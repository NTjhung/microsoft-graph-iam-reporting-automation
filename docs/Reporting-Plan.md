# IAM Reporting Plan

## Purpose

This document describes the reporting plan for the Microsoft Graph IAM Reporting Automation project. The goal is to create repeatable reports that support access reviews, audits, and IAM operations.

## Reports Created

| Report | Purpose |
|---|---|
| all-users-report.csv | Lists Microsoft Entra ID users and key user attributes |
| all-groups-report.csv | Lists Microsoft Entra ID groups |
| group-membership-report.csv | Lists selected group memberships |
| contractor-access-report.csv | Lists contractor access |
| admin-access-report.csv | Lists admin-related group access |
| disabled-users-report.csv | Lists disabled accounts |

## Use Cases

These reports can support:

- Access reviews
- Audit evidence requests
- User lifecycle reviews
- Contractor access reviews
- Privileged access reviews
- Identity governance documentation

## Reporting Process

1. Connect to Microsoft Graph.
2. Run the reporting script.
3. Export results to CSV.
4. Review results for access concerns.
5. Save reports as audit evidence.
6. Document findings and remediation needs.

## Security Notes

Reports may contain user and access information. In a real environment, reports should be stored securely and shared only with authorized users.
