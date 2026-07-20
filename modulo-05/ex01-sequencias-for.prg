

REQUEST HB_CODEPAGE_PT850 

FUNCTION Main()

    LOCAL nNumero

    hb_cdpSelect("PT850")


    QOut("=========================================")
    QOut("        SEQUÊNCIAS COM FOR/NEXT          ")
    QOut("=========================================")


    QOut("Números de 1 até 100:")

    FOR nNumero := 1 TO 100
        QOut(AllTrim(str(nNumero)))
    NEXT


    QOut("-----------------------------------------")


    QOut("Números de -50 até 50:")

    FOR nNumero := -50 TO 50
        QOut(AllTrim(str(nNumero)))
    NEXT


    QOut("-----------------------------------------")


    QOut("Números de 80 até 5:")

    FOR nNumero := 80 TO 5 STEP -1
        QOut(AllTrim(str(nNumero)))
    NEXT


RETURN NIL