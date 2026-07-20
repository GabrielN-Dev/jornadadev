REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL cOpcao


    hb_cdpSelect("PT850")

    Qout("Nessa atividade eu propões duas soluções a tradicional e outra array(seria uma varivel que guarda mais de um valor)")
    Qout("para testar a solução tradicional digite T e para solução de array digite A ")
    ACCEPT " Escolha uma opção e pressione Enter: " TO cOpcao

    cOpcao :=  Upper(AllTrim(cOpcao)) 
        DO CASE
        CASE cOpcao == "T"
            CalTrad()
        CASE cOpcao == "A"
            CalArray()
    OTHERWISE
        QOut("Operação inválida!")
        QOut("Pressione Enter para sair...")
        Inkey(0)     
    ENDCASE  


RETURN NIL



FUNCTION CalTrad()
    LOCAL nMes
    Local cMesExt
    ACCEPT " Digite o número do mês: " TO Nmes
    nMes := Val(nMes)


   DO CASE
        CASE nMes == 1
        cMesExt := "JANEIRO"
        CASE nMes == 2
        cMesExt := "FEVEREIRO"
        CASE nMes == 3
        cMesExt := "MARÇO"
        CASE nMes == 4
        cMesExt := "ABRIL"
        CASE nMes == 5
        cMesExt := "MAIO"
        CASE nMes == 6
        cMesExt := "JUNHO"
        CASE nMes == 7
        cMesExt := "JULHO"
        CASE nMes == 8
        cMesExt := "AGOSTO"
        CASE nMes == 9
        cMesExt := "SETEMBRO"
        CASE nMes == 10
        cMesExt := "OUTUBRO"
        CASE nMes == 11
        cMesExt := "NOVEMBRO"
        CASE nMes == 12
        cMesExt := "DEZEMBRO"     
    OTHERWISE
        cMesExt := "MÊS INVÁLIDO"     
    ENDCASE


Qout("O mes é: "+ cMesExt)



RETURN NIL


FUNCTION CalArray()
    LOCAL nIndice
    
    // Array permite associar a posição ao mês correspondente janeiro --> 1 e por ai vai 
     Local aMeses := { "JANEIRO", "FEVEREIRO", "MARÇO", "ABRIL", "MAIO", "JUNHO","JULHO", "AGOSTO", "SETEMBRO", "OUTUBRO", "NOVEMBRO", "DEZEMBRO" }

     ACCEPT " Digite o número do mês: " TO nIndice

    nIndice := Val(nIndice)
     IF nIndice >= 1 .AND. nIndice <= 12
        Qout("o mês é: " + aMeses[nIndice])
     ELSE
        QOut("Mês inválido!")     
    ENDIF


RETURN NIL