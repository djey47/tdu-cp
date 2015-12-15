# Commands

## Notes

- Put the Alfa GT SP E-class in Alfa Dealer (591263714) at slot #4 (field rank #7)
- Change Alfa GT SP default color from Red to Black
- Put Saleen 3V Coupe and Convertible in US Independents (550413704) at slots #2 and #3 (3 slots available) 
- Put Saleen Supercharged/Extreme Coupe and Convertible in Oahu Cars (550893706) at slots #3 to #6 
- Put Mercedes SLK55 AMG PP in Mercedes-Benz (557186826) at slot #1 
- Put Nissan 350Z Nismo RT and RTP in Nissan Dealer (592253709) at slots #5 and #6 (slot #4 used by 350Z Roadster - xbox excusive). 

## TDUF-CLI

    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Special cars in dealers\SpecialCarsInDealers.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    DatabaseTool apply-patch -p "<...>\tdu-cp\database\patches\2CV-Special cars in dealers\SpecialCarsDefaultColors.mini.json" -j "<...>\tdu-cp\database\current" -o "<...>\tdu-cp\database\current"
    
