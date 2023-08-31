*** Settings ***
Library     SeleniumLibrary
Resource    ../novo_main.robot


*** Test Cases***
Cenário: Validar o login de um e-mail cadastrado e senha incorreta
    Dado que esteja realizando um login com usuário já cadastrado
    Quando adiciono e-mail de acesso
    E pressiono a opção 'Entrar com e-mail'
    E adiciono uma senha incorreta
    E clico a opção 'Entrar'
    Então deve retornar o erro em tela 'O nome de usuário e a senha informados são inválidos. Tente novamente.'

    #Então deve retornar o erro em tela 'O nome de usuário e a senha informados são inválidos. Tente novamente.'
    [Teardown]