# Commands

## Notes

This directory does include diff patches to update an existing database without loosing contents.

Diff for PNJ topic is not included:

- No change has been made to PNJ topic yet
- PNJ topic contains duplicates REFs (is this a bug), causing partial updates to malfunction.

## Generate patches for full database update (diff 1.66A_MP <> current)

    cd scripts/database
    ./updateDiff.sh
