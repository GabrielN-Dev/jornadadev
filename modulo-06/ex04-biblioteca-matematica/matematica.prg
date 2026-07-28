REQUEST HB_CODEPAGE_PT850

FUNCTION FatorialN(nN)
    LOCAL nI
    LOCAL nControle := 1

    FOR nI := nN TO 1  STEP - 1
        nControle := nI * nControle
    NEXT
    QOut("O fatorial: " + AllTrim(Str(nControle)))
    return NIL

    
FUNCTION EhPrimo(nN)
    LOCAL nControll
    LOCAL nfixo := nN
    LOCAL nI := nN -1 
     if nFixo <= 1 
        RETURN .F.
     Endif
    FOR nControll := 2 TO nI STEP 1
      
       IF nfixo % nControll == 0
                         RETURN .F.
       ENDIF
    NEXT
            RETURN .T.

FUNCTION MMC(nA, nB)
    LOCAL nI := nA
    LOCAL nII := nB
    LOCAL nMaior
    if nA > nB
        nMaior := nA
    ELSE 
        nMaior := nB
    endif
    if nMaior % nI == 0 .AND. nMaior % nII == 0
        QOut("O MMC é: " + AllTrim(str(nMaior)))
        return nil
    endif
    do while .T.
       nMaior := nMaior + 1
       if nMaior  % nI == 0 .AND. nMaior % nII == 0
        QOut("O MMC é: " + AllTrim(str(nMaior)))
        EXIT
       endif  
        
    enddo

   
    return NIL

    FUNCTION MDC(nA, nB)
    LOCAL nI := nA
    LOCAL nII := nB
    LOCAL nMenor
    if nA < nB
        nMenor := nA
    ELSE 
        nMenor := nB
    endif
    if  nI % nMenor == 0 .AND.  nII % nMenor  == 0
        QOut("O MDC é: " + AllTrim(str(nMenor)))
        return nil
    endif
    do while .T.
       nMenor := nMenor - 1
       if nI % nMenor  == 0 .AND. nII % nMenor == 0
        QOut("O MDC é: " + AllTrim(str(nMenor)))
        EXIT
       endif  
        
    enddo
    return NIL