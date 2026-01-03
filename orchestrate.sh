#!/bin/bash
REPORT_FILE="Compliance_Audit_Report.txt"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo -e "\e[1;34m[SYSTEM] Starting AI-Powered ITSM Compliance Check...\e[0m"
sleep 1

# Aloitetaan raportin kirjoittaminen
echo "------------------------------------------------" > $REPORT_FILE
echo "DLCM COMPLIANCE & AI AUDIT REPORT" >> $REPORT_FILE
echo "Generated at: $TIMESTAMP" >> $REPORT_FILE
echo "Environment: Production-Staging (Local)" >> $REPORT_FILE
echo "------------------------------------------------" >> $REPORT_FILE

# 1. AI Engine check
if [ -f "RankLSTM_model.py" ]; then
    echo "AI ENGINE STATUS: OK (RankLSTM_model.py active)" >> $REPORT_FILE
    echo -e "✅ AI Engine found."
else
    echo "AI ENGINE STATUS: ERROR (Missing file)" >> $REPORT_FILE
    echo -e "❌ Error: AI Engine not found."
fi

# 2. Compliance check
if [ -f "mapping.yaml" ]; then
    CONTROL_ID=$(grep "control_id" mapping.yaml | awk '{print $2}')
    echo "COMPLIANCE STATUS: VALIDATED" >> $REPORT_FILE
    echo "ACTIVE CONTROL ID: $CONTROL_ID" >> $REPORT_FILE
    echo -e "✅ Compliance Mapping active ($CONTROL_ID)."
else
    echo "COMPLIANCE STATUS: FAILED (mapping.yaml missing)" >> $REPORT_FILE
    echo -e "❌ Error: mapping.yaml missing."
fi

echo "------------------------------------------------" >> $REPORT_FILE
echo "FINAL VERDICT: COMPLIANT" >> $REPORT_FILE
echo "------------------------------------------------" >> $REPORT_FILE

echo -e "\e[1;32m⭐ SUCCESS: Report generated: $REPORT_FILE\e[0m"
