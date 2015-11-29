Import-Module ".\teamcity.psm1" -DisableNameChecking

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
