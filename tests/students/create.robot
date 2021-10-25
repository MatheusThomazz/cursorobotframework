***Settings***
Documentation       Cadastro de alunos

Resource    ../../resources/base.robot  #${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Novo aluno
    #dicionario
    &{student}      Create Dictionary   name=Matheus    email=matheus@gmail.com     age=37  weight=92   feet_tall=1.74   

    Remove Student              ${student.email}        
    Go To Students
    Go To Form Student
    New Student                 ${student}
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]      Thinking And Take Screenshot  2

Cenario: Não deve permitir email duplicado
    [tags]      dup
    &{student}      Create Dictionary   name=João da Silva    email=joao@gmail.com     age=21  weight=70   feet_tall=1.70   

   Insert Student               ${student}

    Go To Students
    Go To Form Student
    New Student                 ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]      Thinking And Take Screenshot  2

Cenario: Todos os campos devem ser obrigatorios
    #lista
    @{expected_alerts}      Set Variable    Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório    a Altura é obrigatória

    Go To Students
    Go To Form Student
    Submit Student Form

    FOR     ${alert}    IN      @{expected_alerts}
        Alert Text Should Be    ${alert}
    END

Cenario: Validação dos campos numericos
    [tags]  temp
    [Template]      Check Type Field On Student Form
    ${AGE_FIELD}         number
    ${WEIGHT_FIELD}      number
    ${FEET_TALL_FIELD}   number

Cenario: Validação dos campos de email
    [tags]  temp
    [Template]      Check Type Field On Student Form
    ${EMAIL_FIELD}       email

Cenario: Menor de 14 anos não pode fazer cadastro

    &{student}      Create Dictionary   name=Livia da Silva    email=livia@gmail.com     age=13  weight=50   feet_tall=1.60

    Go To Students
    Go To Form Student
    New Student             ${student}
    Alert Text Should Be    A idade deve ser maior ou igual 14 anos


***Keywords***
Check Type Field On Student Form
    [Arguments]     ${element}      ${type}

    Go To Students
    Go To Form Student
    Field Should Be Type      ${element}        ${type}     

    

    