# 🛡️ AI-ITSM Compliance Auto
### Automated Compliance Workflows & AI-Powered Documentation

[![AI ITSM Full Stack CI](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/compliance-check.yml/badge.svg)](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/compliance-check.yml)
[![Compliance & Policy Guard](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/policy-guard.yml/badge.svg)](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/policy-guard.yml)

## 🌟 Project Mission
This project automates **ITSM documentation workflows** and **compliance auditing** using AI-driven analysis (RankLSTM) and DevSecOps orchestration. 

### 🔌 Integration & Scalability
While the current implementation features a native **ClickUp AI integration**, the core engine is **platform-agnostic**. The modular architecture allows for seamless integration with:
- **ITSM Tools:** Jira, ServiceNow, Zendesk.
- **Data Sources:** Local markdown repositories, Cloud storage, or custom APIs.
- **Compliance Frameworks:** ISO-27001, GDPR, MDR, or HIPAA.

### 🛡️ Core Capabilities
- **Automated ISO-27001 Mapping:** Automatically cross-references ITSM actions against international security standards.
- **AI Ranking Engine:** Uses RankLSTM to prioritize critical documentation updates based on compliance risk.
- **Zero-Touch Auditing:** Generate full compliance reports in seconds using the built-in orchestrator.

---

## 🏗️ Architecture Overview
The system follows a modular **RAG (Retrieval-Augmented Generation)** pattern designed for high-compliance environments:

```mermaid
graph TD
    subgraph Data_Ingestion
    A[Raw ITSM Docs / ClickUp API] --> B[ingest_to_vector_db.py]
    end

    subgraph AI_Intelligence_Layer
    B --> C[embeddings_generator.py]
    C --> D[(Vector Database / FAISS)]
    D --> E[RankLSTM Engine]
    E --> F[Contextual Ranking Refinement]
    end
    
    subgraph Operational_Output
    F --> G[Compliance-Aware AI Output]
    F --> H[Live AI-Dashboard / Audit Report]
    end

    subgraph Validation_Layer
    I[GitHub Actions CI] -.-> G
    J[Policy Guard] -.-> B
    end

    subgraph Validation_Layer
    I[proof-html.yml] -.-> H
    J[auto-assign.yml] -.-> B
    end
```
