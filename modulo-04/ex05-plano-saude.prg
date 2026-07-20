

REQUEST HB_CODEPAGE_PT850 

FUNCTION Main()

    LOCAL nIdade
    LOCAL nDependente
    LOCAL nValorPlano
    LOCAL nTotal

    hb_cdpSelect("PT850")

    ACCEPT "Digite sua idade: " TO nIdade
    ACCEPT "Digite o número de dependentes: " TO nDependente

    nIdade := Val(nIdade)
    nDependente := Val(nDependente)


    DO CASE
        CASE nIdade <= 25
            nValorPlano := 180

        CASE nIdade <= 40
            nValorPlano := 260

        CASE nIdade <= 60
            nValorPlano := 380

        OTHERWISE
            nValorPlano := 520

    ENDCASE


    nTotal := nValorPlano + (nDependente * 90)

    QOut("Valor do plano: R$ " + AllTrim(str(nTotal,10,2)))


RETURN NIL