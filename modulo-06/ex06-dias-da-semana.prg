REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
   LOCAL nIndice
   LOCAL adias := {"SEGUNDA", "TERÇA", "QUARTA", "QUINTA", "SEXTA", "SÁBADO", "DOMINGO"}
   hb_cdpSelect("PT850")

    ACCEPT "Digita o dia em número (1 - 7): " TO nIndice
        nIndice := Val(nIndice)
    IF nIndice > 0 .AND. nIndice <= len(adias)
            Qout("O Dia da semana é: " + adias[nIndice])
        ELSE 
            Qout("Dia não encontrado")
        ENDIF 

RETURN NIL