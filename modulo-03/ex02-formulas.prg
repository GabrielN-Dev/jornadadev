/* nota:

    Define é uma constante (não muda)
    INPUT utilizado para números
    ACCEPT é utilizado para string

*/
REQUEST HB_CODEPAGE_PT850 
#define PI 3.14159265

FUNCTION Main()

    LOCAL cFuncao
   
    hb_cdpSelect("PT850")

    QOut("=========================================")
    QOut("           MENU DE FÓRMULAS              ")
    QOut("=========================================")
    QOut(" [ a ] Área do Círculo")
    QOut(" [ h ] Hipotenusa")
    QOut(" [ i ] Índice de Massa Corporal (IMC)")
    QOut("-----------------------------------------")
    QOut("")
    
    ACCEPT " Escolha uma opção e pressione Enter: " TO cFuncao

    cFuncao := Lower(cFuncao)
        
    IF  AllTrim (cfuncao) == "a"
        CalA()    
    
    ELSEIF  AllTrim (cfuncao) == "h"
        CalHipo() 

    ELSEIF  AllTrim (cfuncao) == "i"
        CalIMC()

    ELSE
        QOut("Comando Inválido! O programa será encerrado.")
        QOut("Pressione Enter para sair...")
        Inkey(0)   // Essa função pausa o programa até o usuário pressionar qualquer tecla
    ENDIF

RETURN NIL



// -------------------------------------------------

//Função do cálculo da área:


FUNCTION CalA()
    LOCAL nRaio
    LOCAL nArea

    ACCEPT "Digite o valor do Raio: " TO nRaio
    nRaio := Val(nRaio)

    nArea := PI * nRaio ^ 2
    QOut("Área: " + AllTrim(Str(nArea, 10, 2)))

RETURN NIL
            
// -------------------------------------------------



// -------------------------------------------------

// Cálculo da hipotenusa

FUNCTION CalHipo()
    LOCAL nA
    LOCAL nB
    LOCAL nHipo

    ACCEPT "Digite o primeiro valor: " TO nA
    ACCEPT "Digite o segundo valor: " TO nB

    nA := Val(nA)
    nB := Val(nB)

    nHipo := Sqrt(nA ^ 2 + nB ^ 2)
    QOut("A hipotenusa é: " + AllTrim(str(nHipo , 10, 2 )))
RETURN NIL

// -------------------------------------------------




// -------------------------------------------------

// Cálculo do índice de massa corporal


FUNCTION CalIMC()
    LOCAL nPeso
    LOCAL nAltura
    LOCAL nResultado

    ACCEPT "Digita seu peso: " TO nPeso
    ACCEPT "Digita sua altura: " TO nAltura

    nPeso := Val(nPeso)
    nAltura := Val(nAltura)

    IF nAltura > 0
        nResultado := nPeso / nAltura ^2
        Qout("Seu indice corporal é: " + alltrim(str(nResultado, 10,2)))
    ELSE
        QOut("Erro: A altura deve ser maior que 0. Operação cancelada.")
        QOut("Pressione qualquer tecla para sair...")
        Inkey(0)
    ENDIF
RETURN NIL



