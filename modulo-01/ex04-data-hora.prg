REQUEST HB_CODEPAGE_PT850 //config(acento)

FUNCTION  Main()
    local dData := Date()
    hb_cdpSelect("PT850") //config(acento) 
    SET DATE BRITISH   //define o formato para dd/mm/aaaa
    SET CENTURY ON     // for‡a a exiber os 4 digitos do ano 
    QOut("A data de hoje ‚: "+ DToC(dData)) 
    //QOut("A data de hoje ‚:", dData) funciona tamb‚m
    QOut("A hora ‚: " + Time())
RETURN Nil    

 
