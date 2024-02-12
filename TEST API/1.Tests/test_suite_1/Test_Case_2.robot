*** Settings ***

Resource    //automate//TEST API/4.Libraries/setting.robot 



*** Test Cases ***
Post Request Example
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    &{data}=    Create Dictionary    title=foo    body=bar    userId=1
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET On Session    jsonplaceholder    /posts    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    ${response_body}=    Evaluate    ${response.content}
    Should Be Equal As Strings    ${response_body}[title]    foo
