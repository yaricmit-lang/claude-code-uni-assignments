# Claude Code Uni-Assignments

A [Claude Code](https://claude.com/claude-code) workspace for planning, researching, drafting, reviewing and formatting university labs, reports and assignments. It is a set of project rules (`CLAUDE.md`), eight specialised sub-agents and a Markdown-to-Word builder, wired into one repeatable pipeline.

Deliverables are written in English (UK spelling) at a strong undergraduate level, with verified sources and a consistent numbered Harvard reference list.

> **Academic integrity.** Drafts are study material and starting points. You are responsible for understanding, adapting and submitting your work in line with your university's policy, and for declaring any AI use it requires.

## Pipeline

```
brief ─► requirements checklist ─► lectures first ─┬─► structure outline
                                                   ├─► sources (verified)
                                                   ├─► subject deep-dive
                                                   └─► calculations / code (run, not asserted)
        ─► outline (you approve) ─► draft ─► humanise ─► marker-style review (max 2 cycles)
        ─► proofread ─► .docx
```

| Agent | Job |
|---|---|
| `brief-analyst` | Turns the brief and rubric into an exact requirements checklist plus open questions |
| `structure-analyst` | Learns section order and word budgets from `examples/` and proposes an outline |
| `academic-researcher` | Finds and *opens* every source; returns Harvard references with page-level findings |
| `topic-deep-diver` | Concepts, derivations, trade-offs and critical angles for the topic |
| `lab-solver` | Calculations, simulations and figures; every number re-run with code |
| `humanizer` | Removes AI-writing patterns while preserving facts and citations |
| `final-reviewer` | Sceptical marker: requirements, accuracy, citations, word count, language |
| `docx-builder` | Builds the final `.docx` (cover sheet, headings, captions, tables, references) |

## Rules worth knowing

- **Lectures first.** Methods, notation and formulas come from your own course slides; other methods are only used as cross-checks.
- **Citations by name and number.** No (Author, year) in the body: "According to the Lecture 7 slides [3], ...". The reference list is numbered in order of first appearance, in full Harvard format, and checked in both directions.
- **No invented sources or data.** Unverified items are marked `[UNVERIFIED]`. Lab measurements, photos and screenshots are always yours; the agents supply theory, expected ranges, blank tables and a list of what to measure.
- **Quantified discussion.** Labs must state tolerances, instrument accuracy and % error, and explain each discrepancy with numbers.
- **Declarations stay yours.** The cover-sheet builder never ticks declaration boxes or fills in AI-use statements.

The full rule set is in [`CLAUDE.md`](CLAUDE.md).

## Quick start

Requirements: Python 3.10+, git, [Claude Code](https://claude.com/claude-code).

```bash
git clone https://github.com/yaricmit-lang/claude-code-uni-assignments.git
cd claude-code-uni-assignments
./setup.sh          # venv, paper-search tools, humanizer skill, .mcp.json
claude              # start Claude Code from this folder
```

Then drop your brief into `00_inbox/` (or paste it into the chat), put your lecture slides in `lectures/<MODULE>/`, and ask Claude to start a new task.

Build a document by hand:

```bash
venv/bin/python -I templates/build_docx.py works/ABC1234_topic/04_drafts/draft_v2_humanized.md \
  works/ABC1234_topic/06_final/ABC1234_topic.docx --code ABC1234 --title "Title" --toc \
  [--cover --school "..." --module-title "..." --assessment-title "..." --year 2025-26]
```

## Layout

```
.claude/agents/     the eight sub-agents
templates/          build_docx.py (Markdown -> .docx)
examples/           your past works and rubrics (git-ignored) + anonymised structure notes
lectures/           your lecture slides (git-ignored)
00_inbox/           raw briefs and rubrics (git-ignored)
works/<CODE>_<name>/  01_brief  02_research  03_outline  04_drafts  05_review  06_final (git-ignored)
setup.sh            local environment setup
```

## Privacy

Everything personal (briefs, lectures, past works, drafts, final documents, local settings, `.mcp.json` with absolute paths) is git-ignored. The repository contains only the workflow itself.

## Credits

- [blader/humanizer](https://github.com/blader/humanizer) (MIT), installed by `setup.sh`
- [openags/paper-search-mcp](https://github.com/openags/paper-search-mcp) and [blazickjp/arxiv-mcp-server](https://github.com/blazickjp/arxiv-mcp-server), installed from PyPI by `setup.sh`

## Licence

[MIT](LICENSE)
