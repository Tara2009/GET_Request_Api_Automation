*** Settings ***
Library        RequestsLibrary
Library        Collections

Suite Setup    Create Session  jsonplaceholder  https://jsonplaceholder.typicode.com

*** Variables ***
#${url}        https://jsonplaceholder.typicode.com
${jurl}        https://jsonplaceholder.typicode.com   #Actual Full Link : https://jsonplaceholder.typicode.com/posts/1

*** Test Cases ***
Get Request Data
   Create Session      mysession    ${jurl}
   # ${resp}=            get Request    mysession    /posts/1
   #${status_Code}       ${resp.json()}[status]     asd
   #${resp}=             GET   ${jurl}                               #This one also working
   #${resp}=        Get On Session        jsonplaceholder  /posts/1
   ${resp}=        Get On Session        ${jurl}  /posts/1
   Should Be Equal As Strings            ${resp.status}    OK
   Log                  ${resp}     
   Log                  ${resp.json()}.title 
   Log                  ${resp.json()}[title]    
   Log                  ${resp}.reason
   Log                  ${resp}.content
   Log                  ${resp}.headers         
   #${response.json()}[id]