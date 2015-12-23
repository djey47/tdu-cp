# Commands

## Notes

POC for Mazda MX5 Roadster:

- Fix brand name to Mazda (BRANDS - rank #3)
- Fix brand logo from BMW to MAZDA (BRANDS - rank #4)
- Fix logo rank (BRANDS - rank #5)
- Set bitfield to 1 (BRANDS - rank #7)

- Set model name to MX5 (CAR PHYSICS DATA - rank #13)
- Set version name to Roadster(CAR PHYSICS DATA - rank #14)
- Set bitfield to 79 (CAR PHYSICS DATA - rank #103)

All unlocked vehicles are located in Oahu Cars dealers (541293706: Honolulu North) 

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Unlock vehicles\UnlockMazdaMX5.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Unlock vehicles\UnlockAM-DB-AR1.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Unlock vehicles\UnlockAM-DB7-VOL.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Unlock vehicles\UnlockAudi-A4-DTM.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Unlock vehicles\UnlockBrabus-S61-Capa.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Unlock vehicles\VehicleDealers.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"


    
