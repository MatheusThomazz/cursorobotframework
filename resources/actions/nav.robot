***Settings***
Documentation       Ações do menu superior de navegação

***Keywords***
Go To Students
    Click       xpath=//*[@id="root"]/div[1]/div[1]/div/nav/ul/li[1]/a  #css=a[href$=alunos]
    wait for Elements State     css=h1 >> text=Gestão de Alunos     visible     5

Go To Plans
    Click                       css=a[href$=planos]
    wait for Elements State     css=h1 >> text=Gestão de Planos     visible     5

Go To Enrolls
    Click       xpath=//*[@id="root"]/div[1]/div[1]/div/nav/ul/li[3]/a  #css=a[href$=matriculas]
    wait for Elements State     css=h1 >> text=Gestão de Matrículas     visible     5
    
User Should Be Logged IN
    [Arguments]     ${user_name}

    Get Text    css=aside strong    should be   ${user_name}