// ============================================
// Exercício 6 — ⭐ Gravação à prova de falhas (SZ1)
// ============================================
#include "protheus.ch"

USER FUNCTION STTIP003SALVAR()

    // Indica se a gravação foi concluída com sucesso
    LOCAL lSucesso := .T.

    // Guarda informações caso aconteça algum erro
    LOCAL oErro

    // validar campo
    IF Empty(M->Z1_CLIENTE)
        MsgAlert("Informe o cliente antes de salvar o contato.", "Campo obrigatório")
        RETURN .F.
    ENDIF

    // Inicia uma transação para garantir que tudo seja gravado corretamente
    BeginTran()

    BEGIN SEQUENCE

        // Seleciona a tabela onde os dados serão gravados
        dbSelectArea("SZ1")


        // O Protheus possui a variável INCLUI.
        // Ela informa se o usuário está cadastrando um novo registro (.T.)
        // ou alterando um registro já existente (.F.).

        // Verifica se é um novo cadastro ou uma alteração
        IF INCLUI
            // Cria um novo registro
            RecLock("SZ1", .T.)
        ELSE
            // Bloqueia o registro atual para edição
            RecLock("SZ1", .F.)
        ENDIF

        // Copia os dados da tela para a tabela
        SZ1->Z1_CODIGO  := M->Z1_CODIGO
        SZ1->Z1_CLIENTE := M->Z1_CLIENTE
        SZ1->Z1_ASSUNTO := M->Z1_ASSUNTO

        // Salva o registro e libera o bloqueio
        MsUnlock()

    RECOVER USING oErro

        // Marca que ocorreu um erro
        lSucesso := .F.

        // Cancela todas as alterações feitas na transação
        RollBackTran()

        // Exibe uma mensagem informando que ocorreu um erro durante a gravação
        MsgStop("Não foi possível salvar o contato." + CRLF + ;
        "Detalhes: " + oErro:Description, "Erro")
        //nota: CRLF quebra linha.....

        // Grava o erro em um log para facilitar futuras análises
        U_GRAVARLOG("STTIP003SALVAR", oErro)

    END SEQUENCE

    // Se tudo deu certo, confirma definitivamente a gravação
    IF lSucesso
        CommitTran()
    ENDIF

RETURN lSucesso