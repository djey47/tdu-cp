NEW ENGINE TYPES
================

Will update car physics resources with missing engine types:

* 633709|5 Cylinder Inline
* 643709|V4


Already provided:

* 543709|6 Cylinder Inline (same REF)
* 653709|W16  (REF=594709). Will create duplicate REF.

TDUF CLI
--------
Converting to *TDU Engine Types.json*:

    cd tducp-scripts/src/main/shell/tduf
    source ../setEnv.sh
    ./databaseTool.sh convert-patch -p ".../database/patches/JPTH-New engine types/TDU Engine Types.PCH"
    
 