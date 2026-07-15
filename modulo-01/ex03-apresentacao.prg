REQUEST HB_CODEPAGE_PT850 //config(acento)

FUNCTION Main()

    //Declarando as vari veis com os dados
    local cNome := "gabriel"
    local cCidade := "SÆo Paulo" 
    local cCurso := "Harbour/ADVPL" 

    hb_cdpSelect("PT850") //config(acento)
    
    QOut("=============================")
    QOut(" FICHA DE APRESENTA€ÇO ")
    QOut("=============================")
    QOut("Nome:" + cNome)
    QOut("Cidade:" + cCidade)
    QOut("Curso :" + cCurso)
    QOut("=============================")

RETURN NIL