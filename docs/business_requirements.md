# RevenueGuard — Business Requirements

## 1. Project Overview

RevenueGuard is an end-to-end Revenue Cycle Intelligence, Data Quality and Investigation Platform.

The project uses synthetic healthcare revenue-cycle data to demonstrate practical data analytics skills including:

- data generation
- data validation
- data cleaning
- relational data modelling
- SQL analysis
- Python analytics
- revenue analysis
- accounts receivable analysis
- denial analysis
- payment reconciliation
- anomaly detection
- Power BI reporting
- business prioritization

The final goal is not only to show what happened, but to identify which issues require investigation and why.

---

## 2. Business Problem

Revenue-cycle teams manage large volumes of claims, payments and denials.

Business problems may include:

- high outstanding accounts receivable
- aging claims
- increasing denial rates
- delayed payments
- payment discrepancies
- underpayments
- duplicate payments
- missing payments
- incorrect or incomplete records
- claims approaching filing limits
- revenue that may be at risk

When data quality is poor, reporting can also become unreliable.

RevenueGuard will combine data-quality validation, financial analysis and business prioritization in one analytical workflow.

---

## 3. Project Objectives

RevenueGuard should answer five major questions:

### Revenue Performance

- How much was billed?
- How much was allowed?
- How much was paid?
- How much remains outstanding?
- What is the collection rate?
- How is revenue changing over time?

### Accounts Receivable

- How much AR exists?
- What is the AR aging distribution?
- Which claims are old?
- Which payers have the most outstanding AR?
- Which providers have large outstanding balances?
- Which claims are approaching filing limits?

### Denials

- What is the denial rate?
- What is the total denied amount?
- Which denial categories are most common?
- Which payers have higher denial rates?
- Which providers show unusual denial patterns?
- Are denials increasing or decreasing?
- How successful are appeals?
- How much denied revenue has been recovered?

### Payments

- How much has been paid?
- How long does payment take?
- Are there possible underpayments?
- Are there possible overpayments?
- Are there negative payments?
- Are there duplicate payments?
- Are there payments without valid claims?
- Are payment amounts consistent with claim values?

### Data Quality

- Are required IDs missing?
- Are duplicate claims present?
- Are relationships broken?
- Are dates logically valid?
- Are negative or impossible amounts present?
- Are denial records incomplete?
- Are payments attached to nonexistent claims?

---

## 4. Action Center

RevenueGuard will include an Action Center that prioritizes records requiring investigation.

Examples:

- claims approaching filing limits
- high-value outstanding claims
- unusual denial increases
- possible underpayments
- duplicate payments
- orphan payments
- suspicious adjustments
- critical data-quality failures

Each issue should eventually include:

- record ID
- issue type
- severity
- financial exposure
- reason for flag
- recommended investigation

The Action Center should help answer:

"What should the analyst investigate first?"

---

## 5. Target Users

Possible users include:

- Data Analysts
- Revenue Analysts
- Business Intelligence Analysts
- Revenue Cycle Analysts
- Finance Analysts
- Operations Analysts
- Reporting Analysts
- Revenue Cycle Managers

---

## 6. Technology Stack

- Python
- Pandas
- NumPy
- Faker
- PostgreSQL
- SQL
- Power BI
- Power Query
- DAX
- Git
- GitHub

---

## 7. Data Architecture

The project contains four PostgreSQL schemas:

### staging

Raw incoming data.

The purpose of staging is to preserve source records before cleaning.

### analytics

Cleaned and transformed data used for analysis.

### reporting

Business-ready tables or views designed for Power BI and reporting.

### audit

Data-quality failures, pipeline logs and validation history.

---

## 8. Core Entities

RevenueGuard contains six main source entities:

- Patients
- Providers
- Payers
- Claims
- Payments
- Denials

The claim is the central transactional entity.

Relationships:

Patient -> Claim

Provider -> Claim

Payer -> Claim

Claim -> Payment

Claim -> Denial

---

## 9. Project Success Criteria

The project will be considered successful when it can:

1. Generate realistic synthetic data.
2. Load raw data into PostgreSQL.
3. Detect deliberately injected data-quality problems.
4. Transform valid data into an analytics layer.
5. Calculate accurate business KPIs.
6. Perform advanced SQL analysis.
7. Analyse trends and anomalies using Python.
8. Produce Power BI reporting.
9. Prioritize important issues through the Action Center.
10. Explain findings in clear business language.

---------
---

## 10. Initial Data Quality Rules

### Claims

DQ001 - Missing claim ID
Severity: Critical

DQ002 - Duplicate claim ID
Severity: Critical

DQ003 - Missing payer ID
Severity: High

DQ004 - Missing provider ID
Severity: High

DQ005 - Missing patient ID
Severity: High

DQ006 - Submission date before service date
Severity: High

DQ007 - Invalid filing limit date
Severity: High

DQ008 - Negative billed amount
Severity: Critical

DQ009 - Allowed amount greater than billed amount
Severity: Medium

### Payments

DQ010 - Missing payment ID
Severity: Critical

DQ011 - Duplicate payment ID
Severity: Critical

DQ012 - Missing claim ID
Severity: Critical

DQ013 - Payment linked to nonexistent claim
Severity: Critical

DQ014 - Negative payment amount
Severity: High

DQ015 - Suspicious payment amount greater than claim value
Severity: High

DQ016 - Duplicate payment transaction
Severity: High

### Denials

DQ017 - Missing denial ID
Severity: Critical

DQ018 - Missing claim ID
Severity: Critical

DQ019 - Denial linked to nonexistent claim
Severity: Critical

DQ020 - Missing denial code
Severity: Medium

DQ021 - Resolution date before denial date
Severity: High

DQ022 - Negative denial amount
Severity: High
---

## 11. Action Center Concept

The Action Center will prioritize issues requiring analyst investigation.

### Initial Issue Categories

1. Filing Limit Risk

Claims with significant outstanding balances that are approaching their filing limit.

2. High-Value Outstanding AR

Large outstanding balances that remain unresolved for a significant period.

3. Possible Payment Discrepancy

Payments that appear inconsistent with expected financial values.

4. Denial Increase

Denial categories, payers or providers showing unusual increases.

5. Duplicate Transaction Risk

Potential duplicate claims or payment transactions.

6. Orphan Transaction

Payments or denials without a valid parent claim.

7. Data Quality Failure

Critical records that cannot safely move into the analytics layer.

### Priority Levels

Critical

High

Medium

Low

Priority will eventually consider:

- financial exposure
- age
- filing-limit proximity
- denial status
- data-quality severity
- anomaly indicators
# RevenueGuard Data Dictionary

## staging.patients

Grain: One row represents one patient.

| Column | Type | Description |
|---|---|---|
| patient_id | VARCHAR(50) | Patient identifier |
| age_group | VARCHAR(20) | Patient age category |
| gender | VARCHAR(20) | Patient gender |
| city | VARCHAR(100) | Patient city |
| state | VARCHAR(50) | Patient state |
| zip_code | VARCHAR(20) | Postal code |
| source_file | VARCHAR(255) | Original source filename |
| loaded_at | TIMESTAMP | Record load timestamp |

---

## staging.providers

Grain: One row represents one provider.

| Column | Type | Description |
|---|---|---|
| provider_id | VARCHAR(50) | Provider identifier |
| provider_name | VARCHAR(150) | Provider name |
| specialty | VARCHAR(100) | Provider specialty |
| facility_id | VARCHAR(50) | Facility identifier |
| facility_name | VARCHAR(150) | Facility name |
| city | VARCHAR(100) | Provider city |
| state | VARCHAR(50) | Provider state |
| source_file | VARCHAR(255) | Original source filename |
| loaded_at | TIMESTAMP | Record load timestamp |

---

## staging.payers

Grain: One row represents one payer.

| Column | Type | Description |
|---|---|---|
| payer_id | VARCHAR(50) | Payer identifier |
| payer_name | VARCHAR(150) | Payer name |
| payer_type | VARCHAR(50) | Payer category |
| filing_limit_days | INTEGER | Maximum filing period |
| expected_payment_days | INTEGER | Expected payment turnaround |
| source_file | VARCHAR(255) | Original source filename |
| loaded_at | TIMESTAMP | Record load timestamp |

---

## staging.claims

Grain: One row represents one claim.

| Column | Type | Description |
|---|---|---|
| claim_id | VARCHAR(50) | Claim identifier |
| patient_id | VARCHAR(50) | Related patient |
| provider_id | VARCHAR(50) | Related provider |
| payer_id | VARCHAR(50) | Related payer |
| service_date | DATE | Date service occurred |
| submission_date | DATE | Date claim submitted |
| claim_status | VARCHAR(50) | Claim status |
| procedure_code | VARCHAR(50) | Procedure identifier |
| diagnosis_code | VARCHAR(50) | Diagnosis identifier |
| billed_amount | NUMERIC(12,2) | Original billed value |
| allowed_amount | NUMERIC(12,2) | Allowed claim value |
| total_paid_amount | NUMERIC(12,2) | Source-reported paid amount |
| contractual_adjustment | NUMERIC(12,2) | Contractual adjustment |
| other_adjustment | NUMERIC(12,2) | Other adjustment |
| patient_payment | NUMERIC(12,2) | Patient payment |
| source_outstanding_amount | NUMERIC(12,2) | Source-reported outstanding balance |
| last_follow_up_date | DATE | Last follow-up date |
| filing_limit_date | DATE | Filing deadline |
| source_file | VARCHAR(255) | Original source filename |
| loaded_at | TIMESTAMP | Record load timestamp |

---

## staging.payments

Grain: One row represents one payment transaction.

| Column | Type | Description |
|---|---|---|
| payment_id | VARCHAR(50) | Payment identifier |
| claim_id | VARCHAR(50) | Related claim |
| payment_date | DATE | Payment date |
| payment_amount | NUMERIC(12,2) | Payment amount |
| adjustment_amount | NUMERIC(12,2) | Adjustment associated with payment |
| payment_method | VARCHAR(50) | Payment method |
| payment_reference | VARCHAR(100) | Transaction/reference number |
| posting_status | VARCHAR(50) | Posting status |
| source_file | VARCHAR(255) | Original source filename |
| loaded_at | TIMESTAMP | Record load timestamp |

---

## staging.denials

Grain: One row represents one denial event.

| Column | Type | Description |
|---|---|---|
| denial_id | VARCHAR(50) | Denial identifier |
| claim_id | VARCHAR(50) | Related claim |
| denial_date | DATE | Date of denial |
| denial_code | VARCHAR(50) | Denial code |
| denial_category | VARCHAR(100) | Denial grouping |
| denial_description | VARCHAR(255) | Denial description |
| denial_amount | NUMERIC(12,2) | Amount denied |
| appeal_status | VARCHAR(50) | Appeal status |
| appeal_date | DATE | Appeal submission date |
| resolution_date | DATE | Date denial was resolved |
| resolution_status | VARCHAR(100) | Resolution result |
| recovered_amount | NUMERIC(12,2) | Revenue recovered after denial |
| source_file | VARCHAR(255) | Original source filename |
| loaded_at | TIMESTAMP | Record load timestamp |
