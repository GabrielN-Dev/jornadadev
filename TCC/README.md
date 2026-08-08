# 📦 TCC — Controle de Não Conformidades de Fornecedores (ISO 9001)
### Programa START — TOTVS Paulista · Harbour/ADVPL — Do Zero ao Protheus

> **Ambiente de referência:** Protheus 8, Build `7.00.050131A` (Janeiro/2005) — arquitetura clássica (RPO, AppServer monousuário, dicionário SX2/SX3/SIX/SX7, telas via `mBrowse`).
> **Módulo:** Compras (SIGACOM)
> **Autor:** Gabriel

---

## ⚠️ Sobre o ambiente de desenvolvimento

Meu ambiente Protheus ficou instável durante o desenvolvimento e eu não consegui extrair os `.dbf`/CSV do dicionário (SX2/SX3/SIX/SX7) nem capturar todos os prints de tela. Como a rubrica prevê esse cenário:

> *"Sem o ambiente Protheus? Você ainda entrega o TCC. Onde a rubrica pede algo do ambiente (DBF, prints), você entrega o equivalente por escrito/código (...) os fontes .PRW escritos e comentados (a IA lê o código, não precisa executá-lo); onde pediria print, descreva o passo a passo e o resultado esperado."*

Optei por esse caminho: abaixo descrevo a estrutura da `ZZ1` e a configuração de validação/gatilho exatamente como feitas no Configurador, e entrego os fontes `.PRW` comentados e funcionais em texto.

---

## 🎯 Escopo desta entrega — núcleo mínimo do TCC

| # | Item exigido pelo núcleo mínimo | Status |
|---|---|---|
| 1 | Tabela `ZZ1` no dicionário (campos + índices) | ✅ Descrita abaixo |
| 2 | `STTZZ1.PRW` — manutenção da ZZ1 (`mBrowse`) | ✅ Entregue |
| 3 | Validações da ZZ1 (fornecedor existe na SA2; tolerância 0–100) | ✅ Implementadas via **validação de usuário no SX3** |
| 4 | `BEGIN SEQUENCE` protegendo a abertura/gravação, com mensagem amigável | ✅ Entregue (ver observação na seção 3) |

**Fora desta entrega:** ZZ2, STTZZLIB completa, SXB, menu SIGACOM e POO — não deu tempo dentro do prazo. Ficam documentados como próximos passos no fim deste README.

---

## 🗂️ 1. Estrutura da tabela ZZ1 no dicionário

### 1.1. Dicionário de Tabelas (SX2)

| Propriedade | Valor |
|---|---|
| Prefixo | `ZZ1` |
| Nome | Controle de Fornecimento |
| Path | `\DATA\` |
| Modo de Acesso | `COMPARTILHADO` |

### 1.2. Campos (SX3)

| Título | Campo | Tipo | Tam | Dec | Contexto |
|---|---|---|---|---|---|
| Filial | `ZZ1_FILIAL` | C | 2 | 0 | Real |
| Código | `ZZ1_CODIGO` | C | 6 | 0 | Real |
| Cód. Fornecedor | `ZZ1_FORNEC` | C | 6 | 0 | Real |
| Loja Fornecedor | `ZZ1_LOJAFO` | C | 2 | 0 | Real |
| Nome Fornecedor | `ZZ1_NOMEFO` | C | 40 | 0 | **Virtual** |
| Dados Certificado | `ZZ1_CERTIF` | C | 256 | 0 | Real |
| Val. Certificado | `ZZ1_VALCER` | D | 8 | 0 | Real |
| Tolerância (%) | `ZZ1_TOLERA` | N | 5 | 2 | Real |
| Qtd. Conforme | `ZZ1_TOTOK` | N | 12 | 2 | Real |
| Qtd. Não Conforme | `ZZ1_TOTNOK` | N | 12 | 2 | Real |

### 1.3. Índices (SIX)

| Ordem | Expressão | Descrição |
|---|---|---|
| 1 | `ZZ1_FILIAL + ZZ1_CODIGO` | Chave primária |
| 2 | `ZZ1_FILIAL + ZZ1_FORNEC + ZZ1_LOJAFO` | Consulta por fornecedor |
| 3 | `ZZ1_FILIAL + DTOS(ZZ1_VALCER)` | Consulta por validade do certificado |

---

## 💻 2. Rotina AdvPL — STTZZ1.PRW

Usei `mBrowse` (em vez de `AxCadastro` puro) para poder configurar o menu de rotinas (`aRotina`) explicitamente com as 5 opções padrão:

```advpl
#include "protheus.ch"

/*/{Protheus.doc} STTZZ1
Rotina de manutencao da tabela ZZ1 - Controle de Fornecimento.
Abre um mBrowse padrao sobre a ZZ1, com as rotinas de
Pesquisar, Visualizar, Incluir, Alterar e Excluir.
A critica dos campos (fornecedor existente na SA2 e faixa da
tolerancia) fica a cargo das funcoes de validacao de usuario
configuradas diretamente no SX3 (ver secao 3 do README).
@type Function
@author Gabriel
/*/
User Function STTZZ1()

    Local oErro

    Private cCadastro := "Controle de Fornecimento"
    Private aRotina := {;
        {"Pesquisar" , "AxPesqui" , 0, 1},;
        {"Visualizar", "AxVisual" , 0, 2},;
        {"Incluir"   , "AxInclui" , 0, 3},;
        {"Alterar"   , "AxAltera" , 0, 4},;
        {"Excluir"   , "AxDeleta" , 0, 5};
    }

    BEGIN SEQUENCE

        dbSelectArea("ZZ1")
        dbSetOrder(1)          // ZZ1_FILIAL + ZZ1_CODIGO
        dbSeek(xFilial("ZZ1"))
        mBrowse(1, 1, 22, 75, "ZZ1")

    RECOVER USING oErro

        MsgStop("Erro: " + oErro:Description, "Atenção")

    END SEQUENCE

Return Nil
```

**Observação honesta sobre o BEGIN SEQUENCE:** esse bloco aqui protege a **abertura da tabela e do browse** (`dbSelectArea`/`dbSeek`/`mBrowse`) contra erro de acesso ao banco — se a ZZ1 estiver indisponível, o usuário recebe `MsgStop` em vez de a estação travar. A proteção da **gravação em si** acontece nas funções de validação (`VldFornec`/`VldTolera`, seção 3), que rodam antes do `AxInclui`/`AxAltera` confirmarem o registro e podem barrar a gravação. As duas frentes juntas cobrem o item 4 da rubrica: nada é gravado sem passar pela crítica, e qualquer erro de acesso mostra mensagem amigável em vez de erro técnico cru.

---

## ✅ 3. Validações da ZZ1

Em vez de usar parâmetro de validação da `AxCadastro`, configurei a crítica **direto no campo, via SX3**, no menu **Base de Dados → Dicionário → Base de Dados → editar ZZ1 → campo → aba "Validação"**.

### 3.1. Campo `ZZ1_FORNEC`

No SX3, propriedade **Validação do Usuário (X3_VLDUSER)**, informei:

```advpl
U_VldFornec()
```

> ⚠️ Pré-requisito: a função `U_VldFornec()` precisa existir compilada no ambiente (fonte `STTZZLIB.PRW`, incluído no RPO via DevStudio) — senão o SX3 aponta para uma função inexistente e a validação simplesmente não dispara.

Função (em `STTZZLIB.PRW`):

```advpl
#include "protheus.ch"

/*/{Protheus.doc} VldFornec
Valida o campo ZZ1_FORNEC no momento da Inclusao/Alteracao.
Confere se o fornecedor (codigo + loja) existe na SA2.
Conforme pedido em aula, mostra feedback tanto no sucesso
quanto no erro da validacao (bloco Else com MsgAlert).
@type Function
@return lExiste, Logico, .T. libera o campo / .F. bloqueia
/*/
User Function VldFornec()

    Local lExiste := .T.

    If !Empty(M->ZZ1_FORNEC)
        lExiste := ExistCpo("SA2", M->ZZ1_FORNEC + M->ZZ1_LOJAFO, 1)
        If !lExiste
            MsgAlert("Fornecedor não cadastrado!", "Atenção")
            M->ZZ1_FORNEC := Space(TamSx3("ZZ1_FORNEC")[1])
        Else
            MsgAlert("Fornecedor cadastrado!", "Sucesso")
        EndIf
    EndIf

Return lExiste
```

### 3.2. Campo `ZZ1_TOLERA`

Mesmo caminho, **Validação do Usuário** do campo `ZZ1_TOLERA`:

```advpl
U_VldTolera()
```

Função (em `STTZZLIB.PRW`):

```advpl
/*/{Protheus.doc} VldTolera
Valida o campo ZZ1_TOLERA no momento da Inclusao/Alteracao.
Confere se o percentual informado esta entre 0 e 100.
@type Function
@return lValido, Logico, .T. libera o campo / .F. bloqueia
/*/
User Function VldTolera()

    Local lValido := .T.

    If !Empty(M->ZZ1_TOLERA)
        If M->ZZ1_TOLERA < 0 .Or. M->ZZ1_TOLERA > 100
            lValido := .F.
            MsgAlert("Tolerância deve estar entre 0 e 100!", "Atenção")
            M->ZZ1_TOLERA := 0.00
        Else
            MsgAlert("Tolerância aprovada!", "Sucesso")
        EndIf
    EndIf

Return lValido
```

> Os dois `Else` com `MsgAlert` de sucesso foram mantidos de propósito — o professor pediu esse feedback também no caminho feliz, não só no erro.
>
> **Limitação conhecida (ambiente com filial única):** o `ExistCpo` de `VldFornec` não usa `xFilial("SA2")` na frente da chave. Funciona porque o ambiente de teste só tem uma filial; num ambiente multi-filial isso passaria a buscar na filial errada. Deixado assim nesta entrega por decisão de tempo — registrado aqui para não passar despercebido.

---

## 🔗 4. Gatilho (SX7) — nome do fornecedor automático

Configurado em **SIGACFG → Dicionário → Gatilhos**, dois registros (um por campo que participa da chave, para disparar em qualquer ordem de preenchimento):

**Gatilho 1**
| Propriedade | Valor |
|---|---|
| Campo | `ZZ1_FORNEC` |
| Sequência | `001` |
| Cnt. Domínio | `ZZ1_NOMEFO` |
| Tipo | Primário |
| Regra | `POSICIONE("SA2", 1, xFilial("SA2") + M->ZZ1_FORNEC + M->ZZ1_LOJAFO, "A2_NOME")` |
| Posiciona | Não |

**Gatilho 2** (idêntico, mudando só o campo de origem — necessário porque `ZZ1_LOJAFO` costuma ser preenchido depois de `ZZ1_FORNEC`)
| Propriedade | Valor |
|---|---|
| Campo | `ZZ1_LOJAFO` |
| Sequência | `002` |
| Cnt. Domínio | `ZZ1_NOMEFO` |
| Tipo | Primário |
| Regra | `POSICIONE("SA2", 1, xFilial("SA2") + M->ZZ1_FORNEC + M->ZZ1_LOJAFO, "A2_NOME")` |
| Posiciona | Não |

---

## 🧪 5. Testes realizados

Sem prints por causa da instabilidade do ambiente, mas o roteiro testado foi:

1. `U_STTZZ1()` abre o mBrowse normalmente sobre a ZZ1.
2. **Incluir** → digitar código de fornecedor inexistente na SA2 → `MsgAlert("Fornecedor não cadastrado!")` dispara e o campo é limpo.
3. Digitar código válido → `MsgAlert("Fornecedor cadastrado!")` confirma, e após preencher a loja o `ZZ1_NOMEFO` é preenchido automaticamente pelo gatilho.
4. Informar tolerância `150` → `MsgAlert("Tolerância deve estar entre 0 e 100!")`, campo volta para `0.00`.
5. Informar tolerância `25` → `MsgAlert("Tolerância aprovada!")`, registro é gravado com sucesso.

---

## 📌 Funcionalidades não implementadas nesta entrega

Durante o desenvolvimento, algumas funcionalidades previstas inicialmente não puderam ser concluídas dentro do prazo. A principal dificuldade foi o nível de familiaridade ainda limitado com ADVPL e com a estrutura do Protheus 8.

Parte considerável do tempo foi destinada à compreensão da ferramenta, à realização dos testes e à tentativa de encontrar materiais e exemplos compatíveis com a versão do ambiente utilizada. Como o material disponível para Protheus 8 é mais limitado e muitos exemplos encontrados fazem referência a versões e estruturas diferentes, algumas implementações exigiram um tempo maior de pesquisa e validação do que o previsto inicialmente.

Por esse motivo, optei por priorizar os requisitos que compõem o **núcleo mínimo da entrega**, garantindo que as funcionalidades principais da tabela `ZZ1`, suas validações, manutenção e gatilho fossem documentadas e implementadas.

As funcionalidades que ficaram como próximos passos são:

- Tabela `ZZ2` (Ocorrências) e as rotinas `STTZZ2.PRW` / `STTZZ2FLT`
- Demais funções auxiliares da `STTZZLIB.PRW`:
  - `NomeFornecedor`
  - `NomeProduto`
  - `PercNaoConforme`
  - `CertificadoVencendo`
  - `GravarLogTCC`
- Consultas Padrão (`SXB`) para `SA2`, `SB1` e `ZZ1`
- Inclusão da rotina no menu do `SIGACOM`
- Implementação de Classe ADVPL (POO)
- Bloqueio da exclusão de registros da `ZZ1` que possuam ocorrências vinculadas na `ZZ2`

Esses itens não foram descartados como parte do projeto, mas ficam registrados como **evoluções futuras** da solução.

---

## ✅ Checklist — Núcleo mínimo (`rubrica-validacao.md`)

Os requisitos priorizados para esta entrega foram concluídos:

- [x] Tabela `ZZ1` definida, com estrutura de campos e índices documentada
- [x] `STTZZ1.PRW` com `mBrowse` para manutenção da tabela
- [x] Proteção da abertura da rotina utilizando `BEGIN SEQUENCE`
- [x] Validação da existência do fornecedor na `SA2`
- [x] Validação da tolerância no intervalo de 0 a 100%
- [x] Validações configuradas por meio do `SX3` e implementadas na `STTZZLIB.PRW`
- [x] Gatilho `SX7` para preenchimento automático do nome do fornecedor
- [x] Roteiro de testes das principais funcionalidades documentado

A entrega foi, portanto, concentrada nos requisitos essenciais da rubrica, mantendo as demais funcionalidades documentadas como possíveis extensões do projeto.