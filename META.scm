;; SPDX-License-Identifier: PMPL-1.0-or-later
;; META.scm - Project metadata and architectural decisions

(define project-meta
  `((version . "0.1.0")
    (architecture-decisions
      ((adr-001
         ((status . "accepted")
          (date . "2026-01-24")
          (context . "Need to detect incompleteness across multiple languages. Options: regex-only vs AST-based vs ML-based.")
          (decision . "Use tree-sitter for AST-based analysis with regex fallback for patterns not in AST.")
          (consequences . "Pros: Language-aware, fewer false positives, understands structure. Cons: Requires per-language parsers, more complex. Mitigation: tree-sitter has good language coverage.")))
       (adr-002
         ((status . "accepted")
          (date . "2026-01-24")
          (context . "Severity scoring: uniform vs pattern-specific weights.")
          (decision . "Assign severity by pattern type: unimplemented=1.0, TODO=0.6, placeholders=0.8")
          (consequences . "Pros: Differentiates critical from minor issues. Cons: Somewhat arbitrary weights. Mitigation: Can be tuned based on empirical data.")))
       (adr-003
         ((status . "accepted")
          (date . "2026-01-24")
          (context . "Integration protocol: custom format vs vexometer-trace-v1.")
          (decision . "Implement vexometer-trace-v1 protocol for before/after validation.")
          (consequences . "Pros: Standard format, validated by vexometer, reproducible. Cons: Adds JSON serialization overhead. Mitigation: Trace generation is opt-in CLI feature.")))))
    (development-practices
      ((code-style . "rustfmt")
       (security . "cargo-audit + openssf-scorecard")
       (testing . "unit tests + property-based (proptest)")
       (versioning . "semver")
       (documentation . "rustdoc + asciidoc")
       (branching . "trunk-based")))
    (design-rationale
      ((why-rust
         . "Memory safety without GC, excellent tree-sitter bindings, fast analysis, compiled binary for easy distribution.")
       (why-tree-sitter
         . "Best-in-class multi-language parser, maintained by GitHub, AST access without writing custom parsers.")
       (why-multi-language
         . "LLMs generate code in many languages. Single-language tool would miss most use cases.")
       (why-cli-and-library
         . "CLI for direct use, library for integration into build tools, CI/CD, or larger systems.")))))
