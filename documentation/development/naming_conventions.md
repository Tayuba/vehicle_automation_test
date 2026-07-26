# Naming Conventions

## Repository naming

The repository name is:

`vehicle_automation_test`

Project-controlled file and folder names use lowercase words separated by
underscores.

Examples:

- `operator_station`
- `package_importer`
- `test_plan`
- `fault_injection`
- `result_report`

Hyphens are not used in project-controlled file or folder names unless an
external format, generated file, dependency, or vendor requirement makes them
unavoidable.

## Acronyms

The first occurrence of an acronym in each independent document must contain
the full meaning followed by the acronym in parentheses.

Example:

`Controller Area Network (CAN)`

Subsequent occurrences in the same document may use:

`CAN`

Common examples include:

- Electronic Control Unit (ECU)
- Hardware-in-the-Loop (HIL)
- Software-in-the-Loop (SIL)
- Diagnostic Trouble Code (DTC)
- Unified Diagnostic Services (UDS)
- Parameter Group Number (PGN)
- Suspect Parameter Number (SPN)
- Functional Mock-up Unit (FMU)
- Minimum Viable Product (MVP)

## C++ naming

- Namespaces use `snake_case`.
- Variables and functions use `snake_case`.
- Types use `PascalCase`.
- Constants use `kPascalCase`.
- CMake targets use lowercase words separated by underscores.

## External files

Customer, vendor, and standards-based filenames are preserved unless the user
explicitly requests a rename.
