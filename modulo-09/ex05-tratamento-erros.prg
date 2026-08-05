/*
Nota 1: O bloco IF é necessário porque o Harbour nativamente não gera uma 
exceção de Runtime automática para divisão por zero. Sem o comando BREAK 
manual, o compilador resolve a operação internamente, retornando zero 
ou valor nulo sem desviar o fluxo.

Nota 2: Relação entre o WITH do material e o USING do código:
No material do exercício, o professor ensina o uso do "WITH" para injetar o 
bloco de erro na abertura (ex: BEGIN SEQUENCE WITH bBloco). No entanto, no ponto 
de captura (RECOVER), a sintaxe nativa da linguagem exige obrigatoriamente a 
palavra-chave "USING" para repassar o objeto do BREAK para a variável local 
(RECOVER USING oErro). O uso de "RECOVER WITH" gera erro de compilação

Nota 3: Inicialização do Objeto de Erro (ErrorNew()):
A variável 'oErro' foi instanciada como um objeto real do sistema utilizando 
a função ErrorNew(). Isso é fundamental para que, ao dispararmos o BREAK, 
o bloco RECOVER receba um objeto de erro válido, permitindo o acesso à 
propriedade ':Description' sem gerar falhas de tipo (Type Mismatch) em tempo 
de execução.

*/

REQUEST HB_CODEPAGE_PT850
FUNCTION Main()
    LOCAL nA 
    LOCAL nB 
    LOCAL nRes
    LOCAL oErro := ErrorNew()   
    hb_cdpSelect("PT850")

    ACCEPT " Digite o primeiro número: " TO nA
    ACCEPT " Digite o segundo número: " TO nB

    nA := Val(nA)
    nB := Val(nB)
    BEGIN SEQUENCE 
        IF nB == 0 
            oErro:Description := "Atenção: Divisor não pode ser zero!"
            BREAK oErro
        ENDIF    
        nRes := nA / nB
        QOut("Resultado: " + Str(nRes))
    RECOVER USING oErro
        QOut("Erro capturado: " + oErro:Description)
    END SEQUENCE
        QOut("O programa continua de pé!")

RETURN NIL
