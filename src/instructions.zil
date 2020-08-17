<CONSTANT INSTRUCTIONS-HEADER "|HOW TO USE THIS E-ADVENTURE|">
<CONSTANT INSTRUCTIONS-TEXT "To start your adventure simply choose your character. Each characters has six abilities: CHARISMA, COMBAT, MAGIC, SANCTITY, SCOUTING, THIEVERY. Your initial score in each ability ranges from 1 (low ability) to 6 (a high level of ability). The lowest possible score for an ability is 1 -- you can never have a lower score than that..||Also note the stamina and possessions of the character. Stamina is lost each time you are wounded whether in combat or during the course of your adventure. If you are ever reduced to zero stamina, you have been killed and the adventure ends. Sometimes you can recover stamina during the adventure. You can carry up to twelve possessions at a time. If you are at this limit and find something else you want, drop one of your other possessions to make room for the new item.||Consider your character's abilities. They will help you to role-play your choices during the adventure.||During action selection and in other parts of the game, pressing 'H' or '?' brings up a list of additional command keys.">

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