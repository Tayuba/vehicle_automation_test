# Software Boundaries

## Overview

Vehicle Automation Test separates user applications, product data, test
execution, communication, diagnostics, simulation, physical
Hardware-in-the-Loop (HIL), safety control, and result management.

Each subsystem exposes defined interfaces to the other parts of the platform.

## User applications

The operator station and engineering console present platform data and
commands.

They communicate with application services and do not contain communication
protocols, hardware drivers, simulation models, or test-execution logic.

## Product data platform

The product data platform owns:

- Vehicle Test Package import;
- engineering-file conversion;
- schema validation;
- product variants;
- normalized product data;
- cross-reference validation.

Runtime services access customer data through the normalized product model.

## Test executive

The test executive owns:

- test-plan execution;
- test-step state;
- resource coordination;
- timeout handling;
- retry handling;
- cleanup;
- measurements;
- limits;
- verdicts.

Test steps access communication, diagnostics, simulation, and HIL through
service interfaces.

## Communication subsystem

The communication subsystem owns:

- channels;
- frames;
- messages;
- signals;
- protocol state;
- transport adapters;
- communication traces.

Communication implementations remain independent from user-interface and
reporting code.

## Diagnostic subsystem

The diagnostic subsystem owns:

- diagnostic sessions;
- diagnostic services;
- Diagnostic Trouble Codes (DTCs);
- data identifiers;
- routines;
- security access;
- authentication;
- programming workflows;
- diagnostic timing.

It accesses vehicle networks through communication interfaces.

## Simulation subsystem

The simulation subsystem owns:

- simulation time;
- virtual Electronic Control Units (ECUs);
- plant models;
- sensor models;
- actuator models;
- fault models;
- deterministic execution.

Simulation models remain independent from graphical controls and physical
hardware drivers.

## Physical HIL subsystem

The physical HIL subsystem owns:

- hardware channels;
- electrical scaling;
- calibration;
- programmable power;
- loads;
- relays;
- physical fault injection;
- harness mapping.

Logical product signals are connected to physical channels through station
configuration.

## Safety control

Safety control owns:

- station safety state;
- hardware interlocks;
- power sequencing;
- output authorization;
- fault-injection authorization;
- safe-state transitions;
- emergency shutdown state.

Safety state is available to the operator station, test executive, and
physical HIL subsystem.

## Result platform

The result platform owns:

- test-run records;
- test-step records;
- measurements;
- limits;
- verdicts;
- evidence references;
- result persistence;
- report generation.

Reports are generated from stored result data.

## Extensions

Customer and vendor extensions connect through defined interfaces for:

- engineering-file import;
- communication transport;
- protocols;
- diagnostics;
- simulation;
- test steps;
- hardware;
- reporting.
