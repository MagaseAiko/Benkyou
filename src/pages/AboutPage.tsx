import './AboutPage.css'

export function AboutPage() {
  return (
    <main className="page about-page">
      {/* Header */}
      <header className="about-page__header">
        <div className="about-page__header-content">
          <img src="/Icon.png" alt="Benkyou Logo" className="about-page__logo" />
          <h1>Benkyou「勉今日」</h1>
          <p className="about-page__tagline">Seu companheiro de estudos para o JLPT</p>
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
          {/* Feature: Início */}
          <div className="about-page__feature-card">
            <div className="about-page__feature-icon">🏠</div>
            <h3>Início</h3>
            <p>
              Visualize todos os cinco níveis do JLPT (N1, N2, N3, N4, N5). Cada nível mostra sua 
              progressão e quantos itens você já estudou.
            </p>
          </div>

          {/* Feature: Estudar */}
          <div className="about-page__feature-card">
            <div className="about-page__feature-icon">📚</div>
            <h3>Estudar</h3>
            <p>
              Mergulhe no conteúdo de cada nível. Estude vocabulário com definições e leituras em hiragana. 
              Para gramática, aprenda padrões e usos práticos.
            </p>
          </div>

          {/* Feature: Dashboard */}
          <div className="about-page__feature-card">
            <div className="about-page__feature-icon">📊</div>
            <h3>Dashboard</h3>
            <p>
              Acompanhe seu progresso com estatísticas detalhadas. Veja quantos itens estudou, 
              seu percentual de conclusão e previsão de revisões.
            </p>
          </div>

          {/* Feature: Revisão */}
          <div className="about-page__feature-card">
            <div className="about-page__feature-icon">🔄</div>
            <h3>Revisão</h3>
            <p>
              Use o sistema inteligente de revisão com repetição espaçada para mostrar itens 
              no momento ideal de revisão.
            </p>
          </div>

          {/* Feature: Opções */}
          <div className="about-page__feature-card">
            <div className="about-page__feature-icon">⚙️</div>
            <h3>Opções</h3>
            <p>
              Gerencie sua conta de forma segura. Altere email, senha e resete progresso 
              conforme necessário.
            </p>
          </div>

          {/* Feature: Segurança */}
          <div className="about-page__feature-card">
            <div className="about-page__feature-icon">🔒</div>
            <h3>Conta & Segurança</h3>
            <p>
              Autenticação segura via Supabase com sincronização automática de dados 
              em múltiplos dispositivos.
            </p>
          </div>
        </div>
      </section>

      {/* Sistema de Revisão */}
      <section className="about-page__section">
        <h2>Como Funciona o Sistema de Revisão</h2>
        <p className="about-page__text">
          O Benkyou utiliza <strong>repetição espaçada</strong>, uma técnica comprovada 
          que otimiza a retenção de informações.
        </p>

        <div className="about-page__timeline">
          <div className="about-page__timeline-item">
            <div className="about-page__timeline-number">1</div>
            <h4>Você estuda um item</h4>
            <p>Ao marcar como "estudando", ele entra no sistema de revisão.</p>
          </div>

          <div className="about-page__timeline-item">
            <div className="about-page__timeline-number">2</div>
            <h4>Revisões agendadas</h4>
            <p>O sistema agenda revisões em intervalos específicos ao longo do tempo.</p>
          </div>

          <div className="about-page__timeline-item">
            <div className="about-page__timeline-number">3</div>
            <h4>Revisão periódica</h4>
            <p>Você revisa itens quando agendados, reforçando o aprendizado.</p>
          </div>

          <div className="about-page__timeline-item">
            <div className="about-page__timeline-number">4</div>
            <h4>Domínio do conteúdo</h4>
            <p>Após revisões bem-sucedidas, você marca o item como "dominado".</p>
          </div>
        </div>
      </section>

      {/* Informações Técnicas */}
      <section className="about-page__section">
        <h2>💻 Informações Técnicas</h2>

        <div className="about-page__tech-stack">
          <div className="about-page__tech-grid">
            <div className="about-page__tech-item">
              <strong>Frontend</strong>
              <ul>
                <li>React 19.2.0 - UI library</li>
                <li>TypeScript - Tipagem estática</li>
                <li>React Router 7.13.1</li>
                <li>Vite - Bundler rápido</li>
              </ul>
            </div>

            <div className="about-page__tech-item">
              <strong>Backend & Autenticação</strong>
              <ul>
                <li>Supabase - Backend as Service</li>
                <li>PostgreSQL - Banco de dados</li>
                <li>API RESTful</li>
              </ul>
            </div>

            <div className="about-page__tech-item">
              <strong>Desenvolvimento</strong>
              <ul>
                <li>ESLint - Linting</li>
                <li>TypeScript - Type checking</li>
                <li>Node.js & npm</li>
              </ul>
            </div>

            <div className="about-page__tech-item">
              <strong>Armazenamento</strong>
              <ul>
                <li>Sincronização com servidor</li>
                <li>Progressão de usuário</li>
                <li>Fila de revisão</li>
              </ul>
            </div>
          </div>
        </div>

      </section>

      {/* Conteúdo Disponível */}
      <section className="about-page__section">
        <h2>📚 Conteúdo Disponível</h2>
        <div className="about-page__levels">
          <div className="about-page__level-card">
            <h4>Nível N5</h4>
            <p>Iniciante</p>
          </div>
          <div className="about-page__level-card">
            <h4>Nível N4</h4>
            <p>Elementar</p>
          </div>
          <div className="about-page__level-card">
            <h4>Nível N3</h4>
            <p>Intermediário</p>
          </div>
          <div className="about-page__level-card">
            <h4>Nível N2</h4>
            <p>Avançado</p>
          </div>
          <div className="about-page__level-card">
            <h4>Nível N1</h4>
            <p>Proficiente</p>
          </div>
        </div>
      </section>

      {/* Sobre o Projeto */}
      <section className="about-page__section">
        <h2>ℹ️ Sobre o Projeto</h2>
        <p className="about-page__text">
          Benkyou foi desenvolvido como solução moderna para estudantes de japonês 
          que desejam preparar-se para o JLPT com tecnologia web de ponta.
        </p>

        <div className="about-page__mission">
          <h3>Nossa Missão</h3>
          <p>
            Tornar o aprendizado de japonês mais acessível e eficiente através de tecnologia.
          </p>
        </div>

        <div className="about-page__repository">
          <h3>🔗 Repositório do Projeto</h3>
          <a 
            href="https://github.com/MagaseAiko/Benkyou" 
            target="_blank" 
            rel="noopener noreferrer"
            className="about-page__github-link"
          >
            🔗 github.com/MagaseAiko/Benkyou
          </a>
        </div>

        <div className="about-page__contribute">
          <h3>Contribuições</h3>
          <p>
            Encontrou um bug? Contribuições são bem-vindas! 
            Visite nosso repositório no GitHub.
          </p>
        </div>
      </section>

      {/* Contato & Suporte */}
      <section className="about-page__section">
        <h2>💬 Suporte & Feedback</h2>
        <div className="about-page__contact-links">
          <a 
            href="https://github.com/MagaseAiko/Benkyou/issues" 
            target="_blank" 
            rel="noopener noreferrer"
            className="about-page__contact-link"
          >
            🐛 Reportar problema
          </a>
          <a 
            href="https://github.com/MagaseAiko/Benkyou" 
            target="_blank" 
            rel="noopener noreferrer"
            className="about-page__contact-link"
          >
            ⭐ Star no GitHub
          </a>
        </div>
      </section>

      {/* Footer */}
      <footer className="about-page__footer">
        <p>Versão 1.0.0 | Feito com ❤️ para estudantes de japonês</p>
      </footer>
    </main>
  )
}
