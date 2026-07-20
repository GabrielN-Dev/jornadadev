


/*Nota:
Inkey(0)   // Essa função pausa o programa até o usuário pressionar qualquer tecla

*/
REQUEST HB_CODEPAGE_PT850 

FUNCTION Main()

    LOCAL cFuncao
   
    hb_cdpSelect("PT850")
    QOut("=========================================")
    QOut("           MENU CALCULADORA              ")
    QOut("=========================================")
    QOut("  [ + ] Soma")
    QOut("  [ - ] Subtração")
    QOut("  [ * ] Multiplicação")
    QOut("  [ / ] Divisão")
    QOut("  [ ^ ] Potência")
    QOut("  [ R ] Raiz quadrada")

    QOut("-----------------------------------------")
    QOut(" Digite a opção desejada: ")
    QOut("-----------------------------------------")


    ACCEPT " Escolha uma opção e pressione Enter: " TO cFuncao

    cFuncao :=  Upper(AllTrim(cFuncao))   
    DO CASE
        CASE cFuncao == "+"
        CalSoma()
        CASE cFuncao == "-"
        CalSub()
        CASE cFuncao == "*"
        CalMulti()
        CASE cFuncao == "/"
        CalDivi()
        CASE cFuncao == "^"
        CalPot()
        CASE cFuncao == "R"
        CalRaiz()     
    OTHERWISE
        QOut("Operação inválida!")
        QOut("Pressione Enter para sair...")
        Inkey(0)     
    ENDCASE
RETURN NIL



// -------------------------------------------------

//Cálculo da Soma


FUNCTION CalSoma()
    LOCAL nA
    LOCAL nB
    LOCAL nR
    ACCEPT " Digite o primeiro número: " TO nA
    ACCEPT " Digite o segundo número: " TO nB

    nA := Val(nA)
    nB := Val(nB)
    nR := nA + nB
    Qout("O resultado da soma é: " + AllTrim(str(nR,10,2)))


RETURN NIL
            
// -------------------------------------------------



// -------------------------------------------------

// Cálculo da Subtração

FUNCTION CalSub()
    LOCAL nA
    LOCAL nB
    LOCAL nR
    ACCEPT " Digite o primeiro número: " TO nA
    ACCEPT " Digite o segundo número: " TO nB

    nA := Val(nA)
    nB := Val(nB)
    nR := nA - nB
    Qout("O resultado da subtração é: " + AllTrim(str(nR,10,2)))
RETURN NIL

// -------------------------------------------------




// -------------------------------------------------

// Cálculo da multiplicação


FUNCTION CalMulti()
    LOCAL nA
    LOCAL nB
    LOCAL nR
    ACCEPT " Digite o primeiro número: " TO nA
    ACCEPT " Digite o segundo número: " TO nB

    nA := Val(nA)
    nB := Val(nB)
    nR := nA * nB
    Qout("O resultado da multiplição é: " + AllTrim(str(nR,10,2)))
RETURN NIL




// Cálculo da divisão
// -------------------------------------------------

FUNCTION CalDivi()
    LOCAL nA
    LOCAL nB
    LOCAL nR
    ACCEPT " Digite o primeiro número: " TO nA
    ACCEPT " Digite o segundo número: " TO nB

    nA := Val(nA)
    nB := Val(nB)
    IF nB  <> 0
        nR := nA / nB
        QOut("O resultado da divisão é: "+ AllTrim(str(nR,10,2)))
    ELSE 
        QOut("Então.... é impossível dividir um número por 0")
        QOut("Pressione Enter para sair...")
        Inkey(0)     
    ENDIF    
RETURN NIL
// -------------------------------------------------


// -------------------------------------------------
// Cálculo de Potenciação 


FUNCTION CalPot()
    LOCAL nA
    LOCAL nB
    LOCAL nR
    ACCEPT " Digite o número: " TO nA
    ACCEPT " Digite o expoente " TO nB

    nA := Val(nA)
    nB := Val(nB)
        nR := nA ^ nB
        QOut("O resultado é: "+ AllTrim(str(nR,10,2)))

RETURN NIL
// -------------------------------------------------

// -------------------------------------------------

// Cálculo da Raiz quadrada


FUNCTION CalRaiz()
    LOCAL nA
    LOCAL nR
    ACCEPT " Digite o número: " TO nA

    nA := Val(nA)
    IF nA < 0  
        Qout("Entrada inválida: não existe raiz real de número negativo")
        QOut("Pressione Enter para sair...")
        Inkey(0)     
    ELSE
        nR := Sqrt(nA)
        QOut("O resultado é: "+ AllTrim(str(nR,10,2)))
    ENDIF

RETURN NIL
// -------------------------------------------------