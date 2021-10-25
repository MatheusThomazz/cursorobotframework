***Settings***
Documentation       Ações para autoriuzaçao

***Keywords***
Go To Login Page
    Go To       https://body-test-web-matheus.herokuapp.com/


Login With
    [Arguments]     ${email}   ${pass}

    Fill Text       css=input[name=email]           ${email}
    Fill Text       css=input[placeholder*=senha]    ${pass}
    Click           text=Entrar


    