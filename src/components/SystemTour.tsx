import { useState, useEffect } from 'react'
import { Joyride } from 'react-joyride'
import type { EventData, Step } from 'react-joyride'
import { STATUS, EVENTS, ACTIONS } from 'react-joyride'
import { useAuth } from '../hooks/useAuth'
import { useUserProgress } from '../hooks/useUserProgress'
import { useLocation, useNavigate } from 'react-router-dom'

export function SystemTour() {
  const { user } = useAuth()
  const { profile, loading, completeOnboarding } = useUserProgress()
  const location = useLocation()
  const navigate = useNavigate()

  const currentLevel = profile.jlptLevel ?? 'N5'

  const [run, setRun] = useState(false)
  const [stepIndex, setStepIndex] = useState(0)

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

  useEffect(() => {
    const handleNextStep = () => {
      setStepIndex((prev) => prev + 1)
    }
    window.addEventListener('tour-next-step', handleNextStep)
    return () => window.removeEventListener('tour-next-step', handleNextStep)
  }, [])

  // Lógica de roteamento baseada no stepIndex
  useEffect(() => {
    if (!run) return

    const handleRouting = () => {
      switch (stepIndex) {
        case 0:
        case 1:
          if (location.pathname !== '/') navigate('/')
          break
        case 2:
          if (location.pathname !== `/level/${currentLevel}`) navigate(`/level/${currentLevel}`)
          break
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
          if (!location.pathname.includes(`/level/${currentLevel}/grammar/`)) {
            // Se estiver na LevelPage, tenta clicar no primeiro link de gramática
            if (location.pathname === `/level/${currentLevel}`) {
              const timer = setTimeout(() => {
                const firstGrammarLink = document.querySelector('a.study-item-card__link')
                if (firstGrammarLink) {
                  const href = firstGrammarLink.getAttribute('href')
                  if (href) navigate(href)
                }
              }, 600) // Aguarda o carregamento do banco
              return () => clearTimeout(timer)
            } else {
              navigate(`/level/${currentLevel}`)
            }
          }
          break
        case 8:
        case 9:
        case 10:
          if (location.pathname !== '/review') navigate('/review')
          break
        case 11:
          if (location.pathname !== '/dashboard') navigate('/dashboard')
          break
        case 12:
          if (location.pathname !== '/about') navigate('/about')
          break
        case 13:
        case 14:
          if (location.pathname !== '/options') navigate('/options')
          break
        default:
          break
      }
    }

    handleRouting()
  }, [stepIndex, location.pathname, run, navigate])

  const steps: Step[] = [
    { // 0
      target: 'body',
      content: 'Bem-vindo ao Benkyou! Vamos fazer um tour guiado pelas funcionalidades do sistema. Esta é a sua jornada de Onboarding!',
      placement: 'center',
    },
    { // 1
      target: '[data-tour="home-levels"]',
      content: 'A partir da Home, você pode acessar diferentes níveis de aprendizado. Clique em um nível (como o N5) para explorar seu conteúdo.',
      placement: 'top',
    },
    { // 2
      target: '.study-item-list',
      content: 'Ao entrar em um nível, mostraremos que existem várias gramáticas disponíveis. Cada item listado representa um conteúdo diferente que pode ser estudado.',
      placement: 'top',
    },
    { // 3
      target: '.grammar-heading',
      content: 'Esta é a tela de Gramática! Aqui está o título. Repare que se você passar o mouse sobre um kanji no texto, poderá ver o furigana (a leitura correta)!',
      placement: 'bottom',
    },
    { // 4
      target: '.structure',
      content: 'Esta é a Estrutura da gramática, mostrando o uso e as formas aplicáveis na frase.',
      placement: 'bottom',
    },
    { // 5
      target: '.translation',
      content: 'Aqui está o Significado, que te ajuda a entender rapidamente o sentido da estrutura.',
      placement: 'bottom',
    },
    { // 6
      target: '.example-list',
      content: 'Estes são os Exemplos. Você também pode utilizar a função de reprodução de áudio 🔊 para ouvir a pronúncia correta de cada frase!',
      placement: 'top',
    },
    { // 7
      target: '.actions',
      content: 'Estas são as Ações disponíveis: você pode Adicionar à revisão, Marcar como dominado, ou Resetar/apagar o progresso daquele item específico.',
      placement: 'top',
    },
    { // 8
      target: '.flashcard__content',
      content: 'Guiamos você até a Tela de Revisão! Vamos fazer uma revisão prática: Insira uma resposta na lacuna e clique no botão Verificar. O tour avançará automaticamente!',
      placement: 'bottom',
    },
    { // 9
      target: '.review-actions',
      content: 'Após verificar, as opções de autoavaliação aparecem: Esqueci (Estudar de novo), Lembrei (Avançar) ou Dominei.',
      placement: 'top',
    },
    { // 10
      target: '.button-show-info',
      content: 'Você também pode visualizar novamente a estrutura da gramática e sua explicação clicando neste botão durante a revisão.',
      placement: 'top',
    },
    { // 11
      target: '.stats-grid', // no dashboard
      content: 'Apresentamos o Dashboard de Progresso! Aqui os dados são exibidos e você pode acompanhar sua evolução, como total de itens estudados e dominados.',
      placement: 'bottom',
    },
    { // 12
      target: '.about-page__header',
      content: 'Mostramos a página Sobre: Existe uma página explicando detalhadamente como usar o sistema e sua metodologia.',
      placement: 'bottom',
    },
    { // 13
      target: '.tour-account-actions', // nas opções
      content: 'Por fim, a área de Configurações: Aqui você pode fazer a alteração do seu nome de usuário, email e senha.',
      placement: 'top',
    },
    { // 14
      target: '.tour-danger-actions',
      content: 'Aqui fica a opção de apagar o progresso. Com isso terminamos, você agora já entende na prática como usar o sistema. Fim do tour!',
      placement: 'top',
    }
  ]

  const scrollToElement = (targetStr: string, offset = 0) => {
    setTimeout(() => {
      const element = document.querySelector(targetStr)
      if (element) {
        const isMobile = window.innerWidth < 768
        const headerHeight = 80 // Aproximado da navbar
        const tooltipHeight = isMobile ? 300 : 200 // Estimativa
        const padding = 20
        
        const elementRect = element.getBoundingClientRect()
        const scrollTop = window.scrollY
        const elementTop = elementRect.top + scrollTop
        
        // Calcula a posição ideal para scroll
        const targetScrollPosition = elementTop - headerHeight - tooltipHeight - padding + offset
        
        window.scrollTo({
          top: Math.max(0, targetScrollPosition),
          behavior: 'smooth'
        })

        // Fallback para scrollIntoView se o elemento estiver muito pequeno
        if (elementRect.height < 50 && elementRect.top < 100) {
          element.scrollIntoView({ behavior: 'smooth', block: 'center' })
        }
      }
    }, 100)
  }

  const handleJoyrideCallback = (data: EventData) => {
    const { action, index, status, type } = data
    const finishedStatuses: string[] = [STATUS.FINISHED, STATUS.SKIPPED]

    if (type === EVENTS.TOOLTIP) {
      const step = steps[index]
      if (step && step.target && typeof step.target === 'string') {
        scrollToElement(step.target)
      }
    } else if (type === EVENTS.STEP_AFTER) {
      if (index === 8 && action === ACTIONS.NEXT) {
        const reviewActionsExists = document.querySelector('.review-actions')
        if (!reviewActionsExists) {
          // O usuário clicou em Próximo no guia em vez de Verificar.
          // Vamos forçar a verificação para revelar as ações e depois avançar.
          window.dispatchEvent(new Event('tour-force-verify'))
          return
        }
      }
      
      // Atualiza o índice baseado na ação (next/prev)
      const nextStepIndex = index + (action === ACTIONS.PREV ? -1 : 1)
      setStepIndex(nextStepIndex)
    } else if (type === EVENTS.TARGET_NOT_FOUND) {
      console.warn(`Target not found for step ${index}`)
    } else if (finishedStatuses.includes(status)) {
      setRun(false)
      setStepIndex(0)
      if (user) {
        completeOnboarding()
      }
      navigate('/') // Retorna para a home ao finalizar/pular
    }
  }

  const getResponsiveTooltipWidth = () => {
    if (typeof window === 'undefined') return 400
    const width = window.innerWidth
    if (width < 480) return width - 40 // Mobile pequeno
    if (width < 768) return width - 60 // Mobile médio
    return 400 // Desktop
  }

  const getResponsivePlacement = (placement: any): any => {
    if (typeof window === 'undefined') return placement
    if (window.innerWidth < 768 && placement === 'bottom') return 'top'
    if (window.innerWidth < 768 && placement === 'left') return 'right'
    return placement
  }

  // Cria steps responsivos
  const responsiveSteps: Step[] = steps.map((step, idx) => ({
    ...step,
    placement: getResponsivePlacement(step.placement)
  }))

  return (
    <Joyride
      steps={responsiveSteps}
      run={run}
      stepIndex={stepIndex}
      continuous
      onEvent={handleJoyrideCallback}
      options={{
        primaryColor: 'var(--accent)',
        textColor: 'var(--text)',
        backgroundColor: 'var(--surface)',
        arrowColor: 'var(--surface)',
        overlayColor: 'rgba(0, 0, 0, 0.75)',
        zIndex: 10000,
      }}
      styles={{
        tooltip: {
          borderRadius: '12px',
          boxShadow: '0 8px 32px rgba(0, 0, 0, 0.4)',
          padding: window.innerWidth < 480 ? '16px' : '24px',
          maxWidth: getResponsiveTooltipWidth(),
          fontSize: window.innerWidth < 480 ? '0.875rem' : '1rem',
          lineHeight: window.innerWidth < 480 ? '1.4' : '1.6',
        },
        tooltipContainer: {
          textAlign: 'left',
          fontSize: window.innerWidth < 480 ? '0.875rem' : '1rem',
          lineHeight: window.innerWidth < 480 ? '1.4' : '1.6',
        },
        buttonNext: {
          padding: window.innerWidth < 480 ? '6px 12px' : '8px 16px',
          fontSize: window.innerWidth < 480 ? '0.75rem' : '0.875rem',
        },
        buttonBack: {
          padding: window.innerWidth < 480 ? '6px 12px' : '8px 16px',
          fontSize: window.innerWidth < 480 ? '0.75rem' : '0.875rem',
        },
        buttonSkip: {
          padding: window.innerWidth < 480 ? '6px 12px' : '8px 16px',
          fontSize: window.innerWidth < 480 ? '0.75rem' : '0.875rem',
        }
      }}
      locale={{
        back: 'Voltar',
        close: 'Fechar',
        last: 'Finalizar',
        next: 'Próximo',
        skip: 'Pular Tour'
      }}
    />
  )
}
