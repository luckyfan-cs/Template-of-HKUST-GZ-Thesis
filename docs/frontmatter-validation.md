# Front matter repair: validation record

Checked 2026-10-14 against main `ab49ce46aadc554d879297c1d4d40f7e7360cb70` (2026-08-21).

## Official sources

- [Current FYTGS guideline entry](https://fytgs.hkust-gz.edu.cn/rpg-handbook/guidelines-on-thesis-preparation): returned the six-page April 2025 guideline. Sections C.1 and D.2 specify the order and pagination used here.
- [PhD sample linked inside that guideline](https://fytgs.hkust-gz.edu.cn/wp-content/uploads/2024/12/GZ-thesis_sample_page_phd_202412-version.pdf): eight pages, including title, abstract, authorization, signature and contents examples. The sample contents agrees with the new sequence.
- [Library submission instructions](https://hkust-gz.libguides.com/thesis): consult again for final submission packaging and signed pages.

These are the currently reachable official sources checked on this date, not a claim that no internal or future revision exists.

## Minimal repair

`separatefrontmatter` is opt-in. The original authorization/signature implementation is extracted into one shared internal macro; its wording, signature layout and spacing commands are retained. In the new mode `maketitle` stops after the title page and `makeapprovalpages` runs after the abstract in its own spacing group. The old mode calls the same internal macro from the original location. No font, margin, chapter, bibliography or Arabic-numbering implementation is replaced.

The new mode also moves the title's manually printed i into the normal centered footer and restores the previously suppressed contents-page footer. Contents starts a new page. It does not reset the page counter. Abstract continuation pages therefore naturally shift all following Roman numbers.

## Actual validation

Environment: XeTeX / TeX Live 2023 (Debian), latexmk 4.83, BibTeX 0.99d, PyMuPDF. Missing xeCJK/ctex, algorithm2e and IEEEtran packages were supplied from the archived TeX Live 2023 distribution; Fandol fonts and doublestroke were supplied separately for this environment. No package stub or removal from the source was used.

| Check | Result |
| --- | --- |
| Original main example | Compiled successfully, 13 pages |
| Updated full example | Compiled successfully, 13 pages; title i, abstract ii, authorization iii, signature iv, acknowledgments v, contents vi, figures vii, tables viii; chapter 1 starts at 1 |
| Old main file with repaired class, no new option | All 13 rendered pages pixel-identical to baseline |
| Updated sample body and bibliography | All five rendered pages pixel-identical to baseline |
| PhD regression fixture | 13 pages; Doctor of Philosophy and PhD signature wording; two-page abstract, continuous i–ix, then Arabic 1–4 |
| Approval command called twice | Exactly one authorization and signature page |
| Contents after acknowledgment without manual break | Starts a separate page with visible footer |
| natbib / BibTeX / IEEEtran | Real citation [1], bibliography item, figure/table lists, cross-references and appendix resolved in fixture |
| PDF properties | A4, unencrypted, all used fonts embedded; one centered footer per checked page |
| Visual inspection | Sample front matter and first chapter inspected as rendered pages; no clipping or overlap observed |

The stock example has no citations or figure/table content. Its empty bibliography is not evidence of bibliography functionality; that is why the separate fixture includes a real citation, a figure, a table and an appendix. The deliberately forced second abstract page is only a pagination stress test, not a suggested abstract length.

## Reproduce

From the repository root, with the README dependencies and Python PyMuPDF installed:

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error 000_thesis.tex
latexmk -xelatex -interaction=nonstopmode -halt-on-error tests/frontmatter.tex
python tests/check_frontmatter.py 000_thesis.pdf frontmatter.pdf
```

For the optional exact legacy comparison, compile the old source/class in an isolated directory, then the old source with the repaired class in another directory. Pass their PDFs as `--baseline PATH --legacy PATH`. The checker compares rendered pixels, not PDF bytes (which may contain timestamps).

## Not certified / still to confirm

- **Title-page numeral conflict:** guideline D.2 explicitly includes the title page, and the official sample draws i; the sample's body prose nevertheless says i is hidden. New mode follows the guideline and displayed sample. Confirm with FYTGS/Thrust before final submission.
- **Dates:** the inherited `defencedate` controls both the cover month and signature date; the cover should use submission month/year. Separate date semantics are outside this order fix.
- **Title-page copyright line:** retained for compatibility; it is absent from the linked PhD sample. Confirm whether to retain it.
- **Spacing and typography:** existing layout preserved, not comprehensively certified against the 1.5-line-spacing requirement, all heading sizes, sample spacing or every page margin. Long titles, lengthy acknowledgments and unusual supervisor counts need a fresh review with real content.
- **Abstract and content:** no automatic 300-word enforcement; current content is placeholder text. No academic/content review performed.
- **Final submission:** signed-page handling, signature/name/Thrust correctness, all image resolutions and official PDF preflight must be checked on the finished thesis. This patch does not create signed submission files.
- **Other paths:** PQE/Proposal, optional dedication, hyperref/bookmarks, all degree types and multi-page contents were not exhaustively tested. Legacy compatibility was demonstrated on the repository example, not every possible downstream document.

This is a tested front-matter repair suitable as a Draft V1 starting point, not a certification of complete HKUST(GZ) thesis-format compliance.
