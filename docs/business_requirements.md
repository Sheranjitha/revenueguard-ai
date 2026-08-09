# RevenueGuard AI — Business Requirements

## 1. Project Title

**RevenueGuard AI: Automated Healthcare Revenue Cycle Analytics and Denial Intelligence Platform**

---

## 2. Project Overview

RevenueGuard AI is an end-to-end healthcare revenue-cycle analytics and automation platform.

The system will process synthetic healthcare claims, payments, denials and accounts-receivable data using Python, PostgreSQL, SQL and Power BI.

It will automate data ingestion, validation, cleaning, reconciliation, KPI calculation, claim prioritisation and business-intelligence reporting.

The project will demonstrate how raw healthcare billing data can be transformed into accurate, actionable and automated insights for financial and operational decision-making.

---

## 3. Problem Statement

Healthcare revenue-cycle teams process large volumes of claims, payment, denial and patient-account data.

This information may come from multiple systems and files. The files may contain missing values, duplicate records, inconsistent formats, incorrect dates and financial differences.

Analysts often spend significant time manually:

* Combining billing files
* Cleaning and validating data
* Reconciling claims and payments
* Calculating accounts-receivable KPIs
* Investigating denied claims
* Identifying underpayments
* Preparing follow-up worklists
* Building recurring management reports
* Checking whether data is complete and accurate

These manual activities can be slow and difficult to repeat consistently. They may also increase the risk of reporting errors, missed claims and delayed follow-up.

RevenueGuard AI will address this problem by creating an automated and repeatable analytics pipeline.

The system will validate incoming data, load clean information into a structured database, calculate healthcare revenue-cycle KPIs, identify exceptions and display the results in interactive Power BI dashboards.

---

## 4. Project Goal

The main goal is to build a reliable healthcare revenue-cycle analytics solution that reduces repetitive manual work and improves visibility into financial and operational performance.

The project will demonstrate skills in:

* Python automation
* SQL development
* PostgreSQL database design
* Data cleaning and transformation
* Data validation
* Financial reconciliation
* Healthcare revenue-cycle analytics
* Power BI data modelling
* DAX calculations
* Dashboard development
* Pipeline logging
* Testing
* Git version control
* Technical documentation

---

## 5. Project Objectives

The project will:

1. Generate realistic synthetic healthcare claims, payment and denial data.

2. Automatically identify new source files placed in an incoming-data folder.

3. Validate source-file names, structures, columns and data types.

4. Detect missing, duplicate, invalid or inconsistent records.

5. Clean and standardise valid records using Python.

6. Load source data into PostgreSQL staging tables.

7. Transform source records into analytics-ready fact and dimension tables.

8. Reconcile billed amounts, payments, adjustments and outstanding balances.

9. Calculate healthcare revenue-cycle KPIs.

10. Analyse accounts-receivable aging and collection performance.

11. Analyse denial volume, value, causes and recovery results.

12. Identify possible underpayments and financial differences.

13. Calculate a priority score for claims requiring follow-up.

14. Recommend an appropriate action for high-priority claims.

15. Create interactive executive and operational Power BI dashboards.

16. Record pipeline runs, processed records, rejected records and errors.

17. Demonstrate how the complete process can run automatically.

---

## 6. Project Scope

### 6.1 Included in the First Version

The first version will include:

* Synthetic healthcare data generation
* CSV-file ingestion
* Python data cleaning
* Python data validation
* PostgreSQL staging tables
* PostgreSQL analytics tables
* Fact and dimension modelling
* SQL transformations
* Accounts-receivable aging analysis
* Claims and payment reconciliation
* Denial analysis
* Payer-performance analysis
* Provider-performance analysis
* Rule-based claim-priority scoring
* Recommended follow-up actions
* Pipeline audit logging
* Data-quality reporting
* Power BI dashboards
* Python unit tests
* GitHub documentation

### 6.2 Not Included in the First Version

The first version will not include:

* Real patient information
* Real employer or client information
* Production healthcare-system connections
* Medical advice
* Automated claim submission
* Automated payer communication
* A production machine-learning model
* A production cloud deployment
* Real-time streaming data

These may be considered as future improvements after the main system is complete.

---

## 7. Target Users

### 7.1 Chief Financial Officer

The Chief Financial Officer needs a high-level view of financial performance.

The system should help the CFO understand:

* Total billed value
* Total collected value
* Total outstanding accounts receivable
* Collection rate
* Denial value
* Recovery opportunities
* Aging risk
* Payer-performance trends
* Financial reconciliation differences

### 7.2 Revenue-Cycle Manager

The Revenue-Cycle Manager needs to monitor operational and financial performance.

The system should help the manager understand:

* Which payers are causing delays
* Which denial categories are increasing
* Which teams or providers require support
* Which claims should be prioritised
* Whether collection performance is improving
* Whether the processing pipeline completed successfully
* Whether data-quality problems are affecting reports

### 7.3 Accounts-Receivable Analyst

The Accounts-Receivable Analyst needs a clear and prioritised worklist.

The system should help the analyst identify:

* High-value unpaid claims
* Claims older than 90 or 120 days
* Claims approaching filing deadlines
* Claims with unresolved denials
* Claims with possible underpayments
* Claims without recent follow-up
* The recommended next action for each claim

### 7.4 Billing Manager

The Billing Manager needs to understand billing and denial problems.

The system should help the manager identify:

* Common rejection and denial reasons
* Preventable denial categories
* Problems related to eligibility or authorisation
* Provider or procedure groups with high denial rates
* Claims requiring correction or resubmission
* Changes in first-pass acceptance performance

### 7.5 Data Analyst

The Data Analyst needs reliable, documented and reusable data.

The system should help the analyst:

* Access clean analytics tables
* Validate row counts
* investigate data-quality failures
* Reconcile financial values
* Develop and maintain SQL queries
* Create KPI definitions
* Build Power BI reports
* Monitor pipeline execution
* Perform ad hoc analysis

---

## 8. Business Questions

### Business Question 1

**How much outstanding accounts receivable does the organisation have, and how is it distributed across aging buckets?**

The system should show outstanding balances for:

* 0–30 days
* 31–60 days
* 61–90 days
* 91–120 days
* More than 120 days

### Business Question 2

**Which payers, providers and denial categories are responsible for the largest denied value?**

The system should identify:

* Payers with high denial rates
* Providers with high denial rates
* Denial categories with high financial impact
* Changes in denial performance over time

### Business Question 3

**Which claims should accounts-receivable analysts work on first?**

The system should prioritise claims using factors such as:

* Outstanding balance
* Days in accounts receivable
* Denial status
* Filing-deadline risk
* Time since the last follow-up
* Possible underpayment
* Expected recovery opportunity

### Business Question 4

**Do claim balances reconcile correctly with payments and adjustments?**

The system should compare:

* Billed amount
* Allowed amount
* Insurance payment
* Patient payment
* Contractual adjustment
* Other adjustment
* Expected outstanding balance
* Source outstanding balance

It should identify missing payments, possible underpayments, duplicate payments and material reconciliation differences.

### Business Question 5

**Is the analytics pipeline producing complete, accurate and reliable data?**

The system should report:

* Number of files processed
* Number of records received
* Number of records loaded
* Number of records rejected
* Data-quality pass percentage
* Failed validation rules
* Pipeline status
* Pipeline duration
* Last successful run

---

## 9. Key Performance Indicators

The first version should calculate the following KPIs:

* Total billed amount
* Total allowed amount
* Total paid amount
* Total outstanding accounts receivable
* Collection rate
* Denial rate
* Denied amount
* Recovery rate
* Average days in accounts receivable
* Accounts receivable over 90 days
* Accounts receivable over 120 days
* First-pass acceptance rate
* Appeal success rate
* Average denial-resolution time
* Underpayment opportunity
* Reconciliation variance
* High-priority claim count
* Data-quality pass rate
* Rejected-record count
* Pipeline-processing duration

---

## 10. Data Requirements

The project will use only synthetic data.

The planned dataset will contain approximately:

* 50,000 to 100,000 claims
* 5,000 synthetic patients
* 15 to 25 payers
* 20 to 40 providers
* Multiple healthcare facilities
* Multiple medical specialties
* 12 to 24 months of activity
* Claims, payments, denials and adjustments
* Deliberately created data-quality problems

No real patient, client, company or employer information will be used.

---

## 11. Functional Requirements

The system must be able to:

1. Find new CSV files in an incoming folder.

2. Confirm that each file contains the required columns.

3. Reject empty, damaged or incorrectly structured files.

4. Standardise column names and data formats.

5. Validate dates, identifiers, status values and financial amounts.

6. Separate valid and invalid records.

7. Load valid records into PostgreSQL.

8. Store invalid records with a clear rejection reason.

9. Prevent the same file from being processed twice.

10. Calculate business KPIs using SQL and Power BI.

11. Produce a prioritised claim-follow-up worklist.

12. Store the result of each pipeline run.

13. Display data-quality and processing results in Power BI.

14. Handle failures without losing previously processed data.

15. Maintain logs that can be reviewed during troubleshooting.

---

## 12. Non-Functional Requirements

The system should be:

### Accurate

Financial calculations and KPI results must be validated.

### Repeatable

Running the same process with the same input should produce consistent results.

### Maintainable

Python and SQL code should be divided into clear files and functions.

### Secure

Database passwords and confidential values must not be stored directly in source-code files.

### Auditable

Every pipeline run should record its status, timing, row counts and errors.

### Understandable

Business rules, KPI definitions and database fields should be documented.

### Scalable

The design should support increasing the synthetic dataset from thousands to hundreds of thousands of records.

### Testable

Important validation, reconciliation and priority-scoring functions should have automated tests.

---

## 13. Assumptions

The project assumes that:

* Input data is provided as CSV files.
* PostgreSQL is available locally.
* Power BI Desktop is available for dashboard development.
* All healthcare data is synthetic.
* Claims may have more than one payment.
* Claims may have more than one denial event.
* Financial values are recorded in U.S. dollars.
* The first version will run locally.
* Initial claim-priority scoring will use transparent business rules rather than machine learning.

---

## 14. Constraints

The project may be limited by:

* No access to genuine healthcare-system data
* No connection to a real electronic medical record system
* No production payer integrations
* Local-computer processing capacity
* Power BI sharing and scheduled-refresh licensing
* Limited time available for the first project version

These constraints will be explained clearly in the final documentation.

---

## 15. Risks and Controls

### Risk: Sensitive data is accidentally used

**Control:** Use only synthetic data and review files before publishing them.

### Risk: Passwords are uploaded to GitHub

**Control:** Store passwords in a local `.env` file and exclude that file using `.gitignore`.

### Risk: Financial calculations are incorrect

**Control:** Test calculations using manually verified sample claims.

### Risk: Duplicate files are processed

**Control:** Record file names and checksums in an audit table.

### Risk: Invalid data enters reporting tables

**Control:** Run validation rules before loading the analytics layer.

### Risk: Dashboard values do not match SQL

**Control:** Reconcile Power BI measures with SQL query outputs.

---

## 16. Success Criteria

The first version will be considered successful when:

1. Synthetic claims, payment and denial data can be generated.

2. Python can automatically detect and process an incoming CSV file.

3. Invalid records are identified with understandable error messages.

4. Valid records are loaded into PostgreSQL.

5. Analytics-ready fact and dimension tables are created.

6. Accounts-receivable balances reconcile correctly.

7. At least five core business questions can be answered.

8. A priority worklist is generated for AR analysts.

9. Power BI displays executive and operational dashboards.

10. Pipeline history and data-quality results are visible.

11. Automated tests confirm important business calculations.

12. Another person can follow the README and understand how the project works.

---

## 17. Expected Deliverables

The completed project will contain:

* GitHub repository
* Business requirements document
* Architecture diagram
* Data dictionary
* Synthetic-data generator
* Python data pipeline
* PostgreSQL database scripts
* SQL analytics queries
* Data-quality framework
* Reconciliation logic
* Priority-scoring logic
* Power BI dashboard
* Automated tests
* Pipeline logs
* Dashboard screenshots
* Setup instructions
* Demonstration video
* Project findings
* Future-improvement plan

---

## 18. Future Enhancements

Possible future enhancements include:

* Email alerts
* Streamlit analyst application
* FastAPI endpoints
* Cloud database deployment
* Automated Power BI refresh
* Incremental data processing
* Statistical anomaly detection
* Machine-learning denial-risk prediction
* Natural-language KPI summaries
* Docker deployment

These enhancements will only be started after the main end-to-end pipeline is complete.
