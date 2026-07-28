REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL nA
    LOCAL cRepst
    LOCAL aNumeros := {}
    LOCAL nNu
    LOCAL nNu2
    LOCAL oControle := 0
    LOCAL nTemp     

   hb_cdpSelect("PT850")

   

DO WHILE .t.
      
        ACCEPT " Digite o número: " TO nA
    
        IF Empty(nA) 
            QOut("")
            QOut(" >> Opa! Você pressionou Enter sem digitar um número.")             
            ACCEPT "Deseja parar?(S/N)" TO cRepst
            cRepst :=  Upper(AllTrim(cRepst))   
              IF cRepst == "S"
                exit
              ELSE
                 QOut(" >> Continuando a coleta...")
                 QOut("")
              ENDIF
        ELSE 
             nA := Val(nA)
             AADD(aNumeros,  nA ) 

        ENDIF   
    ENDDO 

  FOR nNu2 :=1 TO len(aNumeros)
    FOR nNu := 1 TO len(aNumeros) - 1 
        IF aNumeros[nNU] > aNumeros[nNu + 1]
            nTemp :=  aNumeros[nNU] 
            aNumeros[nNU] =  aNumeros[nNu + 1]
            aNumeros[nNu + 1] := ntemp
        ENDIF
        NEXT
    Next

    FOR EACH oControle in aNumeros
        Qout(oControle)
    NEXT


RETURN NIL


