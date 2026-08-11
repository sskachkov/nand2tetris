#!/usr/bin/env bash
# Usage: tools/test-project.sh <project-number>
# Run from the repo root, or from anywhere -- it locates the repo root itself.
#
# Examples:
#   tools/test-project.sh 01
#   tools/test-project.sh 08

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT"

proj="$1"

run_hardware() {
  for f in $(find "$1" -name "*.tst"); do
    echo "== $f =="
    timeout 30 tools/HardwareSimulator.sh "$f"
  done
}

case "$proj" in
  00) run_hardware projects/00 ;;
  01) run_hardware projects/01 ;;
  02) for f in $(find projects/02 -maxdepth 1 -name "*.tst"); do echo "== $f =="; timeout 30 tools/HardwareSimulator.sh "$f"; done ;;
  03) run_hardware projects/03 ;;
  04)
    # Fill.tst is interactive (unbounded repeat, needs a human watching the screen) -- excluded.
    # FillAutomatic.tst is its batch-testable counterpart.
    for f in $(find projects/04 -name "*.tst" ! -name "Fill.tst"); do
      echo "== $f =="
      timeout 30 tools/CPUEmulator.sh "$f"
    done
    ;;
  05)
    # Memory.tst is interactive -- it waits (via an unbounded "while") for a human to
    # physically hold down a key in the GUI, so it can never finish headlessly. Excluded,
    # same reason Fill.tst is excluded from project 04. Run it yourself with:
    #   tools/HardwareSimulator.sh   (no args -> opens the GUI, then load Memory.tst)
    for f in $(find projects/05 -maxdepth 1 -name "*.tst" ! -name "Memory.tst"); do
      echo "== $f =="
      timeout 30 tools/HardwareSimulator.sh "$f"
    done
    echo "== projects/05/Memory.tst == SKIP (interactive -- requires holding a key in the GUI; run manually)"
    ;;
  06)
    # No official .tst/.cmp for this project -- assemble with assembler.py and
    # cross-check its output against the course's reference Assembler.sh.
    reftmp="projects/06/_reftest"
    rm -rf "$reftmp"; mkdir -p "$reftmp"
    for f in $(find projects/06 -name "*.asm" ! -path "*/tt/*" ! -path "*/_reftest/*"); do
      echo "== $f =="
      python3 projects/06/assembler.py "$f"
      base=$(basename "$f" .asm)
      cp "$f" "$reftmp/$base.asm"
      tools/Assembler.sh "$reftmp/$base.asm" >/dev/null
      tools/TextComparer.sh "${f%.asm}.bin" "$reftmp/$base.hack"
    done
    rm -rf "$reftmp"
    ;;
  07)
    for f in $(find projects/07 -name "*.tst" ! -name "*VME.tst"); do
      vm="${f%.tst}.vm"
      [ -f "$vm" ] && python3 projects/07/vmtranslator.py "$vm" >/dev/null
      echo "== $f =="
      timeout 30 tools/CPUEmulator.sh "$f"
    done
    ;;
  08)
    for f in $(find projects/08 -name "*.tst" ! -name "*VME.tst" \
                    ! -path "*/FunctionCalls/FibonacciElement/*" \
                    ! -path "*/FunctionCalls/StaticsTest/*"); do
      dir=$(dirname "$f"); base=$(basename "$f" .tst)
      count=$(find "$dir" -maxdepth 1 -name "*.vm" | wc -l | tr -d ' ')
      if [ "$count" -eq 1 ]; then
        vm=$(find "$dir" -maxdepth 1 -name "*.vm")
        python3 projects/08/vmtranslator.py "$vm" >/dev/null
        src="${vm%.vm}.asm"
        [ "$src" != "$dir/$base.asm" ] && mv "$src" "$dir/$base.asm"
        echo "== $f =="
        timeout 30 tools/CPUEmulator.sh "$f"
      else
        echo "== $f == SKIP (multi-file, not yet supported)"
      fi
    done
    ;;
  09|10|11)
    echo "Project $proj has no implementation yet to test (course-provided starter/input files only)."
    ;;
  12)
    echo "Project 12's Jack OS classes are still empty stubs -- nothing to test yet."
    ;;
  13)
    echo "Project 13 is the open-ended closing chapter -- no test suite exists for it."
    ;;
  *)
    echo "Usage: $0 <project-number>  (00-13)"
    exit 1
    ;;
esac
