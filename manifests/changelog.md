# Changelog

- Current version number: **2.00A FINAL - release 3**

- Release date: **2016-12-01**

*What's new in this version?*

- Each new slot now gets its own camera (updated TDUPE/TDUMT files included), matching slot identifier (3000 to 4040)
- Add new engine types (updated TDUPE file included).

## Bugfixes
- Fixes some flaws into TDUMT's VehicleSlots.xml reference
- Fixes missing engine types from TDUPE reference.

## Known Bugs
- A few, because it's just TDU :p 


## TDUCP CONTENTS

### FEATURES

#### GAME ENGINE 
- Adds new bots driving megapack vehicles
- Gives avatar bike-clothes for cars, car-clothes for bikes


#### PATCH HD
- Enables PATCH HD feature in SD mode
- Includes customization by CMD script (OFF, SD ... HDU)
- Patch HD install files can be removed via new script option (7)


#### VEHICLE TUNING
- Unlocks tuning kits for Ferrari F40
- Special tuned cars available in dealers (Alfa GT SP, ...) [FULL PACKAGE ONLY]


#### VEHICLE CUSTOMIZATION
- New default license plate [FULL PACKAGE ONLY]
- Unlocks Car Paint Deluxe for all cars
- Propose Nismo rim set for Nissan 350Z RTune and RTune power (required for car dealers)


#### EXTENDED MODDING SUPPORT
- Adds 3 new brands: Hennessey Performance, Radical, Rossion
- Maximize number of vehicles on every car dealer
- Removes unlocked slots from various dealers and V-rent to free up space [FULL PACKAGE ONLY]
- Provides new rim names for many mods (Bugatti Atlantic, Facel Vega...)
- Unlocks 29 vehicle slots (28 cars, 1 bike):
    - Check [TDUCP's WIKI](https://github.com/djey47/tdu-cp/wiki/Vehicle-Slots) to learn how to use unlocked slots    
- Brings 442 *brand new* slots (401 cars, 41 bikes):
    - Check [TDUCP's WIKI](https://github.com/djey47/tdu-cp/wiki/Vehicle-Slots) to learn how to use new slots
- Each of new TDUCP slots gets 10 paint job options and 10 interiors
- Each of new TDUCP slots gets 10 rims ...
- ... BUT by default selectable rims are limited to 1 per slot 
    - Game does not allow rim selection for bikes, by the way!
    - Check [TDUCP's WIKI](https://github.com/djey47/tdu-cp/wiki/TDUF-Rims-Handling) to learn how to extend car rim options.


#### CAMERAS
- Each unlocked slot now gets its own camera (updated TDUPE/TDUMT files included)


#### MAGIC MAP
- Includes official MagicMap
- UltimateMap: can be updated to support any new file


### BUGFIXES

#### GAME FLAWS
- G27 support (Force Feedback, RPM LEDs)
- ACE rank now gets unlocked at 88% completion (remaining achievements cannot be unlocked with Project Paradize)
- Proper brand names: e.g Edonis => B.Engineering, Infiniti ...


#### GAME RELIABILITY
- Fixes conflict in HUD file reference for Unlocked Mazda RX8 and Brabus S55 slots
- Removes some database duplicates
- Offline races sometimes frozen at starting grid, waiting for challengers
- Traffic sync issues (introduced by 1.68 Community Patch) 


#### MODDING SUPPORT
- Behaviour and logo (when possible) of Generic, Hennessey, Honda, Suzuki brands
- Rim file for Triumph 955i follows same naming rules as other vehicles
- Associate dedicated hud file to all 350Z Nismo
- All Saleen Mustang cars get own rim set with proper file name ( **S281_F_01.bnk** to **S281_F_06.bnk** )
- All Alfa GTs get own rim set with proper file name ( **ARGT02_F_F02.bnk** to **ARGT02_F_F04.bnk** )
- All Nissan 350Zs get own rim set with proper file name ( **350ZNISMO_F_02.bnk** to **350ZNISMO_F_04.bnk** )


#### TOOLS
- Adds missing rims and huds in TDUPE reference
- Fixes new slots can't be saved in TDUPE
