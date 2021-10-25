***Settings***
Documentation       Buscar alunos

Resource    ../../resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Busca exata

    &{student}      Create Dictionary   name=Steve Jobs    email=steve@gmail.com     age=45  weight=92   feet_tall=1.74

    Remove Student By Name            ${student.name}
    Insert Student                    ${student}
    Go To Students
    Search Student By name            ${student.name}
    Student Name Should Be Visible    ${student.name}
    Total Itens Should Be             1

Cenario: Registro não encontrado
    
    ${name}     Set Variable         Barao Zemo

    Remove Student By Name            ${name}
    Go To Students
    Search Student By name            ${name}
    Register Should Not Be Found

Cenario: Buscar alunos por um unico termo
    [Tags]      json

    ${fixture}      Get JSON   students-search.json
    ${students}     Set Variable    ${fixture['students']}
    ${word}         Set Variable    ${fixture['word']}

    Remove Student By Name      ${word}
   
     FOR     ${item}     IN      @{students}      #@ para o robot entender que é uma lista
            Insert Student      ${item}
    END

    Go To Students
    Search Student By name      ${word}

     FOR     ${item}     IN      @{students}      
            Student Name Should Be Visible      ${item['name']}
    END

    Total Itens Should Be       3



    
   






