# Commands

## Notes

- Change value of field #2 (TextIndex_) in Achievements topic, for entry with field #1 (Achievement_Event_) being 63136935 (=Ace_Pts): genuine value = 1000 , new value = 980

- Requires TDUF >= 0.9.x.

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Fixed Ace status\FixedAceStatus.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
