# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

#Load PnP Powershell Module
try {
    Import-Module PnP.PowerShell
} catch {
    Write-Log $PSItem.ToString()
    Write-Error -Message "Import PNP Powershell Module failed" -ErrorAction Stop
}

# Interact with query parameters or the body of the request.
$Name = $Request.Query.Name

if ([string]::IsNullOrEmpty($name)) {
    $Body = "Pass a name in the query string or in the request body for a personalized response."
    $Result = [HttpStatusCode]::BadRequest
}
else{
    $Body = "Hello, $Name. This HTTP triggered function executed successfully."
    $Result = [HttpStatusCode]::OK
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $Result
    Body = $Body
})