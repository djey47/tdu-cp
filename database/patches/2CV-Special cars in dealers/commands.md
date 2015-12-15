# Commands

## Notes

- Put the Alfa GT SP E-class in Alfa Dealer (591263714) at slot #4 (field rank #7)
- Change Alfa GT SP default color from Red to Black
- Put Saleen 3V Coupe and Convertible in US Independents (550413704) at slots #2 and #3 (3 slots available) 

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Special cars in dealers\SpecialCarsInDealers.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Special cars in dealers\SpecialCarsDefaultColors.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    
