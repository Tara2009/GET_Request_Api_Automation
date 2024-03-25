*** Settings ***
Library        RequestsLibrary
Library        Collections

Suite Setup    Create Session  jsonplaceholder  https://jsonplaceholder.typicode.com

*** Variables ***
#${url}        https://jsonplaceholder.typicode.com
${jurl}        https://jsonplaceholder.typicode.com/posts/1   #Actual Full Link : https://jsonplaceholder.typicode.com/posts/1

*** Test Cases ***
Get Request Data
    ${CSession}=        Create Session      mysession    ${jurl}
   # ${resp}=            get Request    mysession    /posts/1
   ${resp}=             GET   ${jurl}   
   #${status_Code}       ${resp.json()}[status]     asd
   Log                  ${resp}     
   Log                  ${resp.json()}.title    
   Log                  ${resp}.reason
   Log                  ${resp}.content
   Log                  ${resp}.headers         
   #${response.json()}[id]