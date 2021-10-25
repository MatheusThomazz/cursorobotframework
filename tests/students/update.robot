***Settings***
Documentation        Atualizar  alunos

Resource    ../../resources/base.robot  #${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***

Cenario: Atualizar um aluno já cadastrado

    ${fixture}      Get JSON        students-update.json

    ${KamalaKhan}   Set Variable      ${fixture['before']}
    ${msmarvel}     Set Variable      ${fixture['after']}

    Remove Student By name      ${KamalaKhan['name']}
    Remove Student By name      ${msmarvel['name']}

    Insert Student               ${KamalaKhan}    
    Go To Students  
    Search Student By name       ${KamalaKhan['name']}
    Go To Student Update Form    ${KamalaKhan['email']}
    Update A Student             ${msmarvel}
    Toaster Text Should Be       Aluno atualizado com sucesso.

    [Teardown]      Thinking And Take Screenshot  2


  