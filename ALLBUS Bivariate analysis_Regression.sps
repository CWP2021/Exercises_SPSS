* Description: Examples of exercises which I have done using SPSS.

* Encoding: UTF-8.
* Spearmans rho.
WEIGHT BY V870.
FREQUENCIES polint bildung.
CROSSTABS polint by bildung
/CELLS=COLUMN.
NONPAR CORR polint bildung
/PRINT=BOTH NOSIG.

*Pearsons r.
FREQUENCIES V417 V610.
DESCRIPTIVESC V417 V610
/STATISTICS=MIN MAX RANGE MEAN VARIANCE STDDEV.
CORRELATIONS V417 V610.

*T-Test samples.
T-TEST GROUPS V81 (1,2)
/VARIABLES = V417.

T-TEST GROUPS V81 (1,2)
/VARIABLES=V610.

* Linear Regression.

WEIGHT OFF.
FREQUENCIES V419.
RECODE V419 (ELSE=COPY) INTO einkommen.
MISSING VALUES (0,99999).
VARIABLE LABELS einkommen "Einkommen".
FREQUENCIES V419 einkommen.

FREQUENCIES V84.
RECODE V84 (ELSE=COPY) INTO alter.
VARIABLE LABELS alter "Alter in Jahren".
MISSING VALUES alter (999).
FREQUENCIES V84 alter.

FREQUENCIES V81.
RECODE V81 (1=0) (2=1) INTO frau.
VARIABLE LABELS frau "Geschlecht".
VALUE LABELS frau 0 "Männer" 1 "Frauen".
FREQUENCIES V81 frau.

FREQUENCIES V7.
RECODE V7 (1=0) (2=1) INTO ost.
VARIABLE LABELS ost "Erhebungsgebiet".
VALUE LABELS ost 0 "alte Bundesländer" 1 "neue Bundesländer".
FREQUENCIES V7 ost.

WEIGHT BY V870.
REGRESSION
/DEPENDENT = einkommen
/METHOD = ENTER alter frau ost.


