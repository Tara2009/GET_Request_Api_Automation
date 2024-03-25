*** Settings ***
Library                         RequestsLibrary
Library                         Collections

Suite Setup                     Create Session              jsonplaceholder             https://jsonplaceholder.typicode.com

*** Variables ***
#${url}                         https://jsonplaceholder.typicode.com
${jurl}                         https://jsonplaceholder.typicode.com                    #Actual Full Link : https://jsonplaceholder.typicode.com/posts/1

*** Test Cases ***
Get Request Data
    [Documentation]             Get the Data from the jsonplaceholder website
    [Tags]                      Reqjsonplaceholder
    # ${resp}=                  get Request                 mysession                   /posts/1
    #${status_Code}             ${resp.json()}[status]      asd
    # ${resp}=                  GET                         ${jurl}                     #This one also working
    #${resp}=                   Get On Session              jsonplaceholder             /posts/1
    # Create Session            mysession                   ${jurl}
    ${resp}=                    Get On Session              jsonplaceholder             /posts/1
    # Should Be Equal As Strings                            ${resp.json()}.[status]     ok
    Dictionary Should Contain Value                         ${resp.json()}              sunt aut facere repellat provident
    Log                         ${resp}
    Log                         ${resp.json()}.title
    Log                         ${resp.json()}[title]
    Log                         ${resp.json()}.body
    Log                         ${resp.json()}[body]
    Log                         ${resp}.reason
    Log                         ${resp}.content
    Log                         ${resp}.headers
    #${response.json()}[id]

Get Google Request Data
    [Documentation]             Fetch data from google using get request
    [Tags]                      ReqGoogle
    Create Session              google                      http://www.google.com
    ${resp_google}=             Get On Session              google                      /                           expected_status=200
    Log                         ${resp_google}
    Should Be Equal As Strings                              ${resp_google.reason}       OK
    #Should Be Equal As Integers                            ${resp_google.status}       200