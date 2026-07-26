# Minimum Viable Product Requirements

## 1. Purpose

The Minimum Viable Product (MVP) demonstrates a complete automated vehicle
testing workflow using a customer-defined product package and a simulated
Electronic Control Unit (ECU).

The MVP covers product-package import, validation, virtual Controller Area
Network (CAN) communication, Society of Automotive Engineers J1939
(SAE J1939) communication, automated test execution, live operator feedback,
fault simulation, and structured result reporting.

## 2. Product objective

The platform shall allow a user to:

1. install or build the application;
2. import a Vehicle Test Package;
3. validate product and test data;
4. start a virtual ECU;
5. execute an automated test plan;
6. observe test progress;
7. inject supported simulation faults;
8. inspect Diagnostic Trouble Codes (DTCs);
9. receive a final test verdict;
10. export the test result and associated evidence.

## 3. MVP demonstration product

The first demonstration product is an agricultural engine controller.

The simulated ECU represents a simplified engine controller operating on a
SAE J1939 network.

The demonstration product contains:

- product identity;
- product variant;
- CAN network configuration;
- ECU identity;
- SAE J1939 source address;
- transmitted Parameter Group Numbers (PGNs);
- supported Suspect Parameter Numbers (SPNs);
- DTC definitions;
- simulation variables;
- test definitions;
- expected limits;
- report metadata.

## 4. Functional requirements

### 4.1 Application startup

**VAT_MVP_APP_001**

The platform shall start as a desktop application on Microsoft Windows.

**VAT_MVP_APP_002**

The platform shall display the application name and version.

**VAT_MVP_APP_003**

The platform shall report startup failures using a readable error message.

### 4.2 Product package import

**VAT_MVP_PKG_001**

The platform shall import a Vehicle Test Package with the file extension
`.vtpkg`.

**VAT_MVP_PKG_002**

The Vehicle Test Package shall be represented as a ZIP-compatible archive.

**VAT_MVP_PKG_003**

The package shall contain a versioned manifest.

**VAT_MVP_PKG_004**

The importer shall validate the package schema version.

**VAT_MVP_PKG_005**

The importer shall reject packages with missing required files.

**VAT_MVP_PKG_006**

The importer shall reject duplicate object identifiers.

**VAT_MVP_PKG_007**

The importer shall reject references to undefined networks, ECUs, signals,
tests, or simulation variables.

**VAT_MVP_PKG_008**

The importer shall display validation errors with the affected file, field,
and reason.

**VAT_MVP_PKG_009**

The imported package identifier and version shall be recorded in each test
result.

### 4.3 Normalized product model

**VAT_MVP_MODEL_001**

The platform shall convert imported customer files into a normalized internal
product model.

**VAT_MVP_MODEL_002**

The normalized product model shall contain products, variants, networks, ECUs,
messages, signals, diagnostics, simulation variables, test plans, and test
steps.

**VAT_MVP_MODEL_003**

Runtime components shall access imported product data through the normalized
product model rather than directly through customer file formats.

### 4.4 Virtual CAN communication

**VAT_MVP_CAN_001**

The platform shall provide a virtual CAN channel.

**VAT_MVP_CAN_002**

The virtual CAN channel shall support standard 11-bit identifiers.

**VAT_MVP_CAN_003**

The virtual CAN channel shall support extended 29-bit identifiers.

**VAT_MVP_CAN_004**

The virtual CAN channel shall preserve frame identifier, payload, Data Length
Code (DLC), timestamp, and direction.

**VAT_MVP_CAN_005**

The platform shall record transmitted and received CAN frames during a test
run.

**VAT_MVP_CAN_006**

The platform shall associate the CAN trace with the corresponding test result.

### 4.5 SAE J1939 communication

**VAT_MVP_J1939_001**

The platform shall construct and parse SAE J1939 29-bit identifiers.

**VAT_MVP_J1939_002**

The SAE J1939 implementation shall expose priority, PGN, source address, and
destination address.

**VAT_MVP_J1939_003**

The virtual ECU shall transmit an address-claim message.

**VAT_MVP_J1939_004**

The platform shall support global PGN requests.

**VAT_MVP_J1939_005**

The virtual ECU shall periodically transmit engine speed.

**VAT_MVP_J1939_006**

The virtual ECU shall periodically transmit coolant temperature.

**VAT_MVP_J1939_007**

The virtual ECU shall periodically transmit oil pressure.

**VAT_MVP_J1939_008**

The platform shall decode configured SPNs using resolution, offset, unit, and
valid-range information.

**VAT_MVP_J1939_009**

The platform shall support Broadcast Announce Message (BAM) transport for
multi-packet diagnostic messages.

### 4.6 Diagnostic handling

**VAT_MVP_DIAG_001**

The virtual ECU shall maintain active and previously active DTC records.

**VAT_MVP_DIAG_002**

The platform shall decode Diagnostic Message 1 (DM1).

**VAT_MVP_DIAG_003**

The platform shall decode Diagnostic Message 2 (DM2).

**VAT_MVP_DIAG_004**

The platform shall support Diagnostic Message 3 (DM3) for clearing previously
active DTCs.

**VAT_MVP_DIAG_005**

The platform shall support Diagnostic Message 11 (DM11) for clearing active
DTCs.

**VAT_MVP_DIAG_006**

Each decoded DTC shall contain SPN, Failure Mode Identifier (FMI), occurrence
count, source address, active state, and raw payload.

### 4.7 Simulation

**VAT_MVP_SIM_001**

The platform shall provide a deterministic simulation runtime.

**VAT_MVP_SIM_002**

The simulation runtime shall support start, stop, pause, resume, reset, and
single-step operations.

**VAT_MVP_SIM_003**

The virtual ECU shall expose engine speed, coolant temperature, oil pressure,
communication state, and DTC state.

**VAT_MVP_SIM_004**

Resetting the simulation shall restore a defined initial state.

**VAT_MVP_SIM_005**

The simulation shall support an engine-overtemperature fault.

**VAT_MVP_SIM_006**

The engine-overtemperature fault shall activate the configured DTC.

**VAT_MVP_SIM_007**

The simulation shall support communication loss.

**VAT_MVP_SIM_008**

Communication loss shall stop configured periodic ECU transmissions.

### 4.8 Automated test execution

**VAT_MVP_EXEC_001**

The platform shall load a test plan from the imported product package.

**VAT_MVP_EXEC_002**

The platform shall execute test steps in the defined order.

**VAT_MVP_EXEC_003**

Each test step shall have a stable identifier.

**VAT_MVP_EXEC_004**

Each test step shall expose its current execution state.

**VAT_MVP_EXEC_005**

Supported execution states shall include:

- not started;
- running;
- passed;
- failed;
- error;
- skipped;
- aborted;
- timed out.

**VAT_MVP_EXEC_006**

A test step shall support a configurable timeout.

**VAT_MVP_EXEC_007**

A timeout caused by unavailable test infrastructure shall produce an execution
error rather than a product failure.

**VAT_MVP_EXEC_008**

The operator shall be able to abort an active test run.

**VAT_MVP_EXEC_009**

Cleanup operations shall execute after completion, failure, timeout, error, or
operator abort.

**VAT_MVP_EXEC_010**

Cleanup shall stop the simulation and release the virtual CAN channel.

### 4.9 Operator interface

**VAT_MVP_GUI_001**

The operator interface shall be implemented as a desktop application.

**VAT_MVP_GUI_002**

The operator interface shall provide product-package import.

**VAT_MVP_GUI_003**

The operator interface shall display imported product identity and version.

**VAT_MVP_GUI_004**

The operator interface shall display available test plans.

**VAT_MVP_GUI_005**

The operator interface shall start and abort a test run.

**VAT_MVP_GUI_006**

The operator interface shall display live test-step states.

**VAT_MVP_GUI_007**

The operator interface shall display CAN traffic.

**VAT_MVP_GUI_008**

The operator interface shall display active and previously active DTCs.

**VAT_MVP_GUI_009**

The operator interface shall display the final test verdict.

### 4.10 Results and evidence

**VAT_MVP_RESULT_001**

The authoritative test result shall be stored as JavaScript Object Notation
(JSON).

**VAT_MVP_RESULT_002**

The platform shall generate a Hypertext Markup Language (HTML) report.

**VAT_MVP_RESULT_003**

The platform shall generate a Comma-Separated Values (CSV) measurement export.

**VAT_MVP_RESULT_004**

Each test run shall have a unique run identifier.

**VAT_MVP_RESULT_005**

Each result shall contain:

- application version;
- product package identifier;
- product package version;
- test-plan identifier;
- test-plan version;
- test start and end timestamps;
- test-step results;
- measurements;
- limits;
- DTC evidence;
- CAN trace reference;
- final verdict;
- error or abort information.

**VAT_MVP_RESULT_006**

Each measurement shall contain value, unit, timestamp, and originating test
step.

**VAT_MVP_RESULT_007**

Limit-based measurements shall record the applied lower and upper limits.

**VAT_MVP_RESULT_008**

The final verdict shall distinguish product failure from platform execution
error.

## 5. Quality requirements

### 5.1 Repeatability

**VAT_MVP_QUALITY_001**

Repeated execution using the same package, test plan, simulation state, and
input values shall produce equivalent functional results.

### 5.2 Resource cleanup

**VAT_MVP_QUALITY_002**

All runtime resources shall be released after every test run.

### 5.3 Traceability

**VAT_MVP_QUALITY_003**

Every test step shall reference at least one platform or product requirement.

### 5.4 Validation

**VAT_MVP_QUALITY_004**

Machine-readable package and result data shall be validated against versioned
schemas.

### 5.5 Logging

**VAT_MVP_QUALITY_005**

The platform shall record structured diagnostic logs for startup, import,
simulation, communication, execution, and reporting.

## 6. MVP test plan

The demonstration test plan shall perform the following sequence:

1. validate the imported package;
2. initialize the virtual CAN channel;
3. start the virtual ECU;
4. verify the ECU address claim;
5. verify configured periodic PGNs;
6. command an engine speed of 800 revolutions per minute;
7. verify the decoded engine speed;
8. activate the engine-overtemperature fault;
9. verify the expected DM1 DTC;
10. deactivate the fault;
11. clear active and previously active DTCs;
12. verify that no configured DTC remains active;
13. stop the virtual ECU;
14. close the virtual CAN channel;
15. generate the result files.

## 7. MVP completion criteria

The MVP is complete when:

- all mandatory requirements in this document are implemented;
- all unit tests pass;
- all protocol tests pass;
- all integration tests pass;
- the end-to-end demonstration test passes;
- abort and timeout cleanup tests pass;
- package and result schemas validate;
- the application builds from a clean repository checkout;
- a Windows release package can run without a development environment;
- the generated result contains all required evidence.

## 8. Deferred scope

The following capabilities are outside the MVP:

- physical Hardware-in-the-Loop (HIL) input and output;
- physical fault-injection hardware;
- programmable power supplies;
- Controller Area Network with Flexible Data-Rate (CAN FD);
- CANopen;
- CANopen FD;
- Unified Diagnostic Services (UDS);
- Open Diagnostic Data Exchange (ODX);
- Automotive Open System Architecture XML (ARXML);
- A2L measurement and calibration files;
- Functional Mock-up Units (FMUs);
- full International Organization for Standardization 11783 (ISO 11783)
  implementation;
- ISOBUS Virtual Terminal;
- ISOBUS Task Controller;
- Local Interconnect Network (LIN);
- Diagnostics over Internet Protocol (DoIP);
- ECU flashing;
- commercial hardware adapters;
- central enterprise server;
- formal certification claims.
