***Settings***
Library  SeleniumLibrary

*** Variables ***
${input_email}                  //*[@id="inlineUserEmail"]
${input_password}               //*[@id="inlineUserPassword"]
${button_submit}                name:submit
${URL}                          https://www.glassdoor.com.br/ 
${browser}                      firefox
${button_survey}                //button[@data-testid="start-employed-survey"]
${CARGO_PRETENNDIDO}            //*[@id="survey-component-jobTitle-753c8dc-4b3b-830e-47f4-bfe1261cfe0d"]
${LOCATION}                     //*[@id="start-survey-location-input-0f7f705-afdd-8cae-060a-f82d5441b51f"]
${ENTER}                        ENTER
${survey}                       /html/body/div[1]/div/div/div/div/div/h3/span
${mark_box}                     //*[@id="Container"]/div/div/div/div/div/div[2]/div/div[2]/label/div/svg[2]
${emprego_survey}               //*[@id="Container"]/div/div/div/div/div/div[2]/div/div[2]/div[4]/div/button[1]
${vinculo_empregaticio}         //*[@id="Container"]/div/div/div/div/div/div[2]/div/div[2]/div[5]/div/div[1]
${periodo_integral}             //*[@id="option_REGULAR"]/span
${botao_continuar}              //button[@data-test="add-salary-submit"]
${VALOR_SALARIO}                //*[@id="basePay"]
${POR_MES}                      //*[@id="Container"]/div/div/div/div/div[2]/div/div[3]/div[1]/div/div[2]/div/button[3]/span
${OPCAO_NAO}                    //*[@id="Container"]/div/div/div/div/div[2]/div/div[3]/div[2]/label[2]/div
${EXPERIENCIA}                  //*[@id="yearsOfExperience"]
${AVALIACAO_EMPRESA}            //*[@id="starRating"]/button[4]/svg/path
${TITULO_AVALIACAO}             //*[@id="reviewHeadline"]
${CAMPO_PROS}                   //*[@id="reviewPros"]
${CAMPO_CONTRAS}                //*[@id="reviewCons"]
${TERMO_CONCORDANCIA}           //*[@id="Container"]/div/div/div/div/div[2]/div/div[3]/label[2]/div/svg[2]
${AVALIACAO_OPORTUNIDADES}      //*[@id="careerOpportunitiesRating"]/button[4]/svg
${AVALIACAO_REMUNERACAO}        //*[@id="compensationRating"]/button[4]/svg/path
${AVALIACAO_Qualidade_DE_VIDA}      //*[@id="workLifeBalanceRating"]/button[4]/svg/path
${AVALIACAO_Alta_liderança}         //*[@id="managementRating"]/button[4]/svg/path
${AVALIACAO_Cultura_valores}        //*[@id="cultureRating"]/button[4]/svg
${AVALIACAO_Diversidade_Inclusão}       //*[@id="diversityRating"]/button[4]/svg/path
${AVALIACAO_Recomenda a amigos?}        //input[@data-test:"optional-employer-review-recommend-yes"]
${PERSPECTIVA}                          //input[@data-test:"optional-employer-review-business-outlook-good"]
${CAMPO_CONSELHO_PRESIDENCIA}           //*[@id="adviceToManagement"]
${BOTAO_CONTINUAR}                      //button[@data-test="employer-review-submit"]
${BOTAO_CONCLUIDO}                      //Button[@data-test="done-button"]
***Variables***
#variaveis de preenchimento
${email}                        usuario_teste_003@exemplo.com 
${senha}                        senhapadrao
${cargo}                        Analista de sistema
${local}                        Manaus, Amazonas (Brasil)
${empresa_recente}              Itriad Instituto de Pesquisa e Desenvolvimento
${salario_pretendido}           5000
${tempo_especiencia}            2   
${resposta_titulo}              Ótima empresa
${resposta_pros}                ótima empresa para crescer profissionalmente e aprender coisas novas
${resposta_contras}             Não tenho nada do que reclamar  
${resposta_presidencia}         Continue assim!


*** Keywords ***

Dado que ja tenha realizando o cadastro na tela inicial
    Open Browser        ${URL}      ${browser} 

Quando eu adiciono o e-mail para cadastro
    Input Text          ${input_email}      ${email}
E pressiono o botão 'Entrar com e-mail'
    Click Element       ${button_submit} 
E adiciono uma senha para criar conta 
    Wait Until Element Is Visible         ${input_password} 
    Input Text      ${input_password}     ${senha} 
E pressiono o botão 'Criar conta'
    Click Element       ${button_submit} 
    Sleep   3s
E respondo a pergunta 'Você está trabalhando?' com 'sim'
    Click button    ${button_survey}
    Sleep  3s
E adiciono 'Analista de sistema' para a opção Cargo
    Wait Until Element Is Visible    ${CARGO_PRETENNDIDO} 
    Input Text           ${CARGO_PRETENNDIDO}    ${cargo}
E adiciono 'Manaus, Amazonas (Brasil)' para a opção Localização
    Wait Until Element Is Visible    ${LOCATION} 
    Input Text           ${LOCATION}    ${local} 
E preciono a tecla ENTER
    Press Keys		   ${LOCATION}      ${ENTER} 

E deixo selecionado o botão 'Quero receber novas vagas por e-mail.'
    Click Element       ${mark_box}
E adiciono 'Itriad Instituto de Pesquisa e Desenvolvimento' para a campo Empresa mais recente
    Input Text          ${empresa_recente} 
E informo se sou funcionario ou ex-funcionar
    Click Element       ${emprego_survey} 

E seleciono a opçao 'Período Integral' para o campo tipo de vínculo empregatício
    Click Element       ${vinculo_empregaticio}
    Wait Until Element Is Visible    ${LOCATION} 
    Click Element       ${periodo_integral}  
E Clico em Continuar
    Click Element       ${botao_continuar}

E adiciono '5000' na opção salário base
    Input Text   ${VALOR_SALARIO}    ${salario_pretendido} 

E seleciono a opção 'Por mês'
    Click Element   ${POR_MES}   ${VALOR_SALARIO}
E marco a opção 'Não' para o campo Você recebe bônus, gorjeta ou comissão por venda?
    Click Element   ${OPCAO_NAO}
E adiciono '2' para o campo Anos de experiência nesse cargo
    Input Text      ${EXPERIENCIA}   ${tempo_especiencia}   
E pressiono o botão 'Continuar' para continuar
    Click Element   ${BOTAO_CONTINUAR}

E seleciono 4 estrelas para o campo Avalie sua experiência nesta empresa
    Click Element   ${AVALIACAO_EMPRESA} 

E adiciono 'Ótima empresa.' ao campo Título da avaliação
    Input Text      ${TITULO_AVALIACAO}     ${resposta_titulo}
E adiciono 'ótima empresa para crescer profissionalmente e aprender coisas novas' ao campo Prós
    Input Text      ${CAMPO_PROS}     ${resposta_pros}
E adiciono 'Não tenho nada do que reclamar' ao campo Contras
    Input Text      ${CAMPO_CONTRAS}     ${resposta_contras}
E seleciono o botão de Termos de Uso
    Click Element    ${TERMO_CONCORDANCIA}   
E pressiono o botão 'Continuar'
    Click Element    ${BOTAO_CONTINUE}
E seleciono 4 estrelas para o campo Oportunidades de carreira
    Click Element    ${AVALIACAO_OPORTUNIDADES}
E seleciono 4 estrelas para o campo Remuneração e benefícios
    Click Element    ${AVALIACAO_Cultura_valores}
E seleciono 4 estrelas para o campo Qualidade de vida
    Click Element    ${AVALIACAO_Qualidade_DE_VIDA}
E seleciono 4 estrelas para o campo Alta liderança
    Click Element    ${AVALIACAO_Alta_liderança}
E seleciono 4 estrelas para o campo Cultura e valores
    Click Element   ${AVALIACAO_Cultura_valores}
E seleciono 4 estrelas para o campo Diversidade e inclusão
    Click Element   ${AVALIACAO_Diversidade_Inclusão}
E seleciono a opção 'Sim' para a questão Recomenda a amigos?
    Click Element   ${AVALIACAO_Recomenda a amigos?}
E seleciono a opção 'Boa' para a questão Qual é sua perspectiva de mercado da empresa para os próximos seis meses?
    Click Element   ${PERSPECTIVA}
E adiciono 'Continue assim.' ao campo Conselho à presidência
    Click Element   ${CAMPO_CONSELHO_PRESIDENCIA}       ${resposta_presidencia}
E pressiono o botão 'Continuar'
    Click Element   ${BOTAO_CONTINUAR}
E pressiono o botão 'Concluir'
    Click Element   ${BOTAO_CONCLUIDO}
#Então estou logada com a nova conta criada

***Test Cases***
Cenário: Realizando um Cadastro
    Dado que ja tenha realizando o cadastro na tela inicial
    Quando eu adiciono o e-mail para cadastro
    E pressiono o botão 'Entrar com e-mail'
    E adiciono uma senha para criar conta 
    E pressiono o botão 'Criar conta'
    E respondo a pergunta 'Você está trabalhando?' com 'sim'
    E adiciono 'Analista de sistema' para a opção Cargo
    E adiciono 'Manaus, Amazonas (Brasil)' para a opção Localização
    E deixo selecionado o botão 'Quero receber novas vagas por e-mail.'
    E adiciono 'Itriad Instituto de Pesquisa e Desenvolvimento' para a campo Empresa mais recente
    E seleciono a opçao 'Período Intgeral' para o campo tipo de vínculo empregatício
    E adiciono '5000' na opção salário base
    E deixo marcado a opção 'Real Brasileiro (BRL)'
    E seleciono a opção 'Por mês'
    E marco a opção 'Não' para o campo Você recebe bônus, gorjeta ou comissão por venda?
    E adiciono '2' para o campo Anos de experiência nesse cargo
    E pressiono o botão 'Continuar' para continuar
    E seleciono 4 estrelas para o campo Avalie sua experiência nesta empresa
    E adiciono 'Ótima empresa.' ao campo Título da avaliação
    E adiciono 'ótima empresa para crescer profissionalmente e aprender coisas novas' ao campo Prós
    E adiciono 'Não tenho nada do que reclamar' ao campo Contras
    E seleciono o botão de Termos de Uso
    E pressiono o botão 'Continuar'
    E seleciono 4 estrelas para o campo Oportunidades de carreira
    E seleciono 4 estrelas para o campo Remuneração e benefícios
    E seleciono 4 estrelas para o campo Qualidade de vida
    E seleciono 4 estrelas para o campo Alta liderança
    E seleciono 4 estrelas para o campo Cultura e valores
    E seleciono 4 estrelas para o campo Diversidade e inclusão
    E seleciono a opção 'Sim' para a questão Recomenda a amigos?
    E seleciono a opção 'Boa' para a questão Qual é sua perspectiva de mercado da empresa para os próximos seis meses?
    E adiciono 'Continue assim.' ao campo Conselho à presidência
    E pressiono o botão 'Continuar'
    E pressiono o botão 'Concluir'
    #Então estou logada com a nova conta criada