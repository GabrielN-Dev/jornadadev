FUNCTION Main()
    LOCAL cNome
    LOCAL cNascstr
    LOCAL dNasc
    LOCAL nPreco
    LOCAL nIdade
    LOCAL nTotal 
    LOCAL nDesconto := 0
    LOCAL nVD := 0//variavel de desconto

    ACCEPT "Digite seu nome: " to cNome
    ACCEPT "Digite sua data de nascimento (DD/MM/AAAA): " to cNascstr
    ACCEPT "Digite o pre‡o do produto: " to nPreco
    ACCEPT "Digite o valor de deconto em porcentagem para pessoas acima de 60 anos: " to nVD
     // Desconto definido pelo usu rio.


    //calculo da idade: 
    cNascstr = alltrim(cNascstr)
    dNasc := CToD(cNascstr)
    nIdade := INT((Date() - dNasc) / 365)

    nPreco := Val(nPreco)
    nVD := Val(nVD)

    nVD  :=  (nVD / 100)

    IF nIdade > 60
        nDesconto := nPreco * nVD
    ELSE
         nVD = 0.00 
    ENDIF

    nTotal := nPreco - nDesconto 
    nVD := nVD * 100
    QOut("Nome do cliente: " + cNome)
    QOut("idade: " + alltrim(str(nIdade))) 
    QOut("pre‡o:  " +  alltrim(str(nPreco, 10,2)) + "R$")
    Qout("Desconto aplicado: " + alltrim(str(nVD, 10,2)) + "%")
    Qout("Valor total: " + alltrim(str(nTotal, 10,2)))

 
RETURN NIL  