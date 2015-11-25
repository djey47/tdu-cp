# Commands

## Notes

This sets HUD file name (rank 11) to proper 'Nismo' resource value for slot REFs: 1133391244,1133391037,1133391164

## TDUF-CLI

- Patch init:

           DatabaseTool gen-patch -p "<...>\tdu-cp\database\patches\2CV-Nismo 350Z Hud\NismoHud.mini.json" -j "<1.68b json database dir>" -t "CAR_PHYSICS_DATA" -r "1133391244,1133391037,1133391164"

- Database update:
    
           DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Nismo 350Z Hud\NismoHud.mini.json" -j "<current json database dir>"