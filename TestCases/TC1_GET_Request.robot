*** Settings ***
Library  RequestsLibrary
Library    Collections




*** Variables ***
${base_url}   https://jsonplaceholder.typicode.com
${id}  1





*** Test Cases ***
Get_erste_tes


   Create Session  mysession  ${base_url}
   ${response}=   Get Request  mysession  /posts/${id}

   #Log To Console  ${response.status_code}
   #Log To Console  ${response.content}
   #Log To Console  ${response.headers}

   #Validations

   ${status.code}=   Convert To String   ${response.status_code}
   Should Be Equal  ${status.code}  200

   ${body}=  Convert To String   ${response.content}
   Should Contain    ${body}   facere

   ${contentTypeValue}=  Get From Dictionary  ${response.headers}   Content-Type

   Should Be Equal       ${contentTypeValue}   application/json; charset=utf-8









