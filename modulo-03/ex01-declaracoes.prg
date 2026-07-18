REQUEST HB_CODEPAGE_PT850 
FUNCTION Main()
    LOCAL cNomeFunc := "Gabriel"
    LOCAL nSalario := 2500
    LOCAL lativo := .T.
    LOCAL dAdmissao := Date()
    LOCAL cCod := "Dev"


    // ------------- Teste: -------------------

    hb_cdpSelect("PT850")
    Qout("DADOS(Teste): ")
    Qout("================================")
    Qout("Nome do funcionario: " + cNomeFunc)
    Qout("Sal†rio do funcion†rio " + ALLTRIM(STR(nSalario)))
    IF  lativo
        Qout("O funcion†rio est† ativo")
    ELSE
        Qout("O funcion†rio esta desativado")
    ENDIF
    Qout("Data de admiss∆o do funcion†rio " + DTOC(dAdmissao))
    Qout("C¢digo do setor do funcion†rio: " + cCod)

RETURN Nil    








