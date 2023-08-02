*** Settings ***
Library  RequestsLibrary
Library  Collections



*** Variables ***
${base_url}  https://jsonplaceholder.typicode.com




*** Test Cases ***

Post_CustomerRegistrration
    Create Session    mysession   ${base_url}
    ${body}=    Create Dictionary  FirstName= Talip  LastName=Ayan  Username=WEWE  Password=QWER  Email=QAYXSW
    ${header}=  Create Dictionary  Content-Type=application/json
    ${response}=  POST On Session    mysession  	/posts  data=${body}   headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.status_code}

    #Validations

    ${status_code}=  Convert To String    ${response.content}

    Should Be Equal    ${status_code}    201

    ${res_body}=  Convert To String  ${response.content}
   
    Should Contain    ${res_body}    Talip




