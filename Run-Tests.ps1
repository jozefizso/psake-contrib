Import-Module Pester

Invoke-Pester tests\** -OutputFile TestResult.xml -OutputFormat NUnitXml

$appVeyorJobId = $env:APPVEYOR_JOB_ID
if ($appVeyorJobId) {
	$url = "https://ci.appveyor.com/api/testresults/nunit/$appVeyorJobId"

	$wc = New-Object 'System.Net.WebClient'
	$wc.UploadFile($url, '.\TestResult.xml');
}
