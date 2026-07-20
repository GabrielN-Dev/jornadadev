REQUEST HB_CODEPAGE_PT850 

FUNCTION Main()

    LOCAL nValor
    LOCAL nDobro

    hb_cdpSelect("PT850")


    QOut("=========================================")
    QOut("              CÁLCULO DO DOBRO           ")
    QOut("=========================================")


    WHILE .T.

        ACCEPT "Digite um valor inteiro (0 ou negativo para sair): " TO nValor

        nValor := Val(nValor)


        IF nValor <= 0
            EXIT
        ENDIF


        nDobro := nValor * 2

        QOut("O dobro do valor é: " + AllTrim(str(nDobro)))


    ENDDO


    QOut("Programa encerrado.")


RETURN NIL