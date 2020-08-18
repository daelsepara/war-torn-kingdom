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