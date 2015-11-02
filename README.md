# tdu-cp
Test Drive Unlimited Community Patches : hosts documentation, configuration and database changes of unofficial updates of the game.

That only applies to TDU1 game on PC platform, which was released in 2007.

Discussion and support are provided via the [TurboDuck Community](http://forum.turboduck.net/forums/51-tdu-mod-shop). Huge thanks to them.

*Note : this repository does not contain game files in respect to copyrighted contents. To get final data, you'll have to use some 3rd party tools... or directly get released material at TurboDuck forums! And in any case, you must own a legal version of the game.*

## Community Patches history

- **2015+**: Work In Progress, 2.00A

- **April, 2010**: Released, 1.68

- **July, 2009**: Released, 1.67.

## TDU official versions

- **April, 2008**: (CarMegaPack) one and only DLC, based on 1.66A

- **July, 2007**: one and only official patch, 1.66A

- **March, 2007**: initial version, 1.45A.

## Repository layout

[Hunt the Wiki for help](https://github.com/djey47/tdu-cp/wiki)

- **database**: Full game database (contents and resources), serialized to JSON format for proper editing.

    - **patches**: JSON files describing changes to be applied with TDUF toolset.

    - **reference**: per-game version dumped databases

    - **wip**: dumped database to be released with next patch.

- **manifests**: misc patch properties

    - **changelog.md**: patch contents

    - **files.md**: list of added/updated/removed files
    
    - **readme.md**: contents of readme file to be distributed

    - **version.md**: current version number and release date.
  
- **resources**: all external files required by update

    - **textures**: raw (png) and final (dds, 2db) texture files.
