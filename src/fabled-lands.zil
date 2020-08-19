<INSERT-FILE "instructions">
<INSERT-FILE "characters">
<INSERT-FILE "monsters">
<INSERT-FILE "objects">
<INSERT-FILE "codewords">
<INSERT-FILE "titles">
<INSERT-FILE "numbers">
<INSERT-FILE "merchants">
<INSERT-FILE "abilities">
<INSERT-FILE "story">

; "GLOBALS"
; ---------------------------------------------------------------------------------------------

<CONSTANT NONE <>>
<CONSTANT F <>>

<CONSTANT LIMIT-POSSESSIONS 12>

<GLOBAL CURRENT-LOC NONE>

; "miscellaneous"
<GLOBAL PERIOD-CR ".|">
<GLOBAL EXCLAMATION-CR "!|">

; "CHOICES"
; ---------------------------------------------------------------------------------------------
<GLOBAL RUN-ONCE F>

<GLOBAL CONTINUE-TO-CHOICES T>
<CONSTANT SELECT-CHOICES <LTABLE NONE NONE NONE NONE NONE NONE NONE NONE NONE>>
<CONSTANT TEMP-LIST <LTABLE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE NONE>>

<CONSTANT R-NONE 0> 
<CONSTANT R-ABILITY 1> ; "tests whether ABILITY exceeds certain score"
<CONSTANT R-TEST-ABILITY 2> ; "test ABILITY versus difficulty roll"
<CONSTANT R-RANDOM 3> ; "rolls a number of dice and choose destination based on threshold"
<CONSTANT R-CODEWORD 4> ; "presence of codeword(s)"
<CONSTANT R-CODEWORDS 5> ; "presence of codeword(s)"
<CONSTANT R-ITEM 6> ; "possession of item (s)"
<CONSTANT R-ALL 7> ; "possession of all these item (s)"
<CONSTANT R-ANY 8> ; "possession of any of the item (s)"
<CONSTANT R-MONEY 9> ; "tests abilility to pay indicated amount"
<CONSTANT R-CODEWORD-ITEM 10> ; "presence of codeword and item"
<CONSTANT R-DISCHARGE 11> ; "discharge a weapon"
<CONSTANT R-TITLES 12> ; "check for presence of titles"
<CONSTANT R-VISITS 13> ; "check if location was visited multiple times"
<CONSTANT R-RANK 14> ; "check if location was visited multiple times"

; "for choices that have no requirements"
<CONSTANT TWO-NONES <LTABLE R-NONE R-NONE>>
<CONSTANT THREE-NONES <LTABLE R-NONE R-NONE R-NONE>>
<CONSTANT FOUR-NONES <LTABLE R-NONE R-NONE R-NONE R-NONE>>
<CONSTANT FIVE-NONES <LTABLE R-NONE R-NONE R-NONE R-NONE R-NONE>>
<CONSTANT SIX-NONES <LTABLE R-NONE R-NONE R-NONE R-NONE R-NONE R-NONE>>
<CONSTANT EIGHT-NONES <LTABLE R-NONE R-NONE R-NONE R-NONE R-NONE R-NONE R-NONE R-NONE>>

; "ABILITIES"
; ---------------------------------------------------------------------------------------------

; "ability types"
<CONSTANT ABILITY-CHARISMA 1>
<CONSTANT ABILITY-COMBAT 2>
<CONSTANT ABILITY-MAGIC 3>
<CONSTANT ABILITY-SANCTITY 4>
<CONSTANT ABILITY-SCOUTING 5>
<CONSTANT ABILITY-THIEVERY 6>

; "computed abilities"
<CONSTANT ABILITY-DEFENSE 7>
<CONSTANT ABILITY-STAMINA 8>

; "ability labels"
<CONSTANT ABILITIES <LTABLE "CHARISMA" "COMBAT" "MAGIC" "SANCTITY" "SCOUTING" "THIEVERY" "DEFENSE" "STAMINA">>

; "Give results"
<CONSTANT GIVE-GIVEN 0>
<CONSTANT GIVE-UNABLE 1>
<CONSTANT GIVE-UNWILLING 2>

; "PLAYER / CHARACTER / NPC"
; ---------------------------------------------------------------------------------------------

; "Player Globals"

<GLOBAL CURRENT-VEHICLE NONE>
<GLOBAL MONEY 0>
<GLOBAL MAX-STAMINA 9>
<GLOBAL STAMINA 0>

; "Current Character"
<GLOBAL CURRENT-CHARACTER NONE>

; "GOD worshipped"
<GLOBAL GOD NONE>

; "resurrection arrangment"
<GLOBAL RESURRECTION-ARRANGEMENTS NONE>

; "object to refer to all of your money"
<OBJECT ALL-MONEY (DESC "all your money") (FLAGS TAKEBIT NDESCBIT)>

; "container for blessings"
<OBJECT BLESSINGS (DESC "Blessings") (FLAGS CONTBIT OPENBIT)>

; "container for codewords"
<OBJECT CODEWORDS (DESC "Codewords") (FLAGS CONTBIT OPENBIT)>

; "diseases and aliments"
<OBJECT AILMENTS (DESC "Ailments") (FLAGS CONTBIT OPENBIT)>

; "container for items given"
<OBJECT GIVEBAG (DESC "items to give") (FLAGS CONTBIT OPENBIT)>

; "container for titles and honours acquired"
<OBJECT TITLES-AND-HONOURS (DESC "Titles and Honours") (FLAGS CONTBIT OPENBIT)>

; "container for vehicles owned"
<OBJECT VEHICLES (DESC "vehicles") (FLAGS CONTBIT OPENBIT)>

; "Character Object Properties"
<PROPDEF CHARISMA NONE>
<PROPDEF COMBAT NONE>
<PROPDEF MAGIC NONE>
<PROPDEF SANCTITY NONE>
<PROPDEF SCOUTING NONE>
<PROPDEF THIEVERY NONE>
<PROPDEF RANK NONE>
<PROPDEF PROFESSION NONE>

; "Computed Statistics"
<PROPDEF DEFENSE NONE>
<PROPDEF STAMINA NONE>

; "NON-PERSON OBJECTS"
; ---------------------------------------------------------------------------------------------

; "Properties"
<PROPDEF QUANTITY NONE>
<PROPDEF CHARGES NONE>
<PROPDEF STARS NONE>
<PROPDEF STATUS NONE>
<PROPDEF EFFECTS NONE>

; "STORY"
; ---------------------------------------------------------------------------------------------

; "Properties"
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
<PROPDEF BLESSINGS NONE> ; "blessings gained"
<PROPDEF TITLES NONE> ; "titles and honours gained"
<PROPDEF VISITS NONE>
<PROPDEF DOOM F> ; "section ends in doom for the player"
<PROPDEF VICTORY F> ; "section ends in victory for the player"

; "Gamebook Engine Routines"
; ---------------------------------------------------------------------------------------------

; "generic D6 roller"
<ROUTINE ROLL-DICE ("OPT" DIE "AUX" RESULT)
    <SET RESULT 0>
    <COND (<NOT .DIE> <SET DIE 1>)>
    <DO (I 1 .DIE)
        <SET RESULT <+ .RESULT <RANDOM 6>>>
    >
    <RETURN .RESULT>>

; "Story Routines - print story, process choices, triggers"
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
        <COND (,RESURRECTION-ARRANGEMENTS
            <RESET-CONTAINER ,PLAYER>
            <SETG ,STAMINA ,MAX-STAMINA>
            <MOVE ,ALL-MONEY ,PLAYER>
            <SETG ,MONEY 0>
            <STORY-JUMP <GETP ,RESURRECTION-ARRANGEMENTS ,P?CONTINUE>>
            <SETG ,RESURRECTION-ARRANGEMENTS NONE>
        )(ELSE
            <PRINT-ENDING BAD-ENDING 3>
        )>
        <SETG CONTINUE-TO-CHOICES F>
    )>>

<ROUTINE CHECK-EVENTS ("AUX" EVENTS)
    <SET EVENTS <GETP ,HERE ,P?EVENTS>>
    <COND (.EVENTS <APPLY .EVENTS>)>>

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

<ROUTINE CODEWORD-JUMP (CODEWORD STORY)
	<COND (<CHECK-CODEWORD .CODEWORD> <STORY-JUMP .STORY>)>>

<ROUTINE GAIN-BLESSINGS ("OPT" BLESSINGS)
    <COND (<NOT .BLESSINGS> <SET BLESSINGS <GETP ,HERE ,P?BLESSINGS>>)>
    <GAIN-OBJECTS .BLESSINGS GAIN-BLESSING>>

<ROUTINE GAIN-CODEWORDS ("OPT" CODEWORDS)
    <COND (<NOT .CODEWORDS> <SET CODEWORDS <GETP ,HERE ,P?CODEWORDS>>)>
    <GAIN-OBJECTS .CODEWORDS GAIN-CODEWORD>>

<ROUTINE GAIN-ITEMS ("OPT" ITEMS)
    <COND (<NOT .ITEMS> <SET ITEMS <GETP ,HERE ,P?ITEMS>>)>
    <GAIN-OBJECTS .ITEMS TAKE-ITEM>>

<ROUTINE GAIN-OBJECTS (OBJECTS GAIN-ROUTINE "AUX" COUNT)
    <COND (<NOT .OBJECTS> <RETURN>)>
    <COND (.OBJECTS
        <SET COUNT <GET .OBJECTS 0>>
        <DO (I 1 .COUNT)
            <APPLY .GAIN-ROUTINE <GET .OBJECTS .I>>
        >
    )>>

<ROUTINE GAIN-TITLES ("OPT" TITLES)
    <COND (<NOT .TITLES> <SET TITLES <GETP ,HERE ,P?TITLES>>)>
    <GAIN-OBJECTS .TITLES GAIN-TITLE>>

<ROUTINE IF-ALIVE (TEXT)
    <COND (<IS-ALIVE> <TELL CR .TEXT CR>)>>

<ROUTINE IS-ALIVE ("OPT" THRESHOLD)
    <COND (<NOT .THRESHOLD> <SET THRESHOLD 0>)>
    <COND (<G? ,STAMINA .THRESHOLD> <RTRUE>)>
    <RFALSE>>

<ROUTINE ITEM-JUMP (ITEM STORY)
	<COND (<CHECK-ITEM .ITEM> <STORY-JUMP .STORY>)>>

<ROUTINE MARK-VISITS ("OPT" SECTION VISITS)
    <COND (<NOT .SECTION> <SET SECTION ,HERE>)>
    <SET VISITS <GETP .SECTION ,P?VISITS>>
    <COND (.VISITS
        <INC .VISITS>
        <PUTP .SECTION ,P?VISITS .VISITS>
    )>>

<ROUTINE PREVENT-DEATH ("OPT" STORY)
	<COND (<NOT .STORY> <SET STORY ,HERE>)>
	<COND (<GETP .STORY ,P?DOOM> <PUTP .STORY ,P?DOOM F>)>>

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
        <REPEAT ()
            <SET KEY <INPUT 1>>
            <COND (
                <OR
                    <AND <G=? .KEY !\1> <L=? .KEY !\9>>
                    <AND <G=? .KEY !\A> <L=? .KEY !\J> <G? <GET .CHOICES 0> 9>>
                    <AND <G=? .KEY !\a> <L=? .KEY !\j> <G? <GET .CHOICES 0> 9>>
                    <AND <EQUAL? .KEY !\C !\c> <L? <GET .CHOICES 0> 12>>
                    <AND <EQUAL? .KEY !\H !\h> <L? <GET .CHOICES 0> 17>>
                    <AND <EQUAL? .KEY !\I !\i> <L? <GET .CHOICES 0> 18>>
                    <EQUAL? .KEY !\? !\Q !\q !\R !\r !\S !\s>
                >
                <RETURN>
            )>
        >
        <COND (
            <OR
                <AND <G=? .KEY !\1> <L=? .KEY !\9>>
                <AND <G=? .KEY !\A> <L=? .KEY !\J> <G? <GET .CHOICES 0> 9>>
                <AND <G=? .KEY !\a> <L=? .KEY !\j> <G? <GET .CHOICES 0> 9>>
            >
            <COND (<AND <G=? .KEY !\1> <L=? .KEY !\9>> <SET CHOICE <- .KEY !\0>>)>
            <COND (<AND <G=? .KEY !\A> <L=? .KEY !\J>> <SET CHOICE <+ <- .KEY !\A> 10>>)>
            <COND (<AND <G=? .KEY !\a> <L=? .KEY !\j>> <SET CHOICE <+ <- .KEY !\a> 10>>)>
            <COND (<AND <G=? <GET .CHOICES 0> 1> <L=? .CHOICE <GET .CHOICES 0>>>
                <COND (.REQUIREMENTS <SET LIST <GET .REQUIREMENTS .CHOICE>>)>
                <COND (<AND <G=? .CHOICE 1> <L=? .CHOICE <GET .DESTINATIONS 0>> <L=? .CHOICE <GET .TYPES 0>>>
                    <SET TYPE <GET .TYPES .CHOICE>>
                    <COND (<EQUAL? .TYPE R-NONE>
                        <SETG HERE <GET .DESTINATIONS .CHOICE>>
                        <CRLF>
                    )(<AND <EQUAL? .TYPE R-TEST-ABILITY> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <CRLF><CRLF>
                        <COND (<TEST-ABILITY ,CURRENT-CHARACTER <GET .LIST 1> <GET .LIST 2> T>
                            <SETG HERE <GET <GET .DESTINATIONS .CHOICE> 1>>
                        )(ELSE
                            <SETG HERE <GET <GET .DESTINATIONS .CHOICE> 2>>
                        )>
                        <CRLF>
                    )(<AND <EQUAL? .TYPE R-CODEWORD> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <COND (<CHECK-CODEWORD .LIST>
                            <SETG HERE <GET .DESTINATIONS .CHOICE>>
                            <CRLF>
                        )(ELSE
                            <HLIGHT ,H-BOLD>
                            <CRLF><CRLF>
                            <TELL "You do not have " T .LIST " codeword" ,EXCLAMATION-CR>
                            <HLIGHT 0>
                            <PRESS-A-KEY>
                        )>
                    )(<AND <EQUAL? .TYPE R-CODEWORDS> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <COND (<CHECK-CODEWORDS .LIST>
                            <SETG HERE <GET .DESTINATIONS .CHOICE>>
                            <CRLF>
                        )(ELSE
                            <NOT-ALL-ANY R-ALL .LIST ,CODEWORDS>
                        )>
                    )(<AND <EQUAL? .TYPE R-ITEM> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <COND (<CHECK-ITEM .LIST>
                            <SETG HERE <GET .DESTINATIONS .CHOICE>>
                            <CRLF>
                        )(ELSE
                            <NOT-POSSESSED .LIST>
                        )>
                    )(<AND <OR <EQUAL? .TYPE R-DISCHARGE> <EQUAL? .TYPE R-ITEM>> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <COND (<CHECK-ITEM .LIST>
                            <COND (<CHECK-CHARGES .LIST>
                                <COND (<EQUAL? .TYPE R-DISCHARGE> <DISCHARGE-ITEM .LIST 1>)>
                                <SETG HERE <GET .DESTINATIONS .CHOICE>>
                                <CRLF>
                            )(ELSE
                                <NOT-CHARGED <GET .REQUIREMENTS .CHOICE>>
                            )>
                        )(ELSE
                            <HLIGHT ,H-BOLD>
                            <CRLF><CRLF>
                            <TELL "You do not have ">
                            <COND (<FSET? .LIST ,NARTICLEBIT>
                                <TELL "the">
                            )(ELSE
                                <TELL "a">
                                <COND (<FSET? .LIST ,VOWELBIT> <TELL "n">)>
                            )>
                            <TELL " " D .LIST ,EXCLAMATION-CR>
                            <HLIGHT 0>
                            <PRESS-A-KEY>
                        )>
                    )(<AND <EQUAL? .TYPE R-CODEWORD-ITEM> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <COND (<AND <CHECK-CODEWORD <GET .LIST 1>> <CHECK-ITEM <GET .LIST 2>>>
                            <SETG HERE <GET .DESTINATIONS .CHOICE>>
                            <CRLF>
                        )(ELSE
                            <HLIGHT ,H-BOLD>
                            <CRLF><CRLF>
                            <TELL "You do not have " T <GET .LIST 1> " codeword or ">
                            <COND (<FSET? <GET .LIST 2> ,NARTICLEBIT>
                                <TELL "the">
                            )(<FSET? <GET .LIST 2> ,VOWELBIT>
                                <TELL "an">
                            )(ELSE
                                <TELL "a">
                            )>
                            <TELL " " D <GET .LIST 2> ,EXCLAMATION-CR>
                            <HLIGHT 0>
                            <PRESS-A-KEY>
                        )>
                    )(<AND <EQUAL? .TYPE R-MONEY> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <COND (<CHECK-MONEY .LIST>
                            <SETG HERE <GET .DESTINATIONS .CHOICE>>
                            <CRLF>
                            <COND (<G? .LIST 0>
                                <COST-MONEY .LIST "paid">
                                <PRESS-A-KEY>
                            )>
                        )>
                    )(<AND <EQUAL? .TYPE R-RANK> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <COND (<CHECK-RANK .LIST>
                            <SETG HERE <GET .DESTINATIONS .CHOICE>>
                            <CRLF>
                        )>
                    )(<AND <EQUAL? .TYPE R-RANDOM> .REQUIREMENTS <L=? .CHOICE <GET .REQUIREMENTS 0>>>
                        <SETG HERE <PROCESS-RANDOM .LIST <GET .DESTINATIONS .CHOICE>>>
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
        <COND (<OR <AND <G=? .KEY !\A> <L=? .KEY !\Z>> <AND <G=? .KEY !\a> <L=? .KEY !\z>>>
            <COND (<AND <G=? .KEY !\A> <L=? .KEY !\Z> <G=? <GET .CHOICES 0> <+ <- .KEY !\A> 10>> <SPECIAL-INTERRUPT-ROUTINE .KEY>> <RETURN>)>
            <COND (<AND <G=? .KEY !\a> <L=? .KEY !\z> <G=? <GET .CHOICES 0> <+ <- .KEY !\a> 10>> <SPECIAL-INTERRUPT-ROUTINE .KEY>> <RETURN>)>
        )>
        <COND (<EQUAL? .KEY !\? !\q !\Q !\r !\R !\s !\S> <CRLF> <RETURN>)>
        <COND (<AND <EQUAL? .KEY !\c !\C> <L? <GET .CHOICES 0> 12>> <CRLF> <RETURN>)>
        <COND (<AND <EQUAL? .KEY !\h !\H> <L? <GET .CHOICES 0> 17>> <CRLF> <RETURN>)>
        <COND (<AND <EQUAL? .KEY !\i !\I> <L? <GET .CHOICES 0> 18>> <CRLF> <RETURN>)>
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
            <SET COUNT <GET .CHOICES 0>>
            <DO (I 1 .COUNT)
                <SET CHOICE-TYPE <GET .TYPES .I>>
                <COND (.REQUIREMENTS <SET LIST <GET .REQUIREMENTS .I>>)>
                <HLIGHT ,H-BOLD>
                <COND (<L? .I 10>
                    <TELL N .I> 
                )(ELSE
                    <TELL C <+ !\A <- .I 10>>>
                )>
                <TELL ") ">
                <HLIGHT 0>
                <TELL <GET .CHOICES .I>>
                <COND (<AND <EQUAL? .CHOICE-TYPE ,R-TEST-ABILITY> .REQUIREMENTS> <TELL " (Difficulty: "> <HLIGHT ,H-BOLD> <TELL N <GET .LIST 2>> <HLIGHT 0> <TELL")">)>
                <COND (<AND <EQUAL? .CHOICE-TYPE ,R-ITEM ,R-CODEWORD ,R-DISCHARGE> .REQUIREMENTS> <TELL " ("> <COND (<EQUAL? .CHOICE-TYPE ,R-ITEM ,R-DISCHARGE> <HLIGHT ,H-BOLD>)(ELSE <HLIGHT ,H-ITALIC>)> <TELL D .LIST> <HLIGHT 0> <TELL ")">)>
                <COND (<AND <EQUAL? .CHOICE-TYPE ,R-CODEWORD-ITEM> .REQUIREMENTS> <TELL " ("> <HLIGHT ,H-ITALIC> <TELL D <GET .LIST 1>> <HLIGHT 0> <TELL " and "> <HLIGHT ,H-BOLD> <TELL D <GET .LIST 2>> <HLIGHT 0> <TELL ")">)>
                <COND (<AND <EQUAL? .CHOICE-TYPE R-MONEY> .REQUIREMENTS> <COND (<G? .LIST 0> <TELL " (" N .LIST " " D ,CURRENCY ")">)>)>
                <COND (<AND <EQUAL? .CHOICE-TYPE R-RANK> .REQUIREMENTS> <COND (<G? .LIST 0> <TELL " (Rank "> <HLIGHT ,H-BOLD> <TELL N .LIST> <HLIGHT 0> <TELL ")">)>)>
                <COND (<AND <EQUAL? .CHOICE-TYPE R-ANY> .REQUIREMENTS> <PRINT-ANY .LIST>)>
                <COND (<AND <EQUAL? .CHOICE-TYPE R-ALL> .REQUIREMENTS> <PRINT-ALL .LIST>)>
                <COND (<AND <EQUAL? .CHOICE-TYPE R-VISITS> .REQUIREMENTS> <COND (<G? .LIST 0> <TELL " (visited > " N .LIST " times)">)>)>
                <CRLF>
            >
            <SET CHOICE <PROCESS-CHOICES .CHOICES>>
            <COND (.CHOICE
                <COND (<AND <G=? .CHOICE !\A> <L=? .CHOICE !\Z> <G=? <GET .CHOICES 0> <+ <- .CHOICE !\A> 10>>> <SET .CHOICE NONE> <RETURN>)>
                <COND (<AND <G=? .CHOICE !\a> <L=? .CHOICE !\z> <G=? <GET .CHOICES 0> <+ <- .CHOICE !\a> 10>>> <SET .CHOICE NONE> <RETURN>)>
                <RETURN>
            )>
        >
        <COND (<EQUAL? .CURRENT-LOC ,HERE> <SETG RUN-ONCE F>)>
        <RETURN .CHOICE>
    )(.CONTINUE
        <SETG HERE .CONTINUE>
        <PRESS-A-KEY>
        <RETURN>
    )>
    <RETURN !\x>>

<ROUTINE STORY-JUMP (STORY)
    <COND (.STORY
        <SETG HERE .STORY>
        <SETG CONTINUE-TO-CHOICES F>
        <PRESS-A-KEY>
    )>>

<ROUTINE TITLE-JUMP (TITLE STORY "AUX")
	<COND (<CHECK-TITLE .TITLE> <STORY-JUMP .STORY>)>>

<ROUTINE TITLES-JUMP (TITLES STORY "AUX")
	<COND (<CHECK-TITLES .TITLES> <STORY-JUMP .STORY>)>>

; "Story - Choice Requirements Validations"
; ---------------------------------------------------------------------------------------------

<ROUTINE CHECK-AILMENTS (DISEASE)
    <COND (<NOT .DISEASE> <RTRUE>)>
    <RETURN <IN? .DISEASE ,AILMENTS>>>

<ROUTINE CHECK-ALL (ITEMS "OPT" CONTAINER "AUX" COUNT)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <COND (.ITEMS
        <SET COUNT <GET .ITEMS 0>>
        <DO (I 1 .COUNT)
            <COND (<NOT <IN? <GET .ITEMS .I> .CONTAINER>> <RFALSE>)>
        >
    )>
    <RTRUE>>

<ROUTINE CHECK-ANY (ITEMS "OPT" CONTAINER "AUX" COUNT)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <COND (.ITEMS
        <SET COUNT <GET .ITEMS 0>>
        <DO (I 1 .COUNT)
            <COND (<IN? <GET .ITEMS .I> .CONTAINER> <RTRUE>)>
        >
        <RFALSE>
    )>
    <RTRUE>>

<ROUTINE CHECK-BLESSING (BLESS)
    <COND (<NOT .BLESS> <RTRUE>)>
    <RETURN <IN? .BLESS ,BLESSINGS>>>

<ROUTINE CHECK-CHARGES (ITEM "AUX" CHARGES)
    <COND (<NOT .ITEM> <RTRUE>)>
    <SET CHARGES <GETP .ITEM ,P?CHARGES>>
    <COND (<L? .CHARGES 0>
        <RTRUE>
    )(<G? .CHARGES 0>
        <RTRUE>
    )>
    <RFALSE>>

<ROUTINE CHECK-CODEWORD (CODEWORD)
    <COND (<NOT .CODEWORD> <RTRUE>)>
    <RETURN <IN? .CODEWORD ,CODEWORDS>>>

<ROUTINE CHECK-CODEWORDS (CODEWORDS)
    <RETURN <CHECK-ALL .CODEWORDS ,CODEWORDS>>>

<ROUTINE CHECK-ITEM (ITEM "AUX" QUANTITY)
    <COND (<NOT .ITEM> <RTRUE>)>
    <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
    <COND (<L? .QUANTITY 0>
        <RETURN <IN? .ITEM ,PLAYER>>
    )(ELSE
        <RETURN <AND <IN? .ITEM ,PLAYER> <G? .QUANTITY 0>>>
    )>>

<ROUTINE CHECK-MONEY (AMOUNT)
    <COND (<OR <AND <G? .AMOUNT 0> <L? ,MONEY .AMOUNT>> <L=? ,MONEY 0>>
        <CRLF><CRLF>
        <HLIGHT ,H-BOLD>
        <TELL "You do not have enough " D ,CURRENCY ,PERIOD-CR>
        <HLIGHT 0>
        <PRESS-A-KEY>
        <RFALSE>
    )>
    <RTRUE>>

<ROUTINE CHECK-RANK (LEVEL "OPT" CHARACTER "AUX" RANK)
    <COND (<NOT .CHARACTER> <SET CHARACTER ,CURRENT-CHARACTER>)>
    <SET RANK <GETP .CHARACTER ,P?RANK>>
    <COND (<AND .RANK <G=? .RANK .LEVEL>>
        <RTRUE>
    )(ELSE
        <CRLF><CRLF>
        <HLIGHT ,H-BOLD>
        <TELL "Your Rank is not high enough" ,EXCLAMATION-CR>
        <HLIGHT 0>
        <PRESS-A-KEY>
    )>
    <RFALSE>>

<ROUTINE CHECK-STAMINA (AMOUNT)
    <COND (<G? .AMOUNT 0>
        <COND (<L=? ,STAMINA .AMOUNT>
            <CRLF><CRLF>
            <HLIGHT ,H-BOLD>
            <TELL "You'll die if you do that" ,EXCLAMATION-CR>
            <HLIGHT 0>
            <PRESS-A-KEY>
            <RFALSE>
        )>
    )>
    <RTRUE>>

<ROUTINE CHECK-TITLE (TITLE)
    <COND (<NOT .TITLE> <RTRUE>)>
    <RETURN <IN? .TITLE ,TITLES-AND-HONOURS>>>

<ROUTINE CHECK-TITLES (TITLES "AUX" COUNT)
    <SET COUNT <GET .TITLES 0>>
    <DO (I 1 .COUNT)
        <COND (<NOT <CHECK-TITLE <GET .TITLES .I>>> <RFALSE>)>
    >
    <RTRUE>>

<ROUTINE CHECK-VEHICLE (RIDE)
	<COND (<OR <IN? .RIDE ,VEHICLES> <AND ,CURRENT-VEHICLE <EQUAL? ,CURRENT-VEHICLE .RIDE>>> <RTRUE>)>
	<RFALSE>>

<ROUTINE CHECK-VISITS-EQUAL ("OPT" LOCATION COUNTER "AUX" VISITS)
    <COND (<NOT .LOCATION> <SET LOCATION ,HERE>)>
    <COND (<NOT .COUNTER> <SET .COUNTER 1>)>
    <SET VISITS <GETP .LOCATION ,P?VISITS>>
    <COND (.VISITS
        <RETURN <EQUAL? .VISITS .COUNTER>>
    )>
    <RFALSE>>

<ROUTINE CHECK-VISITS-MORE ("OPT" LOCATION COUNTER "AUX" VISITS)
    <COND (<NOT .LOCATION> <SET LOCATION ,HERE>)>
    <COND (<NOT .COUNTER> <SET .COUNTER 1>)>
    <SET VISITS <GETP .LOCATION ,P?VISITS>>
    <COND (.VISITS <RETURN <G? .VISITS .COUNTER>>)>
    <RFALSE>>

<ROUTINE NOT-ALL-ANY (TYPE LIST "OPT" CONTAINER "AUX" COUNT)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <COND (<EQUAL? .TYPE R-ANY R-ALL>
        <SET COUNT <GET .LIST 0>>
        <HLIGHT ,H-BOLD>
        <CRLF>
        <TELL CR "You do not have ">
        <COND (<G? .COUNT 1>
            <COND (<EQUAL? .TYPE R-ANY>
                <TELL "any">
            )(<EQUAL? .TYPE R-ALL>
                <TELL "all">
            )>
            <TELL " of the">
        )(<EQUAL? .CONTAINER ,CODEWORDS>
            <TELL "the">
        )(<FSET? <GET .LIST 1> ,VOWELBIT>
            <TELL "an">
        )(ELSE
            <TELL "a">
        )>
        <TELL " ">
        <COND (<EQUAL? .CONTAINER ,CODEWORDS>
            <TELL "codeword">
            <COND (<G? .COUNT 1>
                <TELL "s">
                <HLIGHT 0>
                <PRINT-CODEWORDS .LIST>
            )(ELSE
                <TELL " ">
                <HLIGHT 0>
                <HLIGHT ,H-ITALIC>
                <TELL D <GET .LIST 1>>
                <HLIGHT 0>
                <TELL ,PERIOD-CR>
            )>
        )(ELSE
            <COND (<G? .COUNT 1>
                <TELL "items">
                <HLIGHT 0>
                <COND (<EQUAL? .TYPE R-ANY>
                    <PRINT-ANY .LIST>
                )(<EQUAL? .TYPE R-ALL>
                    <PRINT-ALL .LIST>
                )>
            )(ELSE
                <HLIGHT 0>
                <HLIGHT ,H-ITALIC>
                <TELL D <GET .LIST 1>>
                <HLIGHT 0>
                <TELL ,PERIOD-CR>
            )>
        )>
        <HLIGHT 0>
        <CRLF>
        <PRESS-A-KEY>
    )>>

<ROUTINE NOT-CHARGED (OBJECT)
    <CRLF><CRLF>
    <HLIGHT ,H-BOLD>
    <TELL CT .OBJECT " has no charges left" ,PERIOD-CR>
    <HLIGHT 0>
    <PRESS-A-KEY>>

<ROUTINE NOT-POSSESSED (OBJECT)
    <HLIGHT ,H-BOLD>
    <CRLF><CRLF>
    <TELL "You do not have ">
    <COND (<FSET? .OBJECT ,NARTICLEBIT>
        <TELL "the">
    )(ELSE
        <TELL "a">
        <COND (<FSET? .OBJECT ,VOWELBIT> <TELL "n">)>
    )>
    <TELL " " D .OBJECT ,EXCLAMATION-CR>
    <HLIGHT 0>
    <PRESS-A-KEY>>

<ROUTINE PROCESS-RANDOM (ODDS DESTINATIONS "AUX" EVENTS RESULT (DESTINATION NONE))
    <SET EVENTS <- <GET .ODDS 0> 1>>
    <SET DESTINATION ,HERE>
    <COND (<G? .EVENTS 0>
        <CRLF>
        <CRLF>
        <TELL "Triggering random event with " N .EVENTS " possible outcomes .." ,PERIOD-CR>
        <PRESS-A-KEY>
        <SET RESULT <ROLL-DICE <GET .ODDS 1>>>
        <CRLF>
        <TELL "You rolled " N .RESULT ".">
        <DO (I 1 .EVENTS)
            <COND (<L=? .RESULT <GET .ODDS <+ .I 1>>>
                <SET DESTINATION <GET .DESTINATIONS .I>>
                <RETURN>
            )>
        >
    )>
    <RETURN .DESTINATION>>

; "Story - Support Routines (display)"
; ---------------------------------------------------------------------------------------------

<ROUTINE PRINT-ALL (ITEMS)
    <PRINT-LIST .ITEMS "and ">>

<ROUTINE PRINT-ANY (ITEMS)
    <PRINT-LIST .ITEMS "or ">>

<ROUTINE PRINT-CODEWORDS (CODEWORDS)
    <PRINT-LIST .CODEWORDS "and ">>

<ROUTINE PRINT-LIST (ITEMS "OPT" LASTFIX "AUX" COUNT)
    <COND (.ITEMS
        <SET COUNT <GET .ITEMS 0>>
        <COND (<G? .COUNT 0>
            <TELL " (">            
            <DO (I 1 .COUNT)
                <COND (<G? .I 1>
                    <COND (<NOT <EQUAL? .COUNT 2>>
                        <TELL ", ">
                    )(ELSE
                        <TELL " ">
                    )>
                )> 
                <COND (<AND <G? .COUNT 1> <EQUAL? .I .COUNT> .LASTFIX> <TELL .LASTFIX>)>
                <HLIGHT ,H-ITALIC>
                <TELL D <GET .ITEMS .I>>
                <HLIGHT 0>
            >
            <TELL ")">
        )>
    )>>

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
                <COND (<OR <AND <G=? .KEY !\1> <L=? .KEY !\9> <L=? <- .KEY !\0> .COUNT>> <EQUAL? .KEY !\C !\c !\R !\r>> <RETURN>)>
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
    <CRLF><CRLF>
    <TELL ,INSTRUCTIONS-PROFESSIONS>
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

<ROUTINE DESCRIBE-CHARACTER (CHARACTER "AUX" COUNT ITEM POSSESSIONS)
    <COND (.CHARACTER
        <CRLF>
        <HLIGHT ,H-BOLD>
        <TELL CT .CHARACTER CR>
        <HLIGHT 0>
        <COND (<GETP .CHARACTER ,P?LDESC>
            <CRLF>
            <TELL <GETP .CHARACTER ,P?LDESC> ,PERIOD-CR>
        )>
        <DESCRIBE-PLAYER-STATS .CHARACTER .CHARACTER>
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
                    <COND (<G? .I 1> <TELL ", ">)>
                    <PRINT-ITEM .ITEM F 0>
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

<ROUTINE PRINT-CONTAINER (CONTAINER "AUX" COUNT ITEMS)
    <COUNT-CONTAINER .CONTAINER>
    <SET COUNT 0>
    <SET ITEMS <FIRST? .CONTAINER>>
    <COND (.ITEMS
        <REPEAT ()
            <COND (.ITEMS
                <COND (<NOT <FSET? .ITEMS ,NDESCBIT>>
                    <PRINT-ITEM .ITEMS F .COUNT>
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

<ROUTINE TRANSFER-CONTAINER (FROM TO "AUX" ITEM NEXT)
    <COND (<COUNT-CONTAINER .FROM>
        <SET ITEM <FIRST? .FROM>>
        <REPEAT ()
            <COND (<NOT .ITEM> <RETURN>)>
            <SET NEXT <NEXT? .ITEM>>
            <MOVE .ITEM .TO>
            <SET ITEM .NEXT>
        >
    )>>

; "Player or Item routines"
; ---------------------------------------------------------------------------------------------

<ROUTINE AFFLICTED-WITH (DISEASE)
    <COND (<NOT <CHECK-AILMENTS .DISEASE>>
        <CRLF>
        <TELL "You are infected with the ">
        <PRINT-ITEM .DISEASE T>
        <TELL ,PERIOD-CR>
        <MOVE .DISEASE ,AILMENTS>
    )>>

<ROUTINE ADD-QUANTITY (OBJECT "OPT" AMOUNT CONTAINER "AUX" QUANTITY CURRENT)
	<COND (<NOT .OBJECT> <RETURN>)>
	<COND (<L=? .AMOUNT 0> <RETURN>)>
	<COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
	<COND (<EQUAL? .CONTAINER ,PLAYER>
		<DO (I 1 .AMOUNT)
			<TAKE-ITEM .OBJECT>
		>
	)(ELSE
		<SET CURRENT <GETP .OBJECT ,P?QUANTITY>>
		<SET QUANTITY <+ .CURRENT .AMOUNT>>
		<PUTP .OBJECT ,P?QUANTITY .QUANTITY>
	)>>

<ROUTINE BUY-STUFF (ITEM PLURAL PRICE "OPT" LIMIT "AUX" QUANTITIES)
	<COND (<NOT .LIMIT> <SET LIMIT 8>)>
	<COND (<G=? ,MONEY .PRICE>
		<CRLF>
		<TELL "Buy " D .ITEM " for " N .PRICE " " D ,CURRENCY " each?">
		<COND (<YES?>
			<REPEAT ()
				<SET QUANTITIES <GET-NUMBER "How many will you buy" 0 .LIMIT>>
				<COND (<G? .QUANTITIES 0>
					<COND (<L=? <* .QUANTITIES .PRICE> ,MONEY>
						<CRLF>
						<HLIGHT ,H-BOLD>
						<TELL "You purchased " N .QUANTITIES " ">
						<COND (<G? .QUANTITIES 1> <TELL .PLURAL>)(ELSE <TELL D .ITEM>)>
						<TELL ,PERIOD-CR>
						<COST-MONEY <* .QUANTITIES .PRICE>>
						<ADD-QUANTITY .ITEM .QUANTITIES>
						<COND (<L? ,MONEY .PRICE> <RETURN>)>
					)(ELSE
						<EMPHASIZE "You can't afford that!">
					)>
				)(ELSE
					<RETURN>
				)>
			>
		)>
	)>>

<ROUTINE COST-MONEY (COST "OPT" REASON)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "You ">
    <COND (.REASON
        <TELL .REASON>
    )(ELSE
        <TELL "are charged">
    )> 
    <TELL " " N .COST " " D ,CURRENCY ,PERIOD-CR>
    <HLIGHT 0>
    <SETG MONEY <- ,MONEY .COST>>
    <COND (<L? ,MONEY 0> <SETG MONEY 0>)>
    <UPDATE-STATUS-LINE>>

<ROUTINE COUNT-BLESSINGS (ITEM "AUX" (ITEMS 0) (BLESSINGS 0) (PROPERTY NONE))
    <COND (.ITEM
        <SET ITEMS <GET ,ABILITIES 0>>
        <DO (I 1 .ITEMS)
            <SET PROPERTY <GET-ABILITY-PROPERTY .I>>
            <COND (<AND .PROPERTY <G? <GETP .ITEM .PROPERTY> 0>> <INC .BLESSINGS>)> 
        >
    )>
    <RETURN .BLESSINGS>>

<ROUTINE COUNT-POSSESSIONS ()
    <RETURN <COUNT-CONTAINER ,PLAYER>>>

<ROUTINE DELETE-BLESSING (BLESSING)
    <DELETE-OBJECT .BLESSING CHECK-BLESSING "blessing of">>

<ROUTINE DELETE-CODEWORD (CODEWORD)
    <DELETE-OBJECT .CODEWORD CHECK-CODEWORD "codeword">>

<ROUTINE DELETE-TITLE (TITLE)
    <DELETE-OBJECT .TITLE CHECK-TITLE "title of">>

<ROUTINE DELETE-OBJECT (OBJECT CHECK-ROUTINE DESCRIPTION "OPT" (RENDER H-BOLD))
	<COND (<AND .OBJECT <APPLY .CHECK-ROUTINE .OBJECT>>
		<CRLF>
		<TELL "You lose the " .DESCRIPTION " ">
		<HLIGHT .RENDER>
		<TELL D .OBJECT>
		<HLIGHT 0>
		<TELL ,PERIOD-CR>
		<REMOVE .OBJECT>
	)>>

<ROUTINE DISCHARGE-ITEM (ITEM "OPT" AMOUNT "AUX" (CHARGES 0))
	<SET CHARGES <GETP .ITEM ,P?CHARGES>>
	<COND (<G? .CHARGES 0>
        <COND (<NOT .AMOUNT> <SET AMOUNT 1>)>
		<SET CHARGES <- .CHARGES .AMOUNT>>
		<COND (<L? .CHARGES 1> <SET CHARGES 0>)>
		<PUTP .ITEM ,P?CHARGES .CHARGES>
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

<ROUTINE DESCRIBE-PLAYER ()
    <COND (,CURRENT-CHARACTER
        <DESCRIBE-PLAYER-BACKGROUND>
        <DESCRIBE-PLAYER-STATS>
        <DESCRIBE-PLAYER-POSESSIONS>
        <DESCRIBE-PLAYER-CODEWORDS>
        <DESCRIBE-PLAYER-VEHICLES>
        <DESCRIBE-PLAYER-TITLES>
        <DESCRIBE-PLAYER-BLESSINGS>
        <DESCRIBE-PLAYER-WORSHIP>
        <DESCRIBE-PLAYER-RESURRECTIONS>
        <DESCRIBE-PLAYER-AILMENTS>
        <DESCRIBE-PLAYER-CURRENCY>
    )>>

<ROUTINE DESCRIBE-PLAYER-AILMENTS ()
    <HLIGHT ,H-BOLD>
    <TELL D ,AILMENTS ": ">
    <HLIGHT 0>
    <PRINT-CONTAINER ,AILMENTS>>

<ROUTINE DESCRIBE-PLAYER-BACKGROUND ()
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL CT ,CURRENT-CHARACTER CR>
    <HLIGHT 0>
    <COND (<GETP ,CURRENT-CHARACTER, P?LDESC>
        <CRLF>
        <TELL <GETP ,CURRENT-CHARACTER ,P?LDESC> CR>
    )>>

<ROUTINE DESCRIBE-PLAYER-BLESSINGS ()
    <HLIGHT ,H-BOLD>
    <TELL D ,BLESSINGS ": ">
    <HLIGHT 0>
    <PRINT-CONTAINER ,BLESSINGS>>

<ROUTINE DESCRIBE-PLAYER-CODEWORDS ()
    <HLIGHT ,H-BOLD>
    <TELL D ,CODEWORDS ": ">
    <HLIGHT 0>
    <PRINT-CONTAINER ,CODEWORDS>>

<ROUTINE DESCRIBE-PLAYER-CURRENCY ()
    <HLIGHT ,H-BOLD>
    <PRINT-CAP-OBJ ,CURRENCY>
    <HLIGHT 0>
    <TELL ": " N ,MONEY CR>>

<ROUTINE DESCRIBE-PLAYER-POSESSIONS ()
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "Possessions: ">
    <HLIGHT 0>
    <PRINT-CONTAINER ,PLAYER>>

<ROUTINE DESCRIBE-PLAYER-RESURRECTIONS ()
    <HLIGHT ,H-BOLD>
    <TELL "Resurrection Arrangements: ">
    <HLIGHT 0>
    <COND (,RESURRECTION-ARRANGEMENTS <TELL D ,RESURRECTION-ARRANGEMENTS>)(ELSE <TELL "None">)>
    <CRLF>>

<ROUTINE DESCRIBE-PLAYER-STATS ("OPT" CHARACTER CONTAINER)
    <COND (<NOT .CHARACTER> <SET CHARACTER ,CURRENT-CHARACTER>)>
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <CRLF>
    <TELL "RANK: " N <GETP .CHARACTER ,P?RANK> CR>
    <COND (<GETP .CHARACTER ,P?PROFESSION>
        <TELL "PROFESSION: " D <GETP .CHARACTER ,P?PROFESSION> CR>
    )>
    <TELL "STAMINA: " N <GETP .CHARACTER ,P?STAMINA> CR>
    <TELL "DEFENSE: " N <CALCULATE-DEFENSE .CHARACTER .CONTAINER> CR>
    <TELL "CHARISMA: " N <CALCULATE-ABILITY .CHARACTER ,ABILITY-CHARISMA .CONTAINER> CR>
    <TELL "COMBAT: " N <CALCULATE-ABILITY .CHARACTER ,ABILITY-COMBAT .CONTAINER> CR>
    <TELL "MAGIC: " N <CALCULATE-ABILITY .CHARACTER ,ABILITY-MAGIC .CONTAINER> CR>
    <TELL "SANCTITY: " N <CALCULATE-ABILITY .CHARACTER ,ABILITY-SANCTITY .CONTAINER> CR>
    <TELL "SCOUTING: " N <CALCULATE-ABILITY .CHARACTER ,ABILITY-SCOUTING .CONTAINER> CR>
    <TELL "THIEVERY: " N <CALCULATE-ABILITY .CHARACTER ,ABILITY-THIEVERY .CONTAINER> CR>>

<ROUTINE DESCRIBE-PLAYER-TITLES ()
    <HLIGHT ,H-BOLD>
    <TELL D ,TITLES-AND-HONOURS ": ">
    <HLIGHT 0>
    <PRINT-CONTAINER ,TITLES-AND-HONOURS>>

<ROUTINE DESCRIBE-PLAYER-VEHICLES ()
    <COND (<FIRST? VEHICLES>
        <HLIGHT ,H-BOLD>
        <PRINT-CAP-OBJ ,VEHICLE>
        <TELL ": ">
        <HLIGHT 0>
        <PRINT-CONTAINER ,VEHICLES>
    )>>

<ROUTINE DESCRIBE-PLAYER-WORSHIP ()
    <HLIGHT ,H-BOLD>
    <TELL "God: ">
    <HLIGHT 0>
    <COND (,GOD <TELL D ,GOD>)(ELSE <TELL "None">)>
    <CRLF>>

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

<ROUTINE GAIN-BLESSING (BLESSING)
    <GAIN-OBJECT .BLESSING ,BLESSINGS "blessing" CHECK-BLESSING>>

<ROUTINE GAIN-CODEWORD (CODEWORD)
    <GAIN-OBJECT .CODEWORD ,CODEWORDS "codeword" CHECK-CODEWORD>>

<ROUTINE GAIN-MONEY (AMOUNT)
    <CRLF>
    <TELL "You gain ">
    <HLIGHT ,H-BOLD>
    <TELL  N .AMOUNT " " D ,CURRENCY>
    <HLIGHT 0>
    <TELL ,PERIOD-CR>
    <SETG MONEY <+ ,MONEY .AMOUNT>>
    <UPDATE-STATUS-LINE>>

<ROUTINE GAIN-OBJECT (OBJECT CONTAINER DESCRIPTION CHECK-ROUTINE)
    <COND (<NOT <APPLY .CHECK-ROUTINE .OBJECT>>
        <CRLF>
        <TELL "You gained the " .DESCRIPTION " ">
        <PRINT-ITEM .OBJECT <NOT <EQUAL? .CONTAINER ,CODEWORDS>>>
        <TELL ,PERIOD-CR>
        <MOVE .OBJECT .CONTAINER>
    )>>

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

<ROUTINE GAIN-TITLE (TITLE)
    <GAIN-OBJECT .TITLE ,TITLES-AND-HONOURS "title" CHECK-TITLE>>

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

<ROUTINE GIVE-FROM-LIST (LIST UNABLE UNWILLING "OPT" MAX JUMP CONTAINER "AUX" ITEMS COUNT RESULT)
    <RESET-TEMP-LIST>
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <COND (<NOT .MAX> <SET MAX 1>)>
    <SET ITEMS <GET .LIST 0>>
    <SET COUNT 0>
    <DO (I 1 .ITEMS)
        <COND (<AND <GET .LIST .I> <IN? <GET .LIST .I> .CONTAINER>>
            <INC .COUNT>
            <COND (<L=? .COUNT <GET TEMP-LIST 0>>
                <PUT TEMP-LIST .COUNT <GET .LIST .I>>
            )>
        )>
    >
    <COND (<G=? .COUNT .MAX>
        <RESET-GIVEBAG>
        <REPEAT ()
            <TRANSFER-CONTAINER ,GIVEBAG .CONTAINER>
            <SELECT-FROM-LIST TEMP-LIST .COUNT .MAX "item" ,GIVEBAG "give">
            <COND (<NOT <EQUAL? <COUNT-CONTAINER ,GIVEBAG> .MAX>>
                <COND (<AND <EQUAL? .MAX <+ <COUNT-CONTAINER ,GIVEBAG> 1>> <IN? ,ALL-MONEY ,GIVEBAG> <INTBL? ,ALL-MONEY .LIST <+ <GET .LIST 0> 1>>>
                    <COND (<G? ,MONEY 0>
                        <CRLF>
                        <TELL "Are you sure?">
                        <COND (<YES?>
                            <YOU-GAVE ,ALL-MONEY>
                            <COND (.JUMP
                                <STORY-JUMP .JUMP>
                                <SETG MONEY 0>
                                <MOVE ,ALL-MONEY ,PLAYER>
                            )>
                            <SET RESULT GIVE-GIVEN>
                            <RETURN>
                        )>
                    )(ELSE
                        <TRANSFER-CONTAINER ,GIVEBAG .CONTAINER>
                        <SET RESULT GIVE-UNABLE>
                        <RETURN>
                    )>
                )>
                <TRANSFER-CONTAINER ,GIVEBAG .CONTAINER>
                <EMPHASIZE .UNWILLING>
                <SET RESULT GIVE-UNWILLING>
                <RETURN>
            )(ELSE
                <CRLF>
                <TELL "Are you sure?">
                <COND (<YES?>
                    <YOU-GAVE>
                    <COND (.JUMP <STORY-JUMP .JUMP>)>
                    <SET RESULT GIVE-GIVEN>
                    <RETURN>
                )>
            )>
        >
        <RETURN .RESULT>
    )(ELSE
        <EMPHASIZE .UNABLE>
        <RETURN GIVE-UNABLE>
    )>>

<ROUTINE GIVE-ITEM (ITEM "OPT" (SILENT F))
    <REMOVE-ITEM .ITEM "gave" F .SILENT>>

<ROUTINE KEEP-ITEM (ITEM "OPT" JUMP)
	<CRLF>
	<TELL "Keep " T .ITEM "?">
	<COND (<YES?>
		<COND (<NOT <CHECK-ITEM .ITEM>> <TAKE-ITEM .ITEM>)>
		<COND (.JUMP <STORY-JUMP .JUMP>)>
		<RTRUE>
	)>
	<COND (<CHECK-ITEM .ITEM> <LOSE-ITEM .ITEM>)>
	<RFALSE>>

<ROUTINE LOSE-ITEM (ITEM "OPT" (SILENT F))
    <REMOVE-ITEM .ITEM "lost" F .SILENT>>

<ROUTINE LOSE-MONEY (COST)
    <COST-MONEY .COST "lose">>

<ROUTINE LOSE-STAMINA (DAMAGE MESSAGE STORY)
    <SETG STAMINA <- ,STAMINA .DAMAGE>>
    <COND (<L? ,STAMINA 0> <SETG STAMINA 0>)>
    <UPDATE-STATUS-LINE>
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COND (<L? ,STAMINA 1>
        <PUTP .STORY ,P?DOOM T>
        <TELL .MESSAGE>
        <SETG CONTINUE-TO-CHOICES F>
    )(ELSE
        <PUTP .STORY ,P?DOOM F>
        <TELL "You lost " N .DAMAGE " stamina">
    )>
    <HLIGHT 0>
    <TELL ,PERIOD-CR>
    <RETURN>>

<ROUTINE LOSE-VEHICLE (VEHICLE)
	<COND (.VEHICLE
		<COND (<CHECK-VEHICLE .VEHICLE>
			<REMOVE .VEHICLE>
			<SETG CURRENT-VEHICLE NONE>
			<UPDATE-STATUS-LINE>
		)>
	)>>

<ROUTINE PRINT-BLESSINGS (ITEM "OPT"  "AUX" (COUNT 0) (ITEMS 0) (SCORE 0) (PROPERTY NONE))
    <COND (<G? <COUNT-BLESSINGS .ITEM> 0>
        <SET ITEMS <GET ,ABILITIES 0>>
        <DO (I 1 .ITEMS)
            <SET PROPERTY <GET-ABILITY-PROPERTY .I>>
            <COND (<G? .PROPERTY 0>
                <SET SCORE <GETP .ITEM .PROPERTY>>
                <COND (<G? .SCORE 0>
                    <INC .COUNT>
                    <COND (<G? .COUNT 1> <TELL ", ">)>
                    <TELL "+" N .SCORE " " <GET ,ABILITIES .I>>
                )>
            )>
        >
    )>>

<ROUTINE PRINT-ITEM (ITEMS "OPT" (BOLD F) (COUNT 0) "AUX" QUANTITY CHARGES BLESSINGS STARS (WORN F) (EFFECTS NONE))
    <COND (.ITEMS
        <COND (<NOT <FSET? .ITEMS ,NDESCBIT>>
            <SET BLESSINGS <COUNT-BLESSINGS .ITEMS>>
            <SET QUANTITY <GETP .ITEMS ,P?QUANTITY>>
            <SET CHARGES <GETP .ITEMS ,P?CHARGES>>
            <SET STARS <GETP .ITEMS ,P?STARS>>
            <SET WORN <AND <FSET? .ITEMS ,WEARBIT> <FSET? .ITEMS ,WORNBIT>>>
            <SET EFFECTS <GETP .ITEMS ,P?EFFECTS>>
            <COND (<G? .COUNT 0> <TELL ", ">)>
            <COND (.BOLD <HLIGHT ,H-BOLD>)(ELSE <HLIGHT ,H-ITALIC>)>
            <TELL D .ITEMS>
            <HLIGHT 0>
            <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> <G? .CHARGES 0> <G? .STARS 0> .WORN .EFFECTS> <TELL " (">)>
            <COND (<G? .BLESSINGS 0> <PRINT-BLESSINGS .ITEMS>)>
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
            <COND (.EFFECTS
                <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> <G? .CHARGES 0> <G? .STARS 0> .WORN> <TELL ", ">)>
                <PRINT-MODIFIERS .ITEMS>
            )>
            <COND (<OR <G? .BLESSINGS 0> <G? .QUANTITY 1> <G? .CHARGES 0> <G? .STARS 0> .WORN .EFFECTS> <TELL ")">)>
        )>
    )>>

<ROUTINE PRINT-MODIFIERS (ITEM "AUX" (EFFECTS NONE) (EFFECT 0) (MODIFIERS 0))
    <COND (<NOT .ITEM> <RETURN>)>
    <SET EFFECTS <GETP .ITEM ,P?EFFECTS>>
    <COND (.EFFECTS
        <DO (I 1 6)
            <SET EFFECT <GET .EFFECTS .I>>
            <COND (<AND <G? .MODIFIERS 0> <G? .EFFECT 0>> <TELL ", ">)>
            <COND (<G? .EFFECT 0>
                <TELL "-" N .EFFECT " " <GET ,ABILITIES .I>>
                <INC .MODIFIERS>
            )>
        >
    )>>

<ROUTINE REMOVE-ITEM (ITEM REASON "OPT" (USE-THE F) (SILENT F) "AUX" QUANTITY)
    <SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
    <CRLF>
    <TELL "You " .REASON " ">
    <COND (<L? .QUANTITY 0>
        <REMOVE .ITEM>
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
    )>
    <COND (<OR .USE-THE <L? .QUANTITY 0>>
        <TELL "the ">
    )(ELSE
        <TELL "a">
        <COND (<FSET? .ITEM ,VOWELBIT> <TELL "n">)>
        <TELL " ">
    )>
    <PRINT-ITEM .ITEM T>
    <TELL ,PERIOD-CR>
    <COND (<NOT .SILENT> <PRESS-A-KEY>)>
    <RETURN>>

<ROUTINE RETURN-ITEM (ITEM "OPT" (SILENT F))
    <REMOVE-ITEM .ITEM "returned" T .SILENT>>

<ROUTINE SELECT-FROM-LIST (LIST ITEMS MAX "OPT" DESC CONTAINER ACTION "AUX" KEY COUNT CHOICE)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <COND (<NOT .ACTION> <SET ACTION "take">)>
    <SET COUNT 0>
    <COND (<NOT .DESC> <SET DESC "item">)>
    <RESET-SELECTIONS>
    <REPEAT ()
        <CRLF>
        <COND (<EQUAL? .CONTAINER ,PLAYER>
            <TELL "You are already carrying " N <COUNT-POSSESSIONS> " items in your inventory" ,PERIOD-CR>
        )>
        <TELL "You can select up to " N .MAX " " .DESC "s from:" CR>
        <DO (I 1 .ITEMS)
            <HLIGHT ,H-BOLD>
            <COND (<L? .I 10>
                <TELL N .I>
            )(ELSE
                <TELL C <+ <- .I 10> !\A>>
            )>
            <HLIGHT 0>
            <TELL " - [">
            <COND (<INTBL? <GET .LIST .I> SELECT-CHOICES 10> <TELL "X">)(ELSE <TELL " ">)>
            <TELL "] - ">
            <PRINT-ITEM <GET .LIST .I> T 0>
            <CRLF>
        >
        <COND (<AND <OR <EQUAL? .CONTAINER ,PLAYER>> <L? .ITEMS 12>>
            <HLIGHT ,H-BOLD>
            <TELL "C">
            <HLIGHT 0>
            <TELL " - View your character (" D ,CURRENT-CHARACTER ")" CR>
        )>
        <HLIGHT ,H-BOLD>
        <TELL "0">
        <HLIGHT 0>
        <TELL " - I'm alright with my choices" ,PERIOD-CR>
        <TELL "Select which " .DESC "(s) to ">
        <TELL .ACTION>
        <TELL ":" CR>
        <REPEAT ()
            <SET KEY <INPUT 1>>
            <COND (
                <OR
                    <AND <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 12> <EQUAL? .KEY !\c !\C>>
                    <AND <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 18> <EQUAL? .KEY !\i !\I>>
                    <AND <G=? .KEY !\A> <L=? .KEY !\F> <L=? <+ <- .KEY !\A> 10> .ITEMS>>
                    <AND <G=? .KEY !\a> <L=? .KEY !\f> <L=? <+ <- .KEY !\a> 10> .ITEMS>>
                    <AND <G=? .KEY !\1> <L=? .KEY !\9> <L=? <- .KEY !\0> .ITEMS>>
                    <AND <EQUAL? .KEY !\h !\H> <L? .ITEMS 17>>
                    <EQUAL? .KEY !\0 !\?>
                >
                <RETURN>
            )>
        >
        <COND (<EQUAL? .KEY !\0>
            <COND (<L? .COUNT .MAX>
                <TELL CR "Are you sure?">
                <COND(<YES?> <RETURN>)>
            )(ELSE
                <RETURN>
            )>
        )>
        <COND (<AND <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 12> <EQUAL? .KEY !\c !\C>> <DESCRIBE-PLAYER> <PRESS-A-KEY>)>
        <COND (<AND <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 18> <EQUAL? .KEY !\i !\I>> <DESCRIBE-INVENTORY> <PRESS-A-KEY>)>
        <COND (<OR <EQUAL? .KEY !\?> <AND <EQUAL? .KEY !\h !\H> <L? .ITEMS 17>>> <DISPLAY-HELP> <PRESS-A-KEY>)>
        <COND (<OR <AND <G=? .KEY !\1> <L=? .KEY !\9>> <AND <G=? .KEY !\a> <L=? .KEY !\f>> <AND <G=? .KEY !\A> <L=? .KEY !\F>>>
            <COND (<AND <G=? .KEY !\a> <L=? .KEY !\f>>
                <SET CHOICE <+ <- .KEY !\a> 10>> 
            )(<AND <G=? .KEY !\A> <L=? .KEY !\F>>
                <SET CHOICE <+ <- .KEY !\A> 10>>
            )(ELSE
                <SET CHOICE <- .KEY !\0>>
            )>
            <COND (<L=? .CHOICE .ITEMS>
                <COND (<INTBL? <GET .LIST .CHOICE> SELECT-CHOICES 10>
                    <PUT SELECT-CHOICES <GET-INDEX SELECT-CHOICES <GET .LIST .CHOICE>> NONE>
                    <DEC .COUNT>
                )(ELSE
                    <COND (<EQUAL? .COUNT .MAX>
                        <CRLF>
                        <HLIGHT ,H-BOLD>
                        <TELL "You have already selected " N .MAX " " .DESC "s" ,EXCLAMATION-CR>
                        <HLIGHT 0>
                    )(ELSE
                        <INC .COUNT>
                        <PUT SELECT-CHOICES <GET-INDEX SELECT-CHOICES NONE> <GET .LIST .CHOICE>>
                    )>
                )>
            )>
        )>
    >
    <COND (<G? .COUNT 0>
        <DO (I 1 9)
            <COND (<GET SELECT-CHOICES .I>
                <COND (<EQUAL? .CONTAINER ,PLAYER>
                    <TAKE-ITEM <GET SELECT-CHOICES .I>>
                )(ELSE
                    <MOVE <GET SELECT-CHOICES .I> .CONTAINER>
                )>
            )>
        >
    )>
    <RETURN>>

<ROUTINE SELL-STUFF (ITEM PLURAL PRICE "AUX" (ITEMS-SOLD 0) (QUANTITY 0))
	<SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
	<CRLF>
	<TELL "Sell " D .ITEM " at " N .PRICE " " D ,CURRENCY " each?">
	<COND (<YES?>
		<SET ITEMS-SOLD <GET-NUMBER "How many will you sell" 0 .QUANTITY>>
		<COND (<G? .ITEMS-SOLD 0>
			<SETG ,MONEY <+ ,MONEY <* .ITEMS-SOLD .PRICE>>>
			<SET .QUANTITY <- .QUANTITY .ITEMS-SOLD>>
			<CRLF>
			<TELL "You sold " N .ITEMS-SOLD " ">
			<HLIGHT ,H-BOLD>
			<COND (<G? .ITEMS-SOLD 1> <TELL .PLURAL>)(ELSE <TELL D .ITEM>)>
			<HLIGHT 0>
			<TELL ,PERIOD-CR>
			<COND (<G? .QUANTITY 0>
				<PUTP .ITEM ,P?QUANTITY .QUANTITY>
			)(ELSE
				<PUTP .ITEM ,P?QUANTITY 1>
				<REMOVE .ITEM>
			)>
		)>
	)>>

<ROUTINE TAKE-ITEM (ITEM "AUX" QUANTITY)
    <COND (.ITEM
        <CRLF>
        <TELL "You gained a">
        <COND (<FSET? .ITEM ,VOWELBIT> <TELL "n">)>
        <TELL " ">
        <PRINT-ITEM .ITEM T>
        <TELL ,PERIOD-CR>
        <COND (<G=? <COUNT-POSSESSIONS> ,LIMIT-POSSESSIONS>
            <EMPHASIZE "You are carrying too many items!">
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
    )>
    <WEAR-BEST>>

<ROUTINE TAKE-QUANTITIES (OBJECT PLURAL MESSAGE "OPT" AMOUNT)
	<CRLF>
	<TELL "Take the " .PLURAL "?">
	<COND (<YES?> <ADD-QUANTITY .OBJECT <GET-NUMBER .MESSAGE 0 .AMOUNT> ,PLAYER>)>>

<ROUTINE TAKE-STUFF (ITEM PLURAL "OPT" AMOUNT "AUX" TAKEN)
	<COND (<NOT .AMOUNT> <SET .AMOUNT 1>)>
	<CRLF>
	<TELL "Take the ">
	<COND (<G? .AMOUNT 1> <TELL .PLURAL>)(<TELL D .ITEM>)>
	<TELL "?">
	<COND (<YES?>
		<COND (<G? .AMOUNT 1>
			<SET TAKEN <GET-NUMBER "How many will you take" 0 .AMOUNT>>
			<ADD-QUANTITY .ITEM .AMOUNT ,PLAYER>
			<RETURN .TAKEN>
		)(ELSE
			<TAKE-ITEM .ITEM>
			<RETURN 1>
		)>
	)>
	<RETURN 0>>

<ROUTINE TAKE-VEHICLE (VEHICLE)
	<COND (.VEHICLE
		<COND (,CURRENT-VEHICLE <REMOVE ,CURRENT-VEHICLE>)>
		<MOVE .VEHICLE ,VEHICLES>
		<SETG CURRENT-VEHICLE .VEHICLE>
		<UPDATE-STATUS-LINE>
	)>>

<ROUTINE UPGRADE-ABILITIES (POINTS "AUX" KEY ABILITY CURRENT)
    <COND (<NOT ,CURRENT-CHARACTER> <RETURN>)>
    <REPEAT ()
        <COND (<L=? .POINTS 0> <RETURN>)>
        <CRLF>
        <TELL "You have " N .POINTS " point">
        <COND (<G? .POINTS 1> <TELL "s">)>
        <TELL " to allocate:" CR>
        <DO (I 1 6)
            <HLIGHT ,H-BOLD>
            <TELL N .I >
            <HLIGHT 0>
            <TELL " - " <GET ,ABILITIES .I> " (" N <GET-ABILITY-SCORE ,CURRENT-CHARACTER .I> ")" CR>
        >
        <TELL "Select ability to improve:">
        <REPEAT ()
            <SET KEY <INPUT 1>>
            <COND (<AND <G=? .KEY !\1> <L=? .KEY !\8>> <RETURN>)>
        >
        <CRLF>
        <SET ABILITY <- .KEY !\0>>
        <SET CURRENT <GET-ABILITY-SCORE ,CURRENT-CHARACTER .ABILITY>>
        <COND (<L? .CURRENT 12>
            <CRLF>
            <TELL "Add +1 to " <GET ,ABILITIES .ABILITY> "?">
            <COND (<YES?>
                <CRLF>
                <TELL "Your ">
                <HLIGHT ,H-BOLD>
                <TELL <GET ,ABILITIES .ABILITY>>
                <HLIGHT 0>
                <TELL " score improved from ">
                <HLIGHT ,H-BOLD>
                <TELL N .CURRENT>
                <HLIGHT 0>
                <TELL " -> ">
                <HLIGHT ,H-BOLD>
                <INC .CURRENT>
                <TELL N .CURRENT ,EXCLAMATION-CR>
                <HLIGHT 0>
                <PUTP ,CURRENT-CHARACTER <GET-ABILITY-PROPERTY .ABILITY> .CURRENT>
                <DEC .POINTS>
            )>
        )(ELSE
            <CRLF>
            <TELL "Your ">
            <HLIGHT ,H-BOLD>
            <TELL <GET ,ABILITIES .ABILITY>>
            <HLIGHT 0>
            <TELL " score is already at a maximum" ,EXCLAMATION-CR>
        )>
    >>

<ROUTINE WEAR-BEST ("AUX" ITEMS DEFENSE (SCORE 0))
    <SET ITEMS <FIRST? ,PLAYER>>
    <REPEAT ()
        <COND (<NOT .ITEMS> <RETURN>)>
        <COND (<FSET? .ITEMS ,WEARBIT>
            <FCLEAR .ITEMS ,WORNBIT>
            <SET DEFENSE <GETP .ITEMS ,P?DEFENSE>>
            <COND (<AND <G? .DEFENSE 0> <G? .DEFENSE .SCORE>>
                <SET SCORE .DEFENSE>
            )>
        )>
        <SET .ITEMS <NEXT? .ITEMS>>
    >
    <COND (<G? .SCORE 0>
        <SET ITEMS <FIRST? ,PLAYER>>
        <REPEAT ()
            <COND (<NOT .ITEMS> <RETURN>)>
            <COND (<FSET? .ITEMS ,WEARBIT>
                <SET DEFENSE <GETP .ITEMS ,P?DEFENSE>>
                <COND (<AND <G? .DEFENSE 0> <EQUAL? .DEFENSE .SCORE>>
                    <FSET .ITEMS ,WORNBIT>
                    <RETURN>
                )>
            )>
            <SET .ITEMS <NEXT? .ITEMS>>
        >
    )>>

<ROUTINE YOU-GAVE ("OPT" ITEM)
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "You gave: ">
    <HLIGHT 0>
    <COND (.ITEM
        <PRINT-ITEM .ITEM T>
        <CRLF>
    )(ELSE
        <PRINT-CONTAINER ,GIVEBAG>
    )>>

; "Story - Merchant routines (display)"
; ---------------------------------------------------------------------------------------------

<ROUTINE MERCHANT (WARES PRICELIST "OPT" CONTAINER (SELL F) "AUX" ITEM ITEMS KEY)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <COND (<OR <NOT .WARES> <NOT .PRICELIST>> <RETURN>)>
    <SET ITEMS <GET .WARES 0>>
    <REPEAT ()
        <CRLF>
        <COND (<NOT .SELL>
            <TELL "You can buy anything you have money for:">
        )(ELSE
            <TELL "You can sell these items at these prices if you have them:">
        )>
        <CRLF>
        <DO (I 1 .ITEMS)
            <HLIGHT ,H-BOLD>
            <COND (<L? .I 10>
                <TELL N .I>
            )(ELSE
                <TELL C <+ !\A <- .I 10>>>
            )>
            <HLIGHT 0>
            <TELL " - ">
            <PRINT-ITEM <GET .WARES .I> T>
            <TELL " (" N <GET .PRICELIST .I> " " D ,CURRENCY ")" CR>
        >
        <COND (<L? .ITEMS 12>
            <HLIGHT ,H-BOLD>
            <TELL "C">
            <HLIGHT 0>
            <TELL " - View your character (" D ,CURRENT-CHARACTER ")" CR>
        )>
        <COND (<L? .ITEMS 18>
            <HLIGHT ,H-BOLD>
            <TELL "I">
            <HLIGHT 0>
            <TELL " - Display inventory" CR>
        )>
        <HLIGHT ,H-BOLD>
        <TELL "0">
        <HLIGHT 0>
        <TELL " - Bye" CR>
        <TELL "You are carrying " N ,MONEY " " D ,CURRENCY ": ">
        <REPEAT ()
            <SET KEY <INPUT 1>>
            <COND (
                <OR
                    <AND <EQUAL? .KEY !\c !\C> <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 12>>
                    <AND <EQUAL? .KEY !\i !\I> <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 18>>
                    <AND <EQUAL? .KEY !\h !\H> <L? .ITEMS 17>>
                    <AND <G=? .KEY !\1> <L=? .KEY !\9> <L=? <- .KEY !\0> .ITEMS>>
                    <AND <G=? .KEY !\A> <L=? .KEY !\J> <G? .ITEMS 9> <L=? <+ <- .KEY !\A> 10> .ITEMS>>
                    <AND <G=? .KEY !\a> <L=? .KEY !\j> <G? .ITEMS 9> <L=? <+ <- .KEY !\a> 10> .ITEMS>>
                    <EQUAL? .KEY !\? !\0>
                >
                <RETURN>
            )>
        >
        <CRLF>
        <COND (<AND <EQUAL? .KEY !\c !\C> <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 12>> <DESCRIBE-PLAYER> <PRESS-A-KEY>)>
        <COND (<AND <EQUAL? .KEY !\i !\I> <EQUAL? .CONTAINER ,PLAYER> <L? .ITEMS 18>> <DESCRIBE-INVENTORY> <PRESS-A-KEY>)>
        <COND (<AND <EQUAL? .KEY !\h !\H> <L? .ITEMS 17>> <DISPLAY-HELP> <PRESS-A-KEY>)>
        <COND (<EQUAL? .KEY !\?> <DISPLAY-HELP> <PRESS-A-KEY>)>
        <COND (
            <OR
                <AND <G=? .KEY !\1> <L=? .KEY !\9> <L=? <- .KEY !\0> .ITEMS>>
                <AND <G=? .KEY !\A> <L=? .KEY !\J> <G? .ITEMS 9> <L=? <+ <- .KEY !\A> 10> .ITEMS>>
                <AND <G=? .KEY !\a> <L=? .KEY !\j> <G? .ITEMS 9> <L=? <+ <- .KEY !\a> 10> .ITEMS>>
            >
            <COND (<AND <G=? .KEY !\1> <L=? .KEY !\9> <L=? <- .KEY !\0> .ITEMS>>
                <SET ITEM <- .KEY !\0>>
            )(<AND <G=? .KEY !\A> <L=? .KEY !\J> <G? .ITEMS 9> <L=? <+ <- .KEY !\A> 10> .ITEMS>>
                <SET ITEM <+ <- .KEY !\A> 10>>
            )(<AND <G=? .KEY !\a> <L=? .KEY !\j> <G? .ITEMS 9> <L=? <+ <- .KEY !\a> 10> .ITEMS>>
                <SET ITEM <+ <- .KEY !\a> 10>>
            )>
            <CRLF>
            <COND (<NOT .SELL>
                <TELL "Purchase ">
                <PRINT-ITEM <GET .WARES .ITEM> T>
                <TELL " (" N <GET .PRICELIST .ITEM> " " D ,CURRENCY ")?">
            )(ELSE
                <TELL "Sell ">
                <PRINT-ITEM <GET .WARES .ITEM> T>
                <TELL " (" N <GET .PRICELIST .ITEM> " " D ,CURRENCY ")?">
            )>
            <COND (<YES?>
                <COND (<NOT .SELL>
                    <CRLF>
                    <COND (<L? ,MONEY <GET .PRICELIST .ITEM>>
                        <TELL "You can't afford the ">
                        <PRINT-ITEM <GET .WARES .ITEM> T>
                        <TELL ,EXCLAMATION-CR>
                    )(ELSE
                        <COND (<FSET? <GET .WARES .ITEM> ,TAKEBIT>
                            <COND (<IN? <GET .WARES .ITEM> .CONTAINER>
                                <TELL "You already have the ">
                                <PRINT-ITEM <GET .WARES .ITEM> T>
                                <TELL ,EXCLAMATION-CR>
                            )(ELSE
                                <SETG MONEY <- ,MONEY <GET .PRICELIST .ITEM>>>
                                <TELL "You bought the ">
                                <PRINT-ITEM <GET .WARES .ITEM> T>
                                <CRLF>
                                <COND (<AND <EQUAL? .CONTAINER ,PLAYER> <EQUAL? <COUNT-POSSESSIONS> LIMIT-POSSESSIONS> <NOT <IN? <GET .WARES .ITEM> .CONTAINER>>>
                                    <EMPHASIZE "You are carrying too many items.">
                                    <DROP-REPLACE-ITEM <GET .WARES .ITEM>>
                                )(ELSE
                                    <MOVE <GET .WARES .ITEM> .CONTAINER>
                                )>
                            )>
                        )(ELSE
                            <TELL "You can't have that" ,EXCLAMATION-CR>
                        )>
                    )>
                )(ELSE
                    <COND (<CHECK-ITEM <GET .WARES .ITEM>>
                        <REMOVE-ITEM <GET .WARES .ITEM> "sold" F T>
                        <SETG MONEY <+ ,MONEY <GET .PRICELIST .ITEM>>>
                    )(ELSE
                        <CRLF>
                        <TELL "You do not have any ">
                        <PRINT-ITEM <GET .WARES .ITEM> T>
                        <TELL ,EXCLAMATION-CR>
                    )>
                )>
            )>
        )>
        <UPDATE-STATUS-LINE>
        <COND (<EQUAL? .KEY !\0>
            <CRLF>
            <TELL "Are you sure?">
            <COND (<YES?> <RTRUE>)>
        )>
    >>

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

<ROUTINE RESET-BLESSINGS ()
    <RESET-CONTAINER ,BLESSINGS>>

<ROUTINE RESET-CHOICES ()
    <SETG CONTINUE-TO-CHOICES T>>

<ROUTINE RESET-CODEWORDS ()
    <RESET-CONTAINER ,CODEWORDS>>

<ROUTINE RESET-GIVEBAG ()
    <RESET-CONTAINER ,GIVEBAG>>

<ROUTINE RESET-PLAYER ()
    <SETG CURRENT-CHARACTER NONE>
    <SETG CURRENT-VEHICLE NONE>
    <SETG GOD NONE>
    <SETG MAX-STAMINA 0>
    <SETG MONEY 0>
    <SETG RESURRECTION-ARRANGEMENTS NONE>
    <SETG STAMINA 0>
    <RESET-BLESSINGS>
    <RESET-CODEWORDS>
    <RESET-GIVEBAG>
    <RESET-POSSESSIONS>
    <RESET-TITLES>
    <RESET-VEHICLES>>

<ROUTINE RESET-POSSESSIONS ()
    <RESET-CONTAINER ,PLAYER>>

<ROUTINE RESET-SELECTIONS ()
    <DO (I 1 9) <PUT SELECT-CHOICES .I NONE>>>

<ROUTINE RESET-TEMP-LIST ("AUX" ITEMS)
    <SET ITEMS <GET TEMP-LIST 0>>
    <DO (I 1 .ITEMS)
        <PUT TEMP-LIST .I NONE>
    >>

<ROUTINE RESET-TITLES ()
    <RESET-CONTAINER ,TITLES-AND-HONOURS>>

<ROUTINE RESET-VEHICLES ()
    <RESET-CONTAINER ,VEHICLES>>

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

<ROUTINE GET-INDEX (LIST ITEM "AUX" COUNT)
    <COND (.LIST
        <SET COUNT <GET .LIST 0>>
        <DO (I 1 .COUNT)
            <COND (<EQUAL? .ITEM <GET .LIST .I>>
                <RETURN .I>
            )>
        >
    )>
    <RETURN 0>>

<ROUTINE GET-NUMBER (MESSAGE "OPT" MINIMUM MAXIMUM "AUX" COUNT)
	<REPEAT ()
		<CRLF>
		<TELL .MESSAGE>
		<COND (<AND <OR <ASSIGNED? MINIMUM> <ASSIGNED? MAXIMUM>> <G? .MAXIMUM .MINIMUM>>
			<TELL " (" N .MINIMUM "-" N .MAXIMUM ")">
		)>
		<TELL "? ">
		<READLINE>
		<COND (<EQUAL? <GETB ,LEXBUF 1> 1> <SET COUNT <CONVERT-TO-NUMBER 1 10>>
			<COND (<OR .MINIMUM .MAXIMUM>
				<COND (<AND <G=? .COUNT .MINIMUM> <L=? .COUNT .MAXIMUM>> <RETURN>)>
			)(<G? .COUNT 0>
				<RETURN>
			)>
		)>
	>
	<RETURN .COUNT>>

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
        <COND (<G? <GETP ,HERE ,P?VISITS> 1>
            <TELL " (Visited " N <GETP ,HERE ,P?VISITS> " times)">
        )>
        <COND (,CURRENT-CHARACTER
            <COND (,CURRENT-VEHICLE <TELL " " D ,CURRENT-VEHICLE>)>
            <CURSET 1 <- .WIDTH 20>>
            <TELL "Stamina: " N ,STAMINA "/" N ,MAX-STAMINA>
            <LINE-ERASE 2>
            <CURSET 2 1>
            <PRINT-CAP-OBJ ,CURRENT-CHARACTER>
            <CURSET 2 <- .WIDTH 20>>
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

<ROUTINE PRINT-ENDING (MESSAGE "OPT" COLOR)
    <COND (<NOT .COLOR> <SET COLOR 1>)>
    <CRLF>
    <HLIGHT ,H-BOLD>
    <COLOR .COLOR 0>
    <TELL .MESSAGE>
    <COLOR 1 0>
    <HLIGHT 0>
    <GAMES-UP>>

<ROUTINE QUIT-MSG ()
    <TELL CR "Thanks for playing" ,PERIOD-CR>
    <QUIT>>

; "Gamebook loop"
; ---------------------------------------------------------------------------------------------

<ROUTINE GAME-BOOK ("AUX" KEY CURRENT-LOC)
    <INSTRUCTIONS>
    <RESET-PLAYER>
    <RESET-OBJECTS>
    <RESET-SELECTIONS>
    <RESET-STORY>
    <CHOOSE-CHARACTER>
    <SETG HERE ,STARTING-POINT>
    <SETG RUN-ONCE T>
    <REPEAT ()
        <CRLF>
        <RESET-CHOICES>
        <MARK-VISITS>
        <CHECK-BACKGROUND>
        <SET CURRENT-LOC ,HERE>
        <GOTO ,HERE>
        <UPDATE-STATUS-LINE>
        <PRINT-SECTION>
        <CHECK-EVENTS>
        <COND (<EQUAL? .CURRENT-LOC ,HERE>
            <CHECK-DOOM>
            <CHECK-VICTORY>
        )>
        <COND (,RUN-ONCE
            <GAIN-ITEMS>
            <GAIN-CODEWORDS>
            <GAIN-BLESSINGS>
            <GAIN-TITLES>
        )>
        <COND (,CONTINUE-TO-CHOICES
            <SET KEY <PROCESS-STORY>>
            <COND (<EQUAL? .KEY !\c !\C> <DESCRIBE-PLAYER> <PRESS-A-KEY> <SET KEY NONE>)>
            <COND (<EQUAL? .KEY !\h !\H !\?> <DISPLAY-HELP> <PRESS-A-KEY> <SET KEY NONE>)>
            <COND (<EQUAL? .KEY !\i !\I> <DESCRIBE-INVENTORY> <PRESS-A-KEY> <SET KEY NONE>)>
            <COND (<EQUAL? .KEY !\q !\Q> <CRLF> <TELL "Are you sure you want to quit the game?"> <COND(<YES?> <RETURN>)>)>
            <COND (<EQUAL? .KEY !\r !\R> <CRLF> <TELL "Restore from a previous save?"> <COND (<YES?> <COND (<NOT <RESTORE>> <EMPHASIZE "Restore failed."> <PRESS-A-KEY>)>)>)>
            <COND (<EQUAL? .KEY !\s !\S> <CRLF> <TELL "Save current progress?"> <COND (<YES?> <COND (<NOT <SAVE>> <EMPHASIZE "Save failed."> <PRESS-A-KEY>)>)>)>
            <COND (<EQUAL? .KEY !\x !\X> <RETURN>)>
        )>
        <UPDATE-STATUS-LINE>
    >>
