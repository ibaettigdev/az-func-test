# Set Environmental Variable for local testing
# Random Change
if (-not (Test-Path env:buildVer)) {
    $env:buildVer = 'local_build' 
}
if (-not (Test-Path env:BUILD_ARTIFACTSTAGINGDIRECTORY)) {
    $env:BUILD_ARTIFACTSTAGINGDIRECTORY = './build' 
}


$ignoreFiles = @(Get-Content ./.gitignore | Where-Object { ($_.Split('#')[0].Trim() -ne '') })
$ignoreFiles += 'build'

Write-Debug "Temp Directory Path: $($env:AGENT_TEMPDIRECTORY)"

New-Item -Path "$($env:AGENT_TEMPDIRECTORY)" -Name "_temp_artifact_storage" -ItemType "directory" >> $null

Copy-Item `
    -Path "$env:System_DefaultWorkingDirectory/azure_function_apps/MainBackend/*" `
    -Destination "$($env:AGENT_TEMPDIRECTORY)/_temp_artifact_storage" `
    -Recurse



Get-ChildItem "$($env:AGENT_TEMPDIRECTORY)/_temp_artifact_storage" | 
    Where-Object { $_.Name -notin $ignoreFiles } | 
    Compress-Archive -DestinationPath "$($env:BUILD_ARTIFACTSTAGINGDIRECTORY)/$($env:buildVer)_mainbackend.zip" -Update

    
Remove-Item -Recurse -Force "$($env:AGENT_TEMPDIRECTORY)/_temp_artifact_storage"
