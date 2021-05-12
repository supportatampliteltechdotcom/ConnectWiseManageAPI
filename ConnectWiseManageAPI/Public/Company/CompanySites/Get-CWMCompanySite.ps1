function Get-CWMCompanySite {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('companyId')]
        [int]$parentId,
        [Alias('siteId')]
        [int]$id,
        [string]$Condition,
        [ValidatePattern('\S* (desc|asc)')]
        [string]$orderBy,
        [string]$childConditions,
        [string]$customFieldConditions,
        [int]$page,
        [int]$pageSize,
        [string[]]$fields,
        [switch]$all
    )

    $Endpoint = "/company/companies/$($parentId)/sites"
    if($id){ $Endpoint = Join-Url $Endpoint $id }

    Invoke-CWMGetMaster -Arguments $PsBoundParameters -Endpoint $Endpoint
}
