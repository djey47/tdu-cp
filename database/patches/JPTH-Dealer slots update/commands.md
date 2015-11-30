# Commands

## Notes

Consider reformatting json files after patch to minimize diffs.

This sets Bitfield (rank 19) to value allowing use of maximum slots to host vehicles.
Requires TDUF version >= 0.9!

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Dealer slots update.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    
