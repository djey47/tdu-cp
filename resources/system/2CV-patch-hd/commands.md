# Commands

## Notes

SD mode will be included by default. Other modes may be included in a separate distribution:

- **TDU**: will revert to 1.66_MP state. Please include original FX.ini (not provided)

- **HD100, HD300, HD500, HDU**: will switch to higher Patch HD mode. Please include current FX.ini file

## TDUF-CLI

### Unpack TDU original files:

     FileTool unpack -i "<...>\Euro\Bnk\Level\Hawai\CommonWorld.bnk" -o "<...>\workspace\wip\private\CommonWorld"
     FileTool unpack -i "<...>\Euro\Bnk\Level\Hawai\CommonWorldDiv2.bnk" -o "<...>\workspace\wip\private\CommonWorldDiv2"

### Repack to modified files

     FileTool repack -v -i "<...>\workspace\wip\private\CommonWorldDiv"
     FileTool repack -v -i "<...>\workspace\wip\private\CommonWorldDiv2"

## Location of Library.3DD files

    <...>\workspace\wip\private\CommonWorldDiv\4Build\PC\EURO\Level\Hawai\Common\Library\Library.3DD
    <...>\workspace\wip\private\CommonWorldDiv2\4Build\PC\EURO\Level\Hawai\Common\Library\Library.3DD





