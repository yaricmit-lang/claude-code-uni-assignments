# Uni-Assignments — project rules

Workspace for writing university labs, assignments and reports. The user (a UK university student) sends each brief in chat. Reply to the user in the language they write in; **all deliverables are in English (UK spelling)**.

## Overrides of global rules
- For academic work use `academic-researcher` instead of a generic web-search agent. A generic search agent is only for quick non-academic lookups.

## Folder layout
All paths in the agent files are relative to the project root, so start sessions from it. In shell commands always quote absolute paths (they may contain spaces).
- `00_inbox/` — raw briefs, rubrics and lecture files the user drops in
- `examples/` — the user's past works, templates and marking rubrics (read by `structure-analyst`; cached findings in `examples/_structure-notes/`). Do not move or delete the user's files without asking. See "Calibration of examples" below.
- `lectures/` — lecture slides by module (e.g. `lectures/<MODULE>/`). **Primary source for every task:** read the relevant lectures first (python-pptx / pypdf in `venv`) and take the solution methods, formulas, notation and worked-example style from them. Index what you read in `lectures/_index.md` (file -> topics covered -> key formulas/methods) so later tasks do not re-read everything.
- `templates/` — `build_docx.py` (Markdown -> .docx builder)
- `works/<CODE>_<short-name>/` — one folder per task: `01_brief/ 02_research/ 03_outline/ 04_drafts/ 05_review/ 06_final/`
- `venv/` — Python env (python-docx, pypdf, python-pptx, matplotlib, numpy). Use `venv/bin/python`. Created by `setup.sh`.
- `tools/` — third-party tools cloned/installed by `setup.sh` (not tracked in git).

## Pipeline for every brief
1. Create `works/<CODE>_<name>/`; `brief-analyst` -> `01_brief/requirements-checklist.md`. Ask the user clarifying questions (word count, deadline, citation style, rubric, files).
2. First read the matching module's `lectures/` (methods come from there). Then in parallel: `structure-analyst`, `academic-researcher`, `topic-deep-diver` (+ `lab-solver` if calculations/code/simulations; it must use the lecture method, not a different one, unless the user agrees).
3. Write the outline -> `03_outline/` (include a figure list: what, where in the text, why it earns its place); show the user; then draft -> `04_drafts/draft_v1.md`.
4. `humanizer` -> `04_drafts/draft_v2_humanized.md`.
5. `final-reviewer` -> `05_review/review-report.md`; fix; max 2 review cycles.
6. Proofread before the build: language (UK spelling, grammar, tense), typos in headings, consistent heading numbering, captions, units, reference list format. Then `docx-builder` -> `06_final/<CODE>_<name>.docx` (PDF only if asked).

## Standards
- **Citation style (the user's decision, final — do not argue it again):** no (Author, year) or hyperlinked citations in the body. Credit sources in the prose by naming them, and put the source's number in square brackets right after the name: "According to the Lecture 7 slides [3], ...", "IEEE 802.3 [5] defines ...", "As allaboutcircuits.com [2] explains ...". The number is the source's position in the reference list. The reference list at the end is numbered `[1] ...`, `[2] ...` **in order of first appearance in the text**, each entry in full Harvard (Cite Them Right) format, one consistent format. Every source named in the text must be in the list and every listed source must be named in the text at least once, with matching numbers (check both ways). Reusing a source reuses its number.
- **Direct quotations:** at most 3 in the whole work, each short (up to about three sentences), in quotation marks, from 3 different sources, named and numbered like any other source. Everything else is paraphrased.
- **Reference-list hygiene:** no tracking parameters (`?utm...`, `?searchresult=...`), no leftover words in other languages, `(n.d.)` only when the source genuinely has no date, always an access date for web sources, correct names/spelling of authors.
- Never invent a source, DOI, page number or quote; if unverified, mark `[UNVERIFIED]` and tell the user.
- Sources, in priority order: (1) the user's `lectures/` slides (cite as the lecturers, year, module code, title, "[presentation]", university); (2) textbooks, standards (RFC/ISO/IEEE/IEC), official docs; (3) peer-reviewed papers, .ac.uk/.edu/.gov. No Wikipedia, blogs, content farms or AI-generated pages as cited sources; avoid tutorial websites unless nothing better exists.
- **Discussion sections (labs):** quantify. State component tolerances and instrument accuracy, compute % error and compare it with the expected tolerance band, explain each discrepancy with numbers (rounding, tolerance, meter resolution, contact resistance, model limits) and name the limitations of the method and one concrete improvement. Never write only "small differences are due to rounding and instrument error".
- **Lab data are the user's.** Practical measurements, photos and simulation screenshots are never invented. Claude supplies theoretical values, expected ranges, tables to fill in and a list of exactly what to measure/screenshot; the user supplies the real numbers and images; then Claude analyses them.
- Writing level: strong UK undergraduate. Natural, varied, no AI boilerplate (see `humanizer`).
- Respect the word count (+/-10%) and every item of the rubric.
- Technical parts (calculations, code, diagrams) must be verified by running them, not by assertion. Numbers or claims coming from `topic-deep-diver` or any non-running agent are hand-calculated until `lab-solver` re-runs them; never copy them into a draft unverified (in a pipeline test a wrong "less than 0.25%" sensitivity claim from the deep-dive reached the draft and was only caught by `final-reviewer`).

## Figures
- Build data charts, graphs and circuit/network diagrams with matplotlib/code (`lab-solver`) into `works/<CODE>_<name>/06_final/figures/` (300 dpi, labelled axes, units). Photos and screenshots are supplied by the user.
- Every figure needs a numbered caption (`![Figure n: caption](figures/<file>.png)`) and a mention in the text. Do not insert a figure as final until the file exists; once it exists, open it and check it matches the caption.
- Images must not copy a real person, brand logo or copyrighted artwork. Never cite an image as a source.

## Calibration of examples
Past works supplied by the user are a **baseline, not a model of high marks**: copy only work type, cover sheet, section order and module context. Typical weaknesses in such works, which new work must avoid: no in-text source attribution in lab reports and weak/untidy reference lists (tutorial sites, `n.d.`, `utm`, stray foreign-language phrases); spelling and grammar slips in text and headings; generic discussions ("differences due to rounding and instrument error") with no quantified uncertainty; conclusions that only restate the work; inconsistent heading numbering. If the user supplies marks, feedback or a rubric, update this section and the `structure-analyst` notes.

## Academic integrity note
Drafts are study material and starting points; the user is responsible for understanding, adapting and submitting the work in line with their university's policy.

## Installed tools (`tools/`, created by `setup.sh`)
- `.claude/skills/humanizer/SKILL.md` — blader/humanizer (source clone: `tools/humanizer`); used by the `humanizer` agent.
- `tools/mcp-venv/` — `paper-search` CLI + MCP (OpenAlex, Crossref, arXiv, PubMed, Europe PMC, ...) and `arxiv-mcp-server`; both registered in `.mcp.json` (generated by `setup.sh`). CLI: `tools/mcp-venv/bin/paper-search search "<q>" -n 5 -s fast`.
- Optional env: `PAPER_SEARCH_MCP_UNPAYWALL_EMAIL` (Unpaywall DOI lookup), `PAPER_SEARCH_MCP_CORE_API_KEY`. Keep the Sci-Hub fallback OFF.
