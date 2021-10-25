***Settings***
Documentation       Ações da feature de gestão de planos

***Variables***
${TITLE_FIELD}      id=title
${DURATION_FIELD}   id=duration
${PRICE_FIELD}      css=input[name=price]
${TOTAL_FIELD}      css=input[name=total]

***Keywords***
Submit Plan Form
    Click           xpath=//button[contains(text(), "Salvar")]


Fill Plan Form
    [Arguments]     ${plan}    

    Fill Text       ${TITLE_FIELD}        ${plan.title}
    Fill Text       ${DURATION_FIELD}     ${plan.duration}
    Fill Text       ${PRICE_FIELD}        ${plan.price}
     

Go To Form Plan    
    Click       css=a[href$="planos/new"]
    wait for Elements State     css=h1 >> text=Novo plano     visible     5

Total Plan Should Be
    [Arguments]     ${total}

    Get Attribute       ${TOTAL_FIELD}      value       ==      ${total}             