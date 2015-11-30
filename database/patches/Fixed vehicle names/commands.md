# Commands

## Notes

This sets names (ranks 12 to 14 eventually) to correct values for many vehicles.
Requires TDUF version >= 0.9!

## TDUF-CLI

- Apply patch to current database

        DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\Fixed vehicle names\VehicleNameFix.mini.json" -j "<...>/database/current" -o "<...>/database/current"
        