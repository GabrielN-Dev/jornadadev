REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL nSalario
    LOCAL nReajuste
    hb_cdpSelect("PT850")
    ACCEPT "Digite seu salário: " TO nSalario

    nSalario := Val(nSalario)

    IF nSalario < 1000
        nReajuste := 0.15
    ELSEIF nSalario <= 2000
        nReajuste := 0.12 
    ELSEIF nSalario <= 4000
        nReajuste := 0.08
    ELSE 
        nReajuste := 0.05
    
    ENDIF
     nSalario :=   (nSalario * nReajuste) +  nSalario  
     Qout("Seu novo salário é: "+ AllTrim(str(nSalario,10,2)))





   


RETURN NIL