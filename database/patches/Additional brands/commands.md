# Commands

## Notes

Contains all brand brought by 1.68b patch, and more:

- Hennessey Performance
- Radical
- Rossion.

Fixes following brands: 

- Hennessey (Dodge tuning)
- Mazda
- Generic (CITR, REF 91197): becomes sellable in car dealer by bitfield update

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/BrandResources-added-1.68b.mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/BrandResources-added-mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/BrandResources-fixed.mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/Brands-added-1.68b.mini.json" -j "<...>/database/current" -o "<...>/database/current"
    
    DatabaseTool apply-patch -p "<...>/database/patches/Additional brands/Brands-added.mini.json" -j "<...>/database/current" -o "<...>/database/current"

    ...
    
