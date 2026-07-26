# System Architecture

## Overview

Vehicle Automation Test is a modular platform for automated testing of
vehicle, agricultural, industrial, and embedded control products.

The platform supports simulation, emulation, Software-in-the-Loop (SIL),
Hardware-in-the-Loop (HIL), physical controller testing, diagnostic testing,
fault simulation, automated test execution, and result reporting.

## User applications

### Operator station

The operator station provides:

- product selection;
- product variant selection;
- test-plan selection;
- test execution;
- operator prompts;
- live execution status;
- final verdict display;
- report access.

### Engineering console

The engineering console provides:

- product-package import;
- package validation;
- communication configuration;
- signal inspection;
- diagnostic inspection;
- simulation control;
- fault control;
- hardware configuration;
- trace analysis;
- result investigation.

## Product data platform

The product data platform imports customer engineering files and converts them
into a normalized internal product model.

The product model contains:

- products;
- product variants;
- communication networks;
- Electronic Control Units (ECUs);
- messages;
- signals;
- diagnostic definitions;
- simulation models;
- test plans;
- requirements;
- electrical mappings;
- report configuration.

## Test executive

The Open Test Automation Platform (OpenTAP) provides the internal test
execution engine.

The test executive manages:

- test-plan loading;
- setup execution;
- test-step execution;
- cleanup execution;
- resource management;
- timeout handling;
- retry handling;
- abort handling;
- measurements;
- limits;
- verdicts;
- execution events.

## Communication subsystem

The communication subsystem provides transport-independent access to virtual
and physical communication channels.

Supported protocol families include:

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

## Diagnostic subsystem

The diagnostic subsystem provides:

- ECU identification;
- Diagnostic Trouble Code (DTC) reading;
- DTC clearing;
- diagnostic-session control;
- data-identifier access;
- routine control;
- security access;
- authentication;
- ECU programming;
- diagnostic timing;
- raw diagnostic evidence.

## Simulation subsystem

The simulation subsystem provides:

- virtual ECUs;
- network simulation;
- restbus simulation;
- plant simulation;
- sensor simulation;
- actuator simulation;
- fault simulation;
- deterministic execution;
- real-time execution;
- trace replay;
- Functional Mock-up Unit (FMU) support.

## Physical HIL subsystem

The physical HIL subsystem provides:

- programmable power control;
- digital input and output;
- analog input and output;
- voltage measurement;
- current measurement;
- resistance simulation;
- pulse and frequency generation;
- Pulse-Width Modulation (PWM);
- load simulation;
- fault injection;
- hardware interlocks;
- emergency shutdown;
- safe-state control.

## Result platform

The result platform stores:

- test-run identity;
- station identity;
- operator identity;
- product identity;
- product variant;
- test-plan version;
- test-step results;
- measurements;
- limits;
- verdicts;
- diagnostic evidence;
- communication traces;
- simulation evidence;
- hardware evidence;
- calibration information;
- errors;
- abort information.

JavaScript Object Notation (JSON) is the authoritative machine-readable result
format.

Additional output formats include:

- Hypertext Markup Language (HTML);
- Comma-Separated Values (CSV);
- Portable Document Format (PDF);
- database records.

## Data flow

```text
Customer engineering files
        |
        v
Vehicle Test Package
        |
        v
Package import and validation
        |
        v
Normalized product model
        |
        v
Test-plan and runtime configuration
        |
        v
Simulation, diagnostics, communication, or physical HIL
        |
        v
Test execution
        |
        v
Measurements, evidence, and verdicts
        |
        v
Results and reports
```

## Extension model

The platform supports extensions for:

- customer file importers;
- communication transports;
- protocol implementations;
- diagnostic services;
- simulation models;
- test steps;
- hardware adapters;
- result exporters.
