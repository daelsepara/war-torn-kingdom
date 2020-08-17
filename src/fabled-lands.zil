<INSERT-FILE "characters">
<INSERT-FILE "monsters">
<INSERT-FILE "objects">
<INSERT-FILE "story">

; "Global constants"

<CONSTANT NONE <>>
<CONSTANT F <>>

<GLOBAL CONTINUE-TO-CHOICES T>

<CONSTANT SELECT-CHOICES <LTABLE NONE NONE NONE NONE NONE NONE NONE NONE NONE>>
<CONSTANT TEMP-LIST <LTABLE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE>>

; "Choice Types"
<CONSTANT R-NONE 0> 
<CONSTANT R-ABILITY 1> ; "tests whether ABILITY exceeds certain score"
<CONSTANT R-TEST-ABILITY 2> ; "test ABILITY versus difficulty roll"
<CONSTANT R-RANDOM 3> ; "rolls a number of dice and choose destination based on threshold"
<CONSTANT R-CODEWORDS 4> ; "presence of codeword(s)"
<CONSTANT R-ITEMS 5> ; "possession of item (s)"
<CONSTANT R-ANY 6> ; "possession of any of the item (s)"
<CONSTANT R-MONEY 7> ; "tests abilility to pay indicated amount"

; "Global objects and variables"

<CONSTANT LIMIT-POSSESSIONS 12>

<GLOBAL CURRENT-LOC NONE>
<GLOBAL RUN-ONCE F>
<GLOBAL CURRENT-CHARACTER NONE>
<GLOBAL CURRENT-VEHICLE NONE>
<GLOBAL MONEY 0>
<GLOBAL STAMINA 0>
<GLOBAL MAX-STAMINA 9>

; "container for vehicles owned"

<OBJECT VEHICLES
    (DESC "vehicles")
    (SYNONYM VEHICLES)
    (FLAGS CONTBIT OPENBIT)>

; "container for items given"

<OBJECT GIVEBAG
    (DESC "items to give")
    (SYNONYM BAG)
    (ADJECTIVE GIVE)
    (FLAGS CONTBIT OPENBIT)>

; "deity worshipped"
<GLOBAL GOD NONE>

; "container for codewords"

<OBJECT CODEWORDS
    (DESC "Codewords")
    (SYNONYM CODEWORDS)
    (FLAGS CONTBIT OPENBIT)>

; "object to refer to all of your money"

<OBJECT ALL-MONEY
    (DESC "all your money")
    (SYNONYM MONEY)
    (ADJECTIVE ALL YOUR)
    (FLAGS TAKEBIT NDESCBIT)>

; "container for blessings"

<OBJECT BLESSINGS
    (DESC "Blessings")
    (SYNONYM BLESSINGS)
    (FLAGS CONTBIT OPENBIT)>

; "container for titles and honors acquired"

<OBJECT TITLES-AND-HONORS
    (DESC "Titles and Honors")
    (SYNONYM TITLES HONORS)
    (FLAGS CONTBIT OPENBIT)>

; "container for resurrection arrangments"

<OBJECT RESURRECTION-ARRANGEMENTS
    (DESC "Resurrection Arrangements")
    (SYNONYM ARRANGEMENTS)
    (ADJECTIVE RESURRECTION)
    (FLAGS CONTBIT OPENBIT)>

; "Character Abilities"

<PROPDEF CHARISMA -1>
<PROPDEF COMBAT -1>
<PROPDEF MAGIC -1>
<PROPDEF SANCTITY -1>
<PROPDEF THIEVERY -1>
<PROPDEF RANK -1>
<PROPDEF PROFESSION NONE>

; "Object properties"

<PROPDEF QUANTITY -1>
<PROPDEF CHARGES -1>
<PROPDEF STARS -1>

; "Computed Statistics"

<PROPDEF DEFENSE -1>
<PROPDEF STAMINA -1>

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

; "miscellaneous"

<GLOBAL PERIOD-CR ".|">
<GLOBAL EXCLAMATION-CR "!|">

; "Gamebook Engine Routines"
; ---------------------------------------------------------------------------------------------

; "generic D6 roller"

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

; "Fighting routines"
; ---------------------------------------------------------------------------------------------

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
       
; "Display combatants' status"

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

<ROUTINE FIGHT (MONSTER "AUX" RESULT ATTACK STAMINA-PLAYER COMBAT-PLAYER DEFENSE-PLAYER STAMINA-MONSTER COMBAT-MONSTER DEFENSE-MONSTER (ROUND 0))
    <SET STAMINA-PLAYER ,STAMINA>
    <SET DEFENSE-PLAYER <CALCULATE-DEFENSE ,CURRENT-CHARACTER>>
    <SET COMBAT-PLAYER <CALCULATE-COMBAT ,CURRENT-CHARACTER>>
    <COND (<G? .COMBAT-PLAYER 12> <SET .COMBAT-PLAYER 12>)>
    <SET STAMINA-MONSTER <GETP ,CURRENT-CHARACTER ,P?STAMINA>>
    <SET DEFENSE-MONSTER <CALCULATE-DEFENSE .MONSTER .MONSTER>>
    <SET COMBAT-MONSTER <CALCULATE-COMBAT .MONSTER .MONSTER>>
    <COND (<G? .COMBAT-MONSTER 12> <SET .COMBAT-MONSTER 12>)>
    <CRLF>
    <TELL "Resolving combat between " D ,CURRENT-CHARACTER> 
    <TELL " (COMBAT: " N .COMBAT-PLAYER " DEFENSE: " N .DEFENSE-PLAYER ")">
    <TELL " and " T .MONSTER>
    <TELL " (COMBAT: " N .COMBAT-MONSTER " DEFENSE: " N .DEFENSE-MONSTER ")">
    <TELL ,PERIOD-CR>
    <REPEAT ()
        <INC .ROUND>
        <COMBAT-STATUS .ROUND .MONSTER .STAMINA-PLAYER .STAMINA-MONSTER>
        <PRESS-A-KEY>
        <SET ATTACK <+ <ROLL-DICE 2> .COMBAT-PLAYER>>
        <SET RESULT <- .ATTACK .DEFENSE-MONSTER>>
        <COND (<G? .RESULT 0>
            <ATTACK-MESSAGE ,CURRENT-CHARACTER .MONSTER .ATTACK .RESULT>
            <SET STAMINA-MONSTER <- .STAMINA-MONSTER .RESULT>>
            <COND (<L? .STAMINA-MONSTER 1> <RETURN>)>
        )(ELSE
            <ATTACK-INEFFECTIVE ,CURRENT-CHARACTER>
        )>
        <PRESS-A-KEY>
        <SET ATTACK <+ <ROLL-DICE 2> .COMBAT-MONSTER>>
        <SET RESULT <- .ATTACK .DEFENSE-PLAYER>>
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
    <SETG STAMINA .STAMINA-PLAYER>
    <UPDATE-STATUS-LINE>
    <COND (<L=? .STAMINA-MONSTER 0>
        <HAS-PREVAILED ,CURRENT-CHARACTER>
        <RTRUE>
    )>
    <HAS-PREVAILED .MONSTER>
    <RFALSE>>

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

; "Story Routines - print story, process choices"
; ---------------------------------------------------------------------------------------------

<ROUTINE CHECK-BACKGROUND ("AUX" BACKGROUND STORY)
    <SET BACKGROUND <GETP ,HERE ,P?BACKGROUND>>
    <COND (.BACKGROUND
        <SET STORY <APPLY .BACKGROUND>>
        <COND (.STORY <SETG HERE .STORY>)>
        <UPDATE-STATUS-LINE>
    )>>

<ROUTINE CHECK-DOOM ("AUX" DOOM)
    <SET DOOM <GETP ,HERE ,P?DOOM>>
    <COND (.DOOM
        <PRINT-ENDING BAD-ENDING 3>
        <SETG CONTINUE-TO-CHOICES F>
    )>>

<ROUTINE CHECK-VICTORY ("AUX" VICTORY)
    <SET VICTORY <GETP ,HERE ,P?VICTORY>>
    <COND (.VICTORY
        <COND (<EQUAL? .VICTORY T>
            <PRINT-ENDING GOOD-ENDING 4>
        )(ELSE
            <PRINT-ENDING .VICTORY 6>
        )>
        <SETG CONTINUE-TO-CHOICES F>
    )>>

<ROUTINE CHECK-EVENTS ("AUX" EVENTS)
    <SET EVENTS <GETP ,HERE ,P?EVENTS>>
    <COND (.EVENTS <APPLY .EVENTS>)>>

<ROUTINE PRINT-SECTION ("OPT" SECTION "AUX" TEXT)
    <COND (<NOT .SECTION> <SET SECTION ,HERE>)>
    <SET TEXT <GETP .SECTION ,P?STORY>>
    <COND (.TEXT
        <CRLF>
        <TELL .TEXT>
        <CRLF>
    )>>

<ROUTINE PROCESS-CHOICES (CHOICES "AUX" DESTINATIONS REQUIREMENTS TYPES KEY CHOICE TYPE LIST)
    <SET DESTINATIONS <GETP ,HERE ,P?DESTINATIONS>>
    <SET REQUIREMENTS <GETP ,HERE ,P?REQUIREMENTS>>
    <SET TYPES <GETP ,HERE ,P?TYPES>>
    <TELL CR "What will you choose? ">
    <REPEAT ()
        <SET KEY <INPUT 1>>
        <COND (<AND <G=? .KEY !\1> <L=? .KEY !\9>>
            <SET CHOICE <- .KEY !\0>>
            <COND (<AND <G=? <GET .CHOICES 0> 1> <L=? .CHOICE <GET .CHOICES 0>>>
                <COND (.REQUIREMENTS <SET LIST <GET .REQUIREMENTS .CHOICE>>)>
                <COND (<AND <G=? .CHOICE 1> <L=? .CHOICE <GET .DESTINATIONS 0>> <L=? .CHOICE <GET .TYPES 0>>>
                    <SET TYPE <GET .TYPES .CHOICE>>
                    <COND (<EQUAL? .TYPE R-NONE>
                        <SETG HERE <GET .DESTINATIONS .CHOICE>>
                        <CRLF>
                    )>
                    <RETURN>
                )(ELSE
                    <CRLF>
                    <TELL CR "Internal Error" ,PERIOD-CR>
                    <SET KEY !\q>
                    <RETURN>
                )>
            )>
        )>
        <COND (<SPECIAL-INTERRUPT-ROUTINE .KEY> <RETURN>)>
        <COND (<EQUAL? .KEY !\q !\Q !\r !\R !\s !\S> <CRLF> <RETURN>)>
    >
    <RETURN .KEY>>

<ROUTINE PROCESS-STORY ("AUX" COUNT CHOICES TYPES REQUIREMENTS LIST CONTINUE CURRENT-LOC CHOICE CHOICE-TYPE)
    <SET CHOICES <GETP ,HERE ,P?CHOICES>>
    <SET TYPES <GETP ,HERE ,P?TYPES>>
    <SET REQUIREMENTS <GETP ,HERE ,P?REQUIREMENTS>>
    <SET CONTINUE <GETP ,HERE ,P?CONTINUE>>
    <SET CURRENT-LOC ,HERE>
    <SETG RUN-ONCE T>
    <COND (.CHOICES
        <REPEAT ()
            <CRLF>
            <TELL "You can ">
            <SET COUNT <GET .CHOICES 0>>
            <DO (I 1 .COUNT)
                <SET CHOICE-TYPE <GET .TYPES .I>>
                <COND (.REQUIREMENTS <SET LIST <GET .REQUIREMENTS .I>>)>
                <COND (<AND <EQUAL? .I .COUNT> <G? .COUNT 1>> <TELL "or ">)>
                <HLIGHT ,H-BOLD>
                <TELL N .I ") ">
                <HLIGHT 0>
                <TELL <GET .CHOICES .I>>
                <COND (<AND <NOT <EQUAL? .COUNT 2>> <L? .I .COUNT> <TELL ", ">>)>
                <COND (<AND <EQUAL? .I 1> <EQUAL? .COUNT 2>> <TELL " ">)>
            >
            <TELL ,PERIOD-CR>
            <SET CHOICE <PROCESS-CHOICES .CHOICES>>
            <COND (.CHOICE <RETURN>)>
        >
        <COND (<EQUAL? .CURRENT-LOC ,HERE> <SETG RUN-ONCE F>)>
        <RETURN .CHOICE>
    )(.CONTINUE
        <SETG HERE .CONTINUE>
        <PRESS-A-KEY>
        <RETURN>
    )>
    <RETURN !\x>>

; "Choose Character / Profession"
; ---------------------------------------------------------------------------------------------

<ROUTINE CHOOSE-CHARACTER ("AUX" COUNT KEY CHOICE CHARACTER POSSESSIONS)
    <SET COUNT <GET CHARACTERS 0>>
    <COND (<G? .COUNT 0>
        <REPEAT ()
            <SET COUNT <GET CHARACTERS 0>>
            <CRLF>
            <HLIGHT ,H-BOLD>
            <TELL "Choose a character:">
            <HLIGHT 0>
            <CRLF>
            <DO (I 1 .COUNT)
                <HLIGHT ,H-BOLD>
                <TELL N .I>
                <HLIGHT 0>
                <TELL " - " D <GET CHARACTERS .I> CR>
            >
            <HLIGHT ,H-BOLD>
            <TELL "C">
            <HLIGHT 0>
            <TELL " - Choose a Profession" CR>
            <HLIGHT ,H-BOLD>
            <TELL "R">
            <HLIGHT 0>
            <TELL " - Restore from previous save" CR>
            <TELL "Select which character?">
            <REPEAT ()
                <SET KEY <INPUT 1>>
                <COND (<OR <AND <G=? .KEY !\1> <L=? .KEY !\9> <L=? <- .KEY !\0> .COUNT>> <EQUAL? .KEY !\C !\c> <EQUAL? .KEY !\R !\r>> <RETURN>)>
            >
            <COND (<AND <G=? .KEY !\1> <L=? .KEY !\9>>
                <SET CHOICE <- .KEY !\0>>
                <COND (<AND <G=? <GET CHARACTERS 0> 1> <G=? .CHOICE 1> <L=? .CHOICE <GET CHARACTERS 0>>>
                    <SET CHARACTER <GET CHARACTERS .CHOICE>>
                    <CRLF>
                    <DESCRIBE-CHARACTER .CHARACTER>
                    <CRLF>
                    <TELL "Select this character?">
                    <COND (<YES?>
                        <SETG CURRENT-CHARACTER .CHARACTER>
                        <SET POSSESSIONS <GETP .CHARACTER ,P?POSSESSIONS>>
                        <COND (.POSSESSIONS
                            <SET COUNT <GET .POSSESSIONS 0>>
                            <DO (I 1 .COUNT)
                                <MOVE <GET .POSSESSIONS .I> ,PLAYER>
                            >
                        )>
                        <SETG CURRENT-CHARACTER .CHARACTER>
                        <SETG MONEY <GETP .CHARACTER ,P?MONEY>>
                        <SETG STAMINA <GETP .CHARACTER ,P?STAMINA>>
                        <SETG MAX-STAMINA ,STAMINA>
                        <MOVE ,ALL-MONEY ,PLAYER>
                        <TELL CR "You have selected " CT ,CURRENT-CHARACTER CR>
                        <TELL CR "[Press a key to begin]" CR>
                        <INPUT 1>
                        <RETURN>
                    )>
                )(ELSE
                    <CRLF>
                )>
            )(<EQUAL? .KEY !\C !\c>
                <COND (<CHOOSE-PROFESSION> <RETURN>)>
            )(<EQUAL? .KEY !\R !\r>
                <COND (<NOT <RESTORE>>
                    <EMPHASIZE "Restore failed.">
                )>
            )(ELSE
                <CRLF>
            )>
        >
    )>>

<ROUTINE CHOOSE-PROFESSION ("AUX" COUNT KEY CHOICE PROFESSION POSSESSIONS (RESULT F))
    <CRLF>
    <SET COUNT <GET ,PROFESSIONS 0>>
    <COND (<G? .COUNT 0>
        <REPEAT ()
            <SET COUNT <GET ,PROFESSIONS 0>>
            <CRLF>
            <HLIGHT ,H-BOLD>
            <TELL "Choose a professions:">
            <HLIGHT 0>
            <CRLF>
            <DO (I 1 .COUNT)
                <HLIGHT ,H-BOLD>
                <TELL N .I>
                <HLIGHT 0>
                <TELL " - " D <GET ,PROFESSIONS .I> CR>
            >
            <HLIGHT ,H-BOLD>
            <TELL "R">
            <HLIGHT 0>
            <TELL " - Return to character selection" CR>
            <TELL "Select which profession?">
            <REPEAT ()
                <SET KEY <INPUT 1>>
                <COND (<OR <AND <G=? .KEY !\1> <L=? .KEY !\9> <L=? <- .KEY !\0> .COUNT>> <EQUAL? .KEY !\R !\r>> <RETURN>)>
            >
            <COND (<AND <G=? .KEY !\1> <L=? .KEY !\9>>
                <SET CHOICE <- .KEY !\0>>
                <COND (<AND <G=? <GET ,PROFESSIONS 0> 1> <G=? .CHOICE 1> <L=? .CHOICE <GET ,PROFESSIONS 0>>>
                    <SET PROFESSION <GET ,PROFESSIONS .CHOICE>>
                    <CRLF>
                    <DESCRIBE-CHARACTER .PROFESSION>
                    <CRLF>
                    <TELL "Select this profession?">
                    <COND (<YES?>
                        <SETG CURRENT-CHARACTER .PROFESSION>
                        <SET POSSESSIONS <GETP .PROFESSION ,P?POSSESSIONS>>
                        <COND (.POSSESSIONS
                            <SET COUNT <GET .POSSESSIONS 0>>
                            <DO (I 1 .COUNT)
                                <MOVE <GET .POSSESSIONS .I> ,PLAYER>
                            >
                        )>
                        <SETG CURRENT-CHARACTER .PROFESSION>
                        <SETG MONEY <GETP .PROFESSION ,P?MONEY>>
                        <SETG STAMINA <GETP .PROFESSION ,P?STAMINA>>
                        <SETG MAX-STAMINA ,STAMINA>
                        <MOVE ,ALL-MONEY ,PLAYER>
                        <TELL CR "You have selected " T ,CURRENT-CHARACTER CR>
                        <TELL CR "[Press a key to begin]" CR>
                        <INPUT 1>
                        <SET RESULT T>
                        <RETURN>
                    )>
                )(ELSE
                    <CRLF>
                )>
            )(<EQUAL? .KEY !\R !\r>
                <CRLF>
                <RETURN>
            )>
        >
    )>
    <RETURN .RESULT>>

<ROUTINE DESCRIBE-CHARACTER (CHARACTER "AUX" COUNT ITEM POSSESSIONS QUANTITY BLESSINGS (WORN F))
    <COND (.CHARACTER
        <CRLF>
        <HLIGHT ,H-BOLD>
        <TELL CT .CHARACTER CR>
        <HLIGHT 0>
        <COND (<GETP .CHARACTER ,P?LDESC>
            <CRLF>
            <TELL <GETP .CHARACTER ,P?LDESC> ,PERIOD-CR>
        )>
        <CRLF>
        <TELL "Rank: " N <GETP .CHARACTER ,P?RANK> CR>
        <COND (<GETP .CHARACTER ,P?PROFESSION>
            <TELL "Profession: " D <GETP .CHARACTER ,P?PROFESSION> CR>
        )>
        <TELL "Stamina: " N <GETP .CHARACTER ,P?STAMINA> CR>
        <TELL "Defense: " N <GETP .CHARACTER ,P?DEFENSE> CR>
        <TELL "Money: " N <GETP .CHARACTER ,P?MONEY> CR>
        <CRLF>
        <TELL "CHARISMA: " N <GETP .CHARACTER ,P?CHARISMA> CR>
        <TELL "COMBAT: " N <GETP .CHARACTER ,P?COMBAT> CR>
        <TELL "MAGIC: " N <GETP .CHARACTER ,P?MAGIC> CR>
        <TELL "SANCTITY: " N <GETP .CHARACTER ,P?SANCTITY> CR>
        <TELL "SCOUTING: " N <GETP .CHARACTER ,P?SCOUTING> CR>
        <TELL "THIEVERY: " N <GETP .CHARACTER ,P?THIEVERY> CR>
        <CRLF>
        <HLIGHT ,H-BOLD>
        <TELL "Possessions: ">
        <HLIGHT 0>
        <SET POSSESSIONS <GETP .CHARACTER ,P?POSSESSIONS>>
        <COND (.POSSESSIONS
            <SET COUNT <GET .POSSESSIONS 0>>
            <COND (<G? .COUNT 0>
                <DO (I 1 .COUNT)
                    <SET ITEM <GET .POSSESSIONS .I>>
                    <SET BLESSINGS 0>
                    <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
                    <SET WORN <AND <FSET? .ITEM ,WEARBIT> <FSET? .ITEM ,WORNBIT>>>
                    <COND (<G? <GETP .ITEM ,P?DEFENSE> 0> <INC .BLESSINGS>)>
                    <COND (<G? <GETP .ITEM ,P?COMBAT> 0> <INC .BLESSINGS>)>
                    <COND (<AND <G? .I 1> <G? .COUNT 1>> <TELL ", ">)>
                    <HLIGHT ,H-ITALIC>
                    <TELL D .ITEM>
                    <HLIGHT 0>
                    <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> .WORN> <TELL " (">)>
                    <COND (<G? <GETP .ITEM ,P?DEFENSE> 0>
                        <TELL "+" N <GETP .ITEM ,P?DEFENSE> " DEFENSE">
                    )>
                    <COND (<G? <GETP .ITEM ,P?COMBAT> 0>
                        <COND (<G? .BLESSINGS 1> <TELL ", ">)>
                        <TELL "+" N <GETP .ITEM ,P?COMBAT> " COMBAT">
                    )>
                    <COND (<G? .QUANTITY 1>
                        <COND (<G? .BLESSINGS 0>
                            <TELL ", quantity: ">
                        )(.WORN
                            <TELL "quantity: ">
                        )>
                        <TELL N .QUANTITY>
                    )>
                    <COND (.WORN
                        <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1>> <TELL ", ">)>
                        <TELL "worn">
                    )>

                    <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> .WORN> <TELL ")">)>
                >
            )>  
        )(ELSE
            <TELL "None">
        )>
        <CRLF>
    )>>

; "Container routines"
; ---------------------------------------------------------------------------------------------

<ROUTINE COUNT-CONTAINER (CONTAINER "AUX" COUNT ITEM QUANTITY REMOVE)
    <SET COUNT 0>
    <SET ITEM <FIRST? .CONTAINER>>
    <REPEAT ()
        <SET REMOVE NONE>
        <COND (<NOT .ITEM> <RETURN>)>
        <COND (<NOT <FSET? .ITEM ,NDESCBIT>>
            <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
            <COND (<G? .QUANTITY 0>
                <SET COUNT <+ .COUNT .QUANTITY>>
            )(<EQUAL? .QUANTITY 0>
                <PUTP .ITEM ,P?QUANTITY 1>
                <SET REMOVE .ITEM>
            )(ELSE
                <INC .COUNT>
            )>
        )>
        <SET ITEM <NEXT? .ITEM>>
        <COND (.REMOVE <REMOVE .REMOVE>)> ; "remove objects with 0 quantities"
    >
    <RETURN .COUNT>>

<ROUTINE COUNT-POSSESSIONS ()
    <RETURN <COUNT-CONTAINER ,PLAYER>>>

<ROUTINE PRINT-CONTAINER (CONTAINER "AUX" COUNT ITEMS QUANTITY CHARGES BLESSINGS STARS (WORN F))
    <COUNT-CONTAINER .CONTAINER>
    <SET COUNT 0>
    <SET ITEMS <FIRST? .CONTAINER>>
    <COND (.ITEMS
        <REPEAT ()
            <COND (.ITEMS
                <COND (<NOT <FSET? .ITEMS ,NDESCBIT>>
                    <SET BLESSINGS 0>
                    <SET QUANTITY <GETP .ITEMS ,P?QUANTITY>>
                    <SET CHARGES <GETP .ITEMS ,P?CHARGES>>
                    <SET STARS <GETP .ITEMS ,P?STARS>>
                    <SET WORN <AND <FSET? .ITEMS ,WEARBIT> <FSET? .ITEMS ,WORNBIT>>>
                    <COND (<G? <GETP .ITEMS ,P?DEFENSE> 0> <INC .BLESSINGS>)>
                    <COND (<G? <GETP .ITEMS ,P?COMBAT> 0> <INC .BLESSINGS>)>
                    <COND (<G? .COUNT 0> <TELL ", ">)>
                    <HLIGHT ,H-ITALIC>
                    <TELL D .ITEMS>
                    <HLIGHT 0>
                    <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> <G? .CHARGES 0> <G? .STARS 0> .WORN> <TELL " (">)>
                    <COND (<G? <GETP .ITEMS ,P?DEFENSE> 0>
                        <TELL "+" N <GETP .ITEMS ,P?DEFENSE> " DEFENSE">
                    )>
                    <COND (<G? <GETP .ITEMS ,P?COMBAT> 0>
                        <COND (<G? .BLESSINGS 1> <TELL ", ">)>
                        <TELL "+" N <GETP .ITEMS ,P?COMBAT> " COMBAT">
                    )>
                    <COND (<G? .QUANTITY 1>
                        <COND (<G? .BLESSINGS 0>
                            <TELL ", quantity: ">
                        )(<OR <G? .STARS 0> <G? .CHARGES 0> .WORN>
                            <TELL "quantity: ">
                        )>
                        <TELL N .QUANTITY>
                    )>
                    <COND (<G=? .CHARGES 1>
                        <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1>> <TELL ", ">)>
                        <TELL "charges: " N .CHARGES>
                    )>
                    <COND (<G=? .STARS 0>
                        <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> <G? .CHARGES 0>> <TELL ", ">)>
                        <TELL "stars: " N .STARS>
                    )>
                    <COND (.WORN
                        <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> <G? .CHARGES 0> <G? .STARS 0>> <TELL ", ">)>
                        <TELL "worn">
                    )>
                    <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> <G? .CHARGES 0> <G? .STARS 0> .WORN> <TELL ")">)>
                    <INC .COUNT>
                )>
            )(ELSE
                <RETURN>
            )>
            <SET ITEMS <NEXT? .ITEMS>>
        >
    )>
    <COND (<G? .COUNT 0>
        <CRLF>
    )(ELSE
        <TELL "None" CR>
    )>>

; "Player or Item routines"
; ---------------------------------------------------------------------------------------------

<ROUTINE CHECK-ITEM (ITEM "AUX" QUANTITY)
    <COND (<NOT .ITEM> <RTRUE>)>
    <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
    <COND (<L? .QUANTITY 0>
        <RETURN <IN? .ITEM ,PLAYER>>
    )(ELSE
        <RETURN <AND <IN? .ITEM ,PLAYER> <G? .QUANTITY 0>>>
    )>>

<ROUTINE COST-MONEY (COST)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "You lose " N .COST " " D ,CURRENCY ,PERIOD-CR>
    <HLIGHT 0>
    <SETG MONEY <- ,MONEY .COST>>
    <COND (<L? ,MONEY 0> <SETG MONEY 0>)>
    <UPDATE-STATUS-LINE>>

<ROUTINE DISCHARGE-ITEM (ITEM "OPT" AMOUNT "AUX" (CHARGES 0))
	<SET CHARGES <GETP .ITEM ,P?CHARGES>>
	<COND (<G? .CHARGES 0>
        <COND (<NOT .AMOUNT> <SET AMOUNT 1>)>
		<SET CHARGES <- .CHARGES .AMOUNT>>
		<COND (<L? .CHARGES 1> <SET CHARGES 0>)>
		<PUTP .ITEM ,P?CHARGES .CHARGES>
	)>>

<ROUTINE DROP-REPLACE-ITEM (OBJ "AUX" KEY COUNT ITEM CHOICE QUANTITY)
    <COND (<AND .OBJ <G=? <COUNT-POSSESSIONS> ,LIMIT-POSSESSIONS>>
        <REPEAT ()
            <CRLF>
            <TELL "Please choose an item to drop:" CR>
            <SET COUNT 0>
            <SET ITEM <FIRST? ,PLAYER>>
            <REPEAT ()
                <COND (<NOT .ITEM> <RETURN>)>
                <COND (<NOT <FSET? .ITEM ,NDESCBIT>>
                    <INC .COUNT>
                    <HLIGHT ,H-BOLD>
                    <TELL N .COUNT>
                    <HLIGHT 0>
                    <TELL " - " T .ITEM>
                    <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
                    <COND (<G? .QUANTITY 0> <TELL " (" N .QUANTITY ")">)>
                    <CRLF>
                )>
                <SET ITEM <NEXT? .ITEM>>
            >
            <HLIGHT ,H-BOLD>
            <TELL N <+ .COUNT 1>>
            <HLIGHT 0>
            <TELL " - drop " T .OBJ " instead" ,PERIOD-CR>
            <REPEAT ()
                <SET KEY <INPUT 1>>
                <COND (<AND <G? .KEY !\0> <L=? .KEY <+ .COUNT 49>>> <RETURN>)>
            >
            <COND (<AND <G? .KEY 48> <L? .KEY <+ .COUNT 49>>>
                <SET CHOICE <- .KEY 48>>
                <SET ITEM <GET-ITEM .CHOICE>>
                <COND (.ITEM
                    <CRLF>
                    <TELL "Drop " T .ITEM "?">
                    <COND (<YES?>
                        <HLIGHT 0>
                        <TELL CR "You dropped ">
                        <HLIGHT ,H-BOLD>
                        <TELL T .ITEM>
                        <HLIGHT 0>
                        <TELL " and took ">
                        <HLIGHT ,H-BOLD>
                        <TELL T .OBJ>
                        <HLIGHT 0>
                        <TELL ,PERIOD-CR>
                        <COND (<NOT <EQUAL? .ITEM .OBJ>>
                            <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
                            <COND (<G? .QUANTITY 0>
                                <DEC .QUANTITY>
                                <COND (<G? .QUANTITY 0>
                                    <PUTP .ITEM ,P?QUANTITY .QUANTITY>
                                )(ELSE
                                    <PUTP .ITEM ,P?QUANTITY 1>
                                    <REMOVE .ITEM>
                                )>
                            )(<EQUAL? .QUANTITY 0>
                                <PUTP .ITEM ,P?QUANTITY 1>
                                <REMOVE .ITEM>
                            )(ELSE
                                <REMOVE .ITEM>
                            )>
                            <COND (<IN? .OBJ ,PLAYER>
                                <SET QUANTITY <GETP .OBJ ,P?QUANTITY>>
                                <COND (<G=? .QUANTITY 0> <PUTP .OBJ ,P?QUANTITY <+ .QUANTITY 1>>)>
                            )>
                            <MOVE .OBJ ,PLAYER>
                        )>
                        <RETURN>
                    )>
                )>
            )(<EQUAL? .KEY <+ .COUNT 49>>
                <CRLF>
                <TELL "Drop " T .OBJ "?">
                <COND (<YES?>
                    <HLIGHT 0>
                    <TELL CR "You dropped ">
                    <HLIGHT ,H-BOLD>
                    <TELL T .OBJ>
                    <HLIGHT 0>
                    <TELL ,PERIOD-CR>
                    <SET QUANTITY <GETP .OBJ ,P?QUANTITY>>
                    <COND (<L? .QUANTITY 0> <REMOVE .OBJ>)>
                    <RETURN>
                )>
            )>
        >
    )>>

<ROUTINE DESCRIBE-INVENTORY ("AUX" COUNT)
    <COND (,CURRENT-CHARACTER
        <SET COUNT <COUNT-POSSESSIONS>>
        <CRLF>
        <TELL "You are carrying " N .COUNT " items">
        <COND (<G? .COUNT 0>
            <TELL ": ">
            <PRINT-CONTAINER ,PLAYER>
        )(ELSE
            <TELL ,PERIOD-CR>
        )>
    )>>

<ROUTINE GAIN-ITEM ("AUX" ITEMS COUNT)
    <SET ITEMS <GETP ,HERE ,P?ITEMS>>
    <COND (.ITEMS
        <SET COUNT <GET .ITEMS 0>>
        <DO (I 1 .COUNT)
            <TAKE-ITEM <GET .ITEMS .I>>
        >
    )>>

<ROUTINE GAIN-MONEY (AMOUNT)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "You gain " N .AMOUNT " " D ,CURRENCY ,PERIOD-CR>
    <HLIGHT 0>
    <SETG MONEY <+ ,MONEY .AMOUNT>>
    <UPDATE-STATUS-LINE>>

<ROUTINE GAIN-STAMINA (POINTS "AUX" DIFF)
    <COND (<L? ,STAMINA ,MAX-STAMINA>
        <SET DIFF <- ,MAX-STAMINA ,STAMINA>>
        <CRLF>
        <SETG STAMINA <+ ,STAMINA .POINTS>>
        <HLIGHT ,H-BOLD>
        <TELL "You gained ">
        <COND (<G? ,STAMINA ,MAX-STAMINA>
            <SETG STAMINA ,MAX-STAMINA>
            <TELL N .DIFF>
        )(ELSE
            <TELL N .POINTS>
        )>
        <TELL " stamina" ,PERIOD-CR>
        <HLIGHT 0>
    )>>

<ROUTINE GET-ITEM (ITEM "OPT" CONTAINER "AUX" ITEMS COUNT)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <COND(<AND .ITEM <G=? <COUNT-CONTAINER .CONTAINER> 0>>
        <SET COUNT 0>
        <SET ITEMS <FIRST? .CONTAINER>>
        <REPEAT ()
            <COND (.ITEMS
                <COND (<NOT <FSET? .ITEMS ,NDESCBIT>>
                    <INC .COUNT>
                    <COND (<EQUAL? .COUNT .ITEM> <RETURN>)>
                )>
            )(ELSE
                <RETURN>
            )>
            <SET ITEMS <NEXT? .ITEMS>>
        >
        <RETURN .ITEMS>
    )>>

<ROUTINE GIVE-ITEM (ITEM)
    <REMOVE-ITEM .ITEM "gave">>

<ROUTINE LOSE-ITEM (ITEM)
    <REMOVE-ITEM .ITEM "lost">>

<ROUTINE LOSE-STAMINA (DMG MSG STORY)
    <SETG STAMINA <- ,STAMINA .DMG>>
    <COND (<L? ,STAMINA 0> <SETG STAMINA 0>)>
    <UPDATE-STATUS-LINE>
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COND (<L? ,STAMINA 1>
        <TELL .MSG>
        <SETG CONTINUE-TO-CHOICES F>
    )(ELSE
        <PUTP .STORY ,P?DOOM F>
        <TELL "You lost " N .DMG " stamina">
    )>
    <HLIGHT 0>
    <TELL ,PERIOD-CR>
    <RETURN>>

<ROUTINE REMOVE-ITEM (ITEM REASON "AUX" QUANTITY)
    <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "You " .REASON " ">
    <COND (<L? .QUANTITY 0>
        <REMOVE .ITEM>
        <TELL T .ITEM>
    )(ELSE
        <COND (<G? .QUANTITY 0>
            <DEC .QUANTITY>
            <COND (<G? .QUANTITY 0>
                <PUTP .ITEM ,P?QUANTITY .QUANTITY>
            )(ELSE
                <PUTP .ITEM ,P?QUANTITY 1>
                <REMOVE .ITEM>
            )>
        )(ELSE
            <PUTP .ITEM ,P?QUANTITY 1>
            <REMOVE .ITEM>
        )>
        <TELL "a">
        <COND (<FSET? .ITEM ,VOWELBIT> <TELL "n">)>
        <TELL " " D .ITEM>
    )>
    <TELL ,PERIOD-CR>
    <HLIGHT 0>
    <PRESS-A-KEY>
    <RETURN>>

<ROUTINE TAKE-ITEM (ITEM "AUX" QUANTITY)
    <COND (.ITEM
        <CRLF>
        <TELL "[You gained ">
        <HLIGHT ,H-BOLD>
        <TELL A .ITEM>
        <HLIGHT 0>
        <TELL "]" CR>
        <COND (<G=? <COUNT-POSSESSIONS> ,LIMIT-POSSESSIONS>
            <CRLF>
            <TELL "You are carrying too many items" ,PERIOD-CR>
            <DROP-REPLACE-ITEM .ITEM>
        )(ELSE
            ; "check if object has the QUANTITY property"
            <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
            <COND (<L? .QUANTITY 0>
                <COND (<NOT <CHECK-ITEM .ITEM>> <MOVE .ITEM ,PLAYER>)>
            )(ELSE
                <COND (<IN? .ITEM ,PLAYER>
                    <PUTP .ITEM ,P?QUANTITY <+ .QUANTITY 1>>
                )(ELSE
                    <PUTP .ITEM ,P?QUANTITY 1>
                    <MOVE .ITEM ,PLAYER>
                )>
            )>
        )>
    )>>

; "Reset routines"
; ---------------------------------------------------------------------------------------------

<ROUTINE RESET-CONTAINER (CONTAINER "AUX" ITEM NEXT)
    <SET ITEM <FIRST? .CONTAINER>>
    <REPEAT ()
        <COND (<NOT .ITEM> <RETURN>)>
        <SET NEXT <NEXT? .ITEM>>
        <REMOVE .ITEM>
        <SET ITEM .NEXT>
    >>

<ROUTINE RESET-CODEWORDS ()
    <RESET-CONTAINER ,CODEWORDS>>

<ROUTINE RESET-GIVEBAG ()
    <RESET-CONTAINER ,GIVEBAG>>

<ROUTINE RESET-PLAYER ()
    <SETG CURRENT-CHARACTER NONE>
    <SETG MONEY 0>
    <SETG STAMINA 0>
    <SETG MAX-STAMINA 0>
    <RESET-POSSESSIONS>
    <RESET-CODEWORDS>
    <RESET-GIVEBAG>>

<ROUTINE RESET-POSSESSIONS ()
    <RESET-CONTAINER ,PLAYER>>

<ROUTINE RESET-SELECTIONS ()
    <DO (I 1 9) <PUT SELECT-CHOICES .I NONE>>>

<ROUTINE RESET-CHOICES ()
    <SETG CONTINUE-TO-CHOICES T>>

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

; "Gamebook loop routines"
; ---------------------------------------------------------------------------------------------

<ROUTINE QUIT-MSG ()
    <TELL CR "Thanks for playing" ,PERIOD-CR>
    <QUIT>>

<ROUTINE PRINT-ENDING (MESSAGE "OPT" COLOR)
    <COND (<NOT .COLOR> <SET COLOR 1>)>
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COLOR .COLOR 0>
    <TELL .MESSAGE>
    <COLOR 1 0>
    <HLIGHT 0>
    <GAMES-UP>>

<ROUTINE GAMES-UP ("OPT" TEXT "AUX" W)
    <COND (.TEXT <TELL .TEXT CR>)>
    <CRLF>
    <PRINT-GAME-OVER>
    <CRLF>
    <REPEAT PROMPT ()
        <PRINTI "Would you like to RESTART or QUIT? > ">
        <REPEAT ()
            <READLINE>
            <SET W <AND <GETB ,LEXBUF 1> <GET ,LEXBUF 1>>>
            <COND (<EQUAL? .W ,W?RESTART>
                <RESTART>
            )(<EQUAL? .W ,W?QUIT>
                <QUIT-MSG>
            )(T
                <TELL CR "(Please type RESTART or QUIT) > ">
            )>
        >
    >>

; "Gamebook loop"
; ---------------------------------------------------------------------------------------------

<ROUTINE GAME-BOOK ("AUX" KEY CURRENT-LOC)
    <RESET-PLAYER>
    <RESET-OBJECTS>
    <RESET-SELECTIONS>
    <RESET-STORY>
    <CHOOSE-CHARACTER>
    <SETG HERE ,STARTING-POINT>
    <UPDATE-STATUS-LINE>
    <SETG RUN-ONCE T>
    <REPEAT ()
        <CRLF>
        <RESET-CHOICES>
        <CHECK-BACKGROUND>
        <SET CURRENT-LOC ,HERE>
        <GOTO ,HERE>
        <PRINT-SECTION>
        <CHECK-EVENTS>
        <COND (<EQUAL? .CURRENT-LOC ,HERE>
            <CHECK-DOOM>
            <CHECK-VICTORY>
        )>
        <COND (,RUN-ONCE
        )>
        <COND (,CONTINUE-TO-CHOICES
            <SET KEY <PROCESS-STORY>>
            <COND (<EQUAL? .KEY !\q !\Q> <CRLF> <TELL "Are you sure you want to quit the game?"> <COND(<YES?> <RETURN>)>)>
            <COND (<EQUAL? .KEY !\s !\S> <CRLF> <TELL "Save current progress?"> <COND (<YES?> <COND (<NOT <SAVE>> <EMPHASIZE "Save failed."> <PRESS-A-KEY>)>)>)>
            <COND (<EQUAL? .KEY !\r !\R> <CRLF> <TELL "Restore from a previous save?"> <COND (<YES?> <COND (<NOT <RESTORE>> <EMPHASIZE "Restore failed."> <PRESS-A-KEY>)>)>)>
            <COND (<EQUAL? .KEY !\x !\X> <RETURN>)>
        )>
        <UPDATE-STATUS-LINE>
    >>
