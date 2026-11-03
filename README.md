# Curriculum Vitae

> **Source of truth moved (2026-11-03).** The two current CVs are edited in ReLaTeX (self-hosted), tag `Currículo`:
> - **Currículo — Acadêmico**: research, publications (biblatex, by type), awards, talks. 2 pages.
> - **Currículo — Profissional**: projects (portfolio), stack, how I work. 1 page.
>
> Both use AltaCV v1.7.4 and LuaLaTeX (`latexmkrc` with `$pdf_mode = 4`). This repository keeps the legacy multilingual build (4 languages) and the PDFs linked from the site; regenerate them from the ReLaTeX sources before updating the site.

---

## Project-specific build (Makefile)

This repository includes a `Makefile` with convenient targets for building the CVs:

Notes:

This repository contains a CV template built using the AltaCV class (provided as `altacv.cls`).

Examples:

```bash
make englishCV
make portugueseCV
make clean
```

---

## Basic CV info

Where to edit your personal details and content:

- Name and tagline: edit the `\name{...}` and `\tagline{...}` commands in `english.tex` and `portuguese.tex` (the files included by `main.tex`).
- Photo: change the image file referenced by `\photo{<size>}{<filename>}` (currently `curriculo` / `curriculo.jpeg`). Place new images in the repository root or update the path.
- Contact block: edit `\personalinfo{...}` in `english.tex` / `portuguese.tex` to update `\email`, `\phone`, `\location`, and links (GitHub, LinkedIn, ORCID, etc.).
- Sections and items: the CV body uses AltaCV helpers such as `\cvsection{}`, `\cvevent{title}{subtitle}{dates}{location}`, `\cvtag{}`, and `\cvskill{}`. Modify those in the language files to change content.
- Bibliography: `sample.bib` is the bibliography file used by `biblatex` — edit or replace it and re-run `make englishCV` / `make portugueseCV` to regenerate citations.
- Icons: the class maps legacy `\fa...` macros to Font Awesome names. Do not remove `\fa` macros from the documents — if an icon fails to render, prefer switching engine to LuaLaTeX or installing the required fonts (Font Awesome, academicons) rather than stripping macros.

Quick edit workflow:

1. Edit `english.tex` or `portuguese.tex` with your personal data and content.
2. Run `make englishCV` or `make portugueseCV` (or `make all`).
3. The Makefile will build the PDF and automatically remove auxiliary files; generated PDFs are preserved unless you run `make distclean`.

If you need help updating a specific field (name, photo, contact), tell me which file and I can apply the change.
