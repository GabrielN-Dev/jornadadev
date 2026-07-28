/*
Nessa atividade decidir aplicar o conceito de hash. Eu sei que sair da solção principal  Eu pesquisei por fora que a array mas achei interessante ai nesse exercicio coloquei duas suluções

Hash basicamente é quando um valor ligar ao outro é indetico ao JSON

   LOCAL hAgenda := { => }

   h --> hash

   exemplo: 
      hAgenda[ "Gabriel" ] := "99999-1111"
      
  se eu colocar isso hAgenda ["Gabriel"] ele me devolve o número 
  então achei interessante isso para da a liberdade para o cliente digitar o produto e salvar


*/


REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
    LOCAL aProdutos := {}
    LOCAL cNome
    LOCAL nPreco
    LOCAL cRespt
    LOCAL oControle
    LOCAL nSoma := 0
   hb_cdpSelect("PT850")
    Qout("Mini-carrinho")
    
    DO WHILE .t.
      
        ACCEPT " Digite o nome: " TO cNome
        ACCEPT " Digite o preço: " TO nPreco
      
        nPreco := Val(nPreco)
     

           AAdd(aProdutos, {cNome, nPreco})    
        ACCEPT "Deseja parar?(S/N)" TO cRespt
            cRespt :=  Upper(AllTrim(cRespt))   
              IF cRespt == "S"
                exit
              ENDIF
    ENDDO 
    Qout("")
    Qout("Lista de compras: ")
    FOR EACH oControle in aProdutos
      QOut("Produto: " + oControle[1] + " | Preço: " + AllTrim(Str(oControle[2], 10, 2)) + " R$")
      nSoma := nSoma + oControle[2]
    Next 
     Qout("O valor total da compra: " +  AllTrim(Str(nSoma, 10, 2)))
RETURN NIL