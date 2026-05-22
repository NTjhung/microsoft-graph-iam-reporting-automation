# Export Group Memberships from Microsoft Entra ID
# Project: Microsoft Graph IAM Reporting Automation
# Purpose: Exports members of selected IAM-related security groups.

Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "Directory.Read.All"

$reportPath = "../reports/group-membership-report.csv"

$targetGroups = @(
    "SG-HR-Employees",
    "SG-Finance-Employees",
    "SG-Sales-Employees",
    "SG-IT-Admins",
    "SG-Contractors",
    "SG-Executives"
)

$results = @()

foreach ($groupName in $targetGroups) {

    Write-Host "Processing group: $groupName"

    $group = Get-MgGroup -Filter "displayName eq '$groupName'" -ErrorAction SilentlyContinue

    if (-not $group) {
        Write-Host "Group not found: $groupName" -ForegroundColor Yellow
        continue
    }

    $members = Get-MgGroupMember -GroupId $group.Id -All

    foreach ($member in $members) {

        $user = Get-MgUser -UserId $member.Id -Property DisplayName,UserPrincipalName,Department,JobTitle,AccountEnabled -ErrorAction SilentlyContinue

        if ($user) {
            $results += [PSCustomObject]@{
                GroupName = $groupName
                DisplayName = $user.DisplayName
                UserPrincipalName = $user.UserPrincipalName
                Department = $user.Department
                JobTitle = $user.JobTitle
                AccountEnabled = $user.AccountEnabled
            }
        }
    }
}

$results | Export-Csv -Path $reportPath -NoTypeInformation

Write-Host "Group membership report exported to $reportPath" -ForegroundColor Green
