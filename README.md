# DevSecOps 플랫폼

[Backstage](https://backstage.io) (v1.48.0) 기반의 엔터프라이즈급 **DevSecOps 개발자 포털**입니다. 보안 가이드라인을 준수하면서 셀프서비스 방식으로 인프라를 프로비저닝하고 애플리케이션을 배포할 수 있도록 설계되었습니다.

## 개요

이 플랫폼은 **Azure** 및 **GitHub**와 통합된 단일 포털을 제공하여 개발자 경험을 개선합니다. 엔지니어링 팀이 기본적으로 안전하고, 컴플라이언스를 준수하며, 효율적인 골든 패스(Golden Path)를 따를 수 있도록 지원합니다.

> **상태**: 개념 증명(PoC) 단계

## 주요 기능

- 🛠️ **소프트웨어 템플릿 (골든 패스)** — 보안 기본값이 내장된 새 서비스·저장소·인프라를 빠르게 구성하는 셀프서비스 템플릿
- 🔒 **DevSecOps 가드레일** — 개발자 워크플로우에 통합된 자동 보안 및 컴플라이언스 검사
- ☁️ **Azure 연동** — IaC 스캔(Terraform/Bicep)을 포함한 Azure 인프라 프로비저닝
- 🐙 **GitHub 연동** — 소스 제어, CI/CD 파이프라인 자동화, 저장소 관리
- 🔍 **IaC 스캔** — 배포 전 인프라 코드의 잘못된 구성을 탐지하는 정적 분석

## 저장소 구조

```
devsecops-platform/
├── developer-portal/     # Backstage 애플리케이션 (v1.48.0)
│   ├── packages/         # 핵심 앱 & 백엔드 패키지
│   ├── plugins/          # 커스텀 Backstage 플러그인
│   ├── examples/         # 카탈로그 엔티티 예시
│   └── app-config.yaml   # 애플리케이션 설정
├── docs/                 # 프로젝트 문서
│   └── poc-prd.md        # PoC 제품 요구사항 문서
└── LICENSE               # MIT 라이선스
```

## 시작하기

### 사전 요구사항

- Node.js 18 이상
- Yarn
- Docker (로컬 백엔드 서비스 실행 시)

### 로컬 실행

```sh
cd developer-portal
yarn install
yarn start
```

포털은 http://localhost:3000 에서 접속할 수 있습니다.

### 설정 파일

| 파일 | 용도 |
|------|------|
| `app-config.yaml` | 기본 설정 |
| `app-config.local.yaml` | 로컬 개발 환경 오버라이드 (커밋 제외) |
| `app-config.production.yaml` | 프로덕션 설정 |

## 기술 스택

| 구성 요소 | 기술 |
|-----------|------|
| 개발자 포털 | [Backstage](https://backstage.io) v1.48.0 |
| 클라우드 | Microsoft Azure |
| 소스 제어 | GitHub |
| IaC | Terraform / Bicep |
| 언어 | TypeScript |

## 문서

- [PoC PRD](./docs/poc-prd.md) — PoC 단계의 제품 요구사항 및 범위

## 라이선스

이 프로젝트는 [MIT 라이선스](./LICENSE) 하에 배포됩니다.
