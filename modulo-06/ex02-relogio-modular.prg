REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL cHora
    LOCAL nTecla := 0

    hb_cdpSelect("PT850")

    
    
 QOut("Programa iniciado para sair pressione 'Esc'")
    
    do while nTecla <> 27
        cHora := ObterHora()
        cHora := FormatarHora(cHora)
        ExibirHora(cHora)
        nTecla := InKey(30)
    enddo

RETURN NIL

FUNCTION ObterHora()
    LOCAL cHora :=  Time()
RETURN cHora

FUNCTION FormatarHora(cHora)

RETURN "Agora é: " + cHora

FUNCTION ExibirHora(cHora)
    QOut(cHora)
   

RETURN NIL