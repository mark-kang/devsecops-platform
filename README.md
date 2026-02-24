# DevSecOps Platform

An enterprise-grade **DevSecOps Developer Portal** built on [Backstage](https://backstage.io) (v1.48.0), designed to enable self-service infrastructure provisioning and application deployment while enforcing security guardrails.

## Overview

This platform streamlines the developer experience by providing a unified portal that integrates with **Azure** and **GitHub**, helping engineering teams follow the Golden Path  secure, compliant, and efficient by default.

> **Status**: Proof of Concept (PoC)

## Key Features

-  **Software Templates (Golden Path)**  Self-service templates for bootstrapping new services, repos, and infrastructure with built-in security defaults
-  **DevSecOps Guardrails**  Automated security and compliance checks integrated into the developer workflow
-  **Azure Integration**  Infrastructure provisioning via Azure with IaC scanning (Terraform/Bicep)
-  **GitHub Integration**  Source control, CI/CD pipeline automation, and repository management
-  **IaC Scan**  Static analysis of Infrastructure-as-Code to catch misconfigurations before deployment

## Repository Structure

`
devsecops-platform/
 developer-portal/     # Backstage application (v1.48.0)
    packages/         # Core app & backend packages
    plugins/          # Custom Backstage plugins
    examples/         # Catalog entity examples
    app-config.yaml   # Application configuration
 docs/                 # Project documentation
    poc-prd.md        # PoC Product Requirements Document
 LICENSE               # MIT License
`

## Getting Started

### Prerequisites

- Node.js 18+
- Yarn
- Docker (for local backend services)

### Running Locally

`sh
cd developer-portal
yarn install
yarn start
`

The portal will be available at http://localhost:3000.

### Configuration

| File | Purpose |
|------|---------|
| pp-config.yaml | Base configuration |
| pp-config.local.yaml | Local development overrides (not committed) |
| pp-config.production.yaml | Production configuration |

## Tech Stack

| Component | Technology |
|-----------|-----------|
| Developer Portal | [Backstage](https://backstage.io) v1.48.0 |
| Cloud Provider | Microsoft Azure |
| Source Control | GitHub |
| IaC | Terraform / Bicep |
| Language | TypeScript |

## Documentation

- [PoC PRD](./docs/poc-prd.md)  Product requirements and scope for the PoC phase

## License

This project is licensed under the [MIT License](./LICENSE).
