*** Settings ***

Resource    //automate//TEST API/4.Libraries/setting.robot






*** Test Cases ***
Get Request Example
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    ${response}=    GET On Session   jsonplaceholder    /posts/1
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json}[userId]    ${1}


