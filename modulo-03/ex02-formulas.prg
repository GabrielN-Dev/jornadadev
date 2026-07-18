/* nota:
    Define ‚ uma constante (nÆo muda)
    INPUT utilizado para n£meros
    ACCEPT ‚ utilizado para string

*/
REQUEST HB_CODEPAGE_PT850 
#define PI 3.14159265

FUNCTION Main()

    LOCAL cFuncao
   
    hb_cdpSelect("PT850")

    QOut("=========================================")
    QOut("           MENU DE FàRMULAS              ")
    QOut("=========================================")
    QOut(" [ a ] µrea do C¡rculo")
    QOut(" [ h ] Hipotenusa")
    QOut(" [ i ] Öndice de Massa Corporal (IMC)")
    QOut("-----------------------------------------")
    QOut("")
    
    ACCEPT " Escolha uma op‡Æo e pressione Enter: " TO cFuncao

    cFuncao := Lower(cFuncao)
        
    IF  AllTrim (cfuncao) == "a"
        CalA()    
    
    ELSEIF  AllTrim (cfuncao) == "h"
        CalHipo() 

    ELSEIF  AllTrim (cfuncao) == "i"
        CalIMC()

    ELSE
        QOut("Comando Inv lido! O programa ser  encerrado.")
        QOut("Pressione Enter para sair...")
        Inkey(0)   // Essa fun‡Æo pausa o programa at‚ o usu rio pressionar qualquer tecla
    ENDIF

RETURN NIL



// -------------------------------------------------

//Fun‡Æo do c lculo da  rea:


FUNCTION CalA()
    LOCAL nRaio
    LOCAL nArea

    ACCEPT "Digite o valor do Raio: " TO nRaio
    nRaio := Val(nRaio)

    nArea := PI * nRaio ^ 2
    QOut("µrea: " + AllTrim(Str(nArea, 10, 2)))

RETURN NIL
            
// -------------------------------------------------



// -------------------------------------------------

// C lculo da hipotenusa

FUNCTION CalHipo()
    LOCAL nA
    LOCAL nB
    LOCAL nHipo

    ACCEPT "Digite o primeiro valor: " TO nA
    ACCEPT "Digite o segundo valor: " TO nB

    nA := Val(nA)
    nB := Val(nB)

    nHipo := Sqrt(nA ^ 2 + nB ^ 2)
    QOut("A hipotenusa ‚: " + AllTrim(str(nHipo , 10, 2 )))
RETURN NIL

// -------------------------------------------------




// -------------------------------------------------

// C lculo do ¡ndice de massa corporal


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
        Qout("Seu indice corporal ‚: " + alltrim(str(nResultado, 10,2)))
    ELSE
        QOut("Erro: A altura deve ser maior que 0. Opera‡Æo cancelada.")
        QOut("Pressione qualquer tecla para sair...")
        Inkey(0)
    ENDIF
RETURN NIL



