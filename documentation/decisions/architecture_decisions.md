# Architecture Decisions

This document records the major architecture decisions for Vehicle Automation
Test.

## Product architecture

Vehicle Automation Test uses a modular architecture that separates:

- desktop applications;
- product data import;
- normalized product models;
- test execution;
- communication protocols;
- simulation and emulation;
- physical Hardware-in-the-Loop (HIL);
- result generation;
- deployment.

## Test execution

The platform uses the Open Test Automation Platform (OpenTAP) as the internal
test execution engine.

OpenTAP remains an implementation component behind the operator and engineering
applications.

## User interface

The desktop applications use Qt and C++.

The operator application focuses on test execution and result access.

The engineering application focuses on product configuration, communication,
diagnostics, simulation, hardware configuration, and investigation.

## Customer configuration

Customer-specific products are represented through Vehicle Test Packages.

The package contains communication descriptions, diagnostics, product
variants, simulation models, test plans, electrical mappings, limits,
requirements, and report metadata.

Customer configuration is separated from platform source code.

## Communication architecture

Communication protocols use transport abstractions so test logic remains
independent from specific hardware vendors.

Supported transports can include virtual channels, SocketCAN, PEAK,
Kvaser, Vector, and National Instruments adapters.

## Simulation architecture

Simulation uses a deterministic runtime with explicit simulation time.

The same product tests can execute against simulated systems and physical HIL
systems through common interfaces.

## Result architecture

JavaScript Object Notation (JSON) is the authoritative machine-readable result
format.

Human-readable and analytical formats are generated from the authoritative
result data.
