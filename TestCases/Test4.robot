*** Settings ***

Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***

${Base_Url}  http://thetestingworldapi.com     


*** Test Cases ***
TC_01_Get_request
    Create Session    Api_testing    ${Base_Url}
    
    ${Get_response}=  GET On Session  API_Testing   api/studentsDetails/100011
    ${json_response}=  Set Variable    ${Get_response.json()}

    Log To Console   ${json_response}

    
   