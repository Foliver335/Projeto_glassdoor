*** Settings ***
Library     SeleniumLibrary

*** Variables ***
&{login}
${EMAIL_LOGIN}              //*[@id="inlineUserEmail"]
${PASSWORD_LOGIN}           //*[@data-test="passwordInput"]
${BOTAO_ENTRAR_NA_CONTA}    //*[@class="gd-ui-button mt-std w-100pct email-button tng css-jbcabp e5tvpqr2"]
${BOTAO_ENTRAR}             //*[@class="gd-ui-button mt-std w-100pct tng css-jbcabp e5tvpqr2"]
${email}                    usuario_teste@exemplo.com  
${senha}                    senhapadrao
${URL}                      https://www.glassdoor.com.br/
${BROWSER}                  Firefox


*** Keywords ***
Dado que esteja realizando o login na tela inicial com um usuário cadastrado
    Open Browser    ${URL}      ${BROWSER}
    Click Element   ${.EMAIL_LOGIN}  
    Input Text      ${EMAIL_LOGIN}      ${login}
Quando selecionar a opção "Entrar com o E-mail
    Click Element   ${BOTAO_ENTRAR_NA_CONTA}
E adicionar senha
    Input Text      ${PASSWORD_LOGIN}    ${senha}
E clicar na opção "Entrar"
    Click Element   ${BOTAO_ENTRAR}
Então o login foi bem sucedido
    Close Browser


*** Test Cases ***

Cenario 1: Login na glassdoor
    [Setup]
    Dado que esteja realizando o login na tela inicial com um usuário cadastrado
    Quando selecionar a opção "Entrar com o E-mail
    E adicionar senha
    E clicar na opção "Entrar"
    Então o login foi bem sucedido
    [Teardown]




