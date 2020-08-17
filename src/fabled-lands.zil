<INSERT-FILE "characters">
<INSERT-FILE "monsters">
<INSERT-FILE "objects">
<INSERT-FILE "story">

; "Global constants"

<CONSTANT NONE <>>
<CONSTANT F <>>

<GLOBAL CURRENT-LOC NONE>
<GLOBAL PERIOD-CR ".|">
<GLOBAL EXCLAMATION-CR "!|">

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

; "Character Abilities"

<PROPDEF CHARISMA 1>
<PROPDEF COMBAT 1>
<PROPDEF MAGIC 1>
<PROPDEF SANCTITY 1>
<PROPDEF THIEVERY 1>
<PROPDEF RANK 0>
<PROPDEF PROFESSION NONE>

; "Computed Statistics"

<PROPDEF DEFENSE 0>
<PROPDEF MAX-STAMINA 0>
<PROPDEF STAMINA 0>

; "Story Properties"

<PROPDEF BACKGROUND NONE> ; "routine to handle events that happen before story text is displayed"
<PROPDEF STORY NONE> ; "text in the story section"
<PROPDEF EVENTS NONE> ; "routine to handle events after text is displayed but before CHOICES/CONTINUE"
<PROPDEF CHOICES NONE> ; "list of available actions"
<PROPDEF DESTINATIONS NONE> ; "used with CHOICES; list of sections where story is continued based on the selected action"
<PROPDEF REQUIREMENTS NONE> ; "used with CHOICES; list of requirements for each action"
<PROPDEF TYPES NONE>  ; "used with CHOICES and REQUIREMENTS; determines the type of each requirement" 
<PROPDEF CONTINUE NONE> ; "story proceeds to the next section indicated"
<PROPDEF ITEMS NONE> ; "list of items gained"
<PROPDEF CODEWORDS NONE> ; "list of codewords gained"
<PROPDEF GOD NONE> ; "God gained"
<PROPDEF BLESSING NONE> ; "blessings gained"
<PROPDEF TITLES NONE> ; "titles and honors gained"
<PROPDEF MARKS -1> ; "counts the number of times the section has been visited"
<PROPDEF DOOM F> ; "section ends in doom for the player"
<PROPDEF VICTORY F> ; "section ends in victory for the player"

; "Gamebook Engine Routines"

<ROUTINE ROLL-DICE ("OPT" DIE "AUX" (RESULT 0))
    <COND (<NOT .DIE> <SET DIE 1>)>
    <DO (I 1 .DIE)
        <SET RESULT <+ .RESULT <RANDOM 6>>>
    >
    <RETURN .RESULT>>

; "Test ABILITY score"
<ROUTINE TEST-ABILITY (CHARACTER ABILITY DIFFICULTY "OPT" (TOTAL 0) (MODIFIERS 0) "AUX" RESULT)
    <SET RESULT <ROLL-DICE 2>>
    <SET TOTAL <+ <GETP .CHARACTER .ABILITY> .MODIFIERS .TOTAL>>
    <COND (<G? .TOTAL .DIFFICULTY> <RTRUE>)>
    <RFALSE>>

; "Finds the item with the best PROPERTY score"
<ROUTINE FIND-BEST (PROPERTY "OPT" TYPE CONTAINER "AUX" (SCORE 0) (ITEM NONE) (RESULT 0))
    <COND (<NOT .CONTAINER> <SET .CONTAINER ,PLAYER>)>
    <SET ITEM <FIRST? .CONTAINER>>
    <REPEAT ()
        <COND (<NOT .ITEM> <RETURN>)>
        <SET SCORE <GETP .ITEM .PROPERTY>>
        <COND (<AND .TYPE <FSET? .ITEM .TYPE> <G? .SCORE .RESULT>>
            <SET .RESULT .SCORE>
        )(<G? .SCORE .RESULT>
            <SET .RESULT .SCORE>
        )>
        <SET ITEM <NEXT? .ITEM>>
    >
    <RETURN .RESULT>>

; "Calculate defense score"
<ROUTINE CALCULATE-DEFENSE (CHARACTER "OPT" CONTAINER "AUX" (RESULT 0))
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <SET RESULT <+ .RESULT <GETP .CHARACTER ,P?DEFENSE>>>
    <SET RESULT <+ .RESULT <GETP .CHARACTER ,P?RANK>>>
    <SET RESULT <+ .RESULT <FIND-BEST ,P?DEFENSE ,WEARBIT .CONTAINER>>>
    <COND (<EQUAL? .CHARACTER ,CURRENT-CHARACTER> <SET RESULT <+ .RESULT <FIND-BEST ,P?DEFENSE ,NONE ,BLESSINGS>>>)>
    <RETURN .RESULT>>

; "Calculate combat score"
<ROUTINE CALCULATE-COMBAT (CHARACTER "OPT" CONTAINER "AUX" (RESULT 0))
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <SET RESULT <+ .RESULT <GETP .CHARACTER ,P?COMBAT>>>
    <SET RESULT <+ .RESULT <FIND-BEST ,P?COMBAT ,WEARBIT .CONTAINER>>>
    <COND (<EQUAL? .CHARACTER ,CURRENT-CHARACTER> <SET RESULT <+ .RESULT <FIND-BEST ,P?COMBAT ,NONE ,BLESSINGS>>>)>
    <RETURN .RESULT>>
       
; "Fighting routines"

<ROUTINE ATTACK-MESSAGE (ATTACKER DEFENDER ATTACK DAMAGE)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COND (<EQUAL? .ATTACKER ,CURRENT-CHARACTER>
        <TELL D .ATTACKER "'s">
    )(ELSE
        <TELL CT .ATTACKER "'s">
    )>
    <HLIGHT 0>
    <TELL " attack (" N .ATTACK ") hits ">
    <HLIGHT ,H-BOLD>
    <COND (<EQUAL? .DEFENDER ,CURRENT-CHARACTER>
        <TELL D .DEFENDER>
    )(ELSE
        <TELL T .DEFENDER>
    )>
    <HLIGHT 0>
    <TELL " for ">
    <HLIGHT ,H-BOLD>
    <TELL N .DAMAGE " damage">
    <HLIGHT 0>
    <TELL ,PERIOD-CR>>

<ROUTINE HAS-PREVAILED (CHARACTER)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COND (<EQUAL? .CHARACTER ,CURRENT-CHARACTER>
        <TELL D .CHARACTER>
    )(ELSE
        <TELL CT .CHARACTER>
    )>
    <TELL " has prevailed">
    <HLIGHT 0>
    <TELL ,PERIOD-CR>>

<ROUTINE ATTACK-INEFFECTIVE (ATTACKER)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COND (<EQUAL? .ATTACKER ,CURRENT-CHARACTER>
        <TELL D .ATTACKER>
    )(ELSE
        <TELL CT .ATTACKER>
    )>
    <TELL "'s attack was ineffective" ,EXCLAMATION-CR>
    <HLIGHT 0>>

<ROUTINE COMBAT-STATUS (ROUND MONSTER STAMINA-PLAYER STAMINA-MONSTER)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "Round " N .ROUND ": ">
    <HLIGHT 0>
    <HLIGHT ,H-ITALIC>
    <TELL D ,CURRENT-CHARACTER> 
    <HLIGHT 0>
    <TELL " (STAMINA: " N .STAMINA-PLAYER "), ">
    <HLIGHT ,H-ITALIC>
    <TELL CT .MONSTER>
    <HLIGHT 0>
    <TELL " (STAMINA: " N .STAMINA-MONSTER ")">
    <TELL ,PERIOD-CR>
    <UPDATE-STATUS-LINE>>

<ROUTINE FIGHT (MONSTER "AUX" RESULT ATTACK STAMINA-PLAYER STAMINA-MONSTER (ROUND 0))
    <SET STAMINA-PLAYER <GETP ,CURRENT-CHARACTER ,P?STAMINA>>
    <SET STAMINA-MONSTER <GETP ,CURRENT-CHARACTER ,P?STAMINA>>
    <CRLF>
    <TELL "Resolving combat between " D ,CURRENT-CHARACTER> 
    <TELL " (COMBAT: " N <CALCULATE-COMBAT ,CURRENT-CHARACTER> " DEFENSE: " N <CALCULATE-DEFENSE ,CURRENT-CHARACTER> ")">
    <TELL " and " T .MONSTER>
    <TELL " (COMBAT: " N <CALCULATE-COMBAT .MONSTER .MONSTER> " DEFENSE: " N <CALCULATE-DEFENSE .MONSTER .MONSTER> ")">
    <TELL ,PERIOD-CR>
    <REPEAT ()
        <INC .ROUND>
        <COMBAT-STATUS .ROUND .MONSTER .STAMINA-PLAYER .STAMINA-MONSTER>
        <PRESS-A-KEY>
        <SET ATTACK <+ <ROLL-DICE 2> <CALCULATE-COMBAT ,CURRENT-CHARACTER>>>
        <SET RESULT <- .ATTACK <CALCULATE-DEFENSE .MONSTER .MONSTER>>>
        <COND (<G? .RESULT 0>
            <ATTACK-MESSAGE ,CURRENT-CHARACTER .MONSTER .ATTACK .RESULT>
            <SET STAMINA-MONSTER <- .STAMINA-MONSTER .RESULT>>
            <COND (<L? .STAMINA-MONSTER 1> <RETURN>)>
        )(ELSE
            <ATTACK-INEFFECTIVE ,CURRENT-CHARACTER>
        )>
        <PRESS-A-KEY>
        <SET ATTACK <+ <ROLL-DICE 2> <CALCULATE-COMBAT .MONSTER .MONSTER>>>
        <SET RESULT <- .ATTACK <CALCULATE-DEFENSE ,CURRENT-CHARACTER>>>
        <COND (<G? .RESULT 0>
            <ATTACK-MESSAGE .MONSTER ,CURRENT-CHARACTER .ATTACK .RESULT>
            <SET STAMINA-PLAYER <- .STAMINA-PLAYER .RESULT>>
            <COND (<L? .STAMINA-PLAYER 1> <RETURN>)>
        )(ELSE
            <ATTACK-INEFFECTIVE .MONSTER>
        )>
        <PRESS-A-KEY>
    >
    <COND (<L? .STAMINA-PLAYER 0> <SET .STAMINA-PLAYER 0>)>
    <PUTP ,CURRENT-CHARACTER ,P?STAMINA .STAMINA-PLAYER>
    <UPDATE-STATUS-LINE>
    <COND (<L=? .STAMINA-MONSTER 0>
        <HAS-PREVAILED ,CURRENT-CHARACTER>
        <RTRUE>
    )>
    <HAS-PREVAILED .MONSTER>
    <RFALSE>>

; "Story Routines - print story, process choices"
; ---------------------------------------------------------------------------------------------
<ROUTINE PRINT-SECTION ("OPT" SECTION "AUX" TEXT)
    <COND (<NOT .SECTION> <SET SECTION ,HERE>)>
    <SET TEXT <GETP .SECTION ,P?STORY>>
    <COND (.TEXT
        <CRLF>
        <TELL .TEXT>
        <CRLF>
    )>>

; "System/Utility/Miscellaneous routines"
; ---------------------------------------------------------------------------------------------

<ROUTINE EMPHASIZE (TEXT)
    <COND (.TEXT
        <CRLF>
        <HLIGHT ,H-BOLD>
        <TELL .TEXT>
        <HLIGHT 0>
        <CRLF>
    )>>

<ROUTINE PRESS-A-KEY ()
    <TELL CR "[Press a key to continue]" CR>
    <INPUT 1>
    <RETURN>>

; "Status Line routines"
; ---------------------------------------------------------------------------------------------

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

; "Gamebook routines"
; ---------------------------------------------------------------------------------------------

<ROUTINE QUIT-MSG ()
    <TELL CR "Thanks for playing" ,PERIOD-CR>
    <QUIT>>

; "Gamebook loop"
; ---------------------------------------------------------------------------------------------

<ROUTINE GAME-BOOK ()
    <RETURN>>
