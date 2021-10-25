***Settings***          
Documentation           Arquivo base do projeto de automação

Library     Browser
Library     Collections
Library     libs/DeloreanLibrary.py
Library     DateTime
Library     OperatingSystem

Resource    actions/auth.robot
Resource    actions/nav.robot
Resource    actions/students.robot
Resource    actions/plans.robot
Resource    actions/enrolls.robot
Resource    actions/components.robot

***Keywords***
Start Brower Session
    New Browser         chromium    False
    New Page            about:blank

Start Admin Session
    Start Brower Session
    Go To Login Page
    Login With                admin@bodytest.com  pwd123
    User Should Be Logged IN  Administrador

Clear Local Storage And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]     ${timeout}

    sleep       ${timeout}
    Take Screenshot


###Helpers
Get JSON 
    [Arguments]     ${file_name}

    ${file}=            Get File        ${EXECDIR}/resources/fixtures/${file_name}
    ${json_object}      Evaluate        json.loads($file)       json

    [return]        ${json_object}




