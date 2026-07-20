REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL nA
    LOCAL nB
   
    hb_cdpSelect("PT850")

    ACCEPT "Digite o primeiro número: " TO nA
    ACCEPT "Digite o segundo número: " TO nB

    nA := Val(nA)
    nB := Val(nB)

    IF nA > nB
        Qout("O número: " + AllTrim(str(nA,10,2)) + " é maior do que " + AllTrim(str(nB,10,2)))
    ELSEIF  nA < nB
        Qout("O número: " + AllTrim(str(nA,10,2)) + " é menor do que " + AllTrim(str(nB,10,2)))
    ELSE
        Qout("Os números: " + AllTrim(str(nA,10,2)) + " e " + AllTrim(str(nB,10,2))  + " são iguais")
    ENDIF
RETURN NIL