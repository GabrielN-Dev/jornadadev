#define PEDRA    1
#define PAPEL    2
#define TESOURA  3

REQUEST HB_CODEPAGE_PT850

FUNCTION Main()
   LOCAL nJogador
   LOCAL nRobo
   LOCAL cControle := ""
   LOCAL nVencedor
   hb_cdpSelect("PT850")
   DO WHILE cControle <> "N"
      CLS // Limpa a tela a cada nova rodada
      Qout("=====================")
      Qout(" BEM VINDO AO JOKENPO")
      Qout("=====================")
      Qout("Para jogar escolha:")
      Qout("1 - Pedra")
      Qout("2 - Papel")
      Qout("3 - Tesoura")
      Qout("")
      ACCEPT "Digite sua jogada: " TO nJogador
      nJogador := Val(nJogador)
       IF  ValidarJogada(nJogador) == 1
         Qout("Não foi possivel continuar o Jogo tente novamente!")
         QOut("Pressione Enter para continuar...")
         InKey(0) 
      ELSE
         nRobo := SortearJogadaCPU()
         nVencedor := DefinirVencedor(nJogador,nRobo)
        DO CASE
         CASE nVencedor == 0
            Qout("Empate")
         CASE nVencedor == 1
            Qout("Você ganhou!")
         CASE nVencedor == 2
            Qout("Você Perdeu!")
    ENDCASE
      ENDIF
           ACCEPT "Deseja jogar novamente (S/N) " TO cControle
        cControle :=  Upper(AllTrim(cControle))   
   ENDDO
RETURN NIL

FUNCTION ValidarJogada(nJogador)
    DO CASE
        CASE nJogador == PEDRA
        Qout("Você selecionou Pedra")
        CASE nJogador == PAPEL
        Qout("Você selecionou Papel")
        CASE nJogador == TESOURA
        Qout("Você selecionou Tesoura")
    OTHERWISE
        QOut("Operação inválida!")
        RETURN 1
    ENDCASE
RETURN NIL 

 
FUNCTION SortearJogadaCPU()
   LOCAL nRobo
   nRobo := HB_RandomInt( 1, 3 ) 
RETURN nRobo 

FUNCTION DefinirVencedor(nJogador, nRobo)
   Qout("O Robo jogou: ")

   DO CASE
        CASE nRobo == PEDRA
        QQout("Pedra")
        CASE nRobo == PAPEL
        QQout("Papel")
        CASE nRobo == TESOURA
        QQout("Tesoura") 
    ENDCASE
   IF nJogador == nRobo
      RETURN 0
   ELSEIF nJogador == PEDRA .AND. nRobo == TESOURA
      RETURN 1
   ELSEIF nJogador == PAPEL .AND. nRobo == PEDRA
      RETURN 1
   ELSEIF nJogador == TESOURA .AND. nRobo == PAPEL
      RETURN 1
   ELSE 
      RETURN 2
   ENDIF
RETURN NIL