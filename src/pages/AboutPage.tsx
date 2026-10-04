import { House, BookOpen, LayoutGrid, RotateCcw, Settings, ShieldCheck, Bug, Star, ArrowUpRight } from 'lucide-react'
import { LogoMark } from '../components/Logo'
import './AboutPage.css'

const features = [
  {
    icon: <House size={20} strokeWidth={1.8} />,
    title: 'Início',
    text: 'Visualize todos os cinco níveis do JLPT (N1, N2, N3, N4, N5). Cada nível mostra sua progressão e quantos itens você já estudou.',
  },
  {
    icon: <BookOpen size={20} strokeWidth={1.8} />,
    title: 'Estudar',
    text: 'Mergulhe no conteúdo de cada nível. Estude vocabulário com definições e leituras em hiragana. Para gramática, aprenda padrões e usos práticos.',
  },
  {
    icon: <LayoutGrid size={20} strokeWidth={1.8} />,
    title: 'Dashboard',
    text: 'Acompanhe seu progresso com estatísticas detalhadas. Veja quantos itens estudou, seu percentual de conclusão e previsão de revisões.',
  },
  {
    icon: <RotateCcw size={20} strokeWidth={1.8} />,
    title: 'Revisão',
    text: 'Use o sistema inteligente de revisão com repetição espaçada para mostrar itens no momento ideal de revisão.',
  },
  {
    icon: <Settings size={20} strokeWidth={1.8} />,
    title: 'Opções',
    text: 'Gerencie sua conta de forma segura. Altere email, senha e resete progresso conforme necessário.',
  },
  {
    icon: <ShieldCheck size={20} strokeWidth={1.8} />,
    title: 'Conta & Segurança',
    text: 'Autenticação segura via Supabase com sincronização automática de dados em múltiplos dispositivos.',
  },
]

const steps = [
  { title: 'Você estuda um item', text: 'Ao marcar como "estudando", ele entra no sistema de revisão.' },
  { title: 'Revisões agendadas', text: 'O sistema agenda revisões em intervalos específicos ao longo do tempo.' },
  { title: 'Revisão periódica', text: 'Você revisa itens quando agendados, reforçando o aprendizado.' },
  { title: 'Domínio do conteúdo', text: 'Após revisões bem-sucedidas, você marca o item como "dominado".' },
]

const techStack = [
  { title: 'Frontend', items: ['React 19.2.0 - UI library', 'TypeScript - Tipagem estática', 'React Router 7.13.1', 'Vite - Bundler rápido'] },
  { title: 'Backend & Autenticação', items: ['Supabase - Backend as Service', 'PostgreSQL - Banco de dados', 'API RESTful'] },
  { title: 'Desenvolvimento', items: ['ESLint - Linting', 'TypeScript - Type checking', 'Node.js & npm'] },
  { title: 'Armazenamento', items: ['Sincronização com servidor', 'Progressão de usuário', 'Fila de revisão'] },
]

const levels = [
  { id: 'N5', label: 'Iniciante' },
  { id: 'N4', label: 'Elementar' },
  { id: 'N3', label: 'Intermediário' },
  { id: 'N2', label: 'Avançado' },
  { id: 'N1', label: 'Proficiente' },
]

export function AboutPage() {
  return (
    <main className="page about-page">
      {/* Header */}
      <header className="about-page__header">
        <div className="about-page__header-content">
          <LogoMark size={64} className="about-page__logo" />
          <div>
            <span className="page__eyebrow">sobre</span>
            <h1>Benkyou「勉今日」</h1>
            <p className="about-page__tagline">Seu companheiro de estudos para o JLPT</p>
          </div>
        </div>
      </header>

      {/* Visão Geral */}
      <section className="about-page__section">
        <h2>O que é Benkyou?</h2>
        <p className="about-page__text">
          Benkyou é um aplicativo web interativo de estudos para o teste de proficiência em língua japonesa (JLPT).
          O aplicativo oferece um ambiente estruturado com gramática e um sistema inteligente de revisão
          para ajudar você a dominar a língua japonesa de forma eficiente e organizada.
        </p>
        <p className="about-page__text">
          Com foco na pedagogia moderna e técnicas de repetição espaçada, Benkyou otimiza seu aprendizado garantindo
          que você revise o material na hora certa, maximizando a retenção.
        </p>
      </section>

      {/* Guia do Usuário */}
      <section className="about-page__section">
        <h2>Guia do Usuário</h2>
        <p className="about-page__text">Conheça as principais funcionalidades do Benkyou:</p>

        <div className="about-page__features">
          {features.map((feature) => (
            <div key={feature.title} className="about-page__feature-card">
              <div className="about-page__feature-icon">{feature.icon}</div>
              <h3>{feature.title}</h3>
              <p>{feature.text}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Sistema de Revisão */}
      <section className="about-page__section">
        <h2>Como Funciona o Sistema de Revisão</h2>
        <p className="about-page__text">
          O Benkyou utiliza <strong>repetição espaçada</strong>, uma técnica comprovada
          que otimiza a retenção de informações.
        </p>

        <ol className="about-page__timeline">
          {steps.map((step, index) => (
            <li key={step.title} className="about-page__timeline-item">
              <div className="about-page__timeline-number">{index + 1}</div>
              <h4>{step.title}</h4>
              <p>{step.text}</p>
            </li>
          ))}
        </ol>
      </section>

      {/* Informações Técnicas */}
      <section className="about-page__section">
        <h2>Informações Técnicas</h2>

        <div className="about-page__tech-grid">
          {techStack.map((group) => (
            <div key={group.title} className="about-page__tech-item">
              <strong>{group.title}</strong>
              <ul>
                {group.items.map((entry) => (
                  <li key={entry}>{entry}</li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </section>

      {/* Conteúdo Disponível */}
      <section className="about-page__section">
        <h2>Conteúdo Disponível</h2>
        <div className="about-page__levels">
          {levels.map((level) => (
            <div key={level.id} className={`about-page__level-card about-page__level-card--${level.id.toLowerCase()}`}>
              <h4>Nível {level.id}</h4>
              <p>{level.label}</p>
            </div>
          ))}
        </div>
      </section>

      {/* Sobre o Projeto */}
      <section className="about-page__section">
        <h2>Sobre o Projeto</h2>
        <p className="about-page__text">
          Benkyou foi desenvolvido como solução moderna para estudantes de japonês
          que desejam preparar-se para o JLPT com tecnologia web de ponta.
        </p>

        <div className="about-page__notes">
          <div className="about-page__note">
            <h3>Nossa Missão</h3>
            <p>Tornar o aprendizado de japonês mais acessível e eficiente através de tecnologia.</p>
          </div>

          <div className="about-page__note">
            <h3>Contribuições</h3>
            <p>
              Encontrou um bug? Contribuições são bem-vindas!
              Visite nosso repositório no GitHub.
            </p>
          </div>
        </div>

        <div className="about-page__repository">
          <span className="about-page__repository-label">repositório do projeto</span>
          <a
            href="https://github.com/MagaseAiko/Benkyou"
            target="_blank"
            rel="noopener noreferrer"
            className="about-page__github-link"
          >
            github.com/MagaseAiko/Benkyou <ArrowUpRight size={16} />
          </a>
        </div>
      </section>

      {/* Contato & Suporte */}
      <section className="about-page__section">
        <h2>Suporte & Feedback</h2>
        <div className="about-page__contact-links">
          <a
            href="https://github.com/MagaseAiko/Benkyou/issues"
            target="_blank"
            rel="noopener noreferrer"
            className="button about-page__contact-link"
          >
            <Bug size={17} strokeWidth={1.8} /> Reportar problema
          </a>
          <a
            href="https://github.com/MagaseAiko/Benkyou"
            target="_blank"
            rel="noopener noreferrer"
            className="button button--primary about-page__contact-link"
          >
            <Star size={17} strokeWidth={1.8} /> Star no GitHub
          </a>
        </div>
      </section>

      {/* Footer */}
      <footer className="about-page__footer">
        <p>Versão 1.0.0 · feito com carinho para estudantes de japonês</p>
      </footer>
    </main>
  )
}
