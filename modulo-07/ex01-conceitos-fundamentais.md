**a. Qual é a função do AppServer?**

O **AppServer** é o motor do ERP Protheus. Ele recebe os comandos do usuário, processa as regras de negócio (programas AdvPL) e gerencia o acesso ao banco de dados. Sua função central é executar todo o trabalho pesado de forma segura e centralizada, devolvendo os resultados para o computador local.

**b. O que é o RPO?**

O **RPO** é o repositório para onde todo o código escrito em AdvPL é compilado. Ele funciona como uma biblioteca centralizada de rotinas e funções prontas. Em vez de gerar um arquivo executável (.exe) isolado, o código fica armazenado nesse repositório para ser lido e processado pelo AppServer (o motor do sistema).

**c. Para que serve o Configurador (SIGACFG)?**

O **Configurador (SIGACFG)** funciona como o "painel de controle" do Protheus. Ele serve para gerenciar o dicionário de dados, permitindo criar tabelas do zero (como a ZA1), adicionar abas e campos customizados, alterar propriedades (como título e obrigatoriedade) e controlar permissões de acesso por campo, usuário ou grupo. Sua principal função é permitir que essas regras sejam alteradas e refletidas nas telas do sistema automaticamente, sem a necessidade de programar nenhuma linha de código (AdvPL).

**d. Qual a diferença entre campo Real e campo Virtual no SX3?**

* **Campo Real (Contexto = 1):** É um campo físico estruturado diretamente na tabela do banco de dados. Ele é utilizado para persistir e armazenar informações permanentemente em disco (como o nome de um registro).
* **Campo Virtual (Contexto = 2):** É um campo lógico calculado "em tempo de execução" que não ocupa espaço no banco de dados. Ele serve apenas para exibir informações dinâmicas na tela ou em relatórios (como uma soma ou busca externa), sendo descartado ao fechar a rotina.



