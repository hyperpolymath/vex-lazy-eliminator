;; SPDX-License-Identifier: AGPL-3.0-or-later
;; ECOSYSTEM.scm - Project relationship mapping

(ecosystem
  (version "1.0")
  (name "vex-lazy-eliminator")
  (type "satellite-intervention")
  (purpose "Completeness enforcement for LLM-generated code - detects and quantifies TODO, placeholders, unimplemented stubs")

  (position-in-ecosystem
    (role "satellite")
    (layer "intervention")
    (description "First satellite in vexometer ecosystem. Reduces CII (Completion Integrity Index) and LPS (Linguistic Pathology Score) by detecting incompleteness patterns using AST-based analysis."))

  (related-projects
    ((name . "vexometer")
     (relationship . "sibling-standard")
     (description . "Parent diagnostic instrument - validates efficacy via vexometer-trace-v1"))
    ((name . "vexometer-satellites")
     (relationship . "sibling-standard")
     (description . "Umbrella documentation hub"))
    ((name . "tree-sitter")
     (relationship . "inspiration")
     (description . "Parser generator for AST-based analysis")))

  (what-this-is
    "A Rust library and CLI tool that analyzes code for incompleteness patterns (TODO comments, placeholders, unimplemented! macros, truncation markers, null implementations). Uses tree-sitter for language-aware parsing. Supports Python, Rust, JavaScript, TypeScript, Java, Go. Produces vexometer-trace-v1 compatible output for efficacy validation. Works standalone or integrates with vexometer.")

  (what-this-is-not
    "Not a code generator (detects problems, doesn't fix them). Not language-specific (multi-language via tree-sitter). Not a linter replacement (complements existing linters with LLM-specific concerns). Not vexometer itself (measures one aspect, vexometer aggregates 10 metrics)."))
