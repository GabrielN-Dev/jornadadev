FUNCTION Menu_Cadastrar(aEstoqueGeral)
   LOCAL cNome
   LOCAL nQntd
   LOCAL nPreco_U
   LOCAL cRepst := ""
   LOCAL cCod
 DO WHILE cRepst <> "N"

      Clear Screen
      QOut("=========================================")
      QOut("          CADASTRO DE PRODUTO            ")
      QOut("=========================================")
      QOut("")

      ACCEPT " Digite o código do produto: " TO cCod
      ACCEPT " Digite o nome do produto  : " TO cNome
      ACCEPT " Digite a quantidade inicial: " TO nQntd
      ACCEPT " Digite o preço unitário (use PONTO para centavos) R$: " TO nPreco_U
      
      // Conversões de tipo de dado necessárias
     // cCod     := Val(cCod) //não convertir pois to deixando o padrão de 0999
      nQntd    := Val(nQntd)

       // Se o usuário digitou "14,20", o StrTran transforma em "14.20" antes do Val()
      nPreco_U := StrTran(nPreco_U, ",", ".") 
      nPreco_U := Val(nPreco_U)
      
      
       Cadastrar(aEstoqueGeral,cCod,cNome,nQntd,nPreco_U)

       Listar_Produtos(aEstoqueGeral)
       ACCEPT "Deseja Cadastrar mais?(S/N)" TO cRepst
            cRepst :=  Upper(AllTrim(cRepst))   
              IF cRepst == "N"
                exit
              ENDIF
    ENDDO 
RETURN NIL 


FUNCTION Menu_Alterar_Estoque(aEstoqueGeral)
   LOCAL cCod
   LOCAL cRespt_E := "" // Inicializada para segurança
   LOCAL nPosicao
   LOCAL cOpcao_e
   LOCAL nQntd_E

   // O laço roda para permitir alterar vários produtos se o usuário quiser
   DO WHILE cRespt_E <> "N"
      Clear Screen
      QOut("=========================================")
      QOut("        MOVIMENTAÇÃO DE ESTOQUE          ")
      QOut("=========================================")
      QOut("")

      ACCEPT "Por gentileza digite o cod do produto: " TO cCod
      nPosicao := Encontrar_Produto(cCod, aEstoqueGeral)
      
      IF nPosicao > 0
         QOut("Produto encontrado com sucesso! (" + aEstoqueGeral[nPosicao][2] + ")")
         ACCEPT "Adicionar estoque (+) ou subtrair o estoque (-): " TO cOpcao_e
         
         DO CASE
            CASE cOpcao_e == "+"
               ACCEPT "Por gentileza digite a quantidade que deseja aumentar: " TO nQntd_E
               nQntd_E := Val(nQntd_E)
               IF Modificar_Estoque(cOpcao_e, nPosicao, aEstoqueGeral, nQntd_E)
                  QOut("Estoque atualizado com sucesso!")
               ENDIF                              
            
            CASE cOpcao_e == "-"
               ACCEPT "Por gentileza digite a quantidade que deseja retirar: " TO nQntd_E
               nQntd_E := Val(nQntd_E)
               IF Modificar_Estoque(cOpcao_e, nPosicao, aEstoqueGeral, nQntd_E)
                  QOut("Estoque atualizado com sucesso!")
                 ELSE
                    QOut("Erro: Quantidade insuficiente em estoque!")
               ENDIF
            
            OTHERWISE
               QOut("Operação inválida!")
         ENDCASE 
      ELSE
         QOut("Aviso: Produto não encontrado!")
      ENDIF

      QOut("")
      ACCEPT "Deseja realizar outra alteração de estoque? (S/N): " TO cRespt_E
      cRespt_E := Upper(AllTrim(cRespt_E))   
   ENDDO
RETURN NIL 


FUNCTION Menu_Localizar(aEstoqueGeral)
    LOCAL cCod
   LOCAL nPosicao

   Clear Screen
   QOut("=========================================")
   QOut("           BUSCAR PRODUTO                ")
   QOut("=========================================")
   QOut("")

   ACCEPT "Por gentileza digite o cod do produto: " TO cCod
   
   // O motor lógico faz a busca em silêncio...
   nPosicao := Encontrar_Produto(cCod, aEstoqueGeral)
   
   // A tela decide como vai mostrar o resultado...
   IF nPosicao > 0
      Clear Screen
      QOut("=========================================")
      QOut("          PRODUTO ENCONTRADO             ")
      QOut("=========================================")
      QOut(" CÓDIGO:     " + aEstoqueGeral[nPosicao][1])
      QOut(" NOME:       " + aEstoqueGeral[nPosicao][2])
      QOut(" ESTOQUE:    " + hb_NToS(aEstoqueGeral[nPosicao][3]) + " unidades")
      QOut(" PREÇO UNIT: R$" + Transform(aEstoqueGeral[nPosicao][4], "@E 999,999.99"))
      QOut("=========================================")
   ELSE
      QOut("")
      QOut("Aviso: Produto com o código '" + cCod + "' não foi encontrado!")
   ENDIF
   
   QOut("")
   QOut("Pressione qualquer tecla para voltar ao menu...")
   InKey(0)
RETURN NIL



// TELA PARA LISTAR PRODUTOS 

FUNCTION Listar_Produtos(aProdutos)
 LOCAL oControle
        LOCAL nColuna
    LOCAL oDado
    // Obejtivo do aTamanhos> Matriz automática com o tamanho de caracteres de cada coluna na tela
    LOCAL aTamanhos := {8, 25, 10, 15} 
    LOCAL cTextoPronto

    Clear Screen
    QOut("=====================================================================")
    QOut("                         RELATÓRIO DE ESTOQUE                        ")
    QOut("=====================================================================")
    
    // Desenha o Cabeçalho Fixo
    QOut( Padr("CÓDIGO", 8)   + ;
          Padr("NOME", 25)    + ;
          Padr("QUANT.", 10)  + ;
          Padr("PREÇO UNIT.", 15) )
    QOut("---------------------------------------------------------------------")

    Qout("")
    
    // Loop que varre a  matriz bidimensional de produtos automaticamente
    FOR EACH oControle IN aProdutos
        
        FOR nColuna := 1 TO Len(oControle)
            oDado := oControle[nColuna]

             IF ValType(oDado) == "N"
                // 1. Se for a quarta coluna (Preço Unitário) pora editar deixar no modelo da moeda local
                IF nColuna == 4
                    cTextoPronto := "R$" + Transform(oDado, "@E 999,999.99")
                ELSE
                    // 2. Se for qualquer outro número (Código ou Qtd), vai inteiro e limpo!
                    cTextoPronto := hb_NToS(oDado)
                ENDIF
            ELSE
                // 3. Se for texto (Nome do produto),vai direto
                cTextoPronto := oDado
            ENDIF

            QQOut( Padr(cTextoPronto, aTamanhos[nColuna]) )
        NEXT 
        
        QOut("") 
    NEXT 
    QOut("=====================================================================")
    QOut("Pressione Enter para voltar ao menu...")
    InKey(0)

Return Nil



FUNCTION Relatorio(aProdutos)
   LOCAL oControle
   LOCAL nTotalGeral := 0
   LOCAL nTotalProduto  
   
   hb_cdpSelect("PT850")
   CLS // Limpa a tela para o relatório
   
   QOut("=========================================")
   QOut("      VALOR EM ESTOQUE POR PRODUTO       ")
   QOut("=========================================")
   
   FOR EACH oControle IN aProdutos
      nTotalProduto := oControle[3] * oControle[4]
      nTotalGeral   := nTotalGeral + nTotalProduto
      
      // Imprime a linha de cada produto formatada
      QOut(PadR(oControle[2], 20) + ": R$" + Transform(nTotalProduto, "@E 999,999.99"))
   NEXT

   QOut("-----------------------------------------")
   // O total geral fica FORA do laço para aparecer apenas uma vez no fim!
   QOut("TOTAL GERAL EM ESTOQUE: R$" + Transform(nTotalGeral, "@E 999,999.99"))
   QOut("=========================================")
   QOut("Pressione qualquer tecla para voltar...")
   InKey(0)
RETURN Nil
