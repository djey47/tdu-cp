# Commands

## Notes

Consider reformatting json files after patch to minimize diffs.

This patch updates field 8 (DrivingType_) of some Clothes entries to value 918999438 (Mixed)

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Clothes for all\Clothes4All.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    
