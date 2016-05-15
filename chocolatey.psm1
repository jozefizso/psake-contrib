function Cleanup-ChocolateyInstallScript([string]$f) {
    gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f
}


function Convert-ChocolateyTemplate($templateFile, $outputFile, [hashtable]$properties) {
    $tmpl = Get-Content $templateFile

    foreach ($key in $properties.Keys) {
        $tmpl = $tmpl.Replace("{{$key}}", $properties.$key)
    }

    Set-Content -Path $outputFile -Value $tmpl
}
