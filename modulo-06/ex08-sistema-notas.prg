/* matriz -->   | "texto", n1 n2 n3  |
                | "texto2",n1,n2,n3  |         
*/
REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

   LOCAL aAluno  := {}
   LOCAL nMedia := 0
   LOCAL cNome
   LOCAL n1
   LOCAL n2
   LOCAL n3 
   LOCAL n4
   LOCAL cRespt
   LOCAL nNu 
   LOCAL nNu2
   hb_cdpSelect("PT850")

    
DO WHILE .t.
      
        ACCEPT " Digite o nome: " TO cNome
        ACCEPT " Digite a primeira nota: " TO n1
        ACCEPT " Digite a segunda nota: " TO n2
        ACCEPT " Digite a terceira nota: " TO n3
        ACCEPT " Digite a quarta nota: " TO n4
        n1 := Val(n1)
        n2 := Val(n2)
        n3 := Val(n3)
        n4 := Val(n4)

           AAdd(aAluno, {cNome, n1, n2, n3, n4})   
        ACCEPT "Deseja parar?(S/N)" TO cRespt
            cRespt :=  Upper(AllTrim(cRespt))   
              IF cRespt == "S"
                exit
              ENDIF  
    ENDDO 
    Qout("")
    FOR EACH nNu2 IN aAluno //loop para mudar de aluno 
       FOR nNu := 1 to 5 // loop para acessar as informações do aluno
            IF nNu == 1
               QQout(nNu2[nNu])
            ELSE
            
               QQout(" nota: "+ str(nNu2[nNu]))
                nMedia = nMedia + nNu2[nNu]
            ENDIF
        NEXT
        nMedia := nMedia/4
        IF nMedia >= 7
            QQout(" situação: Aprovado ")
        ELSE 
            QQout(" situação: Reprovado ")
        ENDIF
        QQout(" A media é: " +  alltrim(str(nMedia,10,2)))
        
        Qout("")
        nMedia := 0
    NEXT

RETURN NIL