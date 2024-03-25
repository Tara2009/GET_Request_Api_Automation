*** Settings ***
Library                         RequestsLibrary
Library                         Collections

Suite Setup                     Create Session              jsonplaceholder             https://jsonplaceholder.typicode.com

*** Variables ***
#${url}                         https://jsonplaceholder.typicode.com
${jurl}                         https://jsonplaceholder.typicode.com                    #Actual Full Link : https://jsonplaceholder.typicode.com/posts/1
${updated_expected}             update the request through copado

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
    Should Contain              ${resp.json()}[title]       sunt aut facere repellat provident occaecati excepturi optio reprehenderit
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

Post Request
    [Documentation]             Post Request from the Placeholder web Suite
    [Tags]                      PostReq
    &{data}=                    Create Dictionary           title=Robotframework requests                           body=This is test!     UserId=2
    ${postresp}=                Post On Session             jsonplaceholder             /posts                      json=${data}           expected_status=anything
    Status Should Be            201                         ${postresp}
    Dictionary Should Contain Key                           ${postresp.json()}          id

Put Request
    [Documentation]             Put Request from the Placeholder web Suite
    [Tags]                      putReq
    &{data}=                    Create Dictionary           title=update the request through copado
    ${putresp}=                 Put On Session              jsonplaceholder             /posts+/3                    json=${data}           expected_status=200
    Log                        ${putresp}
    #Status Should Be            201                         ${putresp}
    Dictionary Should Contain Key                         ${putresp.json()}             title
    ${titleval}=                        Get From Dictionary                        ${putresp.json()}                 title
    Should Be Equal As Strings          ${updated_expected}                        ${titleval}