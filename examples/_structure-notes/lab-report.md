# Structure notes: electrical-engineering lab reports (UK university, anonymised example)

Source: four anonymised lab reports (Ohm's law/resistors, KCL/KVL, maximum power transfer, RC transient) from the same first-year module, extracted with python-docx.

## CALIBRATION (read first)
These works are mid-range student submissions (roughly a 2:2); marks, feedback and rubric are unknown. They are a BASELINE, not a model. Copy only: work type, cover sheet, section order, module context. Do NOT copy: discussion style, referencing, wording, heading numbering. Weaknesses are listed at the bottom; the new outline must fix each.

## Work type and cover sheet
- Lab report, an Electrical Engineering Fundamentals module. Always preceded by the university "Coursework Cover Sheet" (course title, module title/code, year 2025-26, student number, plagiarism declaration, checklist, AI-tools box, mitigating circumstances, "grade I expect"). Then a title block: name, "<MODULE> Lab N Report", topic, date. Then Abstract.
- Author lists AI tools on the cover sheet box; the declaration asks for AI use details. Keep that box honest.

## Heading hierarchy actually used
Common skeleton (Lab 3, Lab 4/MPT, Lab 6): Abstract > Introduction > (Design requirements/task) > Equipment used > Theoretical analysis (given info, calculations, results table, discussion) > Simulation (circuit, results, discussion) > Practical measurements (build, results table, discussion) > Comparison of all results (Error% tables, discussion) > Conclusion > References.
- Each method section ends with its own "Discussion of ... results" sub-heading (3 mini-discussions plus a comparison discussion), which fragments the analysis; no single synthesis section.
- Lab 2 repeats a 4-block pattern per task (theory, practical, Error%, discussion), headings "Theoretical analysis Task 1" etc.
- Numbering is inconsistent: Lab 4 mixes "4.1.1", "4.2", "5.1", "6." and unnumbered Heading 1s; Lab 2 restarts to "10.", "11."; Lab 6 has no numbers; two different tables are both called "Table 4" in Lab 4. FIX in new work.

## Proportion of words (prose only, tables/images excluded, from extraction)
| Section | MPT lab (~1,760 w) | Lab 3 (~1,600 w) | Lab 6 (~1,460 w) |
|---|---|---|---|
| Abstract | 4% (66 w) | not extracted (unstyled) | not extracted |
| Introduction/theory background | 22% (393 w, 7 subsections, textbook-ish) | 6% | 18% |
| Task/requirements + equipment | 12% | 14% | 0% |
| Theoretical analysis | 15% | 22% | 45% (long worked nodal analysis) |
| Simulation | 15% | 21% | 11% |
| Practical | 10% | 14% | none (no lab in Lab 6) |
| Comparison | 10% | 14% | 9% |
| Conclusion | 4% (72 w) | 6% | 6% |
| References (incl. in count) | 8% | 4% | 11% |
Observation: introduction and "how to use the multimeter" text are heavy; discussion/comparison is thin (10 to 14%). New work should invert this: discussion/analysis is 20% of the marks here.

## How each part is written (baseline behaviour)
- Abstract: 60 to 100 words; says what was done, not what was found (no numbers, no result). FIX: include key values and the headline % errors.
- Introduction: generic theory definitions (Thevenin, Norton, MPT, KCL/KVL), no framing, no aim with measurable targets in places. Aim sentence exists ("aim of this paper is to...").
- Theory: step-by-step worked calculations with equation images, often with "it is needed to multiply every equation by ..." phrasing (awkward). Results table + Graph. Equations numbered (1), (2) ... and referred to ("using formula (3)").
- Simulation: MATLAB/Simulink (not LTspice) in Labs 3, 4, 6; Proteus mentioned in lectures. Screenshots of circuit with sensors/scopes, one screenshot per measured quantity (Lab 3 has 8 near-identical figures; wasteful). Results in a table.
- Practical: "how to measure" paragraphs; photos of built circuit, power-supply settings and DMM display; practical table. Decade boxes used as resistors; DC supply; DMM.
- Comparison: Error% formula stated once, tables of Error% per quantity per RL point (26 rows), small bar/line graphs of Error%. Reference value is theory.
- Discussion: "Results are close; differences due to tolerance, rounding and instrument error". Occasional good moments: Lab 2 notes tolerance of 5% resistors vs observed deviation <2.2%, and that error is highest at low voltage because of the meter's mA resolution; Lab 3 gives a concrete 0.45 to 0.67% voltage error and 12.08 V vs 12.00 V supply. Everything else is unquantified.
- Conclusion: 70 to 100 words, restates what was done; one evaluative sentence ("practical results agree within the applicable error"); no limitations, no improvement, no link to the aim.

## Figure/table/caption conventions
- Figure N for circuits/screenshots/photos, Graph N for plots, Table N for tables; captions below, plain text, no source, lower-case starts ("circuit of 5 resistors..."). Cross-references in prose ("in Figure 1", "Table 4 illustrates"). Some graph captions were not in English: FIX.
- Pagination footer "Academic Year 2025-26". Tables mostly pasted as images in Lab 2.

## Citation density and style
- 3 to 7 references per lab; module lecture slides (Lecturer A and Lecturer B, 2025, "[presentation]", the university) plus tutorial sites (All About Circuits, Electronics Tutorials, Fluke blog, EIM Technology blog, EEPower) with `(n.d.)` and one tracking parameter (`?srsltid`).
- NO in-text citations at all in the lab reports. Reference list is the only trace of sources. Typos in names ("Kircoff").
- Stronger examples to imitate in kind (not content): lecture slides entries format; the UMass "Applied Electrical Engineering Fundamentals" open book (a proper textbook source).

## Tone
Impersonal, passive, repetitive "it is needed to", "one has to"; many spelling/grammar slips ("Desing", "brunch", "Kircoff"); US/UK mix ("analyze", "behavior").

## What looks like high-scoring practice (inferred, unvalidated)
- Full worked example for first data point + "formula applied to each value" (shows method).
- Table of all points + plot with peak visible; Error% tables per method; explicit formula.
- Equipment/measurement method described (how voltage and current meters are connected: ammeter in series, voltmeter in parallel).
- Comparing practical error with component tolerance (Lab 2).

## Weaknesses to avoid (per CLAUDE.md calibration)
1. No in-text source attribution; weak list (tutorial sites, n.d., utm).
2. Spelling/grammar slips and heading typos.
3. Generic discussion without quantified uncertainty.
4. Conclusion restates; no limitation/improvement.
5. Inconsistent heading/table/figure numbering; duplicate table numbers.
6. Abstract with no results; padded introduction.
7. Over-long figure lists of near-identical screenshots.
