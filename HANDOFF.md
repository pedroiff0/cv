# HANDOFF — Curriculum Vitae (Multilíngue)

## 1. Contexto Rápido
- **Repositório:** `pedroiff0/cv` (`~/Repositorios/pessoal/cv`).
- **Função Principal:** Currículo acadêmico e profissional em AltaCV (LaTeX) com compilações completas em PDF para 4 línguas.
- **Idiomas:** Português (`portugueseCV.pdf`), Inglês (`englishCV.pdf`), Francês (`frenchCV.pdf`), Espanhol (`spanishCV.pdf`).

- **Fonte (desde 03/11/2026):** ReLaTeX, projetos "Currículo — Acadêmico" e "Currículo — Profissional" (tag `Currículo`). Este repo guarda o build multilíngue legado e os PDFs do site.

## 2. Arquitetura de Build
- **Motor LaTeX:** LuaLaTeX + Biber para resolução de referências bibliográficas de artigos.
- **Classe:** `altacv.cls` com suporte a ícones FontAwesome e colunas laterais (`page1sidebar*.tex`).
- **Tradução:** Script auxiliar `translate_cv.py`.

## 3. Estado Atual & Diretrizes Operacionais
- **Governança:** AGENTS.md, DESIGN.md, Makefile e templates do GitHub ativos.
- **Comandos Principais:**
  - `make help`: Lista os comandos disponíveis.
  - `make all`: Compila os 4 PDFs de currículo.
  - `make portuguese`: Compila apenas o CV em português.
  - `make lint`: Verifica integridade dos arquivos fontes.
  - `make clean`: Limpa arquivos auxiliares de compilação.
- **Próximos Passos:**
  - Integrar resumo de experiências do CV na página principal do portfólio.
