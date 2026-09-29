# DESIGN — Curriculum Vitae Architecture & Design Rules

## 1. Arquitetura de Documentos

```mermaid
graph TD
    Main["main.tex (Template AltaCV Estrutural)"] --> PT["portuguese.tex + page1sidebar.tex"]
    Main --> EN["english.tex + page1sidebarEN.tex"]
    Main --> FR["french.tex + page1sidebarFR.tex"]
    Main --> ES["spanish.tex + page1sidebarES.tex"]
    Bib["sample.bib (Publicações Acadêmicas)"] --> Biber["Biber Engine"]
    Biber --> LuaLaTeX["LuaLaTeX Compiler"]
    LuaLaTeX --> PDFs["4x PDFs Multilíngues"]
```

---

## 2. Princípios de Design

1. **Separação de Idiomas:**
   - O layout base reside em `main.tex` e na classe `altacv.cls`, enquanto o conteúdo específico de cada idioma reside nos respectivos arquivos `.tex`.
2. **Compactação Visual:**
   - O currículo deve manter layout denso e legível de até 2 páginas.
