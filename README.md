# 📚 Benkyou

*Seu companheiro de estudos para o JLPT*

Benkyou é um aplicativo web interativo de estudos para o teste de proficiência em língua japonesa (JLPT). Oferece um ambiente estruturado com vocabulário, gramática e um sistema inteligente de revisão baseado em repetição espaçada para otimizar o aprendizado.

## ✨ Características

- **Níveis JLPT Completos**: Suporte aos níveis N1, N2, N3, N4 e N5
- **Conteúdo Estruturado**: Vocabulário com definições e leituras em hiragana, gramática com padrões e usos práticos
- **Sistema de Revisão Inteligente**: Algoritmo de repetição espaçada para revisões otimizadas
- **Dashboard de Progresso**: Estatísticas detalhadas e acompanhamento de progresso
- **Autenticação Segura**: Integração com Supabase para sincronização multi-dispositivo
- **Interface Responsiva**: Compatível com desktop, tablet e mobile
- **Tema Escuro**: Design moderno com suporte a modo escuro

## 🛠️ Stack Tecnológico

### Frontend
- **React 19.2.0** - Biblioteca UI
- **TypeScript** - Tipagem estática
- **React Router 7.13.1** - Roteamento
- **Vite** - Bundler rápido com HMR

### Backend & Autenticação
- **Supabase** - Backend as a Service
- **PostgreSQL** - Banco de dados
- **Autenticação JWT** - Sistema de autenticação seguro

### Desenvolvimento
- **ESLint** - Linting e análise de código
- **TypeScript** - Verificação de tipos
- **Node.js & npm** - Gerenciamento de dependências

## 🚀 Instalação

### Pré-requisitos
- Node.js (versão 18 ou superior)
- npm ou yarn
- Conta no Supabase (para funcionalidades completas)

### Passos de Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/MagaseAiko/Benkyou.git
   cd Benkyou
   ```

2. **Instale as dependências**
   ```bash
   npm install
   ```

3. **Configure as variáveis de ambiente**
   Crie um arquivo `.env` na raiz do projeto:
   ```env
   VITE_SUPABASE_URL=your_supabase_url
   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Execute o projeto em modo desenvolvimento**
   ```bash
   npm run dev
   ```

5. **Acesse a aplicação**
   Abra [http://localhost:5173](http://localhost:5173) no seu navegador

## 📖 Uso

### Estrutura do Projeto
```
src/
├── components/          # Componentes reutilizáveis
├── pages/              # Páginas da aplicação
├── hooks/              # Hooks customizados
├── services/           # Serviços (API, dados)
├── types/              # Definições TypeScript
├── utils/              # Utilitários
└── data/               # Dados estáticos (vocabulário, gramática)
```

### Funcionalidades Principais

1. **Início**: Visão geral dos níveis JLPT e progresso
2. **Estudar**: Acesso ao conteúdo de cada nível
3. **Dashboard**: Acompanhamento de estatísticas
4. **Revisão**: Sistema inteligente de repetição espaçada
5. **Opções**: Gerenciamento de conta e configurações

## 🤝 Contribuição

Contribuições são bem-vindas! Siga estes passos:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

### Reportar Problemas

Encontrou um bug? [Abra uma issue](https://github.com/MagaseAiko/Benkyou/issues) no GitHub.

---

**Versão**: 1.0.0
