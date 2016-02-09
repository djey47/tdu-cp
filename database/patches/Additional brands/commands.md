# Commands

## Notes

Contains all brands brought by 1.68b patch, and more:

- Hennessey Performance
- Radical
- Rossion.

Fixes following brands: 

- Hennessey (Dodge tuning)
- Mazda
- Generic (CITR, REF 91197): becomes sellable in car dealer (bitfield update)
- Infiniti (INF, REF 7853): becomes sellable in car dealer (bitfield update)
- Infiniti (INF, REF 7853): displayed name fix (Infinity->Infiniti)
- Infiniti (INF, REF 7853): logo fix (set to index 198).

Removes following brands:

- Infiniti (INF, REF 906): may be inserted by previous Community Patch.


## TDUF-CLI

    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/BrandResources-added-1.68b.mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/BrandResources-added-mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/BrandResources-fixed.mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/Brands-added-1.68b.mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/Brands-added.mini.json" -j "<...>/database/current" -o "<...>/database/current"

    ...
    
