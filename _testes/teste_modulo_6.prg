/* Notas: 

essas funções equivalentes:

Eval( aNumeros, {|nX| QOut("O numero é: " + str(nX))} )  <--> FOR EACH nNum IN aNumeros
                                                                    QOut(nNum)
                                                              NEXT

AEval( aNumeros, {|nX| nSoma += nX} )        <-->           FOR EACH nNum IN aNumeros
                                                                nControle := nControle + nNum
                                                            NEXT
                                                            QOut("soma:" + str(nControle))                           
*/

REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL cOpcaoMenu := ""
    hb_cdpSelect("PT850")

    DO WHILE cOpcaoMenu <> "SAIR"
        InKey(2)
        Clear Screen

        QOut("=========================================")
        QOut("       SISTEMA ESTATÍSTICO       ")
        QOut("=========================================")
        QOut(" Digite uma das opções abaixo:")
        QOut("-----------------------------------------")
        QOut("  [ LIVRE ]  - Inserir quantos números quiser")
        QOut("  [ DEZ ]    - Inserir exatamente 10 números")
        QOut("  [ SAIR ]   - Encerrar o programa")
        QOut("=========================================")

        ACCEPT " Escolha como deseja prosseguir: " TO cOpcaoMenu
        cOpcaoMenu := Upper(AllTrim(cOpcaoMenu))

        DO CASE
            CASE cOpcaoMenu == "LIVRE"
                AnaliseModoLivre()

            CASE cOpcaoMenu == "DEZ"
                AnaliseModoDez()

            CASE cOpcaoMenu == "SAIR"
                QOut("Obrigado por usar o sistema. Até logo!")
                
            OTHERWISE
                QOut("Opção inválida! Escolha entre LIVRE, DEZ ou SAIR.")
                QOut("Pressione Enter para tentar novamente...")
                InKey(0)
        ENDCASE
    ENDDO

RETURN NIL

// ==================================================
// MÓDULOS DE PROCESSAMENTO (O esqueleto dos Legos)
// ==================================================

FUNCTION AnaliseModoLivre()
    LOCAL aNumeros := {}
    LOCAL cRepst
    LOCAL nA
    
    QOut("Executando o Modo de Coleta Livre...")
    DO WHILE .t.
      
        ACCEPT " Digite o número: " TO nA
    
        IF Empty(nA) 
            QOut("")
            QOut(" >> Opa! Você pressionou Enter sem digitar um número.")             
            ACCEPT "Deseja parar?(S/N)" TO cRepst
            cRepst :=  Upper(AllTrim(cRepst))   
              IF cRepst == "S"
                exit
              ELSE
                 QOut(" >> Continuando a coleta...")
                 QOut("")
        ENDIF
        ELSE 
             nA := Val(nA)
             AADD(aNumeros,  nA ) 

        ENDIF   
       

       // adiciona no final
    ENDDO 
    ExibirResultados(aNumeros)
RETURN NIL


FUNCTION AnaliseModoDez()
    LOCAL aNumeros := {}
    LOCAL nA
    LOCAL nNu
    
    QOut("Executando o Modo de Coleta de 10 Números...")
    FOR nNu := 1 to 10
            ACCEPT " Digite o número: " TO nA
            IF Empty(nA) 
                QOut("por gentileza digite apenas números")
                nNu := nNu - 1 //Para evitar erros
            ELSE 
                nA := Val(nA)
                AADD(aNumeros,  nA )
            ENDIF
    NEXT
    ExibirResultados(aNumeros)
RETURN NIL


FUNCTION ExibirResultados(aNumeros)
        LOCAL nSoma := 0
        LOCAL nMedia
        IF Empty(aNumeros)
            QOut("Nenhum número foi enviado para análise.")
            QOut("Pressione Enter para voltar ao Menu...")
            InKey(0)            
        RETURN NIL
        ENDIF
        ASORT(aNumeros)
        QOut("ARRAY em ordem crescente:")
        AEval( aNumeros, {|nX| QQOut(" "+ AllTrim(str((nX))))} ) // mostra em ordem crescente
        AEval( aNumeros, {|nX| nSoma += nX} ) // Soma todos elementos
        QOut("A soma é: " + AllTrim(str(nSoma)))
        nMedia := nSoma / len(aNumeros)
        QOut("A media é: " + AllTrim(str(nMedia)))
        QOut("Menor: " + AllTrim(str(aNumeros[1])))
        QOut("Maior: " + AllTrim(str(aNumeros[len(aNumeros)])))
        QOut("Pressione Enter para voltar ao Menu...")
        InKey(0)


RETURN NIL

