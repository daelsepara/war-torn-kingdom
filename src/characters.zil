; "Characters for War-Torn Kingdom"

<CONSTANT CHARACTERS <LTABLE CHARACTER-LIANA CHARACTER-CHALOR CHARACTER-ANDRIEL CHARACTER-MARANA CHARACTER-IGNATIUS CHARACTER-ASTARIEL>>
<CONSTANT PROFESSIONS <LTABLE PROFESSION-PRIEST PROFESSION-MAGE PROFESSION-ROGUE PROFESSION-TROUBADOUR PROFESSION-WARRIOR PROFESSION-WAYFARER>>

<OBJECT CHARACTER-LIANA
    (DESC "Liana The Swift")
    (LDESC "Liana prefers to make her home in mountain grottos and woodland groves rather than in the squalid streets of cities. She has the agility of a gazelle, the cunning of a fox and the ferocity of an eagle. She has heard of a City of Trees, deep within the forest of the Isle of Druids.")
    (RANK 1)
    (PROFESSION PROFESSION-WAYFARER)
    (STAMINA 9)
    (DEFENSE 6)
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
    (DEFENSE 3)
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
    (DEFENSE 7)
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
    (DEFENSE 5)
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
    (DEFENSE 3)
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
    (DEFENSE 4)
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

<OBJECT PROFESSION-PRIEST
    (DESC "Priest")
    (RANK 1)
    (STAMINA 9)
    (DEFENSE 3)
    (MONEY 16)
    (CHARISMA 4)
    (COMBAT 2)
    (MAGIC 3)
    (SANCTITY 6)
    (SCOUTING 4)
    (THIEVERY 2)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)>

<OBJECT PROFESSION-MAGE
    (DESC "Mage")
    (RANK 1)
    (STAMINA 9)
    (DEFENSE 3)
    (MONEY 16)
    (CHARISMA 2)
    (COMBAT 2)
    (MAGIC 6)
    (SANCTITY 1)
    (SCOUTING 5)
    (THIEVERY 3)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)>

<OBJECT PROFESSION-ROGUE
    (DESC "Rouge")
    (RANK 1)
    (STAMINA 9)
    (DEFENSE 5)
    (MONEY 16)
    (CHARISMA 5)
    (COMBAT 4)
    (MAGIC 4)
    (SANCTITY 1)
    (SCOUTING 2)
    (THIEVERY 6)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)>

<OBJECT PROFESSION-TROUBADOUR
    (DESC "Troubadour")
    (RANK 1)
    (STAMINA 9)
    (DEFENSE 4)
    (MONEY 16)
    (CHARISMA 6)
    (COMBAT 3)
    (MAGIC 4)
    (SANCTITY 3)
    (SCOUTING 2)
    (THIEVERY 4)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)>

<OBJECT PROFESSION-WARRIOR
    (DESC "Warrior")
    (RANK 1)
    (STAMINA 9)
    (DEFENSE 7)
    (MONEY 16)
    (CHARISMA 3)
    (COMBAT 6)
    (MAGIC 2)
    (SANCTITY 4)
    (SCOUTING 3)
    (THIEVERY 2)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)>

<OBJECT PROFESSION-WAYFARER
    (DESC "Wayfarer")
    (RANK 1)
    (STAMINA 9)
    (DEFENSE 6)
    (MONEY 16)
    (CHARISMA 2)
    (COMBAT 5)
    (MAGIC 2)
    (SANCTITY 3)
    (SCOUTING 6)
    (THIEVERY 4)
    (POSSESSIONS <LTABLE SWORD LEATHER-JERKIN MAP>)>
