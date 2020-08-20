; "The War Torn Kingdom (ZIL)"
; ---------------------------------------------------------------------------------------------
<CONSTANT GAME-TITLE "||The War-Torn Kingdom">
<CONSTANT GAME-DESCRIPTION "|Dave Morris and Jamie Thomson (1995)||Implemented in ZIL by SD Separa (2020)|">
<CONSTANT RELEASEID 1>
<CONSTANT IFID "ADECB9D4-B91D-4C0A-8912-A6195F7A81A0">
<VERSION XZIP>

<INSERT-FILE "minilib">

<ROUTINE GO ()
    <V-VERSION>
    <TELL CR "IFID: ">
    <TELL IFID>
    <CRLF>
    <GAME-BOOK>
    <QUIT-MSG>>

; "GLOBALS"
; ---------------------------------------------------------------------------------------------

<CONSTANT NONE <>>
<CONSTANT F <>>

<CONSTANT LIMIT-POSSESSIONS 12>

<GLOBAL CURRENT-LOC NONE>

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
<PROPDEF INVESTMENTS NONE>

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
                <COND (<AND <EQUAL? .CHOICE-TYPE R-TEST-ABILITY> .REQUIREMENTS> <TELL " (Difficulty: "> <HLIGHT ,H-BOLD> <TELL N <GET .LIST 2>> <HLIGHT 0> <TELL")">)>
                <COND (<AND <EQUAL? .CHOICE-TYPE R-ITEM R-CODEWORD R-DISCHARGE> .REQUIREMENTS> <TELL " ("> <COND (<EQUAL? .CHOICE-TYPE R-ITEM R-DISCHARGE> <HLIGHT ,H-BOLD>)(ELSE <HLIGHT ,H-ITALIC>)> <TELL D .LIST> <HLIGHT 0> <TELL ")">)>
                <COND (<AND <EQUAL? .CHOICE-TYPE R-CODEWORD-ITEM> .REQUIREMENTS> <TELL " ("> <HLIGHT ,H-ITALIC> <TELL D <GET .LIST 1>> <HLIGHT 0> <TELL " and "> <HLIGHT ,H-BOLD> <TELL D <GET .LIST 2>> <HLIGHT 0> <TELL ")">)>
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
    <TELL "CHARISMA: " N <CALCULATE-ABILITY .CHARACTER ABILITY-CHARISMA .CONTAINER> CR>
    <TELL "COMBAT: " N <CALCULATE-ABILITY .CHARACTER ABILITY-COMBAT .CONTAINER> CR>
    <TELL "MAGIC: " N <CALCULATE-ABILITY .CHARACTER ABILITY-MAGIC .CONTAINER> CR>
    <TELL "SANCTITY: " N <CALCULATE-ABILITY .CHARACTER ABILITY-SANCTITY .CONTAINER> CR>
    <TELL "SCOUTING: " N <CALCULATE-ABILITY .CHARACTER ABILITY-SCOUTING .CONTAINER> CR>
    <TELL "THIEVERY: " N <CALCULATE-ABILITY .CHARACTER ABILITY-THIEVERY .CONTAINER> CR>>

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

; "Characters for War-Torn Kingdom"
; ---------------------------------------------------------------------------------------------

<CONSTANT CHARACTERS <LTABLE CHARACTER-LIANA CHARACTER-CHALOR CHARACTER-ANDRIEL CHARACTER-MARANA CHARACTER-IGNATIUS CHARACTER-ASTARIEL>>
<CONSTANT PROFESSIONS <LTABLE PROFESSION-PRIEST PROFESSION-MAGE PROFESSION-ROGUE PROFESSION-TROUBADOUR PROFESSION-WARRIOR PROFESSION-WAYFARER>>

<OBJECT CHARACTER-LIANA
    (DESC "Liana The Swift")
    (LDESC "Liana prefers to make her home in mountain grottos and woodland groves rather than in the squalid streets of cities. She has the agility of a gazelle, the cunning of a fox and the ferocity of an eagle. She has heard of a City of Trees, deep within the forest of the Isle of Druids.")
    (RANK 1)
    (PROFESSION PROFESSION-WAYFARER)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 2)
    (COMBAT 5)
    (MAGIC 2)
    (SANCTITY 3)
    (SCOUTING 6)
    (THIEVERY 4)
    (POSSESSIONS <LTABLE SPEAR LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-CHALOR
    (DESC "Chalor The Exiled One")
    (LDESC "Chalor is an outcast by choice, shunning his native land and the family who spurned him, driven by a burning desire for secret knowledge. His goal is to become one of the mightiest wizards of the world, and nothing will stand in his way. For now, he is looking for the Gold Dust tavern in Yellowport, where adventure awaits.")
    (RANK 1)
    (PROFESSION PROFESSION-MAGE)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 2)
    (COMBAT 2)
    (MAGIC 6)
    (SANCTITY 1)
    (SCOUTING 5)
    (THIEVERY 3)
    (POSSESSIONS <LTABLE STAFF LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-ANDRIEL
    (DESC "Andriel The Hammer")
    (LDESC "Andriel seeks frame trhough adventure and the glory of battle. He left his homeland when an extended outbreak of peace made his skills redundant there. He is blunt and outspoken, but scrupulously follows the warrior's code. He knows that the merchants' guild in Yellowport needs assitance.")
    (RANK 1)
    (PROFESSION PROFESSION-WARRIOR)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 3)
    (COMBAT 6)
    (MAGIC 2)
    (SANCTITY 4)
    (SCOUTING 3)
    (THIEVERY 2)
    (POSSESSIONS <LTABLE BATTLE-AXE LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-MARANA
    (DESC "Marana Fireheart")
    (LDESC "Marana is a fiercely independent woman who gew up inthe backstreets of her home town. Forced to flee because she was too active in her chosen profession, she has come to new lands to seek her fortune. Devious and resourceful, she can break in almost anywhere. She has heard that the temple of Sig in Marlock City needs the services of a rogue.")
    (RANK 1)
    (PROFESSION PROFESSION-ROGUE)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 5)
    (COMBAT 4)
    (MAGIC 4)
    (SANCTITY 1)
    (SCOUTING 2)
    (THIEVERY 6)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-IGNATIUS
    (DESC "Ignatius The Devout")
    (LDESC "Ignatius is a traveler whose desire is to learn all he can about the deities of the Fabled Lands. His strong beliefs give his sermons added zest, and he has enthralled many a crowd with his impassioned speeches. He is looking for the house of priests in Marlock City.")
    (RANK 1)
    (PROFESSION PROFESSION-PRIEST)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 4)
    (COMBAT 2)
    (MAGIC 3)
    (SANCTITY 6)
    (SCOUTING 4)
    (THIEVERY 2)
    (POSSESSIONS <LTABLE MACE LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-ASTARIEL
    (DESC "Astariel Skysong")
    (LDESC "Astariel has the wanderlust, and chafes if he has to remain in one place for any length of time. He enjoys the freedom of the open road and the thought that he never knows what adventures each new day will bring. He lives by his wis and is a familiar figure at tavern firesides, where he regales travelers with his tales.")
    (RANK 1)
    (PROFESSION PROFESSION-TROUBADOUR)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 6)
    (COMBAT 3)
    (MAGIC 4)
    (SANCTITY 3)
    (SCOUTING 2)
    (THIEVERY 4)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

; "Professions and default stats"
; ---------------------------------------------------------------------------------------------

<OBJECT PROFESSION-PRIEST
    (DESC "Priest")
    (RANK 1)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 4)
    (COMBAT 2)
    (MAGIC 3)
    (SANCTITY 6)
    (SCOUTING 4)
    (THIEVERY 2)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT PROFESSION-MAGE
    (DESC "Mage")
    (RANK 1)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 2)
    (COMBAT 2)
    (MAGIC 6)
    (SANCTITY 1)
    (SCOUTING 5)
    (THIEVERY 3)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT PROFESSION-ROGUE
    (DESC "Rouge")
    (RANK 1)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 5)
    (COMBAT 4)
    (MAGIC 4)
    (SANCTITY 1)
    (SCOUTING 2)
    (THIEVERY 6)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT PROFESSION-TROUBADOUR
    (DESC "Troubadour")
    (RANK 1)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 6)
    (COMBAT 3)
    (MAGIC 4)
    (SANCTITY 3)
    (SCOUTING 2)
    (THIEVERY 4)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT PROFESSION-WARRIOR
    (DESC "Warrior")
    (RANK 1)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 3)
    (COMBAT 6)
    (MAGIC 2)
    (SANCTITY 4)
    (SCOUTING 3)
    (THIEVERY 2)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

<OBJECT PROFESSION-WAYFARER
    (DESC "Wayfarer")
    (RANK 1)
    (STAMINA 9)
    (MONEY 16)
    (CHARISMA 2)
    (COMBAT 5)
    (MAGIC 2)
    (SANCTITY 3)
    (SCOUTING 6)
    (THIEVERY 4)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)
    (FLAGS PERSONBIT)>

; "Codewords for War-Torn-Kingdom"
; ---------------------------------------------------------------------------------------------

<OBJECT CODEWORD-ABIDE (DESC "Abide")>
<OBJECT CODEWORD-ACID (DESC "Acid")>
<OBJECT CODEWORD-AKLAR (DESC "Aklar")>
<OBJECT CODEWORD-AJAR (DESC "Ajar")>
<OBJECT CODEWORD-ALTITUDE (DESC "Altitude")>
<OBJECT CODEWORD-ALMANAC (DESC "Almanac")>
<OBJECT CODEWORD-ANCHOR (DESC "Anchor")>
<OBJECT CODEWORD-ANVIL (DESC "Anvil")>
<OBJECT CODEWORD-ARTERY (DESC "Artery")>
<OBJECT CODEWORD-ARTIFACT (DESC "Artifact")>
<OBJECT CODEWORD-ASSASSIN (DESC "Assassin")>
<OBJECT CODEWORD-AURIC (DESC "Auric")>
<OBJECT CODEWORD-BRUSH (DESC "Brush")>
<OBJECT CODEWORD-DELIVER (DESC "Deliver")>
<OBJECT CODEWORD-ELDRITCH (DESC "Eldritch")>

; "Objects for War-Torn Kingdom"

; "Weapons"
; ---------------------------------------------------------------------------------------------

<OBJECT BATTLE-AXE
    (DESC "battle-axe")
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT BATTLE-AXE1
    (DESC "battle-axe")
    (COMBAT 1)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT BATTLE-AXE2
    (DESC "battle-axe")
    (COMBAT 2)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT BATTLE-AXE3
    (DESC "battle-axe")
    (COMBAT 3)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT MACE
    (DESC "mace")
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT MACE1
    (DESC "mace")
    (COMBAT 1)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT MACE2
    (DESC "mace")
    (COMBAT 2)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT MACE3
    (DESC "mace")
    (COMBAT 3)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SPEAR
    (DESC "spear")
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SPEAR1
    (DESC "spear")
    (COMBAT 1)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SPEAR2
    (DESC "spear")
    (COMBAT 2)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SPEAR3
    (DESC "spear")
    (COMBAT 3)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT STAFF
    (DESC "staff")
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT STAFF1
    (DESC "staff")
    (COMBAT 1)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT STAFF2
    (DESC "staff")
    (COMBAT 2)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT STAFF3
    (DESC "staff")
    (COMBAT 3)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SWORD
    (DESC "sword")
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SWORD1
    (DESC "sword")
    (COMBAT 1)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SWORD2
    (DESC "sword")
    (COMBAT 2)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT SWORD3
    (DESC "sword")
    (COMBAT 3)
    (FLAGS TAKEBIT WEAPONBIT)>

<OBJECT TRIDENT
    (DESC "trident")
    (COMBAT 1)
    (FLAGS TAKEBIT WEAPONBIT)>

; "Armours"
; ---------------------------------------------------------------------------------------------

<OBJECT CHAIN-MAIL
    (DESC "chain mail")
    (DEFENSE 3)
    (FLAGS TAKEBIT WEARBIT)>

<OBJECT HEAVY-PLATE
    (DESC "heavy plate")
    (DEFENSE 6)
    (FLAGS TAKEBIT WEARBIT)>

<OBJECT LEATHER-ARMOUR
    (DESC "leather armour")
    (DEFENSE 1)
    (FLAGS TAKEBIT WEARBIT)>

<OBJECT LEATHER-JERKIN
    (DESC "leather jerkin")
    (DEFENSE 1)
    (FLAGS TAKEBIT WEARBIT WORNBIT)>

<OBJECT PLATE-ARMOUR
    (DESC "plate armour")
    (DEFENSE 5)
    (FLAGS TAKEBIT WEARBIT)>

<OBJECT RING-MAIL
    (DESC "ring mail")
    (DEFENSE 2)
    (FLAGS TAKEBIT WEARBIT)>

<OBJECT SPLINT-ARMOUR
    (DESC "splint armour")
    (DEFENSE 4)
    (FLAGS TAKEBIT WEARBIT)>

; Wands
; ---------------------------------------------------------------------------------------------

<OBJECT AMBER-WAND
    (DESC "amber wand")
    (MAGIC 1)
    (FLAGS TAKEBIT)>

<OBJECT COBALT-WAND
    (DESC "cobalt wand")
    (MAGIC 3)
    (FLAGS TAKEBIT)>

<OBJECT EBONY-WAND
    (DESC "ebony wand")
    (MAGIC 2)
    (FLAGS TAKEBIT)>

; "Objects"
; ---------------------------------------------------------------------------------------------

<OBJECT BAG-OF-PEARLS
    (DESC "bag of pearls")
    (FLAGS TAKEBIT)>

<OBJECT BOOK-OF-THE-SEVEN-SAGES
    (DESC "Book of the Seven Sages")
    (FLAGS TAKEBIT)>

<OBJECT CLIMBING-GEAR
    (DESC "climbing gear")
    (FLAGS TAKEBIT)>

<OBJECT CODED-MISSIVE
    (DESC "coded missive")
    (FLAGS TAKEBIT)>

<OBJECT COMPASS
    (DESC "compass")
    (SCOUTING 1)
    (FLAGS TAKEBIT)>

<OBJECT GOLDEN-NET
    (DESC "golden net")
    (FLAGS TAKEBIT)>

<OBJECT HOLY-SYMBOL
    (DESC "holy symbol")
    (SANCTITY 1)
    (FLAGS TAKEBIT)>

<OBJECT LANTERN
    (DESC "lantern")
    (FLAGS TAKEBIT)>

<OBJECT LOCKPICKS
    (DESC "locpicks")
    (THIEVERY 1)
    (FLAGS TAKEBIT)>

<OBJECT MANDOLIN
    (DESC "mandolin")
    (CHARISMA 1)
    (FLAGS TAKEBIT)>

<OBJECT MAP
    (DESC "map")
    (FLAGS TAKEBIT)>

<OBJECT POTION-OF-HEALING
    (DESC "potion of healing")
    (FLAGS TAKEBIT)>

<OBJECT ROPE
    (DESC "rope")
    (FLAGS TAKEBIT)>

<OBJECT RAT-POISON
    (DESC "rat poison")
    (FLAGS TAKEBIT)>

<OBJECT SALT-AND-IRON-FILINGS
    (DESC "salt and iron filings")
    (FLAGS TAKEBIT)>

<OBJECT SCROLL-OF-EBRON
    (DESC "scroll of Ebron")
    (FLAGS TAKEBIT)>

<OBJECT SILVER-NUGGET
    (DESC "silver nugget")
    (FLAGS TAKEBIT)>

<OBJECT TREASURE-MAP
    (DESC "treasure map")
    (FLAGS TAKEBIT)>

; "Resurrections"
; ---------------------------------------------------------------------------------------------

<OBJECT RESURRECTION-TYRNAI
    (DESC "Temple of Tyrnai, The War-Torn Kingdom")
    (CONTINUE STORY640)
    (FLAGS TAKEBIT)>

; GODS
; ---------------------------------------------------------------------------------------------

<OBJECT GOD-TYRNAI (DESC "Tyrnai, War God")>

; Blessings
; ---------------------------------------------------------------------------------------------

<OBJECT BLESSING-ALVIR-VALMIR (DESC "Alvir and Valmir")>

; Ships
; ---------------------------------------------------------------------------------------------

<CONSTANT CONDITION-POOR 0>
<CONSTANT CONDITION-EXCELLENT 1>

<OBJECT SHIP-BARQUE
    (DESC "barque")
    (STATUS CONDITION-EXCELLENT)>

<OBJECT SHIP-BRIGANTINE
    (DESC "brigantine")
    (STATUS CONDITION-EXCELLENT)>

<OBJECT SHIP-GALLEON
    (DESC "galleon")
    (STATUS CONDITION-EXCELLENT)>

; "Disease EFFECTS (CHARISMA COMBAT MAGIC SANCTITY SCOUTING THIEVERY)"
; ---------------------------------------------------------------------------------------------

<OBJECT DISEASE-GHOULBITE
    (DESC "ghoulbite")
    (EFFECTS <LTABLE 1 1 0 1 0 0>)>

; "Monsters"
; ---------------------------------------------------------------------------------------------
<OBJECT MONSTER-GHOUL
    (DESC "Ghoul")
    (COMBAT 3)
    (DEFENSE 7)
    (STAMINA 15)
    (FLAGS CONTBIT OPENBIT PERSONBIT)>

<OBJECT MONSTER-THUG
    (DESC "Thug")
    (COMBAT 3)
    (DEFENSE 6)
    (STAMINA 13)
    (FLAGS CONTBIT OPENBIT PERSONBIT)>

<OBJECT MONSTER-TWO-RATMEN
    (DESC "Two Ratmen")
    (COMBAT 6)
    (DEFENSE 9)
    (STAMINA 9)
    (FLAGS CONTBIT OPENBIT PERSONBIT PLURALBIT)>

<OBJECT MONSTER-TOMB-GUARDIAN
    (DESC "Tomb Guardian")
    (COMBAT 6)
    (DEFENSE 8)
    (STAMINA 12)
    (FLAGS CONTBIT OPENBIT PERSONBIT)>

; "Titles and Honors for War-Torn Kingdom"
; ---------------------------------------------------------------------------------------------

<OBJECT TITLE-PROTECTOR-SOKARA (DESC "Protector of Sokara")>
<OBJECT TITLE-ILLUMINATE-MOLHERN (DESC "Illuminate of Molhern")>

; "Abilities and Combat"
; ---------------------------------------------------------------------------------------------

<CONSTANT LOOKUP-ABILITY <LTABLE P?CHARISMA P?COMBAT P?MAGIC P?SANCTITY P?SCOUTING P?THIEVERY P?DEFENSE P?STAMINA>>

<ROUTINE APPLY-NEGATIVE-EFFECTS (ABILITY "AUX" AILMENT (EFFECTS NONE) (SCORE 0))
    <SET SCORE 0>
    <COND (<G? <COUNT-CONTAINER ,AILMENTS> 0>
        <SET AILMENT <FIRST? ,AILMENTS>>
        <REPEAT ()
            <COND (<NOT .AILMENT> <RETURN>)>
            <SET EFFECTS <GETP .AILMENT ,P?EFFECTS>>
            <COND (.EFFECTS
                <SET SCORE <- .SCORE <GET .EFFECTS .ABILITY>>>
            )>
            <SET AILMENT <NEXT? .AILMENT>>
        >
    )>
    <RETURN .SCORE>>

; "Calculates ability scores"
<ROUTINE CALCULATE-ABILITY (CHARACTER ABILITY "OPT" CONTAINER "AUX" SCORE PROPERTY)
    <COND (<NOT .CONTAINER> <SET .CHARACTER ,PLAYER>)>
    <SET PROPERTY <GET-ABILITY-PROPERTY .ABILITY>>
    <SET SCORE <GET-ABILITY-SCORE .CHARACTER .ABILITY>>
    <COND (<EQUAL? .ABILITY ABILITY-COMBAT>
        <SET SCORE <+ .SCORE <FIND-BEST .PROPERTY ,WEAPONBIT .CONTAINER>>>
    )(<N=? .ABILITY ABILITY-DEFENSE>
        <SET SCORE <+ .SCORE <FIND-BEST .PROPERTY NONE .CONTAINER>>>
    )>
    <SET SCORE <+ .SCORE <FIND-BEST .PROPERTY NONE ,BLESSINGS>>>
    <SET SCORE <+ .SCORE <APPLY-NEGATIVE-EFFECTS .ABILITY>>>
    <COND (<G? .SCORE 12> <SET SCORE 12>)>
    <COND (<L? .SCORE 1> <SET SCORE 1>)>
    <RETURN .SCORE>>

; "Get object property that is associated to ability"
<ROUTINE GET-ABILITY-PROPERTY (ABILITY "AUX" (PROPERTY NONE))
    <SET PROPERTY <GET ,LOOKUP-ABILITY .ABILITY>>
    <RETURN .PROPERTY>>

; "Get ability score"
<ROUTINE GET-ABILITY-SCORE (CHARACTER ABILITY "OPT" PROPERTY RESULT)
    <SET PROPERTY <GET-ABILITY-PROPERTY .ABILITY>>
    <COND (.PROPERTY
        <SET RESULT <GETP .CHARACTER .PROPERTY>>
        <RETURN .RESULT>
    )>
    <RETURN 1>>

; "Finds the item with the best PROPERTY score"
<ROUTINE FIND-BEST (PROPERTY "OPT" (FLAG NONE) CONTAINER (MATCH 0) "AUX" (SCORE 0) (ITEM NONE) (RESULT 0))
    <SET RESULT 0>
    <SET SCORE 0>
    <COND (<NOT .CONTAINER> <SET .CONTAINER ,PLAYER>)>
    <SET ITEM <FIRST? .CONTAINER>>
    <REPEAT ()
        <COND (<NOT .ITEM> <RETURN>)>
        <SET SCORE <GETP .ITEM .PROPERTY>>
        <COND (<G? .MATCH 0>
            <COND (.FLAG
                <COND (<AND <FSET? .ITEM .FLAG> <FSET? .ITEM ,NDESCBIT>>
                    <COND (<EQUAL? .SCORE .MATCH>
                        <SET .RESULT .SCORE>
                        <RETURN>
                    )>
                )>
            )(<AND <NOT <FSET? .ITEM ,NDESCBIT>> <EQUAL? .SCORE .MATCH>>
                <SET .RESULT .SCORE>
                <RETURN>
            )>
        )(.FLAG
            <COND (<AND <NOT <FSET? .ITEM ,NDESCBIT>> <FSET? .ITEM .FLAG>>
                <COND (<G? .SCORE .RESULT>
                    <SET .RESULT .SCORE>
                )>
            )> 
        )(<AND <NOT <FSET? .ITEM ,NDESCBIT>> <G? .SCORE .RESULT>>
            <SET .RESULT .SCORE>
        )>
        <SET ITEM <NEXT? .ITEM>>
    >
    <RETURN .RESULT>>

; "as above but find in list"
<ROUTINE FIND-BEST-LIST (PROPERTY "OPT" (FLAG NONE) LIST "AUX" COUNT SCORE ITEM RESULT)
    <COND (<NOT .LIST> <RETURN 0>)>
    <SET SCORE 0>
    <SET RESULT 0>
    <SET COUNT <GET .LIST 0>>
    <DO (I 1 .COUNT)
        <SET ITEM <GET .LIST .I>>
        <SET SCORE <GETP .ITEM .PROPERTY>>
        <COND (<AND .FLAG <NOT <FSET? .ITEM ,NDESCBIT>>>
            <COND (<FSET? .ITEM .FLAG>
                <COND (<G? .SCORE .RESULT> <SET .RESULT .SCORE>)>
            )>
        )(<AND <G? .SCORE .RESULT> <NOT <FSET? .ITEM ,NDESCBIT>>>
            <SET .RESULT .SCORE>
        )>
    >
    <RETURN .RESULT>>

; "Fighting routines"
; ---------------------------------------------------------------------------------------------

; "messages during rounds of combat"

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

; "messages during rounds of combat"
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

; "Calculate combat score"
<ROUTINE CALCULATE-COMBAT (CHARACTER "OPT" CONTAINER)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <RETURN <CALCULATE-ABILITY .CHARACTER ABILITY-COMBAT .CONTAINER>>>

; "Calculate defense score"
<ROUTINE CALCULATE-DEFENSE (CHARACTER "OPT" CONTAINER "AUX" RESULT)
    <COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
    <SET RESULT <GETP .CHARACTER ,P?RANK>>
    <SET RESULT <+ .RESULT <CALCULATE-ABILITY .CHARACTER ABILITY-COMBAT .CONTAINER>>>
    <COND (<AND <N=? .CONTAINER ,PLAYER> <N=? .CHARACTER ,CURRENT-CHARACTER>>
        <SET RESULT <+ .RESULT <FIND-BEST-LIST P?DEFENSE ,WEARBIT <GETP .CHARACTER ,P?POSSESSIONS>>>>
    )(ELSE
        <SET RESULT <+ .RESULT <FIND-BEST ,P?DEFENSE ,WEARBIT .CONTAINER>>>
    )>
    <COND (<G? .RESULT 12> <SET RESULT 12>)>
    <COND (<L? .RESULT 1> <SET RESULT 1>)>
    <RETURN .RESULT>>

; "Wrapper for combat. Sets DOOM on result"
<ROUTINE CHECK-COMBAT (MONSTER "OPT" STORY (MODIFIER 0))
    <COND (<NOT .STORY> <SET STORY ,HERE>)>
    <COND (<FIGHT .MONSTER .MODIFIER>
       <PREVENT-DEATH .STORY>
       <RTRUE>
    )(ELSE
        <PUTP .STORY ,P?DOOM T>
        <RFALSE>
    )>>

; "Initialize Monser Stats"
<ROUTINE COMBAT-MONSTER (MONSTER COMBAT DEFENSE STAMINA)
    <PUT .MONSTER ,P?COMBAT .COMBAT>
    <PUT .MONSTER ,P?DEFENSE .DEFENSE>
    <PUT .MONSTER ,P?DEFENSE .STAMINA>>

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

<ROUTINE FIGHT (MONSTER "OPT" (MODIFIER 0) "AUX" RESULT ATTACK STAMINA-PLAYER COMBAT-PLAYER DEFENSE-PLAYER STAMINA-MONSTER COMBAT-MONSTER DEFENSE-MONSTER (ROUND 0))
    <SET STAMINA-PLAYER ,STAMINA>
    <SET DEFENSE-PLAYER <CALCULATE-DEFENSE ,CURRENT-CHARACTER>>
    <SET COMBAT-PLAYER <CALCULATE-COMBAT ,CURRENT-CHARACTER>>
    <COND (<G? .COMBAT-PLAYER 12> <SET .COMBAT-PLAYER 12>)>
    <SET STAMINA-MONSTER <GETP .MONSTER ,P?STAMINA>>
    <SET DEFENSE-MONSTER <GETP .MONSTER ,P?DEFENSE>>
    <SET COMBAT-MONSTER <GETP .MONSTER ,P?COMBAT>>
    <COND (<G? .COMBAT-MONSTER 12> <SET .COMBAT-MONSTER 12>)>
    <CRLF>
    <TELL "Resolving combat between ">
    <HLIGHT ,H-BOLD>
    <TELL D ,CURRENT-CHARACTER>
    <HLIGHT 0>
    <TELL " (COMBAT: " N .COMBAT-PLAYER " DEFENSE: " N .DEFENSE-PLAYER>
    <COND (<G? .MODIFIER 0> <TELL ", +" N .MODIFIER " to rolls">)>
    <TELL ") and ">
    <HLIGHT ,H-BOLD>
    <TELL T .MONSTER>
    <HLIGHT 0>
    <TELL " (COMBAT: " N .COMBAT-MONSTER " DEFENSE: " N .DEFENSE-MONSTER ")">
    <TELL ,PERIOD-CR>
    <REPEAT ()
        <INC .ROUND>
        <COMBAT-STATUS .ROUND .MONSTER .STAMINA-PLAYER .STAMINA-MONSTER>
        <PRESS-A-KEY>
        <SET ATTACK <+ <ROLL-DICE 2> .COMBAT-PLAYER .MODIFIER>>
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
        <UPDATE-STATUS-LINE>
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
        <TELL D .CHARACTER " ">
    )(ELSE
        <TELL CT .CHARACTER " ">
    )>
    <COND (<FSET? .CHARACTER ,PLURALBIT> <TELL "have">)(ELSE <TELL "has">)>
    <TELL " prevailed">
    <HLIGHT 0>
    <TELL ,PERIOD-CR>>

<ROUTINE TEST-ABILITY (CHARACTER ABILITY DIFFICULTY "OPT" SCORE (ROLL 0) (MODIFIERS T) "AUX" (RESULT F) (TOTAL 0))
    <SET SCORE <CALCULATE-ABILITY .CHARACTER .ABILITY>>
    <TELL "Making a ">
    <HLIGHT ,H-BOLD>
    <TELL <GET ,ABILITIES .ABILITY>>
    <HLIGHT 0>
    <TELL " (" >
    <HLIGHT ,H-BOLD>
    <TELL N .SCORE>
    <HLIGHT 0>
    <TELL ") roll at ">
    <HLIGHT ,H-BOLD>
    <TELL N .DIFFICULTY>
    <HLIGHT 0>
    <TELL " difficulty.." ,PERIOD-CR>
    <PRESS-A-KEY>
    <SET ROLL <ROLL-DICE 2>>
    <SET TOTAL <+ .SCORE .ROLL>>
    <CRLF>
    <TELL "Rolled (">
    <HLIGHT ,H-BOLD>
    <TELL <GET ,ABILITIES .ABILITY> " " N .SCORE>
    <HLIGHT 0>
    <TELL ") + ">
    <HLIGHT ,H-BOLD>
    <TELL N .ROLL>
    <HLIGHT 0>
    <TELL " = ">
    <HLIGHT ,H-BOLD>
    <TELL N .TOTAL>
    <HLIGHT 0>
    <TELL " ... ">
    <HLIGHT ,H-BOLD>
    <COND (<G? .TOTAL .DIFFICULTY>
        <TELL "Success!">
        <SET RESULT T>
    )(ELSE
        <TELL "Failed!">    
    )>
    <HLIGHT 0>
    <RETURN .RESULT>>

<ROUTINE POWER (BASE EXP)
    <COND (<G? .EXP 0>
        <RETURN <* .BASE <POWER .BASE <- .EXP 1>>>>
    )(ELSE
        <RETURN 1>
    )>>

<ROUTINE GET-DIGIT (CHAR "OPT" BASE "AUX" DIGIT)
    <COND (<NOT .BASE> <SET BASE 10>)>
    <SET DIGIT 0>
    <COND (<AND <G? .BASE 10> <G=? .CHAR !\A> <L=? .CHAR !\Z>>
        <SET DIGIT <+ <- .CHAR !\A> 10>>
    )(<AND <G? .BASE 10> <G=? .CHAR !\a> <L=? .CHAR !\z>>
        <SET DIGIT <+ <- .CHAR !\a> 10>>
    )(<AND <G=? .CHAR !\0> <L=? .CHAR !\9>>
        <SET DIGIT <- .CHAR !\0>>
    )>
    <COND (<OR <G? .DIGIT <- .BASE 1>> <L? .DIGIT 0>> <RETURN 0>)>
    <RETURN .DIGIT>>

<ROUTINE TO-INTEGER (START LEN "OPT" BASE "AUX" NUM CHAR SIG)
    <COND (<NOT .BASE> <SET BASE 10>)>
    <SET SIG 1>
    <SET NUM 0>
    <DO (I 1 .LEN)
        <SET CHAR <GETB ,READBUF <+ .START .I>>>
        <COND (<OR
            <AND <G=? .CHAR !\0> <L=? .CHAR !\9>>
            <AND <G? .BASE 10> <L=? .BASE 36> 
                <OR 
                    <AND <G=? .CHAR !\A> <L=? .CHAR !\Z>> 
                    <AND <G=? .CHAR !\a> <L=? .CHAR !\z>>
                >
            >>
            <SET NUM <+ .NUM <* <GET-DIGIT .CHAR .BASE> <POWER .BASE <- .LEN .I>>>>>
        )(<AND <EQUAL? .I 1> <EQUAL? .CHAR !\- !\+>>
            <COND (<EQUAL? .CHAR !\->
                <SET SIG -1>
            )>
        )(ELSE
            <RETURN 0>
        )>
    >
    <RETURN <* .SIG .NUM>>>

<ROUTINE CONVERT-TO-NUMBER (N "OPT" BASE "AUX" INDEX START LEN)
    <COND (<NOT .BASE> <SET BASE 10>)>
    <COND (<0? <GETB ,LEXBUF 1>> <RETURN 0>)>
    <SET INDEX <* .N 4>>
    <SET START <- <GETB ,LEXBUF <+ .INDEX 1>> 1>>
    <SET LEN <GETB ,LEXBUF .INDEX>>
    <RETURN <TO-INTEGER .START .LEN .BASE>>>

<ROUTINE GUILD-INVESTMENTS ("OPT" STORY "AUX" INVESTMENTS KEY INVESTMENT)
    <COND (<NOT .STORY> <SET STORY ,HERE>)>
    <COND (<GETP .STORY ,P?INVESTMENTS>
        <REPEAT ()
            <SET INVESTMENTS <GETP .STORY ,P?INVESTMENTS>>
            <COND (<AND <L? ,MONEY 100> <L=? .INVESTMENTS 0>> <RETURN>)>
            <CRLF>
            <TELL "Current investments: " N .INVESTMENTS CR>
            <CRLF>
            <HLIGHT ,H-BOLD>
            <TELL "1">
            <HLIGHT 0>
            <TELL " - Invest (in multiples of 100 " D ,CURRENCY ")" CR>
            <HLIGHT ,H-BOLD>
            <TELL "2">
            <HLIGHT 0>
            <TELL " - Withdraw investments" CR>
            <HLIGHT ,H-BOLD>
            <TELL "0">
            <HLIGHT 0>
            <TELL " - Bye" CR>
            <TELL "You are currently carrying: " N ,MONEY " " D ,CURRENCY "." CR>
            <TELL "Select what to do next: ">
            <REPEAT ()
                <SET KEY <INPUT 1>>
                <COND (<EQUAL? .KEY !\0 !\1 !\2> <RETURN>)>
            >
            <COND (<EQUAL? .KEY !\1>
                <CRLF>
                <COND (<G? ,MONEY 100>
                    <REPEAT ()
                        <CRLF>
                        <SET INVESTMENT <GET-NUMBER "How much will you invest" 0 ,MONEY>>
                        <COND (<G? .INVESTMENT 0>
                            <COND (<OR <L? .INVESTMENT 100> <G? <MOD .INVESTMENT 100> 0>>
                                <EMPHASIZE "Only amounts that are multiples of 100 are accepted!">
                            )(ELSE
                                <CRLF>
                                <TELL "Are you sure?">
                                <COND (<YES?>
                                    <PUTP .STORY ,P?INVESTMENTS <+ .INVESTMENTS .INVESTMENT>>
                                    <SETG MONEY <- ,MONEY .INVESTMENT>>
                                    <EMPHASIZE "Excellent!">
                                    <UPDATE-STATUS-LINE>
                                )>
                                <RETURN>
                            )>
                        )>
                    >
                )(ELSE
                    <EMPHASIZE "You do not have enough money!">
                )>
            )(<EQUAL? .KEY !\2>
                <CRLF>
                <COND (<G? .INVESTMENTS 0>
                    <REPEAT ()
                        <CRLF>
                        <SET INVESTMENT <GET-NUMBER "How much will you withdraw" 0 .INVESTMENTS>>
                        <COND (<G? .INVESTMENT 0>
                            <CRLF>
                            <TELL "Are you sure?">
                            <COND (<YES?>
                                <PUTP .STORY ,P?INVESTMENTS <- .INVESTMENTS .INVESTMENT>>
                                <SETG MONEY <+ ,MONEY .INVESTMENT>>
                                <EMPHASIZE "Please consider investing again in the future!">
                                <UPDATE-STATUS-LINE>
                            )>
                            <RETURN>
                        )>
                    >
                )(ELSE
                    <EMPHASIZE "You have not made any investment!">
                )>
            )(<EQUAL? .KEY !\0>
                <CRLF>
                <CRLF>
                <TELL "Are you sure?">
                <COND (<YES?>
                    <EMPHASIZE "See you next time!">
                    <RETURN>
                )(ELSE
                    <EMPHASIZE "Excellent!">
                )>
            )>
        >
    )>>

<CONSTANT CHOICES030-BUY <LTABLE "Buy armour" "Buy weapons" "Buy Magical Equipment" "Buy other items" "Return to the Market">>

<ROOM YELLOWPORT-BUY
	(DESC "030 Merchant - Selling")
	(CHOICES CHOICES030-BUY)
	(DESTINATIONS <LTABLE YELLOWPORT-BUY-ARMOUR YELLOWPORT-BUY-WEAPONS YELLOWPORT-BUY-MAGIC YELLOWPORT-BUY-OTHER STORY030>)
    (TYPES FIVE-NONES)
	(FLAGS LIGHTBIT)>

<ROOM YELLOWPORT-BUY-ARMOUR
	(DESC "030 Merchant - Selling armours")
    (EVENTS YELLOWPORT-SELLING-ARMOUR)
    (CONTINUE YELLOWPORT-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-SELLING-ARMOUR ()
    <MERCHANT <LTABLE LEATHER-ARMOUR RING-MAIL CHAIN-MAIL> <LTABLE 50 100 200>>>

<ROOM YELLOWPORT-BUY-WEAPONS
	(DESC "030 Merchant - Selling weapons")
    (EVENTS YELLOWPORT-SELLING-WEAPONS)
    (CONTINUE YELLOWPORT-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-SELLING-WEAPONS ()
    <MERCHANT <LTABLE BATTLE-AXE MACE SPEAR STAFF SWORD BATTLE-AXE1 MACE1 SPEAR1 STAFF1 SWORD1> <LTABLE 50 50 50 50 50 250 250 250 250 250>>>

<ROOM YELLOWPORT-BUY-MAGIC
	(DESC "030 Merchant - Selling magic items")
    (EVENTS YELLOWPORT-SELLING-MAGIC)
    (CONTINUE YELLOWPORT-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-SELLING-MAGIC ()
    <MERCHANT <LTABLE AMBER-WAND> <LTABLE 500>>>

<ROOM YELLOWPORT-BUY-OTHER
	(DESC "030 Merchant - Selling other items")
    (EVENTS YELLOWPORT-SELLING-OTHER)
    (CONTINUE YELLOWPORT-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-SELLING-OTHER ()
    <MERCHANT <LTABLE MANDOLIN HOLY-SYMBOL COMPASS ROPE LANTERN CLIMBING-GEAR RAT-POISON> <LTABLE 300 200 500 50 100 100 60>>>

<CONSTANT CHOICES030-SELL <LTABLE "Sell armour" "Sell weapons (no COMBAT bonuses)" "Sell weapons (Tier I)" "Sell weapons (Tier II)" "Sell weapons (Tier III)" "Sell Magical Equipment" "Sell other items" "Return to the Market">>

<ROOM YELLOWPORT-SELL
	(DESC "030 Merchant - Buying")
	(CHOICES CHOICES030-SELL)
	(DESTINATIONS <LTABLE YELLOWPORT-SELL-ARMOUR YELLOWPORT-SELL-WEAPONS YELLOWPORT-SELL-WEAPONS1 YELLOWPORT-SELL-WEAPONS2 YELLOWPORT-SELL-WEAPONS3 YELLOWPORT-SELL-MAGIC YELLOWPORT-SELL-OTHER STORY030>)
    (TYPES EIGHT-NONES)
	(FLAGS LIGHTBIT)>

<ROOM YELLOWPORT-SELL-ARMOUR
	(DESC "030 Merchant - Buying armours")
    (EVENTS YELLOWPORT-BUYING-ARMOUR)
    (CONTINUE YELLOWPORT-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-BUYING-ARMOUR ()
    <MERCHANT <LTABLE LEATHER-ARMOUR RING-MAIL CHAIN-MAIL SPLINT-ARMOUR PLATE-ARMOUR HEAVY-PLATE> <LTABLE 45 90 180 360 720 1440> ,PLAYER T>>

<ROOM YELLOWPORT-SELL-WEAPONS
	(DESC "030 Merchant - Buying weapons (no COMBAT bonuses)")
    (EVENTS YELLOWPORT-BUYING-WEAPONS)
    (CONTINUE YELLOWPORT-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-BUYING-WEAPONS ()
    <MERCHANT <LTABLE BATTLE-AXE MACE SPEAR STAFF SWORD> <LTABLE 40 40 40 40 40> ,PLAYER T>>

<ROOM YELLOWPORT-SELL-WEAPONS1
	(DESC "030 Merchant - Buying weapons (COMBAT +1)")
    (EVENTS YELLOWPORT-BUYING-WEAPONS1)
    (CONTINUE YELLOWPORT-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-BUYING-WEAPONS1 ()
    <MERCHANT <LTABLE BATTLE-AXE1 MACE1 SPEAR1 STAFF1 SWORD1> <LTABLE 200 200 200 200 200> ,PLAYER T>>

<ROOM YELLOWPORT-SELL-WEAPONS2
	(DESC "030 Merchant - Buying weapons (COMBAT +2)")
    (EVENTS YELLOWPORT-BUYING-WEAPONS2)
    (CONTINUE YELLOWPORT-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-BUYING-WEAPONS2 ()
    <MERCHANT <LTABLE BATTLE-AXE2 MACE2 SPEAR2 STAFF2 SWORD2> <LTABLE 400 400 400 400 400> ,PLAYER T>>

<ROOM YELLOWPORT-SELL-WEAPONS3
	(DESC "030 Merchant - Buying weapons (COMBAT +3)")
    (EVENTS YELLOWPORT-BUYING-WEAPONS3)
    (CONTINUE YELLOWPORT-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-BUYING-WEAPONS3 ()
    <MERCHANT <LTABLE BATTLE-AXE3 MACE3 SPEAR3 STAFF3 SWORD3> <LTABLE 800 800 800 800 800> ,PLAYER T>>

<ROOM YELLOWPORT-SELL-MAGIC
	(DESC "030 Merchant - Buying magic items")
    (EVENTS YELLOWPORT-BUYING-MAGIC)
    (CONTINUE YELLOWPORT-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-BUYING-MAGIC ()
    <MERCHANT <LTABLE AMBER-WAND EBONY-WAND COBALT-WAND> <LTABLE 400 800 600> ,PLAYER T>>

<ROOM YELLOWPORT-SELL-OTHER
	(DESC "030 Merchant - Buying other items")
    (EVENTS YELLOWPORT-BUYING-OTHER)
    (CONTINUE YELLOWPORT-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE YELLOWPORT-BUYING-OTHER ()
    <MERCHANT <LTABLE MANDOLIN LOCKPICKS HOLY-SYMBOL COMPASS ROPE LANTERN CLIMBING-GEAR BAG-OF-PEARLS RAT-POISON SILVER-NUGGET TREASURE-MAP> <LTABLE 270 270 100 450 45 90 90 100 50 200 150> ,PLAYER T>>

<CONSTANT INSTRUCTIONS-HEADER "|HOW TO USE THIS E-ADVENTURE|">
<CONSTANT INSTRUCTIONS-TEXT "Fabled Lands: War-Torn Kingdom is a digital gamebook -- an interactive game where the choices that you make correspond to numbered sections in the game. In moving through these sections you are creating a unique story for your adventuring persona.||You will begin your adventure by choosing a profession (see below) and filling out the Adventure Sheet with the ability scores and Stamina that correspond to that profession at 1st Rank.||ABILITIES|---------||You have six abilities. Your initial score in each ability is decided by your choice of profession. Ability scores range from 1 (low ability) to 6 (a high level of ability). Ability scores will change during your adventure but can never be lower than 1 or higher than 12.||CHARISMA the knack of befriending people|COMBAT the skill of fighting|MAGIC the art of casting spells|SANCTITY the gift of divine power and wisdom|SCOUTING the techniques of tracking and wilderness lore|THIEVERY the talent for stealth and lock picking||STAMINA|-------||Stamina is lost when you get hurt. Keep track of your Stamina score throughout your travels and adventures. You must guard against your Stamina score dropping to zero, because if it does you are dead.||Lost Stamina can be recovered by various means, but your Stamina cannot go above its initial score until you advance in Rank.||You start with 9 Stamina points.||RANK|----||You start at 1st Rank. By completing quests and overcoming enemies, you will have the chance to go up in Rank.||You will be told during the course of your adventures when you are entitled to advance in Rank. Characters of higher Rank are tougher, luckier and generally better able to deal with trouble.||POSSESSIONS|-----------||You can carry up to twelve possessions on your person. All characters begin with 16 Shards in cash and the following possessions:||* sword|* leather jerkin (Defence +1)||Remember that you are limited to carrying a total of 12 items, so if you get more than this you'll have to cross something off your inventory or find somewhere to store extra items. There is no limit to how much money you can carry.||DEFENCE|-------||Your Defence score is equal to:||* you COMBAT score|* plus plus your RANK|* plus the bonus for the armour you're wearing (if any)||Every suit of armour you find will have a Defence bonus listed for it. The higher the bonus, the better the armour. You can carry several suits of armour if you wish -- but because you can wear only one at a time, you only get the Defence bonus of the best armour you are carrying.||To start with it is just your COMBAT score plus 2 (because you are 1st Rank and have +1 armour).||It will be updated it if you get better armour or increase in Rank or COMBAT ability.||ADDITIONAL HELP|---------------||During action selection and in other parts of the game, pressing 'H' or '?' brings up a list of additional command keys.">

<CONSTANT INSTRUCTIONS-PROFESSIONS "PROFESSIONS||Every adventurer has some strengths and some weaknesses. Your choice of profession determines your initial scores in the six abilities.">

<ROUTINE INSTRUCTIONS ()
    <HLIGHT ,H-BOLD>
    <TELL INSTRUCTIONS-HEADER>
    <HLIGHT 0>
    <CRLF>
    <TELL INSTRUCTIONS-TEXT>
    <CRLF>>

<CONSTANT HELP-TEXT "C - Display player information (abilities, items, codewords)|I - Display inventory (items)|R - Restore progress from a saved file|S - Save current progress to a file|Q - quit the game">

<ROUTINE DISPLAY-HELP ()
    <CRLF>
    <HLIGHT ,H-BOLD>
    <TELL "Additional Command Keys:">
    <HLIGHT 0>
    <CRLF><CRLF>
    <TELL HELP-TEXT>
    <CRLF>>

<GLOBAL STARTING-POINT STORY001>

; "reset routines"
<ROUTINE RESET-OBJECTS ()
	<FSET ,LEATHER-JERKIN ,WORNBIT>
	<RETURN>>

<ROUTINE RESET-STORY ()
	<PUTP ,STORY038 ,P?REQUIREMENTS ,STORY038-ODDS>
	<PUTP ,STORY014 ,P?DOOM T>
	<PUTP ,STORY034 ,P?DOOM T>
	<PUTP ,STORY036 ,P?DOOM T>
	<PUTP ,STORY042 ,P?DOOM T>
	<PUTP ,STORY043 ,P?DOOM T>
	<PUTP ,STORY045 ,P?DOOM T>
	<PUTP ,STORY617 ,P?DOOM T>
    <RETURN>>

; "story objects and variables"

; "endings"
<CONSTANT BAD-ENDING "Your adventure ends here.|">
<CONSTANT GOOD-ENDING "Further adventure awaits.|">
<CONSTANT ENDING-BLOOD-DARK-SEA "Further adventure awaits at Fabled Lands 3: Over the Blood-Dark Sea.|">

<OBJECT CURRENCY (DESC "shards")>
<OBJECT VEHICLE (DESC "ship")>

<ROUTINE SPECIAL-INTERRUPT-ROUTINE (KEY)
	<RFALSE>>

<CONSTANT DIED-IN-COMBAT "You died in combat">
<CONSTANT DIED-OF-HUNGER "You starved to death">
<CONSTANT DIED-GREW-WEAKER "You grew weaker and eventually died">
<CONSTANT DIED-FROM-INJURIES "You died from your injuries">
<CONSTANT DIED-FROM-COLD "You eventually freeze to death">
<CONSTANT NATURAL-HARDINESS "Your natural hardiness made you cope better with the situation">

<CONSTANT HAVE-A "You have a">
<CONSTANT HAVE-THE "You have the">
<CONSTANT HAVE-CODEWORD "You have the codeword">
<CONSTANT HAVE-NEITHER "You have neither">
<CONSTANT IF-NOT "If not">
<CONSTANT OTHERWISE "Otherwise">

<CONSTANT TEXT-ROLL-COMBAT "Make a COMBAT roll">
<CONSTANT TEXT-ROLL-CHARISMA "Make a CHARISMA roll">
<CONSTANT TEXT-ROLL-MAGIC "Make a MAGIC roll">
<CONSTANT TEXT-ROLL-SANCTITY "Make a SANCTITY roll">
<CONSTANT TEXT-ROLL-SCOUTING "Make a SCOUTING roll">

<CONSTANT STORY038-ODDS <LTABLE <LTABLE 1 3 5 20>>>

<CONSTANT TEXT001 "The first sound is the gentle murmur of waves some way off. The cry of gulls. Then the sensation of a softly stirring sea breeze and the baking sun on your back.||If that was all, you could imagine yourself in paradise, but as your senses return you start to feel the aches in every muscle. And then you remember the shipwreck.||You force open your eyes, caked shut by a crust of salt. You are lying on a beach, a desolate slab of wet sand that glistens in the merciless glare of the sun. Small crabs break away as you stir, scurrying for cover amid the long strands of seaweed.||\"Not... food for you yet...\" you murmur, wincing at the pain of cracked lips. Your mouth is dry and there is a pounding in your head born of fatigue and thirst. You don\"t care about the headache or the bruises, just as long as you\"re alive.||As you lie gathering your strength, you hear somebody coming along the shore.">
<CONSTANT CHOICES001 <LTABLE "Lie still until he's gone" "Speak to him">>

<ROOM STORY001
	(DESC "001")
	(STORY TEXT001)
	(CHOICES CHOICES001)
	(DESTINATIONS <LTABLE STORY736 STORY020>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT002 "You are face to face with a soldier. But is he friend -- or foe?">
<CONSTANT CHOICES002 <LTABLE HAVE-A HAVE-CODEWORD HAVE-NEITHER>>

<ROOM STORY002
	(DESC "002")
	(STORY TEXT002)
	(CHOICES CHOICES002)
	(DESTINATIONS <LTABLE STORY676 STORY098 STORY680>)
	(REQUIREMENTS <LTABLE CODED-MISSIVE CODEWORD-DELIVER NONE>)
	(TYPES <LTABLE R-ITEM R-CODEWORD R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT003 "You have come to the foothills of the Spine of Harkun, in the north west of Sokara. The view is impressive: a massive wall of forested mountains, whose rocky, white-flanked peaks soar skywards into the clouds. These parts of the mountains are unscalable but you notice a large cave at the bottom of a mountain.">
<CONSTANT CHOICES003 <LTABLE "Investigate the cave" "Go east to the Citadel of Velis Corin" "South into the wilderness">>

<ROOM STORY003
	(DESC "003")
	(STORY TEXT003)
	(CHOICES CHOICES003)
	(DESTINATIONS <LTABLE STORY665 STORY271 STORY276>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT004 "The priests of Alvir and Valmir are overjoyed that you have returned the golden net. The high priest rewards you with 100 Shards and a rune-engraved magic weapon.">

<ROOM STORY004
	(DESC "004")
	(STORY TEXT004)
	(EVENTS STORY004-EVENTS)
	(CONTINUE STORY220)
	(ITEMS <LTABLE TRIDENT>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY004-EVENTS ()
	<RETURN-ITEM ,GOLDEN-NET T>
	<GAIN-MONEY 100>>

<CONSTANT TEXT005 "It is a tough climb upwards but not impossible.">

<ROOM STORY005
	(DESC "005")
	(STORY TEXT005)
	(EVENTS STORY005-EVENTS)
	(CONTINUE STORY681)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY005-EVENTS ()
	<ITEM-JUMP ,CLIMBING-GEAR ,STORY652>>

<CONSTANT TEXT006 "The chest springs open with a click. Inside you find 60 Shards, a mandolin (CHARISMA +1), and a potion of healing. The potion can be used once at any time (even in combat) to restore 5 Stamina points.||There is also an ancient religious text about the gods of Uttaku, called the scroll of Ebron, which reveals that one of the gods of the Uttakin is called Ebron, and that he has fourteen angles. You double-check but that's what it says. Not angels, angles.">

<ROOM STORY006
	(DESC "006")
	(STORY TEXT006)
	(EVENTS STORY006-EVENTS)
	(CONTINUE STORY010)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY006-EVENTS ()
	<SELECT-FROM-LIST <LTABLE MANDOLIN POTION-OF-HEALING SCROLL-OF-EBRON> 3 3>>

<CONSTANT TEXT007 "Much to your embarrassment, you get lost in the vast forest. You wander around for days until you finally emerge at the Bronze Hills.">

<ROOM STORY007
	(DESC "007")
	(STORY TEXT007)
	(CONTINUE STORY110)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT008 "You step through the archway. Immediately the symbols on the stone begin to glow with red-hot energy; your hair stands on end and your body tingles. A crackling nimbus of blue-white force engulfs you, the sky darkens and thunder and lightning crash and leap across the heavens. Suddenly, your vision fades, and everything goes black.||When your sight returns, you find yourself at the gates of a large city, set on an ochre-coloured river. A vile stink of brimstone permeates the air. You wrinkle your face up in disgust and gag involuntarily.||\"Welcome to Yellowport,\" says a passing merchant.">

<ROOM STORY008
	(DESC "008")
	(STORY TEXT008)
	(CONTINUE STORY010)
	(FLAGS LIGHTBIT)>

<ROOM STORY009
	(DESC "009")
	(BACKGROUND STORY009-BACKGROUND)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY009-BACKGROUND ()
	<COND (<CHECK-CODEWORD ,CODEWORD-ALTITUDE> <RETURN ,STORY272>)>
	<RETURN ,STORY685>>

<CONSTANT TEXT010 "Yellowport is the second largest city in Sokara. It is mainly a trading town, and is known for its exotic goods from distant Ankon-Konu.||The Stinking River brings rich deposits of sulphur from the Lake of the Sea Dragon down to the town, where it is extracted and stored in the large waterfront warehouses run by the merchants' guild. From here, the mineral is exported all over Harkuna. But all that sulphur has its drawbacks. The stink is abominable, and much of the city has a yellowish hue. The river is so full of sulphur that it is virtually useless as drinking water. However, the demand for sulphur, especially from the sorcerous guilds, is great.||Politically much has changed in the past few years. The old and corrupt king of Sokara, Corin VII, has been deposed and executed in a military coup. General Grieve Marlock and the army now control Sokara. The old Council of Yellowport has been indefinitely dissolved and a provost marshal, Marloes Marlock, the general's brother, appointed as military governor of the town.||You can buy a townhouse in Yellowport for 200 Shards. Owning a townhouse gives you a place to rest and to store equipment. To leave Yellowport by sea, buy or sell ships and cargo, go to the harbourmaster.">

<CONSTANT YELLOWPORT-CHOICES 
	<LTABLE
		"Call on Pyletes the Sage"
		"Seek an audience with the provost marshal"
		"Visit the market"
		"Visit the harbourmaster"
		"Go to the merchants' guild"
		"Explore the city by day"
		"Explore the city by night"
		"Visit your townhouse"
		"Visit the Gold Dust Tavern"
		"Visit the temple of Maka"
		"Visit the temple of Elnir"
		"Visit the temple of Alvir and Valmir"
		"Visit the temple of Tyrnai"
		"Travel north-east toward Venefax"
		"Head north-west to Trefoille"
		"Follow the Stinking River north"
		"Strike out north-west, across country"
		"Visit your secret cache"
		"Go down into the sewers"
	>>

<CONSTANT YELLOWPORT-DESTINATIONS
	<LTABLE
		STORY040
		STORY523
		STORY030
		STORY555
		STORY405
		STORY302
		STORY442
		STORY300
		STORY506
		STORY141
		STORY316
		STORY220
		STORY526
		STORY621
		STORY233
		STORY082
		STORY558
		STORY327
		STORY460
	>>

<CONSTANT YELLOWPORT-REQUIREMENTS
	<LTABLE
		<LTABLE CODEWORD-ARTIFACT BOOK-OF-THE-SEVEN-SAGES>
		NONE
		NONE
		NONE
		NONE
		NONE
		NONE
		CODEWORD-ABIDE
		NONE
		NONE
		NONE
		NONE
		NONE
		NONE
		NONE
		NONE
		NONE
		CODEWORD-ACID
		CODEWORD-AJAR
	>>

<CONSTANT YELLOWPORT-TYPES
	<LTABLE
		R-CODEWORD-ITEM
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-CODEWORD
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-NONE
		R-CODEWORD
		R-CODEWORD
	>>

<ROOM STORY010
	(DESC "010")
	(VISITS 0)
	(BACKGROUND STORY010-BACKGROUND)
	(STORY TEXT010)
	(EVENTS STORY010-EVENTS)
	(CHOICES YELLOWPORT-CHOICES)
	(DESTINATIONS YELLOWPORT-DESTINATIONS)
	(REQUIREMENTS YELLOWPORT-REQUIREMENTS)
	(TYPES YELLOWPORT-TYPES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY010-BACKGROUND ()
	<COND (<CHECK-CODEWORD ,CODEWORD-ASSASSIN>
		<RETURN ,STORY050>
	)(<CHECK-VISITS-EQUAL ,STORY010 4>
		<RETURN ,STORY273>
	)>>

<ROUTINE STORY010-EVENTS ()
	<COND (<AND <NOT <CHECK-CODEWORD ,CODEWORD-ABIDE>> <G=? ,MONEY 200>>
		<CRLF>
		<TELL "Would you like to buy a townhouse in Yellowport (200 " D ,CURRENCY ")?">
		<COND (<YES?>
			<COST-MONEY 200>
			<GAIN-CODEWORDS <LTABLE CODEWORD-ABIDE>>
		)>
	)>>

<CONSTANT TEXT011 "A narrow path leads up the hill, the top of which is crowned with a circle of large obsidian standing stones, hewn from solid rock. Despite the bitter wind that blows across these hills, the stones are unweathered and seem but newly lain. They form three archways, each carved with mystic symbols and runes of power.">

<ROOM STORY011
	(DESC "011")
	(STORY TEXT011)
	(CONTINUE STORY065)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT012 "You tell them a story of tragic love between a merman and a human princess. The merfolk are moved to shed briny tears, and one of them plants a languorous kiss on your lips.||You find you can indeed breathe underwater now. The merfolk lead you into the depths, where they swim playfully around you.||Suddenly, a hideous form looms out of the murk. It is like a giant squid, but it carries a spear in one of its many tentacles and wears rudimentary armour. Great black eyes shine with an implacable alien intelligence. The merfolk dart away in fright, leaving you alone with the creature.">

<ROOM STORY012
	(DESC "012")
	(STORY TEXT012)
	(EVENTS STORY012-EVENTS)
	(CONTINUE STORY238)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY012-EVENTS ()
	<CODEWORD-JUMP ,CODEWORD-ANCHOR ,STORY116>>

<CONSTANT TEXT013 "\"The Violet Ocean's a dangerous place, Cap'n,\" says the first mate. \"The crew
won't follow you there if they don't think you're good enough.\"">
<CONSTANT CHOICES013 <LTABLE "Demand that the crew follow your orders" TEXT-ROLL-CHARISMA "Turn back">>

<ROOM STORY013
	(DESC "013")
	(STORY TEXT013)
	(CHOICES CHOICES013)
	(DESTINATIONS <LTABLE BLOOD-DARK-SEA <LTABLE BLOOD-DARK-SEA STORY507> STORY507>)
	(REQUIREMENTS <LTABLE 4 <LTABLE ABILITY-CHARISMA 12> NONE>)
	(TYPES <LTABLE R-RANK R-TEST-ABILITY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT014 "Someone stabs you in the back.">
<CONSTANT TEXT014-CONTINUED "You spin around just as a beefy, disreputable-looking thug comes for you again with a long dagger.||\"Get the snooping swine!\" yells the man with the eye patch">

<ROOM STORY014
	(DESC "014")
	(STORY TEXT014)
	(EVENTS STORY014-EVENTS)
	(CONTINUE STORY476)
	(DOOM T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY014-EVENTS ()
	<LOSE-STAMINA 5 ,DIED-FROM-INJURIES ,STORY014>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL TEXT014-CONTINUED>
		<TELL ,PERIOD-CR>
		<COMBAT-MONSTER ,MONSTER-THUG 3 6 13>
		<CHECK-COMBAT ,MONSTER-THUG ,STORY014>
	)>>

<CONSTANT TEXT015 "Three drunken army officers accost you on the street.">

<ROOM STORY015
	(DESC "015")
	(STORY TEXT015)
	(EVENTS STORY015-EVENTS)
	(CONTINUE STORY686)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY015-EVENTS ()
	<TITLE-JUMP ,TITLE-PROTECTOR-SOKARA ,STORY542>>

<ROOM STORY016
	(DESC "016")
	(VISITS 0)
	(BACKGROUND STORY016-BACKGROUND)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY016-BACKGROUND ()
	<COND (<CHECK-VISITS-MORE ,STORY016 1> <RETURN ,STORY251>)>
	<RETURN ,STORY688>>

<CONSTANT TEXT017 "The horse and you hit the wall. There is a bright flash, and you find that you have passed straight through into the hill. It must be a faerie mound -- and that's not good. The horse you are riding abruptly changes shape in a puff of smoke. You find yourself on the back of a little knobbly-limbed, white-faced goblin, who promptly collapses under your weight.||You are in a cavern lit by mouse-sized faerie folk, who flit about in the air blazing like fireflies. The other horses have also turned into goblins, elves and faeries of all shapes and sizes.||\"What have we here?\" whispers a pale, dark-eyed elfin woman, dressed in silvery cobwebs and wearing a platinum crown.||\"An overweight mortal sitting on poor old Gobrash, your majesty,\" groans the goblin you are sitting on.||You realize you are in great danger here. There's no telling what the faerie folk will do to you. The queen signals to her people and they close in around you ominously.">
<CONSTANT CHOICES017 <LTABLE TEXT-ROLL-SANCTITY>>

<ROOM STORY017
	(DESC "017")
	(STORY TEXT017)
	(CHOICES CHOICES017)
	(DESTINATIONS <LTABLE <LTABLE STORY626 STORY268>>)
	(REQUIREMENTS <LTABLE <LTABLE ABILITY-SANCTITY 9>>)
	(TYPES <LTABLE R-TEST-ABILITY>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT018 "You spin them a tale about how your poor brother, a mercenary in Grieve Marlock's personal guard, lost his legs in the fight to overthrow the old king, and that you have spent all your money on looking after him.||Several of the militia are brought to tears by your eloquent speech. They end up having a whip-round among themselves for your brother, and they give you 15 Shards. Chuckling to yourself, you return to the city centre.">

<ROOM STORY018
	(DESC "018")
	(STORY TEXT018)
	(EVENTS STORY018-EVENTS)
	(CONTINUE STORY010)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY018-EVENTS ()
	<GAIN-MONEY 15>>

<CONSTANT TEXT019 "The Dragon Knights are impressed with your combat skills. Your opponent comes round, ruefully rubbing his neck. Grudgingly, he admits to your superior skill and hands you his weapon and armour. You get an ordinary sword and a suit of heavy plate (Defence +6).">

<ROOM STORY019
	(DESC "019")
	(VISITS 2)
	(STORY TEXT019)
	(EVENTS STORY019-EVENTS)
	(CONTINUE STORY276)
	(ITEMS <LTABLE SWORD HEAVY-PLATE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY019-EVENTS ()
	<COND (<CHECK-VISITS-MORE ,STORY019 2> <GAIN-CODEWORD ,CODEWORD-ANVIL>)>>

<CONSTANT TEXT020 "Wary of danger, you lose no time in getting to your feet, but it is only an old man gathering driftwood.||\"What have we here?\" he asks, edging closer. \"All wet and out of luck, you look. Washed-up, eh?\"||\"Where is this?\" Your eyes take in the empty shore, the cliffs, the forest of the hinterland. None of it is familiar to you.||\"You don't know?\" The old man gives you a keener look, and a more serious look comes into his eyes. \"Can it be? After all my waiting, the prophecy is fulfilled at last?\"||\"Prophecy? What are you talking about?\"||\"It was written in the stars that someone like you would come. A traveller from a far land. Great things are in store for you, my young friend.\"||The old man turns smartly about and begins walking up a path. Looking past him, you can just make out a monolithic stone structure atop the cliffs.||\"You still haven't told me where I am.\"||\"This is the Isle of the Druids.\" He gestures to the west. \"The great continent of Harkuna lies a few leagues that way. But if you want to explore it, you'd better come with me.\"||\"Come with you where?\"||He points. \"That ring of stones up there. It's called the Gates of the World.\"">
<CONSTANT CHOICES020 <LTABLE "Follow him" "Explore the Coast" "Head into the nearby forest">>

<ROOM STORY020
	(DESC "020")
	(STORY TEXT020)
	(CHOICES CHOICES020)
	(DESTINATIONS <LTABLE STORY192 STORY128 STORY257>)
	(TYPES THREE-NONES)
	(CODEWORDS <LTABLE CODEWORD-AURIC>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT021 "While making your way through the back streets of the poor quarter you are set upon by a knife-wielding thug who is intent on relieving you of your purse.">
<CONSTANT CHOICES021 <LTABLE "Reason with him" "Fight">>

<ROOM STORY021
	(DESC "021")
	(STORY TEXT021)
	(CHOICES CHOICES021)
	(DESTINATIONS <LTABLE STORY689 STORY690>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT022 "You reach down and deftly pull out the ceramic plug. A gush of foul-smelling emerald green liquid spills on to the floor, and the golem twitches once before collapsing. The other golem is coming to life, however. You'll have to be quick to get it in time.">
<CONSTANT CHOICES022 <LTABLE TEXT-ROLL-COMBAT>>

<ROOM STORY022
	(DESC "022")
	(STORY TEXT022)
	(CHOICES CHOICES022)
	(DESTINATIONS <LTABLE <LTABLE STORY539 STORY647>>)
	(REQUIREMENTS <LTABLE <LTABLE ABILITY-COMBAT 9>>)
	(TYPES <LTABLE R-TEST-ABILITY>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT023 "As you stride forward, they look up with expressions of luminous rage.||\"Get you back, mortal,\" warns one, \"or I'll touch you with my grave-cold hands and then it'll be your dying day.\"">
<CONSTANT CHOICES023 <LTABLE "Attack them" "Call on your god to banish them">>

<ROOM STORY023
	(DESC "023")
	(STORY TEXT023)
	(CHOICES CHOICES023)
	(DESTINATIONS <LTABLE STORY479 STORY520>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT024 "You will need to subdue the king and his henchmen with a spell.">
<CONSTANT CHOICES024 <LTABLE TEXT-ROLL-MAGIC>>

<ROOM STORY024
	(DESC "024")
	(STORY TEXT024)
	(CHOICES CHOICES024)
	(DESTINATIONS <LTABLE <LTABLE STORY644 STORY208>>)
	(REQUIREMENTS <LTABLE <LTABLE ABILITY-MAGIC 12>>)
	(TYPES <LTABLE R-TEST-ABILITY>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT025 "Captain Vorkung is impressed with your claims of loyalty to the rightful king. He decides you might be useful to their cause, and you are led, blindfolded, through a secret pass to a mountain stockade.||King Nergan gives you an audience in a makeshift throne room. He is a young, and handsome man, who seems committed to his country. He leads you aside, into a private chamber.||\"I have need of one such as you,\" he says. \"Yellowport groans under the yoke of Governor Marloes Marlock, the brother of General Grieve Marlock. If you can get into the palace at Yellowport and assassinate Marloes, I will be eternally grateful.\"">

<ROOM STORY025
	(DESC "025")
	(BACKGROUND NONE)
	(STORY TEXT025)
	(EVENTS STORY025-EVENTS)
	(CONTINUE STORY735)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY025-EVENTS ()
	<CODEWORD-JUMP ,CODEWORD-ARTERY ,STORY399>>

<CONSTANT TEXT026 "You set sail for Dweomer. The journey takes a few days but is uneventful. The captain can't believe his luck. \"I half-expected us to end up wrecked on rocks or seized by Uttakin slavers,\" he says with evident relief. You disembark at Dweomer harbour, on the Sorcerers' Isle.">

<ROOM STORY026
	(DESC "026")
	(STORY TEXT026)
	(CONTINUE BLOOD-DARK-SEA)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT027 "Either you are recklessly brave or very foolish to visit the palace where you assassinated the governor. Provost Marshal Royzer has established new security procedures, and it is impossible for you to see him.">

<ROOM STORY027
	(DESC "027")
	(STORY TEXT027)
	(CONTINUE STORY010)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT028 "You jump into the air and hit the ground rolling. You come up, bruised but alive, in time to see the horses ride straight into the rocky wall of a low hill. To your amazement, they pass straight through the rock and disappear. Silence falls across the land like a blanket. There is no sign of them, not even tracks. You camp for the night and the next day set off once more.">
<CONSTANT CHOICES028 <LTABLE "North across country" "East to the road" "To Trefoille" "To Marlock City" "West towards the River Grimm">>

<ROOM STORY028
	(DESC "028")
	(STORY TEXT028)
	(CHOICES CHOICES028)
	(DESTINATIONS <LTABLE STORY560 STORY558 STORY250 STORY100 STORY099>)
	(TYPES FIVE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT029 "Your ship is sailing in the coastal waters beside Yellowport. There are a number of other ships, mostly merchantmen, but there are also a few warships of the Sokaran Imperial Navy. \"At least we won't be plagued by pirates with the navy around,\" says the first mate.">
<CONSTANT CHOICES029 <LTABLE "Random Event (Storm/An uneventful voyage/Sokaran war galley)">>

<ROOM STORY029
	(DESC "029")
	(STORY TEXT029)
	(CHOICES CHOICES029)
	(DESTINATIONS <LTABLE <LTABLE STORY613 STORY439 STORY165>>)
	(REQUIREMENTS <LTABLE <LTABLE 2 4 9 12>>)
	(TYPES <LTABLE R-RANDOM>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT030 "The market is large and busy. At the corners of Brimstone Plaza, gigantic braziers burn sweet-smelling incense in an attempt to overpower the rotten-egg smell that permeates the whole city. There are many stalls and goods to choose from.||One trader is offering a treasure map for sale at 200 Shards. He will also buy any old treasure map for 150 Shards.||To buy cargo for a ship, you need to visit the warehouses at the
harbourmaster.">
<CONSTANT CHOICES030 <LTABLE "buy armours/weapons/magical/equipment/other items" "sell armours/weapons/magical/equipment/other items" "buy treasure map" "go back to town">>

<ROOM STORY030
	(DESC "030")
	(STORY TEXT030)
	(CHOICES CHOICES030)
	(DESTINATIONS <LTABLE YELLOWPORT-BUY YELLOWPORT-SELL STORY200 STORY010>)
	(REQUIREMENTS <LTABLE NONE NONE 200 NONE>)
	(TYPES <LTABLE R-NONE R-NONE R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT031 "A dark emptiness surrounds you. Then, as if in your sleep, you see a tiny glimmer of light off in the distance. Suddenly you wake up, coughing and spluttering, up to your neck in water. You look around. You are floundering in the holy waters of Blessed Springs.||Standing at the side of the pool is a tall, slim, mustachioed man who says, \"I am Aklar the Bold. I found you as bottled dust in the lair of Vayss the Sea Dragon. By sprinkling your ashes into the holy waters, I have brought you back to life. I think a reward is in order, don't you?\"||\"As you can see, I have literally nothing to give you.\"||Aklar frowns in annoyance. \"Blast, I knew I should have taken one of the other bottles. Well, you'll just have to owe me a favour. A big favour.\"||\"I can hardly refuse.\"||\"Well, I must be about my business. We shall meet again, count on it.\"||With that he leaves.||You stagger out of the pool.">

<ROOM STORY031
	(DESC "031")
	(STORY TEXT031)
	(CONTINUE STORY510)
	(CODEWORDS <LTABLE CODEWORD-AKLAR>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT032 "You head across the hot, dusty and sparsely vegetated land. Vultures circle overhead -- presumably they think you're going to die. You wander on, until you come to a ridge. Down below, in a shallow valley, is a great mound of earth. Scorpion men crawl in and out of the many burrows that riddle the earth.
The number of scorpion men in the valley makes your heart quail; the place is too deadly to enter.">

<ROOM STORY032
	(DESC "032")
	(STORY TEXT032)
	(EVENTS STORY032-EVENTS)
	(CONTINUE STORY492)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY032-EVENTS ()
	<CODEWORD-JUMP ,CODEWORD-ARTIFACT ,STORY406>>

<CONSTANT TEXT033 "Resurrection costs 200 Shards if you are an initiate, and 800 Shards if not. It is the last word in insurance. Once you have arranged for resurrection you need not fear death, as you will be magically restored to life here at the temple. To arrange resurrection, pay the fee.||You can have only one resurrection arranged at any one time. If you arrange another resurrection later at a different temple, the original one is cancelled. You do not get a refund.">

<ROOM STORY033
	(DESC "033")
	(STORY TEXT033)
	(EVENTS STORY033-EVENTS)
	(CONTINUE STORY282)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY033-EVENTS ("AUX" (FEE 800))
	<COND (<EQUAL? ,GOD ,GOD-TYRNAI> <SET FEE 200>)>
	<COND (<EQUAL? ,RESURRECTION-ARRANGEMENTS ,RESURRECTION-TYRNAI>
		<EMPHASIZE "You already made resurrection arrangements at this temple!">
	)(<G=? ,MONEY .FEE>
		<CRLF>
		<TELL "Arrange resurrection at this temple?">
		<COND (<YES?>
			<COST-MONEY .FEE "paid">
			<SETG RESURRECTION-ARRANGEMENTS ,RESURRECTION-TYRNAI>
		)>
	)(ELSE
		<EMPHASIZE "You cannot afford a resurrection arrangement at this time.">
	)>>

<CONSTANT TEXT034 "You make it only fifty feet up the sheer rock face before you lose your
footing and fall to the ground.">
<CONSTANT TEXT034-CONTINUED "You try again.">

<ROOM STORY034
	(DESC "034")
	(STORY TEXT034)
	(EVENTS STORY034-EVENTS)
	(CONTINUE STORY658)
	(DOOM T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY034-EVENTS ()
	<LOSE-STAMINA 4 ,DIED-FROM-INJURIES ,STORY034>
	<IF-ALIVE ,TEXT034-CONTINUED>>

<CONSTANT TEXT035 "You come to the top of a windswept cliff. An ancient pillar of jumbled rock,
pitted and weather-beaten, stands at the cliff's edge, like a broken finger pointing at the sky. Seagulls sing their song of desolation in the air.||Judging by the runes etched into the rock, the tor dates back to the time of the Shadar, a race that ruled Harkuna so long ago, they are lost in myth and legend.">
<CONSTANT CHOICES035 <LTABLE "Examine the runes" "Go down to the beach" "Take the road to Trefoille" "Take the road to Marlock City">>

<ROOM STORY035
	(DESC "035")
	(STORY TEXT035)
	(CHOICES CHOICES035)
	(DESTINATIONS <LTABLE STORY515 STORY097 STORY602 STORY166>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT036 "Soon you realize you are completely lost in this strange, magical forest. You wander around for days, barely able to find enough food and water.">
<CONSTANT TEXT036-CONTINUED "You eventually stagger out of the forest to the coast.">

<ROOM STORY036
	(DESC "036")
	(STORY TEXT036)
	(EVENTS STORY036-EVENTS)
	(CONTINUE STORY128)
	(DOOM T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY036-EVENTS ()
	<LOSE-STAMINA 4 ,DIED-OF-HUNGER ,STORY036>>

<CONSTANT TEXT037 "Your men have been fishing with a net. This time, however, they have caught a large shark. Afterwards, when it has been cut open, you find the remains of some poor sailor. Inside his leather pouch, you find a bag of pearls, which you can take if you wish.">

<ROOM STORY037
	(DESC "037")
	(STORY TEXT037)
	(EVENTS STORY037-EVENTS)
	(CONTINUE STORY507)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY037-EVENTS ()
	<KEEP-ITEM ,BAG-OF-PEARLS>>

<CONSTANT TEXT038 "Heavy black clouds race towards you across the sky, whipping the waves into a frenzy. The crew mutter among themselves fearfully.">
<CONSTANT TEXT038-SAFETY "The blessing of Alvir and Valmir confers safety from storms">
<CONSTANT CHOICES038 <LTABLE "The storm hits with full fury (ship sinks/mast splits/you weather the storm)">>

<ROOM STORY038
	(DESC "038")
	(STORY TEXT038)
	(EVENTS STORY038-EVENTS)
	(CHOICES CHOICES038)
	(DESTINATIONS <LTABLE <LTABLE STORY325 STORY397 STORY209>>)
	(REQUIREMENTS <LTABLE <LTABLE 1 3 5 20>>)
	(TYPES <LTABLE R-RANDOM>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY038-EVENTS ("AUX" (DICE 1) (CONDITION 0) ODDS PARAMETERS)
	<COND (<CHECK-BLESSING ,BLESSING-ALVIR-VALMIR>
		<CRLF>
		<TELL TEXT038-SAFETY>
		<TELL ,PERIOD-CR>
		<DELETE-BLESSING ,BLESSING-ALVIR-VALMIR>
		<STORY-JUMP ,STORY209>
	)(ELSE
		<SET ODDS <GETP ,STORY038 ,P?REQUIREMENTS>>
		<SET PARAMETERS <GET .ODDS 1>>
		<COND (<EQUAL? ,CURRENT-VEHICLE ,SHIP-BRIGANTINE>
			<SET DICE 2>
		)(<EQUAL? ,CURRENT-VEHICLE ,SHIP-GALLEON>
			<SET DICE 3>
		)>
		<PUT .PARAMETERS 1 .DICE>
		<COND (,CURRENT-VEHICLE
			<SET CONDITION <GETP ,CURRENT-VEHICLE ,P?STATUS>>
			<COND (<AND .CONDITION <EQUAL? .CONDITION ,CONDITION-EXCELLENT>>
				<PUT .PARAMETERS 2 1>
				<PUT .PARAMETERS 3 3>
				<PUT .PARAMETERS 4 18>
			)>
		)>
	)>
	<RETURN>>

<CONSTANT TEXT039 "You and some of your crew clamber aboard the wreck. You find some dead sailors amid the wreckage. Their bodies are curiously bloated.">
<CONSTANT CHOICES039 <LTABLE TEXT-ROLL-SCOUTING>>

<ROOM STORY039
	(DESC "039")
	(STORY TEXT039)
	(CHOICES CHOICES039)
	(DESTINATIONS <LTABLE <LTABLE STORY194 STORY465>>)
	(REQUIREMENTS <LTABLE <LTABLE ABILITY-SCOUTING 9>>)
	(TYPES <LTABLE R-TEST-ABILITY>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT040 "You take the Book of the Seven Sages to Pyletes the Sage at the Gold Dust tavern. He thanks you effusively for bringing it to him. Your reward is secret learning from the temple of Molhern, god of knowledge.">

<ROOM STORY040
	(DESC "040")
	(STORY TEXT040)
	(EVENTS STORY040-EVENTS)
	(CONTINUE STORY010)
	(TITLES <LTABLE TITLE-ILLUMINATE-MOLHERN>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY040-EVENTS ()
	<UPGRADE-ABILITIES 1>
	<DELETE-CODEWORD ,CODEWORD-ARTIFACT>
	<RETURN-ITEM ,BOOK-OF-THE-SEVEN-SAGES T>>

<CONSTANT TEXT041 "The inside of the dome is lit with an eerie yellowish glow that comes from the sea-moss that carpets the ceiling. At the far end, a grotto in the wall contains an idol made from sea shells and coral, presumably of Oannes, the god of the repulsive ones. At its feet lies the golden net of Alvir and Valmir, the object of your quest. Between you and the idol swim several of the giant squid-creatures, carrying out various undersea chores.">
<CONSTANT CHOICES041 <LTABLE "Swim back to Shadar Tor" "Fight your way to the golden net" "Trust to your magical prowess" "Rack your memory for a solution">>

<ROOM STORY041
	(DESC "041")
	(STORY TEXT041)
	(CHOICES CHOICES041)
	(DESTINATIONS <LTABLE STORY035 STORY121 STORY592 STORY487>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT042 "Two hulking shapes appear out of the shadows as if from nowhere. They are hideous creatures: manlike, standing on two legs, but with the tail and hairy features of a gigantic rat. Their yellowing teeth snap at you as they lunge for you; the ratmen also wield wicked-looking shortswords in their hands. \"Gut the human!\" yells one of them in a bestial voice. You must fight them, both at once, as if they were one opponent.">

<ROOM STORY042
	(DESC "042")
	(STORY TEXT042)
	(EVENTS STORY042-EVENTS)
	(DOOM T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY042-EVENTS ("AUX" (MODIFIER 0))
	<COND (<CHECK-ITEM ,RAT-POISON>
		<SET MODIFIER 3>
		<EMPHASIZE "The rat poison adds +3 to your COMBAT rolls.">
	)>
	<COMBAT-MONSTER ,MONSTER-TWO-RATMEN 6 9 9>
	<COND (<CHECK-COMBAT ,MONSTER-TWO-RATMEN ,STORY042 .MODIFIER>
		<STORY-JUMP ,STORY423>
	)(ELSE
		<STORY-JUMP ,STORY308>
	)>>

<CONSTANT TEXT043 "You must fight the Tomb Guardian. Luckily, your magic weapon will be effective.">

<ROOM STORY043
	(DESC "043")
	(STORY TEXT043)
	(EVENTS STORY043-EVENTS)
	(CONTINUE STORY490)
	(DOOM T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY043-EVENTS ()
	<COMBAT-MONSTER ,MONSTER-TOMB-GUARDIAN 6 8 12>
	<CHECK-COMBAT ,MONSTER-TOMB-GUARDIAN ,STORY043>>

<CONSTANT TEXT044 "You decide that discretion would be the better part of valor in this case, and step aside. The officers laugh contemptuously, and swagger past. Nothing else happens tonight.">

<ROOM STORY044
	(DESC "044")
	(STORY TEXT044)
	(CONTINUE STORY100)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT045 "The little girl runs off before you can talk to her. You thread your way through the pitted tombstones and brooding crypts of the cemetery, under a pale moon that bathes the graveyard in a sickly, pallid light. Suddenly, a foul stench fills your nostrils, and a figure rises up out of the shadows. Yellow eyes glow with feral blood-lust, and the creature sinks its black teeth into your arm before you can react.">
<CONSTANT TEXT045-CONTINUED "The ghoul, a rotting, walking corpse, lunges for you again">
<CONSTANT CHOICES045 <LTABLE "Fight it" "Invoke the power of the gods" "If you have any">>

<ROOM STORY045
	(DESC "045")
	(STORY TEXT045)
	(EVENTS STORY045-EVENTS)
	(CHOICES CHOICES045)
	(DESTINATIONS <LTABLE STORY617 STORY155 STORY303>)
	(REQUIREMENTS <LTABLE NONE NONE SALT-AND-IRON-FILINGS>)
	(TYPES <LTABLE R-NONE R-NONE R-ITEM>)
	(DOOM T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY045-EVENTS ()
	<COND (,RUN-ONCE <LOSE-STAMINA 4 ,DIED-GREW-WEAKER ,STORY045>)>
	<COND (<IS-ALIVE>
		<AFFLICTED-WITH ,DISEASE-GHOULBITE>
		<CRLF>
		<TELL TEXT045-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<ROOM STORY046
	(DESC "046")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY047
	(DESC "047")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY048
	(DESC "048")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY049
	(DESC "049")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY050
	(DESC "050")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY051
	(DESC "051")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY052
	(DESC "052")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY053
	(DESC "053")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY054
	(DESC "054")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY055
	(DESC "055")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY056
	(DESC "056")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY057
	(DESC "057")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY058
	(DESC "058")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY059
	(DESC "059")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY060
	(DESC "060")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY061
	(DESC "061")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY062
	(DESC "062")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY063
	(DESC "063")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY064
	(DESC "064")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY065
	(DESC "065")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY066
	(DESC "066")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY067
	(DESC "067")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY068
	(DESC "068")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY069
	(DESC "069")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY070
	(DESC "070")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY071
	(DESC "071")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY072
	(DESC "072")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY073
	(DESC "073")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY074
	(DESC "074")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY075
	(DESC "075")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY076
	(DESC "076")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY077
	(DESC "077")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY078
	(DESC "078")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY079
	(DESC "079")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY080
	(DESC "080")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY081
	(DESC "081")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY082
	(DESC "082")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY083
	(DESC "083")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY084
	(DESC "084")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY085
	(DESC "085")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY086
	(DESC "086")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY087
	(DESC "087")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY088
	(DESC "088")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY089
	(DESC "089")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY090
	(DESC "090")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY091
	(DESC "091")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY092
	(DESC "092")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY093
	(DESC "093")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY094
	(DESC "094")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY095
	(DESC "095")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY096
	(DESC "096")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY097
	(DESC "097")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY098
	(DESC "098")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY099
	(DESC "099")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY100
	(DESC "100")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY101
	(DESC "101")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY102
	(DESC "102")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY103
	(DESC "103")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY104
	(DESC "104")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY105
	(DESC "105")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY106
	(DESC "106")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY107
	(DESC "107")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY108
	(DESC "108")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY109
	(DESC "109")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY110
	(DESC "110")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY111
	(DESC "111")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY112
	(DESC "112")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY113
	(DESC "113")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY114
	(DESC "114")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY115
	(DESC "115")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY116
	(DESC "116")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY117
	(DESC "117")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY118
	(DESC "118")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY119
	(DESC "119")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY120
	(DESC "120")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY121
	(DESC "121")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY122
	(DESC "122")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY123
	(DESC "123")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY124
	(DESC "124")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY125
	(DESC "125")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY126
	(DESC "126")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY127
	(DESC "127")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY128
	(DESC "128")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY129
	(DESC "129")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY130
	(DESC "130")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY131
	(DESC "131")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY132
	(DESC "132")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY133
	(DESC "133")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY134
	(DESC "134")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY135
	(DESC "135")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY136
	(DESC "136")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY137
	(DESC "137")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY138
	(DESC "138")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY139
	(DESC "139")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY140
	(DESC "140")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY141
	(DESC "141")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY142
	(DESC "142")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY143
	(DESC "143")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY144
	(DESC "144")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY145
	(DESC "145")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY146
	(DESC "146")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY147
	(DESC "147")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY148
	(DESC "148")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY149
	(DESC "149")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY150
	(DESC "150")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY151
	(DESC "151")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY152
	(DESC "152")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY153
	(DESC "153")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY154
	(DESC "154")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY155
	(DESC "155")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY156
	(DESC "156")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY157
	(DESC "157")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY158
	(DESC "158")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY159
	(DESC "159")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY160
	(DESC "160")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY161
	(DESC "161")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY162
	(DESC "162")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY163
	(DESC "163")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY164
	(DESC "164")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY165
	(DESC "165")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY166
	(DESC "166")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY167
	(DESC "167")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY168
	(DESC "168")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY169
	(DESC "169")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY170
	(DESC "170")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY171
	(DESC "171")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY172
	(DESC "172")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY173
	(DESC "173")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY174
	(DESC "174")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY175
	(DESC "175")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY176
	(DESC "176")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY177
	(DESC "177")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY178
	(DESC "178")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY179
	(DESC "179")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY180
	(DESC "180")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY181
	(DESC "181")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY182
	(DESC "182")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY183
	(DESC "183")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY184
	(DESC "184")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY185
	(DESC "185")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY186
	(DESC "186")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY187
	(DESC "187")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY188
	(DESC "188")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY189
	(DESC "189")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY190
	(DESC "190")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY191
	(DESC "191")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY192
	(DESC "192")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY193
	(DESC "193")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY194
	(DESC "194")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY195
	(DESC "195")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY196
	(DESC "196")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY197
	(DESC "197")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY198
	(DESC "198")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY199
	(DESC "199")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY200
	(DESC "200")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY201
	(DESC "201")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY202
	(DESC "202")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY203
	(DESC "203")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY204
	(DESC "204")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY205
	(DESC "205")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY206
	(DESC "206")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY207
	(DESC "207")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY208
	(DESC "208")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY209
	(DESC "209")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY210
	(DESC "210")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY211
	(DESC "211")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY212
	(DESC "212")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY213
	(DESC "213")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY214
	(DESC "214")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY215
	(DESC "215")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY216
	(DESC "216")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY217
	(DESC "217")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY218
	(DESC "218")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY219
	(DESC "219")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY220
	(DESC "220")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY221
	(DESC "221")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY222
	(DESC "222")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY223
	(DESC "223")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY224
	(DESC "224")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY225
	(DESC "225")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY226
	(DESC "226")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY227
	(DESC "227")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY228
	(DESC "228")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY229
	(DESC "229")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY230
	(DESC "230")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY231
	(DESC "231")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY232
	(DESC "232")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY233
	(DESC "233")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY234
	(DESC "234")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY235
	(DESC "235")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY236
	(DESC "236")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY237
	(DESC "237")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY238
	(DESC "238")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY239
	(DESC "239")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY240
	(DESC "240")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY241
	(DESC "241")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY242
	(DESC "242")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY243
	(DESC "243")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY244
	(DESC "244")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY245
	(DESC "245")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY246
	(DESC "246")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY247
	(DESC "247")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY248
	(DESC "248")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY249
	(DESC "249")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY250
	(DESC "250")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY251
	(DESC "251")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY252
	(DESC "252")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY253
	(DESC "253")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY254
	(DESC "254")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY255
	(DESC "255")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY256
	(DESC "256")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY257
	(DESC "257")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY258
	(DESC "258")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY259
	(DESC "259")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY260
	(DESC "260")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY261
	(DESC "261")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY262
	(DESC "262")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY263
	(DESC "263")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY264
	(DESC "264")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY265
	(DESC "265")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY266
	(DESC "266")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY267
	(DESC "267")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY268
	(DESC "268")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY269
	(DESC "269")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY270
	(DESC "270")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY271
	(DESC "271")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY272
	(DESC "272")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY273
	(DESC "273")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY274
	(DESC "274")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY275
	(DESC "275")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY276
	(DESC "276")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY277
	(DESC "277")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY278
	(DESC "278")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY279
	(DESC "279")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY280
	(DESC "280")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY281
	(DESC "281")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY282
	(DESC "282")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY283
	(DESC "283")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY284
	(DESC "284")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY285
	(DESC "285")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY286
	(DESC "286")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY287
	(DESC "287")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY288
	(DESC "288")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY289
	(DESC "289")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY290
	(DESC "290")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY291
	(DESC "291")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY292
	(DESC "292")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY293
	(DESC "293")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY294
	(DESC "294")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY295
	(DESC "295")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY296
	(DESC "296")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY297
	(DESC "297")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY298
	(DESC "298")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY299
	(DESC "299")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY300
	(DESC "300")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY301
	(DESC "301")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY302
	(DESC "302")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY303
	(DESC "303")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY304
	(DESC "304")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY305
	(DESC "305")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY306
	(DESC "306")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY307
	(DESC "307")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY308
	(DESC "308")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT309 "As you move closer to the sarcophagus, your foot crosses the edge of the pentacle by a few inches. It is enough. The lid of the sarcophagus explodes into the air with a deafening crash, and a pillar of black smoke erupts from the stone coffin. The smoke hurtles towards you, like a miniature tornado. You must fight the tomb guardian.">

<ROOM STORY309
	(DESC "309")
	(STORY TEXT309)
	(EVENTS STORY309-EVENTS)
	(CONTINUE STORY260)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY309-EVENTS ("AUX" WEAPON)
	<SET WEAPON <FIND-BEST ,P?COMBAT ,WEAPONBIT ,PLAYER>>
	<COND (<G? .WEAPON 0> <STORY-JUMP ,STORY043>)>>

<ROOM STORY310
	(DESC "310")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY311
	(DESC "311")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY312
	(DESC "312")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY313
	(DESC "313")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY314
	(DESC "314")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY315
	(DESC "315")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY316
	(DESC "316")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY317
	(DESC "317")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY318
	(DESC "318")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY319
	(DESC "319")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY320
	(DESC "320")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY321
	(DESC "321")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY322
	(DESC "322")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY323
	(DESC "323")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY324
	(DESC "324")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY325
	(DESC "325")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY326
	(DESC "326")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY327
	(DESC "327")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY328
	(DESC "328")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY329
	(DESC "329")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY330
	(DESC "330")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY331
	(DESC "331")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY332
	(DESC "332")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY333
	(DESC "333")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY334
	(DESC "334")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY335
	(DESC "335")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY336
	(DESC "336")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY337
	(DESC "337")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY338
	(DESC "338")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY339
	(DESC "339")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY340
	(DESC "340")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY341
	(DESC "341")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY342
	(DESC "342")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY343
	(DESC "343")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY344
	(DESC "344")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY345
	(DESC "345")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY346
	(DESC "346")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY347
	(DESC "347")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY348
	(DESC "348")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY349
	(DESC "349")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY350
	(DESC "350")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY351
	(DESC "351")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY352
	(DESC "352")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY353
	(DESC "353")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY354
	(DESC "354")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY355
	(DESC "355")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY356
	(DESC "356")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY357
	(DESC "357")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY358
	(DESC "358")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY359
	(DESC "359")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY360
	(DESC "360")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY361
	(DESC "361")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY362
	(DESC "362")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY363
	(DESC "363")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY364
	(DESC "364")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY365
	(DESC "365")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY366
	(DESC "366")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY367
	(DESC "367")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY368
	(DESC "368")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY369
	(DESC "369")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY370
	(DESC "370")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY371
	(DESC "371")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY372
	(DESC "372")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY373
	(DESC "373")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY374
	(DESC "374")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY375
	(DESC "375")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY376
	(DESC "376")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY377
	(DESC "377")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY378
	(DESC "378")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY379
	(DESC "379")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY380
	(DESC "380")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY381
	(DESC "381")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY382
	(DESC "382")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY383
	(DESC "383")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY384
	(DESC "384")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY385
	(DESC "385")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY386
	(DESC "386")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY387
	(DESC "387")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY388
	(DESC "388")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY389
	(DESC "389")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY390
	(DESC "390")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY391
	(DESC "391")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY392
	(DESC "392")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY393
	(DESC "393")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY394
	(DESC "394")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY395
	(DESC "395")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY396
	(DESC "396")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY397
	(DESC "397")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY398
	(DESC "398")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY399
	(DESC "399")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY400
	(DESC "400")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY401
	(DESC "401")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY402
	(DESC "402")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY403
	(DESC "403")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY404
	(DESC "404")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY405
	(DESC "405")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY406
	(DESC "406")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY407
	(DESC "407")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY408
	(DESC "408")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY409
	(DESC "409")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY410
	(DESC "410")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY411
	(DESC "411")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY412
	(DESC "412")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY413
	(DESC "413")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY414
	(DESC "414")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY415
	(DESC "415")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY416
	(DESC "416")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY417
	(DESC "417")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY418
	(DESC "418")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY419
	(DESC "419")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY420
	(DESC "420")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY421
	(DESC "421")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY422
	(DESC "422")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY423
	(DESC "423")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY424
	(DESC "424")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY425
	(DESC "425")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY426
	(DESC "426")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY427
	(DESC "427")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY428
	(DESC "428")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY429
	(DESC "429")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY430
	(DESC "430")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY431
	(DESC "431")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY432
	(DESC "432")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY433
	(DESC "433")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY434
	(DESC "434")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY435
	(DESC "435")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY436
	(DESC "436")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY437
	(DESC "437")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY438
	(DESC "438")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY439
	(DESC "439")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY440
	(DESC "440")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY441
	(DESC "441")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY442
	(DESC "442")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY443
	(DESC "443")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY444
	(DESC "444")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY445
	(DESC "445")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY446
	(DESC "446")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY447
	(DESC "447")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY448
	(DESC "448")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY449
	(DESC "449")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY450
	(DESC "450")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY451
	(DESC "451")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY452
	(DESC "452")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY453
	(DESC "453")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY454
	(DESC "454")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY455
	(DESC "455")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY456
	(DESC "456")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY457
	(DESC "457")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY458
	(DESC "458")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY459
	(DESC "459")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY460
	(DESC "460")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY461
	(DESC "461")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY462
	(DESC "462")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY463
	(DESC "463")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY464
	(DESC "464")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY465
	(DESC "465")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY466
	(DESC "466")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY467
	(DESC "467")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY468
	(DESC "468")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY469
	(DESC "469")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY470
	(DESC "470")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY471
	(DESC "471")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY472
	(DESC "472")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY473
	(DESC "473")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY474
	(DESC "474")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY475
	(DESC "475")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY476
	(DESC "476")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY477
	(DESC "477")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY478
	(DESC "478")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY479
	(DESC "479")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY480
	(DESC "480")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY481
	(DESC "481")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY482
	(DESC "482")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY483
	(DESC "483")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY484
	(DESC "484")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY485
	(DESC "485")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY486
	(DESC "486")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY487
	(DESC "487")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY488
	(DESC "488")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY489
	(DESC "489")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY490
	(DESC "490")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY491
	(DESC "491")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY492
	(DESC "492")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY493
	(DESC "493")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY494
	(DESC "494")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY495
	(DESC "495")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY496
	(DESC "496")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY497
	(DESC "497")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY498
	(DESC "498")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY499
	(DESC "499")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY500
	(DESC "500")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY501
	(DESC "501")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY502
	(DESC "502")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY503
	(DESC "503")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY504
	(DESC "504")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY505
	(DESC "505")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY506
	(DESC "506")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY507
	(DESC "507")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY508
	(DESC "508")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY509
	(DESC "509")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY510
	(DESC "510")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY511
	(DESC "511")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY512
	(DESC "512")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY513
	(DESC "513")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY514
	(DESC "514")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY515
	(DESC "515")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY516
	(DESC "516")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY517
	(DESC "517")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY518
	(DESC "518")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY519
	(DESC "519")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY520
	(DESC "520")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY521
	(DESC "521")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY522
	(DESC "522")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY523
	(DESC "523")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY524
	(DESC "524")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY525
	(DESC "525")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY526
	(DESC "526")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY527
	(DESC "527")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY528
	(DESC "528")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY529
	(DESC "529")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY530
	(DESC "530")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY531
	(DESC "531")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY532
	(DESC "532")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY533
	(DESC "533")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY534
	(DESC "534")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY535
	(DESC "535")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY536
	(DESC "536")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY537
	(DESC "537")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY538
	(DESC "538")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY539
	(DESC "539")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY540
	(DESC "540")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY541
	(DESC "541")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY542
	(DESC "542")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY543
	(DESC "543")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY544
	(DESC "544")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY545
	(DESC "545")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY546
	(DESC "546")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY547
	(DESC "547")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY548
	(DESC "548")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY549
	(DESC "549")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY550
	(DESC "550")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY551
	(DESC "551")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY552
	(DESC "552")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY553
	(DESC "553")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY554
	(DESC "554")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY555
	(DESC "555")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY556
	(DESC "556")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY557
	(DESC "557")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY558
	(DESC "558")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY559
	(DESC "559")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY560
	(DESC "560")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY561
	(DESC "561")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY562
	(DESC "562")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY563
	(DESC "563")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY564
	(DESC "564")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY565
	(DESC "565")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY566
	(DESC "566")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY567
	(DESC "567")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY568
	(DESC "568")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY569
	(DESC "569")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY570
	(DESC "570")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY571
	(DESC "571")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY572
	(DESC "572")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY573
	(DESC "573")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY574
	(DESC "574")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY575
	(DESC "575")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY576
	(DESC "576")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY577
	(DESC "577")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY578
	(DESC "578")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY579
	(DESC "579")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY580
	(DESC "580")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY581
	(DESC "581")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY582
	(DESC "582")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY583
	(DESC "583")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY584
	(DESC "584")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY585
	(DESC "585")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY586
	(DESC "586")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY587
	(DESC "587")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY588
	(DESC "588")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY589
	(DESC "589")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY590
	(DESC "590")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY591
	(DESC "591")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY592
	(DESC "592")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY593
	(DESC "593")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY594
	(DESC "594")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY595
	(DESC "595")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY596
	(DESC "596")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY597
	(DESC "597")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY598
	(DESC "598")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY599
	(DESC "599")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY600
	(DESC "600")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY601
	(DESC "601")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY602
	(DESC "602")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY603
	(DESC "603")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY604
	(DESC "604")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY605
	(DESC "605")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY606
	(DESC "606")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY607
	(DESC "607")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY608
	(DESC "608")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY609
	(DESC "609")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY610
	(DESC "610")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY611
	(DESC "611")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY612
	(DESC "612")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY613
	(DESC "613")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY614
	(DESC "614")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY615
	(DESC "615")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY616
	(DESC "616")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT617 "A desperate battle ensues.">

<ROOM STORY617
	(DESC "617")
	(STORY TEXT617)
	(EVENTS STORY617-EVENTS)
	(CONTINUE STORY196)
	(DOOM T)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY617-EVENTS ()
	<COMBAT-MONSTER ,MONSTER-GHOUL 3 7 15>
	<CHECK-COMBAT ,MONSTER-GHOUL ,STORY617>>

<ROOM STORY618
	(DESC "618")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY619
	(DESC "619")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY620
	(DESC "620")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY621
	(DESC "621")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY622
	(DESC "622")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY623
	(DESC "623")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY624
	(DESC "624")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY625
	(DESC "625")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY626
	(DESC "626")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY627
	(DESC "627")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY628
	(DESC "628")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY629
	(DESC "629")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY630
	(DESC "630")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY631
	(DESC "631")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY632
	(DESC "632")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY633
	(DESC "633")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY634
	(DESC "634")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY635
	(DESC "635")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY636
	(DESC "636")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY637
	(DESC "637")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY638
	(DESC "638")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY639
	(DESC "639")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY640
	(DESC "640")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY641
	(DESC "641")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY642
	(DESC "642")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY643
	(DESC "643")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY644
	(DESC "644")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY645
	(DESC "645")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY646
	(DESC "646")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY647
	(DESC "647")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY648
	(DESC "648")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY649
	(DESC "649")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY650
	(DESC "650")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY651
	(DESC "651")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY652
	(DESC "652")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY653
	(DESC "653")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY654
	(DESC "654")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY655
	(DESC "655")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY656
	(DESC "656")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY657
	(DESC "657")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY658
	(DESC "658")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY659
	(DESC "659")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY660
	(DESC "660")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY661
	(DESC "661")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY662
	(DESC "662")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY663
	(DESC "663")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY664
	(DESC "664")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY665
	(DESC "665")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY666
	(DESC "666")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY667
	(DESC "667")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY668
	(DESC "668")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY669
	(DESC "669")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY670
	(DESC "670")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY671
	(DESC "671")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY672
	(DESC "672")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY673
	(DESC "673")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY674
	(DESC "674")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY675
	(DESC "675")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY676
	(DESC "676")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY677
	(DESC "677")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY678
	(DESC "678")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY679
	(DESC "679")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY680
	(DESC "680")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT CHOICES681 <LTABLE TEXT-ROLL-SCOUTING>>

<ROOM STORY681
	(DESC "681")
	(CHOICES CHOICES681)
	(DESTINATIONS <LTABLE <LTABLE STORY652 STORY529>>)
	(REQUIREMENTS <LTABLE <LTABLE ABILITY-SCOUTING 10>>)
	(TYPES <LTABLE R-TEST-ABILITY>)
	(FLAGS LIGHTBIT)>

<ROOM STORY682
	(DESC "682")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY683
	(DESC "683")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY684
	(DESC "684")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY685
	(DESC "685")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY686
	(DESC "686")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY687
	(DESC "687")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY688
	(DESC "688")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY689
	(DESC "689")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY690
	(DESC "690")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY691
	(DESC "691")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY692
	(DESC "692")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY693
	(DESC "693")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY694
	(DESC "694")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY695
	(DESC "695")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY696
	(DESC "696")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY697
	(DESC "697")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY698
	(DESC "698")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY699
	(DESC "699")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY700
	(DESC "700")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY701
	(DESC "701")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY702
	(DESC "702")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY703
	(DESC "703")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY704
	(DESC "704")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY705
	(DESC "705")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY706
	(DESC "706")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY707
	(DESC "707")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY708
	(DESC "708")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY709
	(DESC "709")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY710
	(DESC "710")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY711
	(DESC "711")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY712
	(DESC "712")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY713
	(DESC "713")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY714
	(DESC "714")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY715
	(DESC "715")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY716
	(DESC "716")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY717
	(DESC "717")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY718
	(DESC "718")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY719
	(DESC "719")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY720
	(DESC "720")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY721
	(DESC "721")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY722
	(DESC "722")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY723
	(DESC "723")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY724
	(DESC "724")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY725
	(DESC "725")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY726
	(DESC "726")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY727
	(DESC "727")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY728
	(DESC "728")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY729
	(DESC "729")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY730
	(DESC "730")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY731
	(DESC "731")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY732
	(DESC "732")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY733
	(DESC "733")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY734
	(DESC "734")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY735
	(DESC "735")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY736
	(DESC "736")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY737
	(DESC "737")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY738
	(DESC "738")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY739
	(DESC "739")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY740
	(DESC "740")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY741
	(DESC "741")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY742
	(DESC "742")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY743
	(DESC "743")
	(BACKGROUND NONE)
	(STORY NONE)
	(EVENTS NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEMS NONE)
	(CODEWORDS NONE)
	(GOD NONE)
	(BLESSINGS NONE)
	(TITLES NONE)
	(DOOM F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM BLOOD-DARK-SEA
	(DESC "Blood Dark Sea")
	(VICTORY ENDING-BLOOD-DARK-SEA)
	(FLAGS LIGHTBIT)>
