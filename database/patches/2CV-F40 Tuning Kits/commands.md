# Commands

## Notes

This will add 2 entries to CarPacks topic, giving tuning kits to both F40 slots (698399392 and 1192399594). 

As always, consider reformatting json files after patch to minimize diffs.

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-F40 Tuning Kits\F40Kits.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    
