# RevenueGuard AI — Data Dictionary

## 1. Purpose

This document defines the data model for RevenueGuard AI.

The project will use a star-schema style data model containing dimension tables and fact tables.

Dimension tables describe business entities such as patients, providers, payers, denial reasons and dates.

Fact tables store measurable business events such as claims, payments and denials.

The model is designed to support accounts-receivable analysis, payment reconciliation, denial analysis, payer performance, provider performance and Power BI reporting.

---

# 2. Simple Data Model

The main relationships are:

```text
Patient  → Claim
Provider → Claim
Payer    → Claim

Claim → Payment
Claim → Denial

Date → Claim
Date → Payment
Date → Denial
```

A simplified model is:

```text
dim_patient
     |
     |
     v
fact_claim <------ dim_provider
     ^
     |
     |
dim_payer

fact_claim
   |
   |------< fact_payment
   |
   |------< fact_denial

dim_date
   |
   |------> fact_claim
   |------> fact_payment
   |------> fact_denial
```

---

# 3. Key Concepts

## Primary Key

A primary key uniquely identifies one row in a table.

Example:

```text
patient_key = 101
```

No two rows in `dim_patient` should have the same `patient_key`.

Examples of primary keys in this project include:

* patient_key
* provider_key
* payer_key
* date_key
* denial_reason_key
* claim_key
* payment_key
* denial_key

---

## Foreign Key

A foreign key connects one table to another table.

Example:

A claim belongs to a patient.

Therefore:

```text
fact_claim.patient_key
```

connects to:

```text
dim_patient.patient_key
```

The value stored in the fact table tells us which patient belongs to that claim.

---

## Surrogate Key

A surrogate key is a technical numeric identifier created by the analytics system.

Example:

```text
patient_key = 101
```

The original source system may contain:

```text
patient_id = PAT000245
```

RevenueGuard can keep both values.

The numeric `patient_key` will be used for relationships in the analytics model.

---

# 4. Relationship Types

## Patient to Claim

Relationship:

```text
dim_patient
    1
    |
    |
    *
fact_claim
```

Meaning:

One patient can have many claims.

Each claim belongs to one patient.

Relationship type:

```text
One-to-Many
```

---

## Provider to Claim

Relationship:

```text
dim_provider
    1
    |
    |
    *
fact_claim
```

Meaning:

One provider can be associated with many claims.

Each claim is associated with one provider in the first version of the project.

Relationship type:

```text
One-to-Many
```

---

## Payer to Claim

Relationship:

```text
dim_payer
    1
    |
    |
    *
fact_claim
```

Meaning:

One payer can be responsible for many claims.

Each claim will have one primary payer in the first version.

Relationship type:

```text
One-to-Many
```

---

## Claim to Payment

Relationship:

```text
fact_claim
    1
    |
    |
    *
fact_payment
```

Meaning:

One claim may receive zero, one or multiple payments.

One payment belongs to one claim.

Relationship type:

```text
One-to-Many
```

---

## Claim to Denial

Relationship:

```text
fact_claim
    1
    |
    |
    *
fact_denial
```

Meaning:

One claim may have zero, one or multiple denial events.

One denial record belongs to one claim.

Relationship type:

```text
One-to-Many
```

---

## Date to Claim

Relationship:

```text
dim_date
    1
    |
    |
    *
fact_claim
```

Meaning:

One calendar date can be associated with many claims.

Claims will use dates such as:

* service date
* submission date
* created date
* last follow-up date

---

## Date to Payment

Relationship:

```text
dim_date
    1
    |
    |
    *
fact_payment
```

Meaning:

One calendar date can contain many payment transactions.

---

## Date to Denial

Relationship:

```text
dim_date
    1
    |
    |
    *
fact_denial
```

Meaning:

One calendar date can contain many denial events.

---

# 5. Dimension Tables

The first version of RevenueGuard AI will contain the following dimension tables:

```text
dim_patient
dim_provider
dim_payer
dim_denial_reason
dim_date
```

---

# 6. Dimension Table — dim_patient

## Purpose

`dim_patient` stores descriptive information about synthetic patients.

No real patient information will be used.

## Primary Key

```text
patient_key
```

## Columns

| Column      | Data Type | Required | Business Meaning                               |
| ----------- | --------- | -------: | ---------------------------------------------- |
| patient_key | INTEGER   |      Yes | Analytics-generated unique patient identifier  |
| patient_id  | VARCHAR   |      Yes | Original synthetic patient identifier          |
| age_group   | VARCHAR   |      Yes | Patient age category used for analysis         |
| gender      | VARCHAR   |       No | Synthetic patient gender value                 |
| city        | VARCHAR   |       No | Synthetic patient city                         |
| state       | VARCHAR   |       No | Synthetic patient state                        |
| zip_code    | VARCHAR   |       No | Synthetic postal code                          |
| active_flag | BOOLEAN   |      Yes | Indicates whether the patient record is active |
| created_at  | TIMESTAMP |      Yes | Date and time the record was created           |
| updated_at  | TIMESTAMP |      Yes | Date and time the record was last updated      |

## Example

```text
patient_key: 101
patient_id: PAT000101
age_group: 45-54
gender: Female
state: TX
active_flag: True
```

---

# 7. Dimension Table — dim_provider

## Purpose

`dim_provider` stores descriptive information about healthcare providers.

## Primary Key

```text
provider_key
```

## Columns

| Column        | Data Type | Required | Business Meaning                          |
| ------------- | --------- | -------: | ----------------------------------------- |
| provider_key  | INTEGER   |      Yes | Analytics-generated provider identifier   |
| provider_id   | VARCHAR   |      Yes | Original synthetic provider identifier    |
| provider_name | VARCHAR   |      Yes | Synthetic provider name                   |
| specialty     | VARCHAR   |      Yes | Provider medical specialty                |
| facility_id   | VARCHAR   |       No | Facility associated with the provider     |
| facility_name | VARCHAR   |       No | Synthetic facility name                   |
| city          | VARCHAR   |       No | Provider city                             |
| state         | VARCHAR   |       No | Provider state                            |
| active_flag   | BOOLEAN   |      Yes | Indicates whether the provider is active  |
| created_at    | TIMESTAMP |      Yes | Date and time the record was created      |
| updated_at    | TIMESTAMP |      Yes | Date and time the record was last updated |

## Example

```text
provider_key: 25
provider_id: PRV0025
provider_name: Dr. Synthetic Example
specialty: Cardiology
facility_name: Central Medical Centre
state: CA
```

---

# 8. Dimension Table — dim_payer

## Purpose

`dim_payer` stores information about insurance payers.

This table will be important for denial, payment and collection analysis.

## Primary Key

```text
payer_key
```

## Columns

| Column                | Data Type | Required | Business Meaning                               |
| --------------------- | --------- | -------: | ---------------------------------------------- |
| payer_key             | INTEGER   |      Yes | Analytics-generated payer identifier           |
| payer_id              | VARCHAR   |      Yes | Original synthetic payer identifier            |
| payer_name            | VARCHAR   |      Yes | Synthetic payer name                           |
| payer_type            | VARCHAR   |      Yes | Type of payer                                  |
| filing_limit_days     | INTEGER   |      Yes | Number of days allowed for claim filing        |
| expected_payment_days | INTEGER   |       No | Expected average number of days before payment |
| active_flag           | BOOLEAN   |      Yes | Indicates whether the payer is active          |
| created_at            | TIMESTAMP |      Yes | Date and time the record was created           |
| updated_at            | TIMESTAMP |      Yes | Date and time the record was last updated      |

## Example Payer Types

```text
Commercial
Medicare
Medicaid
Self Pay
Other
```

## Example

```text
payer_key: 12
payer_id: PAY0012
payer_name: Horizon Health Plan
payer_type: Commercial
filing_limit_days: 90
expected_payment_days: 30
```

---

# 9. Dimension Table — dim_denial_reason

## Purpose

`dim_denial_reason` stores standardised denial codes and denial categories.

## Primary Key

```text
denial_reason_key
```

## Columns

| Column             | Data Type | Required | Business Meaning                                       |
| ------------------ | --------- | -------: | ------------------------------------------------------ |
| denial_reason_key  | INTEGER   |      Yes | Analytics-generated denial reason identifier           |
| denial_code        | VARCHAR   |      Yes | Denial code                                            |
| denial_category    | VARCHAR   |      Yes | High-level denial category                             |
| denial_description | VARCHAR   |      Yes | Description of the denial reason                       |
| preventable_flag   | BOOLEAN   |      Yes | Indicates whether the denial may have been preventable |
| active_flag        | BOOLEAN   |      Yes | Indicates whether the denial reason is active          |
| created_at         | TIMESTAMP |      Yes | Date and time the record was created                   |

## Example Categories

```text
Eligibility
Authorization
Coding
Duplicate Claim
Medical Necessity
Timely Filing
Missing Information
Coordination of Benefits
```

## Example

```text
denial_reason_key: 5
denial_code: D005
denial_category: Authorization
denial_description: Missing prior authorization
preventable_flag: True
```

---

# 10. Dimension Table — dim_date

## Purpose

`dim_date` provides calendar information for time-based reporting.

It will allow Power BI to analyse claims, payments and denials by:

* day
* week
* month
* quarter
* year

## Primary Key

```text
date_key
```

## Columns

| Column         | Data Type | Required | Business Meaning                          |
| -------------- | --------- | -------: | ----------------------------------------- |
| date_key       | INTEGER   |      Yes | Numeric date identifier, usually YYYYMMDD |
| full_date      | DATE      |      Yes | Full calendar date                        |
| day_number     | INTEGER   |      Yes | Day of month                              |
| day_name       | VARCHAR   |      Yes | Name of the day                           |
| week_number    | INTEGER   |      Yes | Week number of year                       |
| month_number   | INTEGER   |      Yes | Month number                              |
| month_name     | VARCHAR   |      Yes | Month name                                |
| quarter_number | INTEGER   |      Yes | Calendar quarter                          |
| year_number    | INTEGER   |      Yes | Calendar year                             |
| year_month     | VARCHAR   |      Yes | Reporting value such as 2026-08           |
| weekend_flag   | BOOLEAN   |      Yes | Indicates Saturday or Sunday              |

## Example

```text
date_key: 20260810
full_date: 2026-08-10
day_name: Monday
month_name: August
quarter_number: 3
year_number: 2026
year_month: 2026-08
```

---

# 11. Fact Tables

The first version will contain:

```text
fact_claim
fact_payment
fact_denial
```

Fact tables contain measurable business transactions or events.

---

# 12. Fact Table — fact_claim

## Purpose

`fact_claim` is the main table in the RevenueGuard analytics model.

Each row represents one healthcare claim.

## Primary Key

```text
claim_key
```

## Business Identifier

```text
claim_id
```

## Foreign Keys

```text
patient_key
provider_key
payer_key
service_date_key
submission_date_key
```

## Columns

| Column                        | Data Type | Required | Business Meaning                                 |
| ----------------------------- | --------- | -------: | ------------------------------------------------ |
| claim_key                     | BIGINT    |      Yes | Analytics-generated unique claim key             |
| claim_id                      | VARCHAR   |      Yes | Original synthetic claim identifier              |
| patient_key                   | INTEGER   |      Yes | Connects claim to dim_patient                    |
| provider_key                  | INTEGER   |      Yes | Connects claim to dim_provider                   |
| payer_key                     | INTEGER   |      Yes | Connects claim to dim_payer                      |
| service_date_key              | INTEGER   |      Yes | Connects service date to dim_date                |
| submission_date_key           | INTEGER   |      Yes | Connects submission date to dim_date             |
| claim_status                  | VARCHAR   |      Yes | Current claim status                             |
| procedure_code                | VARCHAR   |      Yes | Synthetic procedure code                         |
| diagnosis_code                | VARCHAR   |       No | Synthetic diagnosis code                         |
| billed_amount                 | DECIMAL   |      Yes | Total amount billed                              |
| allowed_amount                | DECIMAL   |       No | Amount allowed by the payer                      |
| total_paid_amount             | DECIMAL   |      Yes | Total payment received                           |
| contractual_adjustment        | DECIMAL   |      Yes | Contractual adjustment amount                    |
| other_adjustment              | DECIMAL   |      Yes | Other adjustment amount                          |
| patient_payment               | DECIMAL   |      Yes | Amount paid by patient                           |
| source_outstanding_amount     | DECIMAL   |      Yes | Outstanding balance supplied by source data      |
| calculated_outstanding_amount | DECIMAL   |      Yes | Balance calculated by RevenueGuard               |
| reconciliation_difference     | DECIMAL   |      Yes | Difference between source and calculated balance |
| days_in_ar                    | INTEGER   |      Yes | Number of days the claim has remained in AR      |
| aging_bucket                  | VARCHAR   |      Yes | AR aging category                                |
| denial_flag                   | BOOLEAN   |      Yes | Indicates whether claim has been denied          |
| last_follow_up_date           | DATE      |       No | Most recent AR follow-up date                    |
| filing_limit_date             | DATE      |       No | Last date for timely filing                      |
| priority_score                | INTEGER   |       No | RevenueGuard follow-up priority score            |
| recommended_action            | VARCHAR   |       No | Suggested next analyst action                    |
| created_at                    | TIMESTAMP |      Yes | Date and time record was created                 |
| updated_at                    | TIMESTAMP |      Yes | Date and time record was last updated            |

---

# 13. Claim Status Values

Initial claim-status values may include:

```text
Submitted
Pending
Paid
Partially Paid
Denied
Rejected
Appealed
Closed
```

---

# 14. AR Aging Buckets

RevenueGuard will classify claims using:

```text
0-30
31-60
61-90
91-120
120+
```

Example:

```text
days_in_ar = 17
aging_bucket = 0-30
```

Example:

```text
days_in_ar = 145
aging_bucket = 120+
```

---

# 15. Fact Table — fact_payment

## Purpose

`fact_payment` stores individual payment transactions.

One claim may contain multiple payment records.

## Primary Key

```text
payment_key
```

## Business Identifier

```text
payment_id
```

## Foreign Keys

```text
claim_key
payment_date_key
```

## Columns

| Column            | Data Type | Required | Business Meaning                                  |
| ----------------- | --------- | -------: | ------------------------------------------------- |
| payment_key       | BIGINT    |      Yes | Analytics-generated unique payment key            |
| payment_id        | VARCHAR   |      Yes | Original synthetic payment identifier             |
| claim_key         | BIGINT    |      Yes | Connects payment to fact_claim                    |
| payment_date_key  | INTEGER   |      Yes | Connects payment date to dim_date                 |
| payment_date      | DATE      |      Yes | Date payment was received or posted               |
| payment_amount    | DECIMAL   |      Yes | Amount received                                   |
| adjustment_amount | DECIMAL   |      Yes | Adjustment recorded with payment                  |
| payment_method    | VARCHAR   |       No | Payment method or source                          |
| payment_reference | VARCHAR   |       No | Synthetic payment reference                       |
| posting_status    | VARCHAR   |      Yes | Indicates whether payment was posted successfully |
| created_at        | TIMESTAMP |      Yes | Date and time record was created                  |

---

# 16. Payment Method Values

Possible values include:

```text
EFT
Check
Credit Card
Patient Payment
Other
```

---

# 17. Posting Status Values

Possible values include:

```text
Posted
Pending
Rejected
Reversed
```

---

# 18. Fact Table — fact_denial

## Purpose

`fact_denial` stores denial events related to claims.

One claim may have multiple denial events.

## Primary Key

```text
denial_key
```

## Business Identifier

```text
denial_id
```

## Foreign Keys

```text
claim_key
denial_reason_key
denial_date_key
resolution_date_key
```

## Columns

| Column              | Data Type | Required | Business Meaning                           |
| ------------------- | --------- | -------: | ------------------------------------------ |
| denial_key          | BIGINT    |      Yes | Analytics-generated denial identifier      |
| denial_id           | VARCHAR   |      Yes | Original synthetic denial identifier       |
| claim_key           | BIGINT    |      Yes | Connects denial to fact_claim              |
| denial_reason_key   | INTEGER   |      Yes | Connects denial to dim_denial_reason       |
| denial_date_key     | INTEGER   |      Yes | Connects denial date to dim_date           |
| resolution_date_key | INTEGER   |       No | Connects resolution date to dim_date       |
| denial_date         | DATE      |      Yes | Date denial occurred                       |
| denial_amount       | DECIMAL   |      Yes | Financial value associated with the denial |
| appeal_status       | VARCHAR   |       No | Current appeal status                      |
| appeal_date         | DATE      |       No | Date appeal was submitted                  |
| resolution_date     | DATE      |       No | Date denial was resolved                   |
| resolution_status   | VARCHAR   |       No | Final denial outcome                       |
| recovered_amount    | DECIMAL   |      Yes | Amount recovered after denial activity     |
| created_at          | TIMESTAMP |      Yes | Date and time record was created           |
| updated_at          | TIMESTAMP |      Yes | Date and time record was last updated      |

---

# 19. Appeal Status Values

Possible values include:

```text
Not Appealed
Pending Appeal
Appeal Submitted
Appeal Approved
Appeal Denied
Closed
```

---

# 20. Resolution Status Values

Possible values include:

```text
Unresolved
Recovered
Partially Recovered
Written Off
Corrected Claim Submitted
Appeal Denied
```

---

# 21. Primary Key Summary

| Table             | Primary Key       |
| ----------------- | ----------------- |
| dim_patient       | patient_key       |
| dim_provider      | provider_key      |
| dim_payer         | payer_key         |
| dim_denial_reason | denial_reason_key |
| dim_date          | date_key          |
| fact_claim        | claim_key         |
| fact_payment      | payment_key       |
| fact_denial       | denial_key        |

---

# 22. Foreign Key Summary

| Table        | Foreign Key         | References                          |
| ------------ | ------------------- | ----------------------------------- |
| fact_claim   | patient_key         | dim_patient.patient_key             |
| fact_claim   | provider_key        | dim_provider.provider_key           |
| fact_claim   | payer_key           | dim_payer.payer_key                 |
| fact_claim   | service_date_key    | dim_date.date_key                   |
| fact_claim   | submission_date_key | dim_date.date_key                   |
| fact_payment | claim_key           | fact_claim.claim_key                |
| fact_payment | payment_date_key    | dim_date.date_key                   |
| fact_denial  | claim_key           | fact_claim.claim_key                |
| fact_denial  | denial_reason_key   | dim_denial_reason.denial_reason_key |
| fact_denial  | denial_date_key     | dim_date.date_key                   |
| fact_denial  | resolution_date_key | dim_date.date_key                   |

---

# 23. One-to-Many Relationship Summary

| Parent            | Child        | Relationship                           |
| ----------------- | ------------ | -------------------------------------- |
| dim_patient       | fact_claim   | One patient → many claims              |
| dim_provider      | fact_claim   | One provider → many claims             |
| dim_payer         | fact_claim   | One payer → many claims                |
| dim_date          | fact_claim   | One date → many claim events           |
| fact_claim        | fact_payment | One claim → many payments              |
| fact_claim        | fact_denial  | One claim → many denials               |
| dim_date          | fact_payment | One date → many payments               |
| dim_date          | fact_denial  | One date → many denials                |
| dim_denial_reason | fact_denial  | One denial reason → many denial events |

---

# 24. Fact vs Dimension Summary

## Dimension Tables

Dimension tables answer questions such as:

```text
Who?
What?
Which payer?
Which provider?
Which denial reason?
Which date?
```

RevenueGuard dimensions:

```text
dim_patient
dim_provider
dim_payer
dim_denial_reason
dim_date
```

## Fact Tables

Fact tables answer questions such as:

```text
What happened?
How much?
How many?
When?
```

RevenueGuard facts:

```text
fact_claim
fact_payment
fact_denial
```

---

# 25. Important Business Calculations

## Outstanding Balance

RevenueGuard will calculate:

```text
Calculated Outstanding Amount
=
Billed Amount
- Total Paid Amount
- Contractual Adjustment
- Other Adjustment
- Patient Payment
```

The result will be compared with the source outstanding balance.

---

## Reconciliation Difference

```text
Reconciliation Difference
=
Source Outstanding Amount
- Calculated Outstanding Amount
```

A difference near zero means the account is reconciled.

A larger difference may indicate:

* missing payment
* incorrect adjustment
* duplicate payment
* underpayment
* source-data issue

---

## Days in Accounts Receivable

```text
Days in AR
=
Current Date
- Relevant Claim Start Date
```

The exact business rule will be finalised during SQL development.

---

## Priority Score

The project will later calculate a priority score using factors such as:

```text
Outstanding balance
Days in AR
Denial status
Filing deadline
Time since last follow-up
Payment variance
Recovery opportunity
```

A larger score will indicate a claim requiring more urgent review.

---

# 26. Data Quality Rules

The data model will support validation rules including:

* claim_id must not be empty
* claim_id must be unique
* billed_amount must not be negative
* payment_amount must not be negative
* service_date must not occur after submission_date
* payer must exist
* provider must exist
* patient must exist
* denied claims should contain a denial reason
* payment records must belong to an existing claim
* denial records must belong to an existing claim
* financial fields must contain valid numeric values
* required dates must contain valid dates

---

# 27. Data Privacy

This portfolio project will use synthetic healthcare data only.

The project will not use:

* real patient names
* real patient identifiers
* real medical records
* real insurance member identifiers
* real client data
* employer-confidential datasets

Synthetic identifiers will be used instead.

Examples:

```text
PAT000001
CLM000001
PAY000001
DEN000001
PRV000001
PYR000001
```

---

# 28. Data Model Version

```text
Project: RevenueGuard AI
Model Version: 1.0
Status: Initial Design
```s

The data model may be refined as the pipeline is developed and tested.
