*** Settings ***
Library           DebugLibrary
Library           APIHelper.py

*** Variables ***
${url}            https://skillacademy.com/skillacademy/discovery/search

# *** Keywords ***
# Get Data Method
#     [Arguments]         ${service_name}   ${service_url}          ${uri}        ${header}=    ${parameter}=   ${payload}=
#     # Create Session      ${service_name}   ${service_url}          verify=True
#     ${response}         Get Request       alias=${service_name}   uri=${uri}    headers=${header}    params=${parameter}   data=${payload}
#     [Return]            ${response}
