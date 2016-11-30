NEW ENGINE TYPES
================

Will update car physics resources with missing/incorrect engine types:

* 543709|6 Cylinder Inline
* 633709|5 Cylinder Inline
* 643709|V4
* 653709|W16
* 663709|Electric
* 673709|Hybrid 3 Cylinder Inline
* 683709|Hybrid V6
* 693709|Hybrid V8
* 703709|Hybrid V10
* 713709|Hybrid V12


TDUF CLI
--------
Converting to *TDU Engine Types.json*:

    cd tducp-scripts/src/main/shell/tduf
    source ../setEnv.sh
    ./databaseTool.sh convert-patch -p ".../database/patches/JPTH-New engine types/TDU Engine Types.PCH"
    
 