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

<ROOM STORY030-BUY
	(DESC "030 Merchant - Selling")
	(CHOICES CHOICES030-BUY)
	(DESTINATIONS <LTABLE STORY030-BUY-ARMOUR STORY030-BUY-WEAPONS STORY030-BUY-MAGIC STORY030-BUY-OTHER STORY030>)
    (TYPES FIVE-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY030-BUY-ARMOUR
	(DESC "030 Merchant - Selling armours")
    (EVENTS STORY030-SELLING-ARMOUR)
    (CONTINUE STORY030-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-SELLING-ARMOUR ()
    <MERCHANT <LTABLE LEATHER-ARMOUR RING-MAIL CHAIN-MAIL> <LTABLE 50 100 200>>>

<ROOM STORY030-BUY-WEAPONS
	(DESC "030 Merchant - Selling weapons")
    (EVENTS STORY030-SELLING-WEAPONS)
    (CONTINUE STORY030-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-SELLING-WEAPONS ()
    <MERCHANT <LTABLE BATTLE-AXE MACE SPEAR STAFF SWORD BATTLE-AXE1 MACE1 SPEAR1 STAFF1 SWORD1> <LTABLE 50 50 50 50 50 250 250 250 250 250>>>

<ROOM STORY030-BUY-MAGIC
	(DESC "030 Merchant - Selling magic items")
    (EVENTS STORY030-SELLING-MAGIC)
    (CONTINUE STORY030-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-SELLING-MAGIC ()
    <MERCHANT <LTABLE AMBER-WAND> <LTABLE 500>>>

<ROOM STORY030-BUY-OTHER
	(DESC "030 Merchant - Selling other items")
    (EVENTS STORY030-SELLING-OTHER)
    (CONTINUE STORY030-BUY)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-SELLING-OTHER ()
    <MERCHANT <LTABLE MANDOLIN HOLY-SYMBOL COMPASS ROPE LANTERN CLIMBING-GEAR RAT-POISON> <LTABLE 300 200 500 50 100 100 60>>>

<CONSTANT CHOICES030-SELL <LTABLE "Sell armour" "Sell weapons (no COMBAT bonuses)" "Sell weapons (Tier I)" "Sell weapons (Tier II)" "Sell weapons (Tier III)" "Sell Magical Equipment" "Sell other items" "Return to the Market">>

<ROOM STORY030-SELL
	(DESC "030 Merchant - Buying")
	(CHOICES CHOICES030-SELL)
	(DESTINATIONS <LTABLE STORY030-SELL-ARMOUR STORY030-SELL-WEAPONS STORY030-SELL-WEAPONS1 STORY030-SELL-WEAPONS2 STORY030-SELL-WEAPONS3 STORY030-SELL-MAGIC STORY030-SELL-OTHER STORY030>)
    (TYPES EIGHT-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY030-SELL-ARMOUR
	(DESC "030 Merchant - Buying armours")
    (EVENTS STORY030-BUYING-ARMOUR)
    (CONTINUE STORY030-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-BUYING-ARMOUR ()
    <MERCHANT <LTABLE LEATHER-ARMOUR RING-MAIL CHAIN-MAIL SPLINT-ARMOUR PLATE-ARMOUR HEAVY-PLATE> <LTABLE 45 90 180 360 720 1440> ,PLAYER T>>

<ROOM STORY030-SELL-WEAPONS
	(DESC "030 Merchant - Buying weapons (no COMBAT bonuses)")
    (EVENTS STORY030-BUYING-WEAPONS)
    (CONTINUE STORY030-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-BUYING-WEAPONS ()
    <MERCHANT <LTABLE BATTLE-AXE MACE SPEAR STAFF SWORD> <LTABLE 40 40 40 40 40> ,PLAYER T>>

<ROOM STORY030-SELL-WEAPONS1
	(DESC "030 Merchant - Buying weapons (COMBAT +1)")
    (EVENTS STORY030-BUYING-WEAPONS1)
    (CONTINUE STORY030-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-BUYING-WEAPONS1 ()
    <MERCHANT <LTABLE BATTLE-AXE1 MACE1 SPEAR1 STAFF1 SWORD1> <LTABLE 200 200 200 200 200> ,PLAYER T>>

<ROOM STORY030-SELL-WEAPONS2
	(DESC "030 Merchant - Buying weapons (COMBAT +2)")
    (EVENTS STORY030-BUYING-WEAPONS2)
    (CONTINUE STORY030-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-BUYING-WEAPONS2 ()
    <MERCHANT <LTABLE BATTLE-AXE2 MACE2 SPEAR2 STAFF2 SWORD2> <LTABLE 400 400 400 400 400> ,PLAYER T>>

<ROOM STORY030-SELL-WEAPONS3
	(DESC "030 Merchant - Buying weapons (COMBAT +3)")
    (EVENTS STORY030-BUYING-WEAPONS3)
    (CONTINUE STORY030-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-BUYING-WEAPONS3 ()
    <MERCHANT <LTABLE BATTLE-AXE3 MACE3 SPEAR3 STAFF3 SWORD3> <LTABLE 800 800 800 800 800> ,PLAYER T>>

<ROOM STORY030-SELL-MAGIC
	(DESC "030 Merchant - Buying magic items")
    (EVENTS STORY030-BUYING-MAGIC)
    (CONTINUE STORY030-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-BUYING-MAGIC ()
    <MERCHANT <LTABLE AMBER-WAND EBONY-WAND COBALT-WAND> <LTABLE 400 800 600> ,PLAYER T>>

<ROOM STORY030-SELL-OTHER
	(DESC "030 Merchant - Buying other items")
    (EVENTS STORY030-BUYING-OTHER)
    (CONTINUE STORY030-SELL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-BUYING-OTHER ()
    <MERCHANT <LTABLE MANDOLIN LOCKPICKS HOLY-SYMBOL COMPASS ROPE LANTERN CLIMBING-GEAR BAG-OF-PEARLS RAT-POISON SILVER-NUGGET TREASURE-MAP> <LTABLE 270 270 100 450 45 90 90 100 50 200 150> ,PLAYER T>>
