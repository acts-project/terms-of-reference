# ACTS terms of reference

LaTeX sources for the ACTS governance documents. Each top-level `.tex` file with a
`\documentclass` is a standalone document and is built independently.

| Document | Subject |
| --- | --- |
| `pc.tex` | ACTS Project Contact — Terms of Reference |
| `elg.tex` | ACTS Experiment Liaison Group — Terms of Reference |
| `authorship.tex` | ACTS Contributor Policy |

## Status and versions

Each document declares its own status and version in its preamble:

```latex
\usepackage[status=draft, version=0.1, name={ACTS Project Contact}]{actsdoc}
```

* **`status=draft`** — the document is watermarked `DRAFT` and gets line numbers
  for ease of commenting. Drafts are built by CI but never released.
* **`status=final`** — no watermark or line numbers; the title page reads
  `Version <version>`. A version is mandatory.

Documents version independently: `pc` can be at 1.0 while `authorship` is still a
0.1 draft.

## Releasing

There is nothing to tag by hand. To release a document, edit its preamble — from
Overleaf is fine — to `status=final` with the intended version, and commit to
`main`. CI then builds it, creates the tag `<document>-v<version>`, and publishes
a GitHub release with the PDF attached. Re-running on an already released version
does nothing, so a release happens exactly once per version bump.

## Builds

Every push and pull request builds all documents; the PDFs are attached to the
workflow run as artifacts. Below the title, each PDF carries the git revision it
was built from, so any circulated copy can be traced back to a commit.

Building locally works with plain `latexmk`:

```console
$ ./scripts/gitversion.sh    # optional; stamps the current revision
$ latexmk -pdf pc.tex
```

Without `version.tex` — on Overleaf, for instance — the revision falls back to
`uncommitted` and today's date. Nothing else changes.
