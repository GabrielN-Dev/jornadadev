REQUEST HB_CODEPAGE_PT850 
FUNCTION Main()
    LOCAL cNomeFunc := "Gabriel"
    LOCAL nSalario := 2500
    LOCAL lativo := .T.
    LOCAL dAdmissao := Date()
    LOCAL cCod := "Dev"


    // -------------  Teste: -------------------

    hb_cdpSelect("PT850")
    Qout("DADOS(Teste): ")
    Qout("================================")
    Qout("Nome do funcionario: " + cNomeFunc)
    Qout("Salário do funcionário " + ALLTRIM(STR(nSalario)))
    IF  lativo
        Qout("O funcionário está ativo")
    ELSE
        Qout("O funcionário esta desativado")
    ENDIF
    Qout("Data de admissão do funcionário " + DTOC(dAdmissao))
    Qout("Código do setor do funcionário: " + cCod)

RETURN Nil    








