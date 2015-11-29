@echo off

NuGet.exe install Pester -OutputDirectory packages -ExcludeVersion -Verbosity quiet

set pester=.\packages\Pester\tools\Pester.psm1

powershell -NoProfile -ExecutionPolicy Bypass -Command "Import-Module '%pester%'; Invoke-Pester tests\** -OutputFile TestResult.xml -OutputFormat NUnitXml;"
goto :eof
