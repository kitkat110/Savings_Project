# Money Saved vs. Financial Literacy and Budgeting Tool Usage

** Language:** R

## Overview
This project analyzes how budgeting behavior and financial literacy influence the amount of money individuals save each month. Using statistical modeling in R, I examined whether people who use budgetin tools or score higher on a financial literacy quiz tend to save more.

## Methods
**Response:** `moneysaved` - monthly savings (USD)
**Predictors:**
- `score` - financial literacy score (0-100)
- `budgetingtool` - uses budgeting tool (`Yes`/`No`)
**Models:**
- Linear regression
- Interaction model (`moneysaved ~ score * budgetingtool`)

Packages: 'interactions'

## Key Findings
- Financial literacy score and budgeting tool usage alone aren't a significant predictor of monthly savings.
- No strong interaction effect - the two factors influence savings independently
