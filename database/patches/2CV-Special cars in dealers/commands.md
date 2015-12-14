# Commands

## Notes

- Put the Alfa GT SP E-class in Alfa Dealer at slot #4 (field rank #7)
- Change Alfa GT SP default color from Red to Black

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Special cars in dealers\SpecialCarsInDealers.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Special cars in dealers\SpecialCarsDefaultColors.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    
