# Commands

## Notes

Only supported for now:

- 1 rim set, same rims front and rear
- 1 exterior color set
- 1 interior scheme (no color)
- No localization (same values for all languages)
- No tuning options.

Included templates depend on following placeholder values:

- SLOTREF: REF on CarPhysics topic (#1)
- RES_BANKNAME: Car_File_Name on CarPhysics topic (#9)
- RES_MODELNAME: Model_Name on CarPhysics topic (#13)
- RES_VERSIONNAME: Version_Name on CarPhysics topic (#14)
- BANKNAME: Value of resource #RES_BANKNAME
- RIMREF.1: REF on Rims topic, first rim set (#10)
- CARID: ID_Car on CarPhysics topic (#102)

- RES_RIMNAME.1: DisplayName on Rims topic, first rim set (#4)
- RIMNAME.1: Value of resource #RES_RIMNAME.1
- RES_BANKNAME.FR.1: Rsc_File_Name_Front on Rims topic, first rim set (#14)
- BANKNAME.FR.1: Value of resource #RES_BANKNAME.FR.1
- RES_BANKNAME.RR.1: Rsc_File_Name_Rear on Rims topic, first rim set (#15)
- BANKNAME.RR.1: Value of resource #RES_BANKNAME.RR.1

- COLORID.M.1: Color_ID_1 on CarColors topic, first color set (#2)
- RES_COLORNAME.1: Color_Name on CarColors topic (#3)
- COLORNAME.1: Value of resource #RES_COLORNAME.1
- COLORID.S.1: Color_ID_2 on CarColors topic, first color set (#4)
- CALLIPERSID.1: Callipers on CarColors topic, first color set (#5)
- INTREF.1: Interior_1 on CarColors topic, first color set (#8)

- INTREF.1: REF on Interior topic, first interior scheme (#1)
- RES_INTNAME.1: Interior_Name on Interior topic, first interior scheme (#3)
- INTNAME.1: Value of resource #RES_INTNAME.1
- INTCOLORID.M.1: Interior_Color_1 on Interior topic, first interior scheme (#4)
- INTCOLORID.S.1: Interior_Color_2 on Interior topic, first interior scheme (#5)
- INTMATERIALID.1: Material on Interior topic, first interior scheme (#6)
