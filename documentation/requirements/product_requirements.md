# Product Requirements

## Purpose

Vehicle Automation Test is a configurable platform for automated testing of
vehicle, agricultural, industrial, and embedded control products.

The platform supports simulation, emulation, Software-in-the-Loop (SIL),
Hardware-in-the-Loop (HIL), physical controller testing, network analysis,
diagnostic testing, fault simulation, automated test execution, and structured
result reporting.

## Customer workflow

The platform provides a complete workflow for:

1. installing or building the application;
2. importing a customer product package;
3. validating product data;
4. configuring the test environment;
5. selecting a product variant;
6. selecting a test plan;
7. executing automated tests;
8. monitoring test progress;
9. inspecting communication and diagnostics;
10. generating test results and evidence.

## Product package

The platform imports a Vehicle Test Package using the `.vtpkg` extension.

The package contains product-specific information such as:

- product identity;
- product variants;
- communication networks;
- Electronic Control Units (ECUs);
- messages and signals;
- diagnostic definitions;
- simulation models;
- plant models;
- fault models;
- electrical mappings;
- test plans;
- measurement limits;
- requirements;
- report metadata.

The imported files are converted into a normalized internal product model.

## Supported engineering data

The platform supports standardized and customer-specific engineering data,
including:

- Controller Area Network database files (DBC);
- AUTomotive Open System ARchitecture XML files (ARXML);
- Open Diagnostic Data Exchange files (ODX);
- Packaged ODX files (PDX);
- Electronic Data Sheet files (EDS);
- Device Configuration Files (DCF);
- A2L measurement and calibration files;
- Functional Mock-up Units (FMUs);
- Requirements Interchange Format files (ReqIF);
- measurement data;
- recorded bus traces;
- structured test definitions;
- customer-defined configuration files.

## Communication

The communication subsystem supports vehicle and industrial networks,
including:

- Controller Area Network (CAN);
- Controller Area Network with Flexible Data-Rate (CAN FD);
- CANopen;
- CANopen FD;
- Society of Automotive Engineers J1939 (SAE J1939);
- International Organization for Standardization 11783 (ISO 11783);
- ISOBUS;
- Local Interconnect Network (LIN);
- Unified Diagnostic Services (UDS);
- Diagnostics over Internet Protocol (DoIP);
- On-Board Diagnostics (OBD);
- automotive Ethernet.

Communication functions include:

- standard and extended identifiers;
- frame filtering;
- timestamping;
- trace recording;
- trace replay;
- bus-load calculation;
- periodic transmission;
- timeout monitoring;
- counter validation;
- checksum validation;
- signal decoding;
- signal encoding;
- malformed-frame detection;
- bus-state monitoring;
- bus-off recovery.

## SAE J1939

The SAE J1939 implementation supports:

- 29-bit identifier construction and parsing;
- priority;
- Parameter Group Number (PGN);
- source address;
- destination address;
- address claiming;
- commanded address;
- PGN requests;
- acknowledgements;
- proprietary PGNs;
- Broadcast Announce Message (BAM);
- Request to Send (RTS);
- Clear to Send (CTS);
- End of Message Acknowledgement;
- transport abort handling;
- multi-packet communication;
- Suspect Parameter Number (SPN) decoding;
- diagnostic messages;
- network-management behaviour.

## CANopen

The CANopen implementation supports:

- Network Management (NMT);
- heartbeat producer and consumer;
- boot-up messages;
- node guarding;
- Emergency messages (EMCY);
- Service Data Objects (SDO);
- Process Data Objects (PDO);
- synchronization;
- time distribution;
- Layer Setting Services (LSS);
- object dictionary handling;
- EDS and DCF import;
- expedited transfers;
- segmented transfers;
- block transfers;
- abort-code decoding;
- CAN in Automation 301 (CiA 301);
- CiA 401;
- CiA 402;
- CiA 406;
- CANopen FD.

## Diagnostics

The diagnostic subsystem supports:

- UDS over CAN;
- UDS over CAN FD;
- UDS over DoIP;
- ISO Transport Protocol (ISO-TP);
- SAE J1939 diagnostics;
- OBD;
- CANopen EMCY;
- manufacturer-specific diagnostics.

Diagnostic functions include:

- ECU identification;
- diagnostic-session control;
- ECU reset;
- Diagnostic Trouble Code (DTC) reading;
- DTC clearing;
- snapshot data;
- extended data;
- freeze-frame data;
- data identifier reading;
- data identifier writing;
- routine control;
- communication control;
- input and output control;
- security access;
- authentication;
- memory reading;
- memory writing;
- software download;
- software upload;
- file transfer;
- tester-present handling;
- response-pending handling;
- negative-response decoding;
- timing supervision;
- interrupted-programming recovery.

## Simulation and emulation

The simulation subsystem supports:

- virtual ECUs;
- network simulation;
- restbus simulation;
- ECU emulation;
- plant simulation;
- sensor simulation;
- actuator simulation;
- environment simulation;
- state-machine models;
- lookup-table models;
- differential-equation models;
- FMU execution;
- recorded-data replay;
- deterministic execution;
- real-time execution;
- faster-than-real-time execution;
- paused execution;
- single-step execution;
- external-clock synchronization.

## Fault simulation

The platform supports controlled fault simulation for:

- message loss;
- delayed messages;
- message jitter;
- duplicate messages;
- corrupted counters;
- corrupted checksums;
- invalid signal values;
- address conflicts;
- transport-protocol errors;
- communication loss;
- sensor drift;
- sensor bias;
- sensor noise;
- actuator failure;
- mechanical jam;
- thermal faults;
- pressure faults;
- voltage faults;
- current faults;
- open circuits;
- short circuits;
- added resistance;
- intermittent connections.

## Physical HIL

The physical HIL subsystem supports:

- programmable power control;
- digital input;
- digital output;
- analog input;
- analog output;
- current measurement;
- voltage measurement;
- resistance simulation;
- pulse generation;
- frequency generation;
- Pulse-Width Modulation (PWM);
- load simulation;
- relay control;
- fault-injection hardware;
- harness mapping;
- channel calibration;
- hardware interlocks;
- emergency shutdown;
- safe-state control.

## Test execution

The platform executes configurable test plans containing:

- setup steps;
- test steps;
- cleanup steps;
- nested sequences;
- conditional branches;
- loops;
- operator prompts;
- resource dependencies;
- timeouts;
- retries;
- measurements;
- limits;
- evidence;
- verdicts.

Execution states include:

- not started;
- queued;
- running;
- waiting;
- passed;
- failed;
- error;
- skipped;
- aborted;
- timed out;
- inconclusive.

Cleanup executes after normal completion, failure, timeout, error, operator
abort, communication loss, or safety interruption.

## Operator interface

The operator application provides:

- user authentication;
- product selection;
- product variant selection;
- test-plan selection;
- test execution;
- live step status;
- final verdict;
- operator prompts;
- report access.

## Engineering interface

The engineering application provides:

- product-package import;
- package validation;
- network configuration;
- signal inspection;
- diagnostic inspection;
- test-plan configuration;
- simulation control;
- fault activation;
- manual communication;
- manual input and output control;
- hardware configuration;
- calibration status;
- trace analysis;
- result investigation.

## Results and reporting

The platform generates structured test results containing:

- run identifier;
- station identifier;
- operator;
- product identity;
- product variant;
- package version;
- test-plan version;
- application version;
- start timestamp;
- end timestamp;
- step results;
- measurements;
- units;
- limits;
- verdicts;
- DTC evidence;
- communication traces;
- simulation evidence;
- hardware evidence;
- fault history;
- calibration information;
- errors;
- abort reasons.

Supported result formats include:

- JavaScript Object Notation (JSON);
- Hypertext Markup Language (HTML);
- Comma-Separated Values (CSV);
- Portable Document Format (PDF);
- database storage.

## Traceability

The platform links:

- requirements;
- test cases;
- test steps;
- measurements;
- faults;
- product versions;
- software versions;
- hardware versions;
- calibration records;
- reports;
- evidence files.

## Deployment

The platform supports:

- Microsoft Windows installation;
- portable Windows deployment;
- Linux deployment;
- source-code builds;
- command-line execution;
- desktop execution;
- automated laboratory execution;
- offline operation;
- on-premises operation;
- multi-station deployment.

## Compliance support

The platform stores standards references, requirements, verification methods,
test evidence, calibration records, configuration records, and audit records.

Applicable standards depend on the tested product, industry, test environment,
and deployment context.
