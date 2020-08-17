; "Global constants"

<CONSTANT NONE <>>
<CONSTANT F <>>

<GLOBAL PERIOD-CR ".|">
<GLOBAL EXCLAMATION-CR "!|">

; "Character Abilities"

<PROPDEF CHARISMA 1>
<PROPDEF COMBAT 1>
<PROPDEF MAGIC 1>
<PROPDEF SANCTITY 1>
<PROPDEF THIEVERY 1>
<PROPDEF RANK 1>
<PROPDEF PROFESSION>

; "Computed Statistics"

<PROPDEF DEFENSE 0>
<PROPDEF MAX-STAMINA 0>
<PROPDEF STAMINA 0>

; "Global Objects"
<GLOBAL CURRENT-CHARACTER NONE>
<GLOBAL CURRENT-VEHICLE NONE>
<GLOBAL LIMIT-POSSESSIONS 12>

<GLOBAL MONEY 0>
<GLOBAL GOD NONE>

<OBJECT CURRENCY
    (DESC "shards")>

<OBJECT CODEWORDS
    (DESC "Codewords")
    (SYNONYM CODEWORDS)
    (FLAGS CONTBIT OPENBIT)>

<OBJECT BLESSINGS
    (DESC "Blessings")
    (SYNONYM BLESSINGS)
    (FLAGS CONTBIT OPENBIT)>

<OBJECT TITLES-AND-HONORS
    (DESC "Titles and Honors")
    (SYNONYM TITLES HONORS)
    (FLAGS CONTBIT OPENBIT)>

<OBJECT RESURRECTION-ARRANGEMENTS
    (DESC "Resurrection Arrangements")
    (SYNONYM TITLES HONORS)
    (FLAGS CONTBIT OPENBIT)>

; "Gamebook Engine Routines"

<ROUTINE ROLL-DICE ("OPT" DIE "AUX" (RESULT 0))
    <COND (<NOT .DIE> <SET DIE 1>)>
    <DO (I 1 .DIE)
        <SET RESULT <+ .RESULT <RANDOM 6>>>
    >
    <RETURN .RESULT>>

<ROUTINE TEST-ABILITY (CHARACTER ABILITY DIFFICULTY "OPT" (TOTAL 0) (MODIFIERS 0) "AUX" RESULT)
    <SET RESULT <ROLL-DICE 2>>
    <SET TOTAL <+ <GETP .CHARACTER .ABILITY> .MODIFIERS .TOTAL>>
    <COND (<G? .TOTAL .DIFFICULTY> <RTRUE>)>
    <RFALSE>>

<ROUTINE FIND-BEST (PROPERTY TYPE "AUX" (SCORE 0) (ITEM NONE) (RESULT 0))
    <SET ITEM <FIRST? ,PLAYER>>
    <REPEAT ()
        <COND (<NOT .ITEM> <RETURN>)>
        <COND (<FSET? .ITEM .PROPERTY>
            <SET SCORE <GETP .ITEM .PROPERTY>>
            <COND (<G? .SCORE .RESULT> <SET .RESULT .SCORE>)>
        )>
        <SET ITEM <NEXT? .ITEM>>
    >
    <RETURN .SCORE>>

<ROUTINE CALCULATE-DEFENSE (CHARACTER "AUX" (RESULT 0))
    <SET RESULT <+ .RESULT <GETP .CHARACTER ,P?COMBAT>>>
    <SET RESULT <+ .RESULT <GETP .CHARACTER ,P?RANK>>>
    <SET RESULT <+ .RESULT <FIND-BEST ,P?DEFENSE ,WEARBIT>>>
    <RETURN .RESULT>>

<ROUTINE LINE-ERASE (ROW)
    <CURSET .ROW 1>
    <DO (I <LOWCORE SCRH> 1 -1) <PRINTC !\ >>
    <CURSET .ROW 1>>

<ROUTINE UPDATE-STATUS-LINE ("AUX" WIDTH)
    <SPLIT 2>
    <SCREEN 1>
    <SET WIDTH <LOWCORE SCRH>>
    <HLIGHT ,H-INVERSE>
    <LINE-ERASE 1>
    <COND (,HERE
        <CURSET 1 1>
        <TELL D ,HERE>
        <COND (,CURRENT-CHARACTER
            <COND (,CURRENT-VEHICLE <TELL " " D ,CURRENT-VEHICLE>)>
            <CURSET 1 <- .WIDTH 16>>
            <TELL "Stamina: " N <GETP ,CURRENT-CHARACTER ,P?STAMINA>>
            <LINE-ERASE 2>
            <CURSET 2 1>
            <PRINT-CAP-OBJ ,CURRENT-CHARACTER>
            <CURSET 2 <- .WIDTH 16>>
            <PRINT-CAP-OBJ ,CURRENCY>
            <COND (<G? ,MONEY 9999>
                <TELL ": lots">
            )(ELSE
                <TELL ": " N ,MONEY>
            )>
        )>
    )>
    <SCREEN 0>
    <HLIGHT 0>>

<ROUTINE QUIT-MSG ()
    <TELL CR "Thanks for playing" ,PERIOD-CR>
    <QUIT>>

<ROUTINE GAME-BOOK ()
    <RETURN>>