# nand2tetris

Personal work-through of [*The Elements of Computing Systems*](https://www.nand2tetris.org/) — building a computer from a single NAND gate up through hardware, an assembler, a VM translator, and (eventually) a compiler and OS.

Projects 07 and 08 share one VM translator (`projects/07/vmtranslator.py`, symlinked into `projects/08/`).

## Running the tests

```
tools/test-project.sh <NN>
```

e.g. `tools/test-project.sh 05`. Dispatches each project to the right nand2tetris tool (Hardware Simulator, CPU Emulator, or the assembler/VM translator + comparison), skips tests that require live GUI interaction, and prints a pass/fail per test script.

## Layout

- `projects/` — one folder per project (course exercises + this repo's solutions)
- `tools/` — the nand2tetris simulator suite (Hardware Simulator, CPU/VM Emulator, Assembler, etc.) plus `test-project.sh`
- `src/` — vendored simulator source, not tracked in git
