/*Array de produtos, cada item: {codigo, nome, quantidade, preco_unitario}
Menu em loop com as opções:
1 ? Cadastrar produto (usa AADD ) feito 
2 ? Listar produtos (percorre com FOR ) feito 
3 ? Entrada de estoque (aumenta a quantidade) 
4 ? Saída de estoque (diminui; valide estoque suficiente)
5 ? Buscar produto por código (função que devolve a posição, ou 0)
6 ? Relatório: valor em estoque por produto ( qtd × preço ) e total geral
0 ? Sair*/
SET PROCEDURE TO estoque_lib.prg // inclui a biblioteca
SET PROCEDURE TO telas_lib.prg

REQUEST HB_CODEPAGE_PT850
// {codigo, nome, quantidade, preco_unitario}

FUNCTION Main()
   LOCAL aEstoqueGeral := {} 
   LOCAL cOpcao := ""


   hb_cdpSelect("PT850")
      
   DO WHILE cOpcao <> "0"
      Clear Screen
      QOut("=========================================")
      QOut("          CONTROLE DE ESTOQUE            ")
      QOut("=========================================")
      QOut("1 ? Cadastrar Produto")
      QOut("2 ? Listar Estoque Completo")
      QOut("3 ? Entrada de Estoque")
      QOut("4 ? Saída de Estoque")      
      QOut("5 ? Buscar Produto por Código")
      QOut("6 ? Relatório de Valores")
      QOut("0 ? Sair")
      QOut("=========================================")
      QOut("")
      
      ACCEPT "Escolha uma opção: " TO cOpcao
      cOpcao := AllTrim(cOpcao)

      DO CASE
         CASE cOpcao == "1"
            // Passamos a array por parâmetro para a camada de telas!
            Menu_Cadastrar(aEstoqueGeral) 
         CASE cOpcao == "2"
            Listar_Produtos(aEstoqueGeral)
         CASE cOpcao == "3" .OR. cOpcao == "4"
            Menu_Alterar_Estoque(aEstoqueGeral)
         CASE cOpcao == "5"
            Menu_Localizar(aEstoqueGeral)
         CASE cOpcao == "6"
            Relatorio(aEstoqueGeral)
         CASE cOpcao == "0"
            QOut("Saindo do sistema... Até logo!")
            InKey(1.5)
         OTHERWISE
            QOut("Opção inválida! Pressione qualquer tecla...")
            InKey(0)
      ENDCASE
   ENDDO 
RETURN NIL