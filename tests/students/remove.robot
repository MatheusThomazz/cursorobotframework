***Settings***
Documentation       Remover Alunos

Resource    ../../resources/base.robot

# Suite Setup     Start Admin Session uma unica sessao para os cenarios
Test Setup     Start Admin Session  # uma sessao por cenario
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Remover aluno cadastrado

    &{student}      Create Dictionary   name=Robert Pattinson    email=batman@gmail.com     age=37  weight=92   feet_tall=1.74

    Insert Student                  ${student}
    Go To Students
    Search Student By name          ${student.name}    
    Request Removal By Email        ${student.email}
    Confrim Removal
    Toaster Text Should Be          Aluno removido com sucesso.
    Student Should Not visible      ${student.email}

    [Teardown]      Thinking And Take Screenshot  2

Cenario desistir da exclusão

    &{student}      Create Dictionary   name=Robert Jr    email=iromman@gmail.com     age=37  weight=92   feet_tall=1.74

    Insert Student                  ${student}
    Go To Students
    Search Student By name          ${student.name}
    # Reload recarrega a pagina
    Request Removal By Email        ${student.email}
    Cancel Removal
    Student Should Be Visible       ${student.email}



