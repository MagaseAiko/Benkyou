import { Link } from 'react-router-dom'

export function NotFoundPage() {
  return (
    <main className="page not-found">
      <span className="not-found__code" aria-hidden="true">404</span>
      <header className="page__header">
        <span className="page__eyebrow">迷子 · perdido</span>
        <h1>Página não encontrada.</h1>
        <p>O endereço que você abriu não existe ou foi movido.</p>
      </header>
      <div>
        <Link to="/" className="button button--primary">
          Voltar para o início
        </Link>
      </div>
    </main>
  )
}
