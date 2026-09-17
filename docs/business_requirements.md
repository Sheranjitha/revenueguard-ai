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
