*** Settings ***
Library        RequestsLibrary
Library        Collections
Library        JSONLibrary

*** Variables ***
#${url}        https://jsonplaceholder.typicode.com
${jurl}        https://jsonplaceholder.typicode.com/posts/1   #Actual Full Link : https://jsonplaceholder.typicode.com/posts/1

*** Test Cases ***
Get Request Data
    ${CSession}=        Create Session      mysession    ${jurl}
   # ${resp}=            get Request    mysession    /posts/1
   ${resp}=             GET   ${jurl}   
   Log                  ${resp}     
   Log                  ${resp}.status             