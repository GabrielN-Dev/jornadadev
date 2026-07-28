REQUEST HB_CODEPAGE_PT850
SET PROCEDURE TO matematica.prg // inclui a biblioteca


FUNCTION Main()
        LOCAL cOP
        LOCAL nI
        LOCAL nII
        hb_cdpSelect("PT850")
        ACCEPT " Digite a operação  (FAT), (PRI), (MMC), (MDC): " TO cOP
        
        cOP := Upper(AllTrim(cOP))   
        ACCEPT " Digite o primeiro número: " TO nI
        nI := Val(nI)

        IF cOP <> "FAT" .AND. cOP <> "PRI"
            ACCEPT " Digite o segundo número: " TO nII
            nII := Val(nII)
        ENDIF
        
         DO CASE
        CASE cOP == "FAT"
            FatorialN(nI)
        CASE cOP == "PRI"
            if EhPrimo(nI)
                QOut("É primo")
            else
               QOut(" não É primo")
            ENDIF
        CASE cOP == "MMC"
            MMC(nI, nII)
        CASE cOP == "MDC"
            MDC(nI, nII)
    OTHERWISE
        QOut( "Você selecionou uma opção inexistente!")
        
    ENDCASE 
RETURN NIL



