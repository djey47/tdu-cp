# Commands

## Notes

Magic Map is already provided in JSON format in this repository:

- **Bnk1.map.json**: reference file (should not be modified)

- **Bnk1.map.patched.json**: latest mapping information, taking updated files into account.

## TDUF-CLI

- Convert Bnk1.map file to JSON:

        FileTool jsonify -i "<...>\Bnk1.map" -s "structures\MAP4-map.json" -o "<...>\tdu-cp\resources\system\magic-map\Bnk1.map.json"
    
- Convert JSON file to Bnk1.map back:

        FileTool applyjson -i "<...>\tdu-cp\resources\system\magic-map\Bnk1.map.json" -s "structures\MAP4-map.json" -o "<...>\tdu-cp\workspace\build\private\Euro\Bnk\Bnk1.map"
