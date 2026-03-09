import { Link } from 'react-router-dom'

export function NotFoundPage() {
  return (
    <main className="page">
      <header className="page__header">
        <h1>404</h1>
        <p>Página não encontrada.</p>
      </header>
      <section className="section">
        <Link to="/" className="button button--primary">
          Voltar para o início
        </Link>
      </section>
    </main>
  )
}
