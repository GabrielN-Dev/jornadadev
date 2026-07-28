// {codigo, nome, quantidade, preco_unitario}

FUNCTION Cadastrar(aProdutos, cCod, cNome, nQntd, nPreco_u)
    AADD(aProdutos, {cCod, cNome, nQntd, nPreco_u} ) 
RETURN Nil

FUNCTION Encontrar_Produto(cCod, aProdutos)
RETURN AScan( aProdutos, {|aItem| aItem[1] == cCod} )



FUNCTION Modificar_Estoque(cOpcao,nPosicao,aProdutos,nQntd_E)
   LOCAL nEstoque :=  aProdutos[nPosicao][3]
 DO CASE
        CASE cOpcao == "+"
           nEstoque := nEstoque + nQntd_E
           aProdutos[nPosicao][3] := nEstoque
        RETURN .T.
        CASE cOpcao == "-"
            IF nQntd_E > nEstoque
                RETURN .F. 
            ELSE 
                nEstoque := nEstoque - nQntd_E
                aProdutos[nPosicao][3] = nEstoque
                RETURN .T. 
            ENDIF
       
 ENDCASE 
   

RETURN .F.
