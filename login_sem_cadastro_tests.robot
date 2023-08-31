*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${input_email}          //input[@id="inlineUserEmail"]
${input_password}       id:inlineUserPassword
${button_submit}        name:submit
${URL}                  https://www.glassdoor.com.br/ 
${browser}              firefox
${email}                outro_email@gmail.com
${texto}                Criar conta


*** Keywords ***
Dado que esteja realizando o login na tela inicial com um usuário não cadastrado
    Open Browser    ${URL}     ${browser} 
Quando adicionar e-mail no campo “E-mail“ 
    [Arguments]     ${email} 
    Wait Until Element Is Visible       ${input_email}
    Input Text      ${input_email}      ${email}
    Sleep  3 

E selecionar a opção “Entrar com e-mail“ 
    Wait Until Element Is Visible       ${button_submit}
    Click Element   ${button_submit}

Então a tela inicial de um cadastro com a opção de "criar conta" deve ser mostrada
    Wait Until Page Contains       ${texto}

*** Test Cases***
Cenário_2: Validar Login com um usuário não cadastrado
    Dado que esteja realizando o login na tela inicial com um usuário não cadastrado
    Quando adicionar e-mail no campo “E-mail“          
    E selecionar a opção “Entrar com e-mail“ 
    Então a tela inicial de um cadastro com a opção de "criar conta" deve ser mostrada