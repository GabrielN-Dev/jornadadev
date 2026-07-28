FUNCTION Main()
    LOCAL aValores := { 10, 15, 20, 33, 40 }
    LOCAL nSoma := 0
    LOCAL nI
    FOR nI := 1 TO Len( aValores )
        IF aValores[ nI ] % 2 = 0
            nSoma := aValores[ nI ] // ?? bug: devia ser += <- breakpoint aqui
            Inkey(0)
        ENDIF
    NEXT
    QOut( "Soma dos pares: " + Str( nSoma ) )
RETURN NIL