# Commands

## Notes

This directory does include diff patches to update an existing database without loosing contents.

Diff for Achievements topic is not included:

- Would break TDUCP Ace feature

Diff for PNJ topic is not included:

- No change has been made to PNJ topic yet
- PNJ topic contains duplicates REFs (is this a bug), causing partial updates to malfunction.

## Generate patches for full database update (current -> Milli's patch)

    cd scripts/database
    ./updateDiffWithCarPack.sh

## Clean patches

**Z-clean.mini.json** will revert some 1.66/1.68b problematic features:

- unassigned ultimate cam ids
- duplicate rims
- additional traffic vehicles
- wrong bitfield for some car dealers.
