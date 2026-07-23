REQUEST HB_CODEPAGE_PT850
SET PROCEDURE TO matematica.prg // inclui a biblioteca


FUNCTION Main()

        LOCAL nI
        hb_cdpSelect("PT850")
        ACCEPT " Digite o primeiro número: " TO nI


        // Código aqui

RETURN NIL

FUNCTION OutraForma()
     LOCAL nI
               LOCAL nControle 
           hb_cdpSelect("PT850")
             ACCEPT " Digite o primeiro número: " TO nI

    nI := Val(nI)

        FOR nI := nI TO 2  STEP - 1
        nControle = nControle * (nI - 1)
 // Mostra 10, 8, 6, 4, 2
NEXT

    QOut(nControle)
   // Código aqui
return nil