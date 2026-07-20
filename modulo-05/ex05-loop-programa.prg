REQUEST HB_CODEPAGE_PT850 

FUNCTION Main()

    LOCAL cNome
    LOCAL cDisc
    LOCAL cNota1
    LOCAL cNota2
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nMedia
    LOCAL cOpcao


    hb_cdpSelect("PT850")


    WHILE .T.


        // Validação do nome

        WHILE .T.

            ACCEPT "Digite o nome do aluno: " TO cNome

            IF Len(Trim(cNome)) > 0
                EXIT
            ELSE
                QOut("Nome inválido!")
            ENDIF

        ENDDO



        // Validação da disciplina

        WHILE .T.

            ACCEPT "Digite a disciplina (3 letras maiúsculas): " TO cDisc

            cDisc := AllTrim(cDisc)

            IF Len(cDisc) == 3 .AND. cDisc == Upper(cDisc) .AND. IsAlpha(cDisc)
                EXIT
            ELSE
                QOut("Disciplina inválida!")
            ENDIF

        ENDDO



        // Validação da primeira nota

        WHILE .T.

            ACCEPT "Digite a primeira nota: " TO cNota1

            nNota1 := Val(cNota1)

            IF nNota1 >= 0 .AND. nNota1 <= 10
                EXIT
            ELSE
                QOut("Nota inválida!")
            ENDIF

        ENDDO



        // Validação da segunda nota

        WHILE .T.

            ACCEPT "Digite a segunda nota: " TO cNota2

            nNota2 := Val(cNota2)

            IF nNota2 >= 0 .AND. nNota2 <= 10
                EXIT
            ELSE
                QOut("Nota inválida!")
            ENDIF

        ENDDO



        nMedia := (nNota1 + nNota2) / 2


        QOut("-----------------------------------------")
        QOut("Aluno: " + cNome)
        QOut("Disciplina: " + cDisc)
        QOut("Média: " + AllTrim(str(nMedia,10,2)))



        ACCEPT "Deseja calcular outro? (S/N): " TO cOpcao

        cOpcao := Upper(AllTrim(cOpcao))


        IF cOpcao <> "S"
            EXIT
        ENDIF


    ENDDO


    QOut("Programa encerrado.")


RETURN NIL