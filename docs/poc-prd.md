1. 배경 및 목적
엔터프라이즈 환경에서 개발자가 보안 가이드라인을 준수하며 인프라를 프로비저닝하고 애플리케이션을 배포하는 과정은 복잡하고 시간이 많이 소요됨. 본 PoC는 Backstage를 통해 이 과정을 'Self-Service'화하여 개발 생산성을 높이고, Azure 및 GitHub를 연동해 강력한 DevSecOps 가드레일을 제공함을 목적으로 함.

2. 핵심 기능 (MVP Scope)
Software Templates (The Golden Path):

Azure Web App(Node.js/Python) 기반의 표준 프로젝트 템플릿 제공.

GitHub Repository 자동 생성 및 초기 코드(CI/CD 포함) 커밋.

Infrastructure as Code (IaC) Integration:

Azure Bicep을 활용한 표준 리소스 선언.

배포 시 Azure Policy 및 태깅(Owner, Environment 등) 강제 적용.

DevSecOps Pipeline:

GitHub Actions를 통한 자동 빌드 및 배포.

보안 스캔(Static Analysis, Credential Scan) 단계 필수 포함.

Software Catalog:

생성된 서비스의 메타데이터 및 인프라 상태를 Backstage에서 한눈에 확인.

3. 기술 스택
Portal: Backstage (Node.js/React)

Infrastructure: Azure (Bicep 또는 Terraform)

VCS/CI/CD: GitHub Enterprise & GitHub Actions

Security: GitHub Advanced Security (Secret Scanning), Checkov (IaC Scan)