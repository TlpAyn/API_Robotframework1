*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections


*** Test Cases ***
First Test Case


  ${json_obj}=  Load Json From File  C:\Users\talipa\Desktop\rbt\ubung.json

  ${title_value}=  Get Value From Json    ${json_obj}     $.glossary.title
  Should Be Equal    ${title_value}    example glossary

  ${ID_value}=  Get Value From Json    ${json_obj}    $.glossary.GlossDiv.GlossList.GlossEntry.ID
  Should Be Equal    ${ID_value}    SGML


