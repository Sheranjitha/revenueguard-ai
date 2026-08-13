-- =====================================================
-- RevenueGuard AI
-- Staging Tables
-- =====================================================

-- -----------------------------
-- Patients
-- -----------------------------
CREATE TABLE IF NOT EXISTS staging.patients (
    patient_id VARCHAR(50),
    age_group VARCHAR(20),
    gender VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    source_file VARCHAR(255),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------
-- Providers
-- -----------------------------

CREATE TABLE IF NOT EXISTS staging.providers (
    provider_id VARCHAR(50),
    provider_name VARCHAR(150),
    specialty VARCHAR(100),
    facility_id VARCHAR(50),
    facility_name VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(50),
    source_file VARCHAR(255),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------
-- Payers
-- -----------------------------

CREATE TABLE IF NOT EXISTS staging.payers (
    payer_id VARCHAR(50),
    payer_name VARCHAR(150),
    payer_type VARCHAR(50),
    filing_limit_days INTEGER,
    expected_payment_days INTEGER,
    source_file VARCHAR(255),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------
-- Claims
-- -----------------------------

CREATE TABLE IF NOT EXISTS staging.claims (
    claim_id VARCHAR(50),
    patient_id VARCHAR(50),
    provider_id VARCHAR(50),
    payer_id VARCHAR(50),

    service_date DATE,
    submission_date DATE,

    claim_status VARCHAR(50),
    procedure_code VARCHAR(50),
    diagnosis_code VARCHAR(50),

    billed_amount NUMERIC(12,2),
    allowed_amount NUMERIC(12,2),
    total_paid_amount NUMERIC(12,2),

    contractual_adjustment NUMERIC(12,2),
    other_adjustment NUMERIC(12,2),
    patient_payment NUMERIC(12,2),

    source_outstanding_amount NUMERIC(12,2),

    last_follow_up_date DATE,
    filing_limit_date DATE,

    source_file VARCHAR(255),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------
-- Payments
-- -----------------------------

CREATE TABLE IF NOT EXISTS staging.payments (
    payment_id VARCHAR(50),
    claim_id VARCHAR(50),

    payment_date DATE,
    payment_amount NUMERIC(12,2),
    adjustment_amount NUMERIC(12,2),

    payment_method VARCHAR(50),
    payment_reference VARCHAR(100),
    posting_status VARCHAR(50),

    source_file VARCHAR(255),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- -----------------------------
-- Denials
-- -----------------------------

CREATE TABLE IF NOT EXISTS staging.denials (
    denial_id VARCHAR(50),
    claim_id VARCHAR(50),

    denial_date DATE,
    denial_code VARCHAR(50),
    denial_category VARCHAR(100),
    denial_description VARCHAR(255),

    denial_amount NUMERIC(12,2),

    appeal_status VARCHAR(50),
    appeal_date DATE,

    resolution_date DATE,
    resolution_status VARCHAR(100),

    recovered_amount NUMERIC(12,2),

    source_file VARCHAR(255),
    loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);