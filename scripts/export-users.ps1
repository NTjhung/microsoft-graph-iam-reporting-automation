# Export Users from Microsoft Entra ID
# Project: Microsoft Graph IAM Reporting Automation
# Purpose: Exports users from Microsoft Entra ID to a CSV report.

Connect-MgGraph -Scopes "User.Read.All", "Directory.Read.All"

$reportPath = "../reports/all-users-report.csv"

$users = Get-MgUser -All -Property `
    Id,DisplayName,UserPrincipalName,Department,JobTitle,AccountEnabled,CreatedDateTime

$users | Select-Object `
    DisplayName,
    UserPrincipalName,
    Department,
    JobTitle,
    AccountEnabled,
    CreatedDateTime,
    Id |
    Export-Csv -Path $reportPath -NoTypeInformation

Write-Host "User report exported to $reportPath" -ForegroundColor Green
