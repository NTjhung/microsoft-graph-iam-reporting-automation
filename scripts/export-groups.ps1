# Export Groups from Microsoft Entra ID
# Project: Microsoft Graph IAM Reporting Automation
# Purpose: Exports Microsoft Entra ID groups to a CSV report.

Connect-MgGraph -Scopes "Group.Read.All", "Directory.Read.All"

$reportPath = "../reports/all-groups-report.csv"

$groups = Get-MgGroup -All -Property `
    Id,DisplayName,Description,MailEnabled,SecurityEnabled,CreatedDateTime

$groups | Select-Object `
    DisplayName,
    Description,
    MailEnabled,
    SecurityEnabled,
    CreatedDateTime,
    Id |
    Export-Csv -Path $reportPath -NoTypeInformation

Write-Host "Group report exported to $reportPath" -ForegroundColor Green
