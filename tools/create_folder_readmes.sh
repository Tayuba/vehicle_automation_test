#!/usr/bin/env bash

set -euo pipefail

declare -A descriptions

descriptions["applications"]="Contains the user-facing desktop applications."
descriptions["applications/operator_station"]="Contains the production and laboratory operator application."
descriptions["applications/engineering_console"]="Contains engineering tools for configuration, diagnostics, simulation, and troubleshooting."

descriptions["platform"]="Contains platform services and domain-independent application logic."
descriptions["platform/product_model"]="Contains the normalized representation of customer products, variants, networks, controllers, signals, diagnostics, and test definitions."
descriptions["platform/package_importer"]="Contains customer package loading, validation, migration, and import logic."
descriptions["platform/station_controller"]="Contains station state coordination, resource management, execution coordination, and safety-state integration."
descriptions["platform/result_model"]="Contains immutable test-run, test-step, measurement, evidence, and verdict models."
descriptions["platform/configuration"]="Contains platform and station configuration models, validation, defaults, and migrations."

descriptions["test_executive"]="Contains integration with the automated test-sequence execution system."
descriptions["test_executive/opentap_plugins"]="Contains plugins that integrate the Open Test Automation Platform (OpenTAP) with this project."
descriptions["test_executive/plan_generator"]="Contains conversion of normalized customer test definitions into executable test plans."
descriptions["test_executive/result_listener"]="Contains execution-event collection and structured test-result publication."

descriptions["communication"]="Contains vehicle and industrial communication transports and protocol implementations."
descriptions["communication/can_core"]="Contains the Controller Area Network (CAN) frame model, channel abstraction, filtering, timing, statistics, and trace interfaces."
descriptions["communication/socketcan"]="Contains the Linux SocketCAN transport implementation."
descriptions["communication/virtual_can"]="Contains virtual and replay-based CAN channel implementations used for simulation and automated testing."
descriptions["communication/j1939"]="Contains the Society of Automotive Engineers J1939 (SAE J1939) protocol implementation."

descriptions["simulation"]="Contains deterministic simulation, emulation, plant-model, and fault-model components."
descriptions["simulation/runtime"]="Contains the simulation clock, scheduler, lifecycle, and execution controls."
descriptions["simulation/virtual_ecu"]="Contains virtual Electronic Control Unit (ECU) implementations."
descriptions["simulation/fault_models"]="Contains network, diagnostic, electrical, sensor, actuator, and plant fault definitions."

descriptions["formats"]="Contains parsers, serializers, schemas, and format-conversion components."
descriptions["formats/package_schema"]="Contains the Vehicle Test Package schema and validation rules."
descriptions["formats/result_schema"]="Contains authoritative machine-readable test-result schemas."
descriptions["formats/dbc_importer"]="Contains the Controller Area Network database file (DBC) importer and normalization logic."

descriptions["sample_packages"]="Contains redistributable example customer packages used for demonstrations and acceptance tests."
descriptions["sample_packages/agricultural_engine"]="Contains the agricultural engine controller demonstration package."

descriptions["tests"]="Contains automated verification of the platform."
descriptions["tests/unit"]="Contains isolated software unit tests."
descriptions["tests/integration"]="Contains tests for interaction between multiple platform components."
descriptions["tests/protocol"]="Contains protocol behaviour, timing, malformed-message, and interoperability tests."
descriptions["tests/acceptance"]="Contains end-to-end tests derived from the Minimum Viable Product (MVP) acceptance criteria."

descriptions["tools"]="Contains development, validation, packaging, migration, and release-support utilities."

descriptions["deployment"]="Contains packaging, installation, service, and runtime deployment definitions."
descriptions["deployment/windows"]="Contains Microsoft Windows installer and deployment resources."
descriptions["deployment/linux"]="Contains Linux packaging, service, and deployment resources."

descriptions["legal"]="Contains licence, attribution, redistribution, and dependency-compliance records."
descriptions["legal/third_party_notices"]="Contains notices required by third-party software licences."
descriptions["legal/licences"]="Contains copies of licences associated with distributed components."
descriptions["legal/dependency_manifest"]="Contains the dependency inventory, licence classification, and redistribution status."

descriptions["documentation"]="Contains controlled project documentation."
descriptions["documentation/architecture"]="Contains system, software, communication, simulation, safety, and deployment architecture."
descriptions["documentation/requirements"]="Contains version-controlled platform, product, interface, safety, and quality requirements."
descriptions["documentation/decisions"]="Contains Architecture Decision Records (ADRs) for important technical and product decisions."
descriptions["documentation/compliance"]="Contains standards applicability, traceability, tool-confidence, calibration, and audit information."
descriptions["documentation/development"]="Contains development-environment, coding, build, testing, and contribution documentation."

declare -A titles

titles["communication/can_core"]="CAN Core"
titles["communication/j1939"]="J1939"
titles["simulation/virtual_ecu"]="Virtual ECU"
titles["test_executive/opentap_plugins"]="OpenTAP Plugins"
titles["formats/dbc_importer"]="DBC Importer"

for folder in "${!descriptions[@]}"; do
    if [[ ! -d "$folder" ]]; then
        echo "ERROR: Missing folder: $folder" >&2
        exit 1
    fi

    if [[ -n "${titles[$folder]:-}" ]]; then
        title="${titles[$folder]}"
    else
        title="$(basename "$folder" | tr '_' ' ')"
        title="$(printf '%s' "$title" | awk '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')"
    fi

    cat > "$folder/README.md" <<README
# $title

${descriptions[$folder]}
README
done

echo "Created descriptive folder README files."
