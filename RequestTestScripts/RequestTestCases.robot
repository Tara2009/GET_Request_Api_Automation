*** Settings ***
Library        RequestsLibrary
Library        Collections
*** Variables ***
${url}        https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Request Data
    Create Session      mysession    ${url}
    ${response}=        get