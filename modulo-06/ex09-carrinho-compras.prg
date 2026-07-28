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