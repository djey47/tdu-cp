# Commands

## Notes

This sets HUD file name (rank 11) to proper 'Nismo' resource value for slot REFs: 1133391244,1133391037,1133391164.
Requires TDUF version >= 0.9!

## TDUF-CLI

- Database update:
    
           DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Nismo 350Z Hud\NismoHud.mini.json" -j "<current json database dir>" -o "<current json database dir>"