*** Settings ***

Library  RequestsLibrary
Library  Collections

*** Variables ***

${base_url}  https://petstore.swagger.io

*** Test Cases ***

TC1:All the Animals(GET)
    Create Session    mysession    ${base_url}
   ${response}=  GET On Session  mysession   /v2/pet/findByStatus?status\=available
   Log To Console    ${response.status_code}
   Log To Console    ${response.content}

   #validations

   ${status_code}=       Convert To String  ${response.status_code}
   Should Be Equal    ${status_code}    200

TC2:Add a new pet in Store(POST)
    Create Session    mysession  ${base_url}
    ${body}=  create dictionary    id=55   name=Tayo
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=  Post Request  mysession   /v2/pet   data=${body}   headers=${header}

    Log To Console   ${response.status_code}
    Log To Console   ${response.content}

    #Validations

    ${status_code}=  Convert To String   ${response.status_code}
    Should Be Equal    ${status_code}    200
    
    ${res_body}=    Convert To String    ${response.content}
    Should Contain    ${res_body}    a


TC3: Call the details animal ID 5 (GET)
    Create Session    mysession    ${base_url}
    ${response}=  GET On Session    mysession   /v2/pet/55

    Log To Console  ${response.status_code}
    Log To Console  ${response.content}

    #Validation

    ${status_code}=  Convert TO String  ${response.status_code}
    Should Be Equal    ${status_code}  200

    ${res_body}=  Convert To String  ${response.content}
    Should Contain    ${res_body}  Tayo   #Name

TC4: Update and existing video game a new body(PUT)
    Create Session    mysession   ${base_url}
    ${body}=  create dictionary    id=55   name=Tayoland
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=  Put Request  mysession   /v2/pet   data=${body}   headers=${header}


   Log To Console   ${response.status_code}
   Log To Console   ${response.content}

   #validation

  ${status_code}=  Convert To String   ${response.status_code}
  Should Be Equal    ${status_code}    200


 # ${res_content}=  Convert To String   ${response.content}
  #Should Contain    ${res_content}    Tayoland

TC: Delete the animal (DELETE)

    Create Session    mysession    ${base_url}
    ${response}=  Delete Request    mysession    /v2/pet/55
    
    #Validation
    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}   200


    ${res_body}=  Convert To String     ${response.content}
    Should Contain     ${res_body}   a
    

