REQUEST HB_CODEPAGE_PT850 

FUNCTION Main()

    LOCAL nValor
    LOCAL nTotal := 0
    LOCAL nQtd := 0

    hb_cdpSelect("PT850")


    QOut("=========================================")
    QOut("            MÁQUINA DE SOMA              ")
    QOut("=========================================")


    WHILE .T.

        ACCEPT "Digite um valor (0 para finalizar): " TO nValor

        nValor := Val(nValor)


        IF nValor == 0
            EXIT
        ENDIF


        nTotal := nTotal + nValor
        nQtd := nQtd + 1


    ENDDO


    QOut("-----------------------------------------")
    QOut("A soma total é: " + AllTrim(str(nTotal)))
    QOut("Quantidade de valores somados: " + AllTrim(str(nQtd)))


RETURN NIL