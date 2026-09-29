# AGENTS.md — Curriculum Vitae (Multilíngue)

> Diretrizes e regras operacionais para Agentes de IA no repositório `cv`.

---

## 1. Visão Geral
- **Repositório:** `pedroiff0/cv` (`~/Repositorios/pessoal/cv`).
- **Propósito:** Currículo profissional multilíngue (Português, Inglês, Francês, Espanhol) gerado em LaTeX utilizando a classe AltaCV e LuaLaTeX + Biber.
- **Sincronização:** Alterações em uma língua devem ser propagadas consistentemente para as demais versões.

---

## 2. Regras para Agentes
1. **Consistência Curricular:**
   - Ao adicionar ou atualizar experiências profissionais, formação ou publicações, atualizar os arquivos correspondentes (`portuguese.tex`, `english.tex`, `french.tex`, `spanish.tex`).
2. **Compilação Segura:**
   - Usar `make help` para comandos e `make <lingua>` para compilação pontual.
3. **CI/CD:**
   - Workflows rápidos de validação estrutural com timeout de 5 minutos (`timeout-minutes: 5`).
