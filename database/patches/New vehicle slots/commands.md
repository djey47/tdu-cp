# Commands

## Notes

Supported for now:

- Default BRAND: Generic Car (CITR)
- 10 rim sets, different rims front and rear.
- 1 rim set enabled per vehicle
- 10 exterior color sets
- 10 interior schemes (no color)
- No localization (same values for all languages)
- No tuning options.

Included templates depend on following placeholder values:

- SLOTREF: REF on CarPhysics topic (#1)
- RES_BANKNAME: Car_File_Name on CarPhysics topic (#9)
- RES_MODELNAME: Model_Name on CarPhysics topic (#13)
- RES_VERSIONNAME: Version_Name on CarPhysics topic (#14)
- BANKNAME: Value of resource #RES_BANKNAME
- RIMREF.1 REF on Rims topic, first rim set (#10)
- CARID: ID_Car on CarPhysics topic (#102)

- RES_RIMNAME.X: DisplayName on Rims topic, Xth rim set (#4)
- RIMNAME.X: Value of resource #RES_RIMNAME.X
- RES_BANKNAME.FR.X: Rsc_File_Name_Front on Rims topic, Xth rim set (#14)
- BANKNAME.FR.X: Value of resource #RES_BANKNAME.FR.X
- RES_BANKNAME.RR.X: Rsc_File_Name_Rear on Rims topic, Xth rim set (#15)
- BANKNAME.RR.X: Value of resource #RES_BANKNAME.RR.X

- COLORID.M.X: Color_ID_1 on CarColors topic, Xth color set (#2)
- RES_COLORNAME.X: Color_Name on CarColors topic (#3)
- COLORNAME.X: Value of resource #RES_COLORNAME.X
- COLORID.S.X: Color_ID_2 on CarColors topic, Xth color set (#4)
- CALLIPERSID.X: Callipers on CarColors topic, Xth color set (#5)
- INTREF.Y: Interior_Y on CarColors topic, Xth color set (#(8 + Y - 1))

- INTREF.X: REF on Interior topic, Xth interior scheme (#1)
- INTCOLORID.M.X: Interior_Color_1 on Interior topic, first interior scheme (#4)
- INTCOLORID.S.X: Interior_Color_2 on Interior topic, first interior scheme (#5)
- INTMATERIALID.X: Material on Interior topic, first interior scheme (#6)

Properties are defined in script: **scripts/slots/addSlots.sh**


**dealers/VehicleDealers.mini.json**: put TDUCP 3000 and 4000 slots to OahuCars/bikes dealers.

**dealers/VehicleDealers-reset.mini.json**: removes all vehicles from those dealers.