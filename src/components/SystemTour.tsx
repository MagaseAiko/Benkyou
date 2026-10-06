import { useState, useEffect, useRef } from 'react'
import { Joyride } from 'react-joyride'
import type { EventData, Step } from 'react-joyride'
import { STATUS, EVENTS, ACTIONS } from 'react-joyride'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { useLocation, useNavigate } from 'react-router-dom'
import { onTourRestartRequest, setTourRunning } from '../hooks/useTourState'
import { getAllGrammar } from '../services/studyDataService'

/** Página onde cada passo acontece; o tour navega até ela automaticamente. */
type TourRoute = 'home' | 'level' | 'grammar' | 'review' | 'dashboard' | 'options'

type TourStep = {
  id: string
  route: TourRoute
  target: string
  title: string
  content: string
  placement: Step['placement']
}

const TOUR_STEPS: TourStep[] = [
  {
    id: 'welcome',
    route: 'home',
    target: 'body',
    placement: 'center',
    title: 'Bem-vindo ao Benkyou!',
    content: 'Em poucos minutos você vai conhecer tudo o que precisa para estudar gramática do JLPT por aqui. Você pode sair do tour a qualquer momento.',
  },
  {
    id: 'home-levels',
    route: 'home',
    target: '[data-tour="home-levels"]',
    placement: 'top',
    title: 'Seus níveis',
    content: 'Cada cartão é um nível do JLPT, do N5 (iniciante) ao N1 (fluente). A barra mostra quanto você já estudou de cada um.',
  },
  {
    id: 'home-today',
    route: 'home',
    target: '.today-strip',
    placement: 'bottom',
    title: 'Seu dia',
    content: 'Aqui aparecem as revisões prontas para hoje e o anel da sua meta diária. Clique no anel para ajustar a meta.',
  },
  {
    id: 'level-list',
    route: 'level',
    target: '.study-item-list',
    placement: 'top',
    title: 'Gramáticas do nível',
    content: 'Cada linha é uma gramática deste nível. O círculo marcado indica o que você já estudou ou colocou em revisão.',
  },
  {
    id: 'level-filters',
    route: 'level',
    target: '.level-filters',
    placement: 'bottom',
    title: 'Busca e filtros',
    content: 'Procure em japonês, romaji ou português (ex.: "temo" ou "permissão") e filtre por não estudados, em revisão ou dominados.',
  },
  {
    id: 'grammar-heading',
    route: 'grammar',
    target: '.grammar-heading',
    placement: 'bottom',
    title: 'A gramática',
    content: 'No topo ficam a gramática, a leitura logo abaixo e o significado em português.',
  },
  {
    id: 'grammar-structure',
    route: 'grammar',
    target: '.structure',
    placement: 'bottom',
    title: 'Estrutura',
    content: 'Mostra como montar a frase: com que tipo de palavra a gramática se combina. As partes em destaque são a própria gramática.',
  },
  {
    id: 'grammar-examples',
    route: 'grammar',
    target: '.example-list',
    placement: 'top',
    title: 'Exemplos',
    content: 'Frases usando a gramática. Clique no botão de áudio para ouvir a pronúncia e passe o mouse sobre os kanjis para ver a leitura — ou ative o botão "Furigana" no topo da página para deixá-la sempre visível.',
  },
  {
    id: 'grammar-actions',
    route: 'grammar',
    target: '.actions',
    placement: 'top',
    title: 'O que fazer com a gramática',
    content: '"Revisar" coloca a gramática na sua fila de revisões, "Já sei" marca como dominada e "Apagar progresso" reinicia este item. "Próximo" leva à gramática seguinte.',
  },
  {
    id: 'review-card',
    route: 'review',
    target: '.flashcard__content',
    placement: 'bottom',
    title: 'Hora de revisar',
    content: 'Complete a lacuna e clique em "Verificar" (ou aperte Enter). Pode digitar em romaji, que vira kana automaticamente. O tour avança sozinho depois da verificação.',
  },
  {
    id: 'review-actions',
    route: 'review',
    target: '.review-actions',
    placement: 'top',
    title: 'Como você foi?',
    content: 'Avalie sua resposta para o sistema decidir quando mostrar o item de novo: logo, em alguns dias ou nunca mais (quando você decorou). No computador, use as teclas 1, 2 e 3.',
  },
  {
    id: 'review-explanation',
    route: 'review',
    target: '.button-show-info',
    placement: 'top',
    title: 'Ver explicação',
    content: 'Esqueceu a regra? Abra a explicação completa, com exemplos e áudio, sem sair da revisão.',
  },
  {
    id: 'dashboard-stats',
    route: 'dashboard',
    target: '.stats-grid',
    placement: 'bottom',
    title: 'Seu progresso',
    content: 'No Dashboard você acompanha quantos itens já estudou, dominou e quantos estão em revisão.',
  },
  {
    id: 'dashboard-calendar',
    route: 'dashboard',
    target: '.activity-card',
    placement: 'top',
    title: 'Dias de estudo',
    content: 'Cada quadrado é um dia. Estude um pouco todos os dias para manter sua ofensiva!',
  },
  {
    id: 'options-preferences',
    route: 'options',
    target: '.tour-preferences',
    placement: 'top',
    title: 'Preferências',
    content: 'Escolha tema claro ou escuro, deixe o furigana sempre visível, ajuste a meta diária ou reveja este tour quando quiser.',
  },
  {
    id: 'options-account',
    route: 'options',
    target: '.tour-account-actions',
    placement: 'top',
    title: 'Sua conta',
    content: 'Aqui você altera seu email, nome de usuário e senha.',
  },
  {
    id: 'options-reset',
    route: 'options',
    target: '.tour-danger-actions',
    placement: 'top',
    title: 'Fim do tour!',
    content: 'Se um dia quiser recomeçar do zero, é aqui que se apaga o progresso. Agora é com você — bons estudos! がんばって！',
  },
]

const REVIEW_CARD_INDEX = TOUR_STEPS.findIndex((step) => step.id === 'review-card')
const LAST_INDEX = TOUR_STEPS.length - 1

// Tempo máximo esperando o elemento de um passo aparecer (navegação + dados)
const TARGET_WAIT_MS = 5000

export function SystemTour() {
  const { user } = useAuth()
  const { profile, loading, completeOnboarding } = useUserProgress()
  const location = useLocation()
  const navigate = useNavigate()

  const currentLevel = profile.jlptLevel ?? 'N5'

  const [run, setRun] = useState(false)
  const [stepIndex, setStepIndex] = useState(0)
  // Remonta o Joyride ao reiniciar, garantindo que ele comece do zero
  const [tourKey, setTourKey] = useState(0)
  // Direção da última navegação (+1 avançando, -1 voltando), usada ao pular passos
  const directionRef = useRef<1 | -1>(1)

  useEffect(() => {
    if (!user || loading) return

    const shouldRunTour = profile.jlptLevel !== null && profile.hasCompletedOnboarding === false

    if (shouldRunTour) {
      const timer = setTimeout(() => {
        setRun(true)
      }, 500)
      return () => clearTimeout(timer)
    }

    setRun(false)
  }, [user, profile.jlptLevel, profile.hasCompletedOnboarding, loading])

  // Publica o estado para outras telas (ex.: item de exemplo na Revisão)
  useEffect(() => {
    setTourRunning(run)
  }, [run])

  useEffect(() => () => setTourRunning(false), [])

  // "Ver tour novamente" em Opções
  useEffect(() => onTourRestartRequest(() => {
    directionRef.current = 1
    setTourKey((key) => key + 1)
    setStepIndex(0)
    setRun(true)
  }), [])

  // A Revisão avisa quando a resposta foi verificada: avança do cartão para as ações
  useEffect(() => {
    const handleVerified = () => {
      directionRef.current = 1
      setStepIndex((prev) => (prev === REVIEW_CARD_INDEX ? prev + 1 : prev))
    }
    window.addEventListener('tour-review-verified', handleVerified)
    return () => window.removeEventListener('tour-review-verified', handleVerified)
  }, [])

  const endTour = () => {
    setRun(false)
    setStepIndex(0)
    if (user) {
      completeOnboarding()
    }
    navigate('/')
  }

  /** Vai para o passo `index`, ou encerra o tour se passou do último. */
  const goToStep = (index: number) => {
    if (index > LAST_INDEX) {
      endTour()
      return
    }
    setStepIndex(Math.max(0, index))
  }

  /** Pula todos os passos de uma página (ex.: nível sem gramáticas cadastradas). */
  const skipRoute = (route: TourRoute, fromIndex: number) => {
    let index = fromIndex
    while (TOUR_STEPS[index]?.route === route) index += directionRef.current
    goToStep(index)
  }

  // Leva o usuário até a página do passo atual
  useEffect(() => {
    if (!run) return
    const step = TOUR_STEPS[stepIndex]
    if (!step) return

    const levelPath = `/level/${currentLevel}`
    const { pathname } = location

    switch (step.route) {
      case 'home':
        if (pathname !== '/') navigate('/')
        break
      case 'level':
        if (pathname !== levelPath) navigate(levelPath)
        break
      case 'grammar': {
        if (pathname.startsWith(`${levelPath}/grammar/`)) break
        // Abre a primeira gramática do nível direto pelos dados (não depende da lista renderizada)
        let cancelled = false
        getAllGrammar()
          .then((items) => {
            if (cancelled) return
            const first = items.find((item) => item.level === currentLevel)
            if (first) {
              navigate(`${levelPath}/grammar/${first.id}`, { state: { fromLevel: true } })
            } else {
              skipRoute('grammar', stepIndex)
            }
          })
          .catch(() => {
            if (!cancelled) skipRoute('grammar', stepIndex)
          })
        return () => {
          cancelled = true
        }
      }
      case 'review':
        if (pathname !== '/review') navigate('/review')
        break
      case 'dashboard':
        if (pathname !== '/dashboard') navigate('/dashboard')
        break
      case 'options':
        if (pathname !== '/options') navigate('/options')
        break
    }
    // skipRoute usa só setters estáveis e refs
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [stepIndex, location.pathname, run, navigate, currentLevel])

  const scrollToElement = (targetStr: string, offset = 0) => {
    setTimeout(() => {
      const element = document.querySelector(targetStr)
      if (element) {
        const isMobile = window.innerWidth < 768
        const headerHeight = 80
        const tooltipHeight = isMobile ? 300 : 200
        const padding = 20

        const elementRect = element.getBoundingClientRect()
        const scrollTop = window.scrollY
        const elementTop = elementRect.top + scrollTop

        const targetScrollPosition = elementTop - headerHeight - tooltipHeight - padding + offset

        window.scrollTo({
          top: Math.max(0, targetScrollPosition),
          behavior: 'smooth'
        })

        if (elementRect.height < 50 && elementRect.top < 100) {
          element.scrollIntoView({ behavior: 'smooth', block: 'center' })
        }
      }
    }, 100)
  }

  const handleJoyrideCallback = (data: EventData) => {
    const { action, index, status, type } = data
    const finishedStatuses: string[] = [STATUS.FINISHED, STATUS.SKIPPED]

    // Fechar o tour (botão X ou Esc) encerra o tour. Antes, o "close" apenas
    // pulava para o próximo passo como beacon, deixando o tour ativo e
    // forçando o usuário de volta para as páginas do tour.
    if (finishedStatuses.includes(status) || action === ACTIONS.CLOSE || action === ACTIONS.SKIP) {
      if (run) endTour()
      return
    }

    if (type === EVENTS.TOOLTIP) {
      const step = TOUR_STEPS[index]
      if (step && step.target !== 'body') {
        scrollToElement(step.target)
      }
    } else if (type === EVENTS.STEP_AFTER) {
      directionRef.current = action === ACTIONS.PREV ? -1 : 1

      // No cartão da revisão, "Próximo" verifica a resposta; o tour avança quando
      // a Revisão confirmar (evento tour-review-verified).
      if (index === REVIEW_CARD_INDEX && action === ACTIONS.NEXT) {
        const hasPendingAnswer = document.querySelector('.review-inline-input:not(:disabled)')
        if (hasPendingAnswer && !document.querySelector('.review-actions')) {
          window.dispatchEvent(new Event('tour-force-verify'))
          return
        }
      }

      goToStep(index + directionRef.current)
    } else if (type === EVENTS.TARGET_NOT_FOUND) {
      // O elemento não apareceu (ex.: gramática sem "Estrutura", item sem frase de
      // revisão). Em vez de travar, pula este passo na direção em que o usuário ia.
      console.warn(`Tour: elemento não encontrado no passo ${index} (${TOUR_STEPS[index]?.id}), pulando.`)
      goToStep(index + directionRef.current)
    }
  }

  const getResponsiveTooltipWidth = () => {
    if (typeof window === 'undefined') return 400
    const width = window.innerWidth
    if (width < 480) return width - 40
    if (width < 768) return width - 60
    return 400
  }

  const getResponsivePlacement = (placement: Step['placement']): Step['placement'] => {
    if (typeof window === 'undefined') return placement
    if (window.innerWidth < 768 && placement === 'bottom') return 'top'
    if (window.innerWidth < 768 && placement === 'left') return 'right'
    return placement
  }

  const joyrideSteps: Step[] = TOUR_STEPS.map((step) => ({
    target: step.target,
    title: step.title,
    content: step.content,
    placement: getResponsivePlacement(step.placement),
  }))

  return (
    <Joyride
      key={tourKey}
      steps={joyrideSteps}
      run={run}
      stepIndex={stepIndex}
      continuous
      onEvent={handleJoyrideCallback}
      options={{
        primaryColor: 'var(--lilac)',
        textColor: 'var(--ink)',
        backgroundColor: 'var(--card)',
        arrowColor: 'var(--edge)',
        overlayColor: 'rgba(30, 24, 38, 0.55)',
        overlayClickAction: false,
        closeButtonAction: 'skip',
        // Mostra o balão direto (sem o "beacon" piscando antes)
        skipBeacon: true,
        showProgress: true,
        targetWaitTimeout: TARGET_WAIT_MS,
        zIndex: 10000,
        buttons: ['back', 'close', 'primary', 'skip'],
      }}
      styles={{
        tooltip: {
          borderRadius: '16px',
          border: '1.5px solid var(--edge)',
          boxShadow: '5px 5px 0 var(--shadow-ink)',
          fontFamily: 'var(--font-body)',
          padding: window.innerWidth < 480 ? '16px' : '24px',
          maxWidth: getResponsiveTooltipWidth(),
          fontSize: window.innerWidth < 480 ? '0.875rem' : '1rem',
          lineHeight: window.innerWidth < 480 ? '1.4' : '1.6',
        },
        // Botão "X": afastado do canto arredondado do balão
        buttonClose: {
          top: window.innerWidth < 480 ? 10 : 14,
          right: window.innerWidth < 480 ? 10 : 14,
          width: 14,
          height: 14,
          padding: 6,
          borderRadius: 8,
          color: 'var(--ink-soft)',
        },
        tooltipTitle: {
          fontFamily: 'var(--font-display)',
          fontSize: window.innerWidth < 480 ? '1.05rem' : '1.2rem',
          fontWeight: 900,
          textAlign: 'left',
          margin: 0,
          // Reserva espaço para o "X" não encostar no título
          paddingRight: 32,
        },
        tooltipContainer: {
          textAlign: 'left',
          fontSize: window.innerWidth < 480 ? '0.875rem' : '1rem',
          lineHeight: window.innerWidth < 480 ? '1.4' : '1.6',
        },
        buttonNext: {
          backgroundColor: 'var(--lilac)',
          color: 'var(--on-pastel)',
          border: '1.5px solid var(--edge)',
          borderRadius: '10px',
          fontWeight: 700,
          padding: window.innerWidth < 480 ? '6px 12px' : '8px 16px',
          fontSize: window.innerWidth < 480 ? '0.75rem' : '0.875rem',
        },
        buttonBack: {
          color: 'var(--ink-soft)',
          padding: window.innerWidth < 480 ? '6px 12px' : '8px 16px',
          fontSize: window.innerWidth < 480 ? '0.75rem' : '0.875rem',
        },
        buttonSkip: {
          color: 'var(--ink-faint)',
          padding: window.innerWidth < 480 ? '6px 12px' : '8px 16px',
          fontSize: window.innerWidth < 480 ? '0.75rem' : '0.875rem',
        }
      } as any}
      locale={{
        back: 'Voltar',
        close: 'Fechar',
        last: 'Finalizar',
        next: 'Próximo',
        nextWithProgress: 'Próximo ({current} de {total})',
        skip: 'Pular Tour'
      }}
    />
  )
}
