@echo off

NuGet.exe install nuget\packages.config -OutputDirectory packages -ExcludeVersion

set pester=.\packages\Pester\tools\Pester.psm1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module '%pester%'; Invoke-Pester tests\**;"
goto :eof
