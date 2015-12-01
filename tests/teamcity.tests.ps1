Import-Module ".\teamcity.psm1" -DisableNameChecking -Force

Describe "TeamCity-WriteServiceMessage" {
    It "Writes ##teamcity[message 'Single parameter message.']" {
        TeamCity-WriteServiceMessage "message" "Single parameter message." | `
          Should BeExactly "##teamcity[message 'Single parameter message.']"
    }
    
    It "Writes ##teamcity[message key='value']" {
        TeamCity-WriteServiceMessage "message" @{ key = 'value'} | `
          Should BeExactly "##teamcity[message key='value']"
    }
}

Describe "TeamCity-TestSuiteStarted" {
    It "Writes ##teamcity[testSuiteStarted name='suiteName']" {
        TeamCity-TestSuiteStarted "suiteName" | `
          Should BeExactly "##teamcity[testSuiteStarted name='suiteName']"
    }
}

Describe "TeamCity-TestSuiteFinished" {
    It "Writes ##teamcity[testSuiteFinished name='suiteName']" {
        TeamCity-TestSuiteFinished "suiteName" | `
          Should BeExactly "##teamcity[testSuiteFinished name='suiteName']"
    }
}

Describe "TeamCity-TestStarted" {
    It "Writes ##teamcity[testStarted name='testName']" {
        TeamCity-TestStarted "testName" | `
          Should BeExactly "##teamcity[testStarted name='testName']"
    }
}

Describe "TeamCity-TestFinished" {
    It "Writes ##teamcity[testFinished duration='0' name='testName'] when no duration is given" {
        TeamCity-TestFinished "testName" | `
          Should BeExactly "##teamcity[testFinished duration='0' name='testName']"
    }
    
    It "Writes ##teamcity[testFinished duration='0' name='testName'] when 0 duration is given" {
        TeamCity-TestFinished "testName" 0 | `
          Should BeExactly "##teamcity[testFinished duration='0' name='testName']"
    }
    
    It "Writes ##teamcity[testFinished duration='247' name='testName'] when 247 duration is given" {
        TeamCity-TestFinished "testName" 247 | `
          Should BeExactly "##teamcity[testFinished duration='247' name='testName']"
    }
    
    It "Writes ##teamcity[testFinished duration='-1' name='testName'] when duration is negative number" {
        TeamCity-TestFinished "testName" -1 | `
          Should BeExactly "##teamcity[testFinished duration='-1' name='testName']"
    }
}

Describe "TeamCity-TestIgnored" {
    It "Writes ##teamcity[testIgnored message='' name='testName']" {
        TeamCity-TestIgnored "testName" | `
          Should BeExactly "##teamcity[testIgnored message='' name='testName']"
    }
    
    It "Writes ##teamcity[testIgnored message='ignore comment' name='testName']" {
        TeamCity-TestIgnored "testName" "ignore comment" | `
          Should BeExactly "##teamcity[testIgnored message='ignore comment' name='testName']"
    }
}

Describe "TeamCity-TestOutput" {
    It "Writes ##teamcity[testStdOut name='className.testName' out='text']" {
        TeamCity-TestOutput "className.testName" "text" | `
          Should BeExactly "##teamcity[testStdOut name='className.testName' out='text']"
    }
}

Describe "TeamCity-TestError" {
    It "Writes ##teamcity[testStdErr name='className.testName' out='error text']" {
        TeamCity-TestError "className.testName" "error text" | `
          Should BeExactly "##teamcity[testStdErr name='className.testName' out='error text']"
    }
}

Describe "TeamCity-TestFailed" {
    It "Writes ##teamcity[testFailed message='failure message' type='comparisonFailure' actual='actual value' expected='expected value' details='message and stack trace' name='MyTest.test2']" {
        TeamCity-TestFailed "MyTest.test2" "failure message" "message and stack trace" "comparisonFailure" "expected value" "actual value" | `
          Should BeExactly "##teamcity[testFailed message='failure message' type='comparisonFailure' actual='actual value' expected='expected value' details='message and stack trace' name='MyTest.test2']"
    }
}

