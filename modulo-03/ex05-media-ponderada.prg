REQUEST HB_CODEPAGE_PT850 

FUNCTION Main()

    LOCAL nA
    LOCAL nB
    LOCAL nC
    LOCAL nD
    LOCAL nTotal

    ACCEPT " Primeira nota: " TO nA
    ACCEPT " Segunda nota: " TO nB
    ACCEPT " Terceira nota: " TO nC
    ACCEPT " Quarta nota: " TO nD

    hb_cdpSelect("PT850")


    nA := Val(nA)
    nB := Val(nB)
    nC := Val(nC)
    nD := Val(nD)

    nTotal := (nA*1 + nB*2 + nC*3 + nD*4) / (1+2+3+4)

    Qout("A m‚dia ‚: " + alltrim(str(nTotal), 10,2))
   
RETURN NIL