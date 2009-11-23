TITLE SBML model: Model_1 generated from file: BIOMD000000183_altered_id_replaced.xml

UNITS {
  (mA) = (milliamp)
  (mV) = (millivolt)
}

NEURON {
  SUFFIX Model_1
  RANGE Spine
  GLOBAL kon
  GLOBAL koffRA
  GLOBAL koffRB
  GLOBAL koffRC
  GLOBAL koffRD
  GLOBAL koffTA
  GLOBAL koffTB
  GLOBAL koffTC
  GLOBAL koffTD
  GLOBAL kRT
  GLOBAL kTR
  GLOBAL cA
  GLOBAL cB
  GLOBAL cC
  GLOBAL cD
  GLOBAL konCaMKII
  GLOBAL koffCaMKII
  GLOBAL konPP2B
  GLOBAL koffPP2B
  GLOBAL free_camR_ca3_total
  GLOBAL free_camT_ca3_total
  GLOBAL free_cam_ca3_total
  GLOBAL cam_ca4_total
  GLOBAL CaMKII_camR_ca1
  GLOBAL CaMKII_camR_ca2
  GLOBAL CaMKII_camR_ca3
  GLOBAL total_CaMKII_bound
  GLOBAL total_CaMKII
  GLOBAL CaMKIIbar
  GLOBAL PP2B_camR_ca1
  GLOBAL PP2B_camR_ca2
  GLOBAL PP2B_camR_ca3
  GLOBAL total_PP2B_bound
  GLOBAL total_PP2B
  GLOBAL PP2Bbar
  GLOBAL camR_unbound
  GLOBAL total_camR
  GLOBAL total_camT
  GLOBAL Rbar
  GLOBAL cam_ca3_total
  GLOBAL free_camR_ca2_total
  GLOBAL free_camT_ca2_total
  GLOBAL free_cam_ca2_total
  GLOBAL cam_ca2_total
  GLOBAL free_cam_ca1_total
  GLOBAL cam_ca1_total
  GLOBAL cam_ca0_total
  GLOBAL cam_total
  GLOBAL moles_bound_ca_per_moles_cam
  GLOBAL L
  GLOBAL KRA
  GLOBAL KRB
  GLOBAL KRC
  GLOBAL KRD
  GLOBAL epsilon
  GLOBAL ybar
  GLOBAL ybar1ybar
}

PARAMETER {
  Spine = 0.000000
  kon = 1000000.0
  koffRA = 8.32
  koffRB = 0.0166
  koffRC = 17.4
  koffRD = 0.0145
  koffTA = 2101.01010101
  koffTB = 4.19191919192
  koffTC = 4393.93939394
  koffTD = 3.66161616162
  kRT = 1000000.0
  kTR = 48.3792936623
  cA = 0.00396
  cB = 0.00396
  cC = 0.00396
  cD = 0.00396
  konCaMKII = 3200000.0
  koffCaMKII = 0.343
  konPP2B = 46000000.0
  koffPP2B = 0.4
  free_camR_ca3_total = 0.0
  free_camT_ca3_total = 0.0
  free_cam_ca3_total = 0.0
  cam_ca4_total = 0.0
  CaMKII_camR_ca1 = 0.0
  CaMKII_camR_ca2 = 0.0
  CaMKII_camR_ca3 = 0.0
  total_CaMKII_bound = 0.0
  total_CaMKII = 7e-05
  CaMKIIbar = 0.0
  PP2B_camR_ca1 = 0.0
  PP2B_camR_ca2 = 0.0
  PP2B_camR_ca3 = 0.0
  total_PP2B_bound = 0.0
  total_PP2B = 1.6e-06
  PP2Bbar = 0.0
  camR_unbound = 9.7e-12
  total_camR = 9.7e-12
  total_camT = 2e-07
  Rbar = 4.84976478641e-05
  cam_ca3_total = 0.0
  free_camR_ca2_total = 0.0
  free_camT_ca2_total = 0.0
  free_cam_ca2_total = 0.0
  cam_ca2_total = 0.0
  free_cam_ca1_total = 0.0
  cam_ca1_total = 0.0
  cam_ca0_total = 2.000097e-07
  cam_total = 2.000097e-07
  moles_bound_ca_per_moles_cam = 0.0
  L = 20670.0
  KRA = 8.32e-06
  KRB = 1.66e-08
  KRC = 1.74e-05
  KRD = 1.45e-08
  epsilon = 4.84976478641e-05
  ybar = 0.0
  ybar1ybar = 0.0
}

STATE {
  camR
  ca
  camR_ca1_A
  camR_ca1_B
  camR_ca1_C
  camR_ca1_D
  camR_ca2_AB
  camR_ca2_AC
  camR_ca2_AD
  camR_ca2_BC
  camR_ca2_BD
  camR_ca2_CD
  camR_ca3_ABC
  camR_ca3_ABD
  camR_ca3_ACD
  camR_ca3_BCD
  camR_ca4_ABCD
  camT
  camT_ca1_A
  camT_ca1_B
  camT_ca1_C
  camT_ca1_D
  camT_ca2_AB
  camT_ca2_AC
  camT_ca2_AD
  camT_ca2_BC
  camT_ca2_BD
  camT_ca2_CD
  camT_ca3_ABC
  camT_ca3_ABD
  camT_ca3_ACD
  camT_ca3_BCD
  camT_ca4_ABCD
  CaMKII
  camR_CaMKII
  camR_ca1_A_CaMKII
  camR_ca1_B_CaMKII
  camR_ca1_C_CaMKII
  camR_ca1_D_CaMKII
  camR_ca2_AB_CaMKII
  camR_ca2_AC_CaMKII
  camR_ca2_AD_CaMKII
  camR_ca2_BC_CaMKII
  camR_ca2_BD_CaMKII
  camR_ca2_CD_CaMKII
  camR_ca3_ABC_CaMKII
  camR_ca3_ABD_CaMKII
  camR_ca3_ACD_CaMKII
  camR_ca3_BCD_CaMKII
  camR_ca4_ABCD_CaMKII
  PP2B
  camR_PP2B
  camR_ca1_A_PP2B
  camR_ca1_B_PP2B
  camR_ca1_C_PP2B
  camR_ca1_D_PP2B
  camR_ca2_AB_PP2B
  camR_ca2_AC_PP2B
  camR_ca2_AD_PP2B
  camR_ca2_BC_PP2B
  camR_ca2_BD_PP2B
  camR_ca2_CD_PP2B
  camR_ca3_ABC_PP2B
  camR_ca3_ABD_PP2B
  camR_ca3_ACD_PP2B
  camR_ca3_BCD_PP2B
  camR_ca4_ABCD_PP2B
}

INITIAL {
  camR = 9.7e-12
  ca = 1e-05
  camR_ca1_A = 0.0
  camR_ca1_B = 0.0
  camR_ca1_C = 0.0
  camR_ca1_D = 0.0
  camR_ca2_AB = 0.0
  camR_ca2_AC = 0.0
  camR_ca2_AD = 0.0
  camR_ca2_BC = 0.0
  camR_ca2_BD = 0.0
  camR_ca2_CD = 0.0
  camR_ca3_ABC = 0.0
  camR_ca3_ABD = 0.0
  camR_ca3_ACD = 0.0
  camR_ca3_BCD = 0.0
  camR_ca4_ABCD = 0.0
  camT = 2e-07
  camT_ca1_A = 0.0
  camT_ca1_B = 0.0
  camT_ca1_C = 0.0
  camT_ca1_D = 0.0
  camT_ca2_AB = 0.0
  camT_ca2_AC = 0.0
  camT_ca2_AD = 0.0
  camT_ca2_BC = 0.0
  camT_ca2_BD = 0.0
  camT_ca2_CD = 0.0
  camT_ca3_ABC = 0.0
  camT_ca3_ABD = 0.0
  camT_ca3_ACD = 0.0
  camT_ca3_BCD = 0.0
  camT_ca4_ABCD = 0.0
  CaMKII = 7e-05
  camR_CaMKII = 0.0
  camR_ca1_A_CaMKII = 0.0
  camR_ca1_B_CaMKII = 0.0
  camR_ca1_C_CaMKII = 0.0
  camR_ca1_D_CaMKII = 0.0
  camR_ca2_AB_CaMKII = 0.0
  camR_ca2_AC_CaMKII = 0.0
  camR_ca2_AD_CaMKII = 0.0
  camR_ca2_BC_CaMKII = 0.0
  camR_ca2_BD_CaMKII = 0.0
  camR_ca2_CD_CaMKII = 0.0
  camR_ca3_ABC_CaMKII = 0.0
  camR_ca3_ABD_CaMKII = 0.0
  camR_ca3_ACD_CaMKII = 0.0
  camR_ca3_BCD_CaMKII = 0.0
  camR_ca4_ABCD_CaMKII = 0.0
  PP2B = 1.6e-06
  camR_PP2B = 0.0
  camR_ca1_A_PP2B = 0.0
  camR_ca1_B_PP2B = 0.0
  camR_ca1_C_PP2B = 0.0
  camR_ca1_D_PP2B = 0.0
  camR_ca2_AB_PP2B = 0.0
  camR_ca2_AC_PP2B = 0.0
  camR_ca2_AD_PP2B = 0.0
  camR_ca2_BC_PP2B = 0.0
  camR_ca2_BD_PP2B = 0.0
  camR_ca2_CD_PP2B = 0.0
  camR_ca3_ABC_PP2B = 0.0
  camR_ca3_ABD_PP2B = 0.0
  camR_ca3_ACD_PP2B = 0.0
  camR_ca3_BCD_PP2B = 0.0
  camR_ca4_ABCD_PP2B = 0.0
}

BREAKPOINT {
  SOLVE states METHOD cnexp
}

DERIVATIVE states {
  :  (camR, ca) -> (camR_ca1_A) with formula : Spine * kon * camR * ca
  :  (camR, ca) -> (camR_ca1_B) with formula : Spine * kon * camR * ca
  :  (camR, ca) -> (camR_ca1_C) with formula : Spine * kon * camR * ca
  :  (camR, ca) -> (camR_ca1_D) with formula : Spine * kon * camR * ca
  :  (camR_ca1_A) -> (camR, ca) with formula : Spine * koffRA * camR_ca1_A
  :  (camR_ca1_B) -> (camR, ca) with formula : Spine * koffRB * camR_ca1_B
  :  (camR_ca1_C) -> (camR, ca) with formula : Spine * koffRC * camR_ca1_C
  :  (camR_ca1_D) -> (camR, ca) with formula : Spine * koffRD * camR_ca1_D
  :  (camR_ca1_A, ca) -> (camR_ca2_AB) with formula : Spine * kon * camR_ca1_A * ca
  :  (camR_ca1_A, ca) -> (camR_ca2_AC) with formula : Spine * kon * camR_ca1_A * ca
  :  (camR_ca1_A, ca) -> (camR_ca2_AD) with formula : Spine * kon * camR_ca1_A * ca
  :  (camR_ca1_B, ca) -> (camR_ca2_AB) with formula : Spine * kon * camR_ca1_B * ca
  :  (camR_ca1_B, ca) -> (camR_ca2_BC) with formula : Spine * kon * camR_ca1_B * ca
  :  (camR_ca1_B, ca) -> (camR_ca2_BD) with formula : Spine * kon * camR_ca1_B * ca
  :  (camR_ca1_C, ca) -> (camR_ca2_AC) with formula : Spine * kon * camR_ca1_C * ca
  :  (camR_ca1_C, ca) -> (camR_ca2_BC) with formula : Spine * kon * camR_ca1_C * ca
  :  (camR_ca1_C, ca) -> (camR_ca2_CD) with formula : Spine * kon * camR_ca1_C * ca
  :  (camR_ca1_D, ca) -> (camR_ca2_AD) with formula : Spine * kon * camR_ca1_D * ca
  :  (camR_ca1_D, ca) -> (camR_ca2_BD) with formula : Spine * kon * camR_ca1_D * ca
  :  (camR_ca1_D, ca) -> (camR_ca2_CD) with formula : Spine * kon * camR_ca1_D * ca
  :  (camR_ca2_AB) -> (camR_ca1_A, ca) with formula : Spine * koffRB * camR_ca2_AB
  :  (camR_ca2_AC) -> (camR_ca1_A, ca) with formula : Spine * koffRC * camR_ca2_AC
  :  (camR_ca2_AD) -> (camR_ca1_A, ca) with formula : Spine * koffRD * camR_ca2_AD
  :  (camR_ca2_AB) -> (camR_ca1_B, ca) with formula : Spine * koffRA * camR_ca2_AB
  :  (camR_ca2_BC) -> (camR_ca1_B, ca) with formula : Spine * koffRC * camR_ca2_BC
  :  (camR_ca2_BD) -> (camR_ca1_B, ca) with formula : Spine * koffRD * camR_ca2_BD
  :  (camR_ca2_AC) -> (camR_ca1_C, ca) with formula : Spine * koffRA * camR_ca2_AC
  :  (camR_ca2_BC) -> (camR_ca1_C, ca) with formula : Spine * koffRB * camR_ca2_BC
  :  (camR_ca2_CD) -> (camR_ca1_C, ca) with formula : Spine * koffRD * camR_ca2_CD
  :  (camR_ca2_AD) -> (camR_ca1_D, ca) with formula : Spine * koffRA * camR_ca2_AD
  :  (camR_ca2_BD) -> (camR_ca1_D, ca) with formula : Spine * koffRB * camR_ca2_BD
  :  (camR_ca2_CD) -> (camR_ca1_D, ca) with formula : Spine * koffRC * camR_ca2_CD
  :  (camR_ca2_AB, ca) -> (camR_ca3_ABC) with formula : Spine * kon * camR_ca2_AB * ca
  :  (camR_ca2_AB, ca) -> (camR_ca3_ABD) with formula : Spine * kon * camR_ca2_AB * ca
  :  (camR_ca2_AC, ca) -> (camR_ca3_ABC) with formula : Spine * kon * camR_ca2_AC * ca
  :  (camR_ca2_AC, ca) -> (camR_ca3_ACD) with formula : Spine * kon * camR_ca2_AC * ca
  :  (camR_ca2_AD, ca) -> (camR_ca3_ABD) with formula : Spine * kon * camR_ca2_AD * ca
  :  (camR_ca2_AD, ca) -> (camR_ca3_ACD) with formula : Spine * kon * camR_ca2_AD * ca
  :  (camR_ca2_BC, ca) -> (camR_ca3_ABC) with formula : Spine * kon * camR_ca2_BC * ca
  :  (camR_ca2_BC, ca) -> (camR_ca3_BCD) with formula : Spine * kon * camR_ca2_BC * ca
  :  (camR_ca2_BD, ca) -> (camR_ca3_ABD) with formula : Spine * kon * camR_ca2_BD * ca
  :  (camR_ca2_BD, ca) -> (camR_ca3_BCD) with formula : Spine * kon * camR_ca2_BD * ca
  :  (camR_ca2_CD, ca) -> (camR_ca3_ACD) with formula : Spine * kon * camR_ca2_CD * ca
  :  (camR_ca2_CD, ca) -> (camR_ca3_BCD) with formula : Spine * kon * camR_ca2_CD * ca
  :  (camR_ca3_ABC) -> (camR_ca2_BC, ca) with formula : Spine * koffRA * camR_ca3_ABC
  :  (camR_ca3_ABC) -> (camR_ca2_AC, ca) with formula : Spine * koffRB * camR_ca3_ABC
  :  (camR_ca3_ABC) -> (camR_ca2_AB, ca) with formula : Spine * koffRC * camR_ca3_ABC
  :  (camR_ca3_ABD) -> (camR_ca2_BD, ca) with formula : Spine * koffRA * camR_ca3_ABD
  :  (camR_ca3_ABD) -> (camR_ca2_AD, ca) with formula : Spine * koffRB * camR_ca3_ABD
  :  (camR_ca3_ABD) -> (camR_ca2_AB, ca) with formula : Spine * koffRD * camR_ca3_ABD
  :  (camR_ca3_ACD) -> (camR_ca2_CD, ca) with formula : Spine * koffRA * camR_ca3_ACD
  :  (camR_ca3_ACD) -> (camR_ca2_AD, ca) with formula : Spine * koffRC * camR_ca3_ACD
  :  (camR_ca3_ACD) -> (camR_ca2_AC, ca) with formula : Spine * koffRD * camR_ca3_ACD
  :  (camR_ca3_BCD) -> (camR_ca2_CD, ca) with formula : Spine * koffRB * camR_ca3_BCD
  :  (camR_ca3_BCD) -> (camR_ca2_BD, ca) with formula : Spine * koffRC * camR_ca3_BCD
  :  (camR_ca3_BCD) -> (camR_ca2_BC, ca) with formula : Spine * koffRD * camR_ca3_BCD
  :  (camR_ca3_ABC, ca) -> (camR_ca4_ABCD) with formula : Spine * kon * camR_ca3_ABC * ca
  :  (camR_ca3_ABD, ca) -> (camR_ca4_ABCD) with formula : Spine * kon * camR_ca3_ABD * ca
  :  (camR_ca3_ACD, ca) -> (camR_ca4_ABCD) with formula : Spine * kon * camR_ca3_ACD * ca
  :  (camR_ca3_BCD, ca) -> (camR_ca4_ABCD) with formula : Spine * kon * camR_ca3_BCD * ca
  :  (camR_ca4_ABCD) -> (camR_ca3_ABC, ca) with formula : Spine * koffRD * camR_ca4_ABCD
  :  (camR_ca4_ABCD) -> (camR_ca3_ABD, ca) with formula : Spine * koffRC * camR_ca4_ABCD
  :  (camR_ca4_ABCD) -> (camR_ca3_ACD, ca) with formula : Spine * koffRB * camR_ca4_ABCD
  :  (camR_ca4_ABCD) -> (camR_ca3_BCD, ca) with formula : Spine * koffRA * camR_ca4_ABCD
  :  (camT, ca) -> (camT_ca1_A) with formula : Spine * kon * camT * ca
  :  (camT, ca) -> (camT_ca1_B) with formula : Spine * kon * camT * ca
  :  (camT, ca) -> (camT_ca1_C) with formula : Spine * kon * camT * ca
  :  (camT, ca) -> (camT_ca1_D) with formula : Spine * kon * camT * ca
  :  (camT_ca1_A) -> (camT, ca) with formula : Spine * koffTA * camT_ca1_A
  :  (camT_ca1_B) -> (camT, ca) with formula : Spine * koffTB * camT_ca1_B
  :  (camT_ca1_C) -> (camT, ca) with formula : Spine * koffTC * camT_ca1_C
  :  (camT_ca1_D) -> (camT, ca) with formula : Spine * koffTD * camT_ca1_D
  :  (camT_ca1_A, ca) -> (camT_ca2_AB) with formula : Spine * kon * camT_ca1_A * ca
  :  (camT_ca1_A, ca) -> (camT_ca2_AC) with formula : Spine * kon * camT_ca1_A * ca
  :  (camT_ca1_A, ca) -> (camT_ca2_AD) with formula : Spine * kon * camT_ca1_A * ca
  :  (camT_ca1_B, ca) -> (camT_ca2_AB) with formula : Spine * kon * camT_ca1_B * ca
  :  (camT_ca1_B, ca) -> (camT_ca2_BC) with formula : Spine * kon * camT_ca1_B * ca
  :  (camT_ca1_B, ca) -> (camT_ca2_BD) with formula : Spine * kon * camT_ca1_B * ca
  :  (camT_ca1_C, ca) -> (camT_ca2_AC) with formula : Spine * kon * camT_ca1_C * ca
  :  (camT_ca1_C, ca) -> (camT_ca2_BC) with formula : Spine * kon * camT_ca1_C * ca
  :  (camT_ca1_C, ca) -> (camT_ca2_CD) with formula : Spine * kon * camT_ca1_C * ca
  :  (camT_ca1_D, ca) -> (camT_ca2_AD) with formula : Spine * kon * camT_ca1_D * ca
  :  (camT_ca1_D, ca) -> (camT_ca2_BD) with formula : Spine * kon * camT_ca1_D * ca
  :  (camT_ca1_D, ca) -> (camT_ca2_CD) with formula : Spine * kon * camT_ca1_D * ca
  :  (camT_ca2_AB) -> (camT_ca1_B, ca) with formula : Spine * koffTA * camT_ca2_AB
  :  (camT_ca2_AB) -> (camT_ca1_A, ca) with formula : Spine * koffTB * camT_ca2_AB
  :  (camT_ca2_AC) -> (camT_ca1_C, ca) with formula : Spine * koffTA * camT_ca2_AC
  :  (camT_ca2_AC) -> (camT_ca1_A, ca) with formula : Spine * koffTC * camT_ca2_AC
  :  (camT_ca2_AD) -> (camT_ca1_D, ca) with formula : Spine * koffTA * camT_ca2_AD
  :  (camT_ca2_AD) -> (camT_ca1_A, ca) with formula : Spine * koffTD * camT_ca2_AD
  :  (camT_ca2_BC) -> (camT_ca1_C, ca) with formula : Spine * koffTB * camT_ca2_BC
  :  (camT_ca2_BC) -> (camT_ca1_B, ca) with formula : Spine * koffTC * camT_ca2_BC
  :  (camT_ca2_BD) -> (camT_ca1_D, ca) with formula : Spine * koffTB * camT_ca2_BD
  :  (camT_ca2_BD) -> (camT_ca1_B, ca) with formula : Spine * koffTD * camT_ca2_BD
  :  (camT_ca2_CD) -> (camT_ca1_D, ca) with formula : Spine * koffTC * camT_ca2_CD
  :  (camT_ca2_CD) -> (camT_ca1_C, ca) with formula : Spine * koffTD * camT_ca2_CD
  :  (camT_ca2_AB, ca) -> (camT_ca3_ABC) with formula : Spine * kon * camT_ca2_AB * ca
  :  (camT_ca2_AB, ca) -> (camT_ca3_ABD) with formula : Spine * kon * camT_ca2_AB * ca
  :  (camT_ca2_AC, ca) -> (camT_ca3_ABC) with formula : Spine * kon * camT_ca2_AC * ca
  :  (camT_ca2_AC, ca) -> (camT_ca3_ACD) with formula : Spine * kon * camT_ca2_AC * ca
  :  (camT_ca2_AD, ca) -> (camT_ca3_ABD) with formula : Spine * kon * camT_ca2_AD * ca
  :  (camT_ca2_AD, ca) -> (camT_ca3_ACD) with formula : Spine * kon * camT_ca2_AD * ca
  :  (camT_ca2_BC, ca) -> (camT_ca3_ABC) with formula : Spine * kon * camT_ca2_BC * ca
  :  (camT_ca2_BC, ca) -> (camT_ca3_BCD) with formula : Spine * kon * camT_ca2_BC * ca
  :  (camT_ca2_BD, ca) -> (camT_ca3_ABD) with formula : Spine * kon * camT_ca2_BD * ca
  :  (camT_ca2_BD, ca) -> (camT_ca3_BCD) with formula : Spine * kon * camT_ca2_BD * ca
  :  (camT_ca2_CD, ca) -> (camT_ca3_ACD) with formula : Spine * kon * camT_ca2_CD * ca
  :  (camT_ca2_CD, ca) -> (camT_ca3_BCD) with formula : Spine * kon * camT_ca2_CD * ca
  :  (camT_ca3_ABC) -> (camT_ca2_AC, ca) with formula : Spine * koffTB * camT_ca3_ABC
  :  (camT_ca3_ABC) -> (camT_ca2_BC, ca) with formula : Spine * koffTA * camT_ca3_ABC
  :  (camT_ca3_ABD) -> (camT_ca2_AB, ca) with formula : Spine * koffTD * camT_ca3_ABD
  :  (camT_ca3_ABD) -> (camT_ca2_AD, ca) with formula : Spine * koffTB * camT_ca3_ABD
  :  (camT_ca3_ABD) -> (camT_ca2_BD, ca) with formula : Spine * koffTA * camT_ca3_ABD
  :  (camT_ca3_ACD) -> (camT_ca2_AC, ca) with formula : Spine * koffTD * camT_ca3_ACD
  :  (camT_ca3_ACD) -> (camT_ca2_AD, ca) with formula : Spine * koffTC * camT_ca3_ACD
  :  (camT_ca3_ACD) -> (camT_ca2_CD, ca) with formula : Spine * koffTA * camT_ca3_ACD
  :  (camT_ca3_BCD) -> (camT_ca2_BC, ca) with formula : Spine * koffTD * camT_ca3_BCD
  :  (camT_ca3_BCD) -> (camT_ca2_BD, ca) with formula : Spine * koffTC * camT_ca3_BCD
  :  (camT_ca3_BCD) -> (camT_ca2_CD, ca) with formula : Spine * koffTB * camT_ca3_BCD
  :  (camT_ca3_ABC, ca) -> (camT_ca4_ABCD) with formula : Spine * kon * camT_ca3_ABC * ca
  :  (camT_ca3_ABD, ca) -> (camT_ca4_ABCD) with formula : Spine * kon * camT_ca3_ABD * ca
  :  (camT_ca3_ACD, ca) -> (camT_ca4_ABCD) with formula : Spine * kon * camT_ca3_ACD * ca
  :  (camT_ca3_BCD, ca) -> (camT_ca4_ABCD) with formula : Spine * kon * camT_ca3_BCD * ca
  :  (camT_ca4_ABCD) -> (camT_ca3_ABC, ca) with formula : Spine * koffTD * camT_ca4_ABCD
  :  (camT_ca4_ABCD) -> (camT_ca3_ABD, ca) with formula : Spine * koffTC * camT_ca4_ABCD
  :  (camT_ca4_ABCD) -> (camT_ca3_ACD, ca) with formula : Spine * koffTB * camT_ca4_ABCD
  :  (camT_ca4_ABCD) -> (camT_ca3_BCD, ca) with formula : Spine * koffTA * camT_ca4_ABCD
  :  (camR) -> (camT) with formula : Spine * kRT * camR
  :  (camT) -> (camR) with formula : Spine * kTR * camT
  :  (camR_ca1_A) -> (camT_ca1_A) with formula : Spine * kRT * camR_ca1_A
  :  (camR_ca1_B) -> (camT_ca1_B) with formula : Spine * kRT * camR_ca1_B
  :  (camR_ca1_C) -> (camT_ca1_C) with formula : Spine * kRT * camR_ca1_C
  :  (camR_ca1_D) -> (camT_ca1_D) with formula : Spine * kRT * camR_ca1_D
  :  (camT_ca1_A) -> (camR_ca1_A) with formula : Spine * function_1(kTR, cA, camT_ca1_A)
  :  (camT_ca1_B) -> (camR_ca1_B) with formula : Spine * function_2(kTR, cB, camT_ca1_B)
  :  (camT_ca1_C) -> (camR_ca1_C) with formula : Spine * function_3(kTR, cC, camT_ca1_C)
  :  (camT_ca1_D) -> (camR_ca1_D) with formula : Spine * function_4(kTR, cD, camT_ca1_D)
  :  (camR_ca2_AB) -> (camT_ca2_AB) with formula : Spine * function_5(cA, cB, kRT, camR_ca2_AB)
  :  (camR_ca2_AC) -> (camT_ca2_AC) with formula : Spine * function_6(cA, cC, kRT, camR_ca2_AC)
  :  (camR_ca2_AD) -> (camT_ca2_AD) with formula : Spine * function_7(cA, cD, kRT, camR_ca2_AD)
  :  (camR_ca2_BC) -> (camT_ca2_BC) with formula : Spine * function_8(cB, cC, kRT, camR_ca2_BC)
  :  (camR_ca2_BD) -> (camT_ca2_BD) with formula : Spine * function_9(cB, cD, kRT, camR_ca2_BD)
  :  (camR_ca2_CD) -> (camT_ca2_CD) with formula : Spine * function_10(cC, cD, kRT, camR_ca2_CD)
  :  (camT_ca2_AB) -> (camR_ca2_AB) with formula : Spine * function_11(kTR, cA, cB, camT_ca2_AB)
  :  (camT_ca2_AC) -> (camR_ca2_AC) with formula : Spine * function_12(kTR, cA, cC, camT_ca2_AC)
  :  (camT_ca2_AD) -> (camR_ca2_AD) with formula : Spine * function_13(kTR, cA, cD, camT_ca2_AD)
  :  (camT_ca2_BC) -> (camR_ca2_BC) with formula : Spine * function_14(kTR, cB, cC, camT_ca2_BC)
  :  (camT_ca2_BD) -> (camR_ca2_BD) with formula : Spine * function_15(kTR, cB, cD, camT_ca2_BD)
  :  (camT_ca2_CD) -> (camR_ca2_CD) with formula : Spine * function_16(kTR, cC, cD, camT_ca2_CD)
  :  (camR_ca3_ABC) -> (camT_ca3_ABC) with formula : Spine * function_17(cA, cB, cC, kRT, camR_ca3_ABC)
  :  (camR_ca3_ABD) -> (camT_ca3_ABD) with formula : Spine * function_18(cA, cB, cD, kRT, camR_ca3_ABD)
  :  (camR_ca3_ACD) -> (camT_ca3_ACD) with formula : Spine * function_19(cA, cC, cD, kRT, camR_ca3_ACD)
  :  (camR_ca3_BCD) -> (camT_ca3_BCD) with formula : Spine * function_20(cB, cC, cD, kRT, camR_ca3_BCD)
  :  (camT_ca3_ABC) -> (camR_ca3_ABC) with formula : Spine * function_21(kTR, cA, cB, cC, camT_ca3_ABC)
  :  (camT_ca3_ABD) -> (camR_ca3_ABD) with formula : Spine * function_22(kTR, cA, cB, cD, camT_ca3_ABD)
  :  (camT_ca3_ACD) -> (camR_ca3_ACD) with formula : Spine * function_23(kTR, cA, cC, cD, camT_ca3_ACD)
  :  (camT_ca3_BCD) -> (camR_ca3_BCD) with formula : Spine * function_24(kTR, cB, cC, cD, camT_ca3_BCD)
  :  (camR_ca4_ABCD) -> (camT_ca4_ABCD) with formula : Spine * function_25(cA, cB, cC, cD, kRT, camR_ca4_ABCD)
  :  (camT_ca4_ABCD) -> (camR_ca4_ABCD) with formula : Spine * function_26(kTR, cA, cB, cC, cD, camT_ca4_ABCD)
  :  (camR, CaMKII) -> (camR_CaMKII) with formula : Spine * konCaMKII * camR * CaMKII
  :  (camR_ca1_A, CaMKII) -> (camR_ca1_A_CaMKII) with formula : Spine * konCaMKII * camR_ca1_A * CaMKII
  :  (camR_ca1_B, CaMKII) -> (camR_ca1_B_CaMKII) with formula : Spine * konCaMKII * camR_ca1_B * CaMKII
  :  (camR_ca1_C, CaMKII) -> (camR_ca1_C_CaMKII) with formula : Spine * konCaMKII * camR_ca1_C * CaMKII
  :  (camR_ca1_D, CaMKII) -> (camR_ca1_D_CaMKII) with formula : Spine * konCaMKII * camR_ca1_D * CaMKII
  :  (camR_ca2_AB, CaMKII) -> (camR_ca2_AB_CaMKII) with formula : Spine * konCaMKII * camR_ca2_AB * CaMKII
  :  (camR_ca2_AC, CaMKII) -> (camR_ca2_AC_CaMKII) with formula : Spine * konCaMKII * camR_ca2_AC * CaMKII
  :  (camR_ca2_AD, CaMKII) -> (camR_ca2_AD_CaMKII) with formula : Spine * konCaMKII * camR_ca2_AD * CaMKII
  :  (camR_ca2_BC, CaMKII) -> (camR_ca2_BC_CaMKII) with formula : Spine * konCaMKII * camR_ca2_BC * CaMKII
  :  (camR_ca2_BD, CaMKII) -> (camR_ca2_BD_CaMKII) with formula : Spine * konCaMKII * camR_ca2_BD * CaMKII
  :  (camR_ca2_CD, CaMKII) -> (camR_ca2_CD_CaMKII) with formula : Spine * konCaMKII * camR_ca2_CD * CaMKII
  :  (camR_ca3_ABC, CaMKII) -> (camR_ca3_ABC_CaMKII) with formula : Spine * konCaMKII * camR_ca3_ABC * CaMKII
  :  (camR_ca3_ABD, CaMKII) -> (camR_ca3_ABD_CaMKII) with formula : Spine * konCaMKII * camR_ca3_ABD * CaMKII
  :  (camR_ca3_ACD, CaMKII) -> (camR_ca3_ACD_CaMKII) with formula : Spine * konCaMKII * camR_ca3_ACD * CaMKII
  :  (camR_ca3_BCD, CaMKII) -> (camR_ca3_BCD_CaMKII) with formula : Spine * konCaMKII * camR_ca3_BCD * CaMKII
  :  (camR_ca4_ABCD, CaMKII) -> (camR_ca4_ABCD_CaMKII) with formula : Spine * konCaMKII * camR_ca4_ABCD * CaMKII
  :  (camR_CaMKII) -> (camR, CaMKII) with formula : Spine * koffCaMKII * camR_CaMKII
  :  (camR_ca1_A_CaMKII) -> (camR_ca1_A, CaMKII) with formula : Spine * koffCaMKII * camR_ca1_A_CaMKII
  :  (camR_ca1_B_CaMKII) -> (camR_ca1_B, CaMKII) with formula : Spine * koffCaMKII * camR_ca1_B_CaMKII
  :  (camR_ca1_C_CaMKII) -> (camR_ca1_C, CaMKII) with formula : Spine * koffCaMKII * camR_ca1_C_CaMKII
  :  (camR_ca1_D_CaMKII) -> (camR_ca1_D, CaMKII) with formula : Spine * koffCaMKII * camR_ca1_D_CaMKII
  :  (camR_ca2_AB_CaMKII) -> (camR_ca2_AB, CaMKII) with formula : Spine * koffCaMKII * camR_ca2_AB_CaMKII
  :  (camR_ca2_AC_CaMKII) -> (camR_ca2_AC, CaMKII) with formula : Spine * koffCaMKII * camR_ca2_AC_CaMKII
  :  (camR_ca2_AD_CaMKII) -> (camR_ca2_AD, CaMKII) with formula : Spine * koffCaMKII * camR_ca2_AD_CaMKII
  :  (camR_ca2_BC_CaMKII) -> (camR_ca2_BC, CaMKII) with formula : Spine * koffCaMKII * camR_ca2_BC_CaMKII
  :  (camR_ca2_BD_CaMKII) -> (camR_ca2_BD, CaMKII) with formula : Spine * koffCaMKII * camR_ca2_BD_CaMKII
  :  (camR_ca2_CD_CaMKII) -> (camR_ca2_CD, CaMKII) with formula : Spine * koffCaMKII * camR_ca2_CD_CaMKII
  :  (camR_ca3_ABC_CaMKII) -> (camR_ca3_ABC, CaMKII) with formula : Spine * koffCaMKII * camR_ca3_ABC_CaMKII
  :  (camR_ca3_ABD_CaMKII) -> (camR_ca3_ABD, CaMKII) with formula : Spine * koffCaMKII * camR_ca3_ABD_CaMKII
  :  (camR_ca3_ACD_CaMKII) -> (camR_ca3_ACD, CaMKII) with formula : Spine * koffCaMKII * camR_ca3_ACD_CaMKII
  :  (camR_ca3_BCD_CaMKII) -> (camR_ca3_BCD, CaMKII) with formula : Spine * koffCaMKII * camR_ca3_BCD_CaMKII
  :  (camR_ca4_ABCD_CaMKII) -> (camR_ca4_ABCD, CaMKII) with formula : Spine * koffCaMKII * camR_ca4_ABCD_CaMKII
  :  (camR, PP2B) -> (camR_PP2B) with formula : Spine * konPP2B * camR * PP2B
  :  (camR_ca1_A, PP2B) -> (camR_ca1_A_PP2B) with formula : Spine * konPP2B * camR_ca1_A * PP2B
  :  (camR_ca1_B, PP2B) -> (camR_ca1_B_PP2B) with formula : Spine * konPP2B * camR_ca1_B * PP2B
  :  (camR_ca1_C, PP2B) -> (camR_ca1_C_PP2B) with formula : Spine * konPP2B * camR_ca1_C * PP2B
  :  (camR_ca1_D, PP2B) -> (camR_ca1_D_PP2B) with formula : Spine * konPP2B * camR_ca1_D * PP2B
  :  (camR_ca2_AB, PP2B) -> (camR_ca2_AB_PP2B) with formula : Spine * konPP2B * camR_ca2_AB * PP2B
  :  (camR_ca2_AC, PP2B) -> (camR_ca2_AC_PP2B) with formula : Spine * konPP2B * camR_ca2_AC * PP2B
  :  (camR_ca2_AD, PP2B) -> (camR_ca2_AD_PP2B) with formula : Spine * konPP2B * camR_ca2_AD * PP2B
  :  (camR_ca2_BC, PP2B) -> (camR_ca2_BC_PP2B) with formula : Spine * konPP2B * camR_ca2_BC * PP2B
  :  (camR_ca2_BD, PP2B) -> (camR_ca2_BD_PP2B) with formula : Spine * konPP2B * camR_ca2_BD * PP2B
  :  (camR_ca2_CD, PP2B) -> (camR_ca2_CD_PP2B) with formula : Spine * konPP2B * camR_ca2_CD * PP2B
  :  (camR_ca3_ABC, PP2B) -> (camR_ca3_ABC_PP2B) with formula : Spine * konPP2B * camR_ca3_ABC * PP2B
  :  (camR_ca3_ABD, PP2B) -> (camR_ca3_ABD_PP2B) with formula : Spine * konPP2B * camR_ca3_ABD * PP2B
  :  (camR_ca3_ACD, PP2B) -> (camR_ca3_ACD_PP2B) with formula : Spine * konPP2B * camR_ca3_ACD * PP2B
  :  (camR_ca3_BCD, PP2B) -> (camR_ca3_BCD_PP2B) with formula : Spine * konPP2B * camR_ca3_BCD * PP2B
  :  (camR_ca4_ABCD, PP2B) -> (camR_ca4_ABCD_PP2B) with formula : Spine * konPP2B * camR_ca4_ABCD * PP2B
  :  (camR_PP2B) -> (camR, PP2B) with formula : Spine * koffPP2B * camR_PP2B
  :  (camR_ca1_A_PP2B) -> (camR_ca1_A, PP2B) with formula : Spine * koffPP2B * camR_ca1_A_PP2B
  :  (camR_ca1_B_PP2B) -> (camR_ca1_B, PP2B) with formula : Spine * koffPP2B * camR_ca1_B_PP2B
  :  (camR_ca1_C_PP2B) -> (camR_ca1_C, PP2B) with formula : Spine * koffPP2B * camR_ca1_C_PP2B
  :  (camR_ca1_D_PP2B) -> (camR_ca1_D, PP2B) with formula : Spine * koffPP2B * camR_ca1_D_PP2B
  :  (camR_ca2_AB_PP2B) -> (camR_ca2_AB, PP2B) with formula : Spine * koffPP2B * camR_ca2_AB_PP2B
  :  (camR_ca2_AC_PP2B) -> (camR_ca2_AC, PP2B) with formula : Spine * koffPP2B * camR_ca2_AC_PP2B
  :  (camR_ca2_AD_PP2B) -> (camR_ca2_AD, PP2B) with formula : Spine * koffPP2B * camR_ca2_AD_PP2B
  :  (camR_ca2_BC_PP2B) -> (camR_ca2_BC, PP2B) with formula : Spine * koffPP2B * camR_ca2_BC_PP2B
  :  (camR_ca2_BD_PP2B) -> (camR_ca2_BD, PP2B) with formula : Spine * koffPP2B * camR_ca2_BD_PP2B
  :  (camR_ca2_CD_PP2B) -> (camR_ca2_CD, PP2B) with formula : Spine * koffPP2B * camR_ca2_CD_PP2B
  :  (camR_ca3_ABC_PP2B) -> (camR_ca3_ABC, PP2B) with formula : Spine * koffPP2B * camR_ca3_ABC_PP2B
  :  (camR_ca3_ABD_PP2B) -> (camR_ca3_ABD, PP2B) with formula : Spine * koffPP2B * camR_ca3_ABD_PP2B
  :  (camR_ca3_ACD_PP2B) -> (camR_ca3_ACD, PP2B) with formula : Spine * koffPP2B * camR_ca3_ACD_PP2B
  :  (camR_ca3_BCD_PP2B) -> (camR_ca3_BCD, PP2B) with formula : Spine * koffPP2B * camR_ca3_BCD_PP2B
  :  (camR_ca4_ABCD_PP2B) -> (camR_ca4_ABCD, PP2B) with formula : Spine * koffPP2B * camR_ca4_ABCD_PP2B
  :  (camR_CaMKII, ca) -> (camR_ca1_A_CaMKII) with formula : Spine * kon * camR_CaMKII * ca
  :  (camR_CaMKII, ca) -> (camR_ca1_B_CaMKII) with formula : Spine * kon * camR_CaMKII * ca
  :  (camR_CaMKII, ca) -> (camR_ca1_C_CaMKII) with formula : Spine * kon * camR_CaMKII * ca
  :  (camR_CaMKII, ca) -> (camR_ca1_D_CaMKII) with formula : Spine * kon * camR_CaMKII * ca
  :  (camR_ca1_A_CaMKII) -> (camR_CaMKII, ca) with formula : Spine * koffRA * camR_ca1_A_CaMKII
  :  (camR_ca1_C_CaMKII) -> (camR_CaMKII, ca) with formula : Spine * koffRC * camR_ca1_C_CaMKII
  :  (camR_ca1_D_CaMKII) -> (camR_CaMKII, ca) with formula : Spine * koffRD * camR_ca1_D_CaMKII
  :  (camR_ca1_A_CaMKII, ca) -> (camR_ca2_AB_CaMKII) with formula : Spine * kon * camR_ca1_A_CaMKII * ca
  :  (camR_ca1_A_CaMKII, ca) -> (camR_ca2_AC_CaMKII) with formula : Spine * kon * camR_ca1_A_CaMKII * ca
  :  (camR_ca1_A_CaMKII, ca) -> (camR_ca2_AD_CaMKII) with formula : Spine * kon * camR_ca1_A_CaMKII * ca
  :  (camR_ca1_B_CaMKII, ca) -> (camR_ca2_AB_CaMKII) with formula : Spine * kon * camR_ca1_B_CaMKII * ca
  :  (camR_ca1_B_CaMKII, ca) -> (camR_ca2_BC_CaMKII) with formula : Spine * kon * camR_ca1_B_CaMKII * ca
  :  (camR_ca1_B_CaMKII, ca) -> (camR_ca2_BD_CaMKII) with formula : Spine * kon * camR_ca1_B_CaMKII * ca
  :  (camR_ca1_C_CaMKII, ca) -> (camR_ca2_AC_CaMKII) with formula : Spine * kon * camR_ca1_C_CaMKII * ca
  :  (camR_ca1_C_CaMKII, ca) -> (camR_ca2_BC_CaMKII) with formula : Spine * kon * camR_ca1_C_CaMKII * ca
  :  (camR_ca1_C_CaMKII, ca) -> (camR_ca2_CD_CaMKII) with formula : Spine * kon * camR_ca1_C_CaMKII * ca
  :  (camR_ca1_D_CaMKII, ca) -> (camR_ca2_AD_CaMKII) with formula : Spine * kon * camR_ca1_D_CaMKII * ca
  :  (camR_ca1_D_CaMKII, ca) -> (camR_ca2_BD_CaMKII) with formula : Spine * kon * camR_ca1_D_CaMKII * ca
  :  (camR_ca1_D_CaMKII, ca) -> (camR_ca2_CD_CaMKII) with formula : Spine * kon * camR_ca1_D_CaMKII * ca
  :  (camR_ca2_AB_CaMKII) -> (camR_ca1_B_CaMKII, ca) with formula : Spine * koffRA * camR_ca2_AB_CaMKII
  :  (camR_ca2_AB_CaMKII) -> (camR_ca1_A_CaMKII, ca) with formula : Spine * koffRB * camR_ca2_AB_CaMKII
  :  (camR_ca2_AC_CaMKII) -> (camR_ca1_C_CaMKII, ca) with formula : Spine * koffRA * camR_ca2_AC_CaMKII
  :  (camR_ca2_AC_CaMKII) -> (camR_ca1_A_CaMKII, ca) with formula : Spine * koffRC * camR_ca2_AC_CaMKII
  :  (camR_ca2_AD_CaMKII) -> (camR_ca1_D_CaMKII, ca) with formula : Spine * koffRA * camR_ca2_AD_CaMKII
  :  (camR_ca2_AD_CaMKII) -> (camR_ca1_A_CaMKII, ca) with formula : Spine * koffRD * camR_ca2_AD_CaMKII
  :  (camR_ca2_BC_CaMKII) -> (camR_ca1_C_CaMKII, ca) with formula : Spine * koffRB * camR_ca2_BC_CaMKII
  :  (camR_ca2_BC_CaMKII) -> (camR_ca1_B_CaMKII, ca) with formula : Spine * koffRC * camR_ca2_BC_CaMKII
  :  (camR_ca2_BD_CaMKII) -> (camR_ca1_D_CaMKII, ca) with formula : Spine * koffRB * camR_ca2_BD_CaMKII
  :  (camR_ca2_BD_CaMKII) -> (camR_ca1_B_CaMKII, ca) with formula : Spine * koffRD * camR_ca2_BD_CaMKII
  :  (camR_ca2_CD_CaMKII) -> (camR_ca1_D_CaMKII, ca) with formula : Spine * koffRC * camR_ca2_CD_CaMKII
  :  (camR_ca2_CD_CaMKII) -> (camR_ca1_C_CaMKII, ca) with formula : Spine * koffRD * camR_ca2_CD_CaMKII
  :  (camR_ca2_AB_CaMKII, ca) -> (camR_ca3_ABC_CaMKII) with formula : Spine * kon * camR_ca2_AB_CaMKII * ca
  :  (camR_ca2_AB_CaMKII, ca) -> (camR_ca3_ABD_CaMKII) with formula : Spine * kon * camR_ca2_AB_CaMKII * ca
  :  (camR_ca2_AC_CaMKII, ca) -> (camR_ca3_ABC_CaMKII) with formula : Spine * kon * camR_ca2_AC_CaMKII * ca
  :  (camR_ca2_AC_CaMKII, ca) -> (camR_ca3_ACD_CaMKII) with formula : Spine * kon * camR_ca2_AC_CaMKII * ca
  :  (camR_ca2_AD_CaMKII, ca) -> (camR_ca3_ABD_CaMKII) with formula : Spine * kon * camR_ca2_AD_CaMKII * ca
  :  (camR_ca2_AD_CaMKII, ca) -> (camR_ca3_ACD_CaMKII) with formula : Spine * kon * camR_ca2_AD_CaMKII * ca
  :  (camR_ca2_BC_CaMKII, ca) -> (camR_ca3_ABC_CaMKII) with formula : Spine * kon * camR_ca2_BC_CaMKII * ca
  :  (camR_ca2_BC_CaMKII, ca) -> (camR_ca3_BCD_CaMKII) with formula : Spine * kon * camR_ca2_BC_CaMKII * ca
  :  (camR_ca2_BD_CaMKII, ca) -> (camR_ca3_ABD_CaMKII) with formula : Spine * kon * camR_ca2_BD_CaMKII * ca
  :  (camR_ca2_BD_CaMKII, ca) -> (camR_ca3_BCD_CaMKII) with formula : Spine * kon * camR_ca2_BD_CaMKII * ca
  :  (camR_ca2_CD_CaMKII, ca) -> (camR_ca3_ACD_CaMKII) with formula : Spine * kon * camR_ca2_CD_CaMKII * ca
  :  (camR_ca2_CD_CaMKII, ca) -> (camR_ca3_BCD_CaMKII) with formula : Spine * kon * camR_ca2_CD_CaMKII * ca
  :  (camR_ca3_ABC_CaMKII) -> (camR_ca2_AB_CaMKII, ca) with formula : Spine * koffRC * camR_ca3_ABC_CaMKII
  :  (camR_ca3_ABC_CaMKII) -> (camR_ca2_AC_CaMKII, ca) with formula : Spine * koffRB * camR_ca3_ABC_CaMKII
  :  (camR_ca3_ABC_CaMKII) -> (camR_ca2_BC_CaMKII, ca) with formula : Spine * koffRA * camR_ca3_ABC_CaMKII
  :  (camR_ca3_ABD_CaMKII) -> (camR_ca2_AB_CaMKII, ca) with formula : Spine * koffRD * camR_ca3_ABD_CaMKII
  :  (camR_ca3_ABD_CaMKII) -> (camR_ca2_AD_CaMKII, ca) with formula : Spine * koffRB * camR_ca3_ABD_CaMKII
  :  (camR_ca3_ABD_CaMKII) -> (camR_ca2_BD_CaMKII, ca) with formula : Spine * koffRA * camR_ca3_ABD_CaMKII
  :  (camR_ca3_ACD_CaMKII) -> (camR_ca2_AC_CaMKII, ca) with formula : Spine * koffRD * camR_ca3_ACD_CaMKII
  :  (camR_ca3_ACD_CaMKII) -> (camR_ca2_AD_CaMKII, ca) with formula : Spine * koffRC * camR_ca3_ACD_CaMKII
  :  (camR_ca3_ACD_CaMKII) -> (camR_ca2_CD_CaMKII, ca) with formula : Spine * koffRA * camR_ca3_ACD_CaMKII
  :  (camR_ca3_BCD_CaMKII) -> (camR_ca2_BC_CaMKII, ca) with formula : Spine * koffRD * camR_ca3_BCD_CaMKII
  :  (camR_ca3_BCD_CaMKII) -> (camR_ca2_BD_CaMKII, ca) with formula : Spine * koffRC * camR_ca3_BCD_CaMKII
  :  (camR_ca3_BCD_CaMKII) -> (camR_ca2_CD_CaMKII, ca) with formula : Spine * koffRB * camR_ca3_BCD_CaMKII
  :  (camR_ca3_BCD_CaMKII, ca) -> (camR_ca4_ABCD_CaMKII) with formula : Spine * kon * camR_ca3_BCD_CaMKII * ca
  :  (camR_ca3_ACD_CaMKII, ca) -> (camR_ca4_ABCD_CaMKII) with formula : Spine * kon * camR_ca3_ACD_CaMKII * ca
  :  (camR_ca3_ABD_CaMKII, ca) -> (camR_ca4_ABCD_CaMKII) with formula : Spine * kon * camR_ca3_ABD_CaMKII * ca
  :  (camR_ca3_ABC_CaMKII, ca) -> (camR_ca4_ABCD_CaMKII) with formula : Spine * kon * camR_ca3_ABC_CaMKII * ca
  :  (camR_ca4_ABCD_CaMKII) -> (camR_ca3_BCD_CaMKII, ca) with formula : Spine * koffRA * camR_ca4_ABCD_CaMKII
  :  (camR_ca4_ABCD_CaMKII) -> (camR_ca3_ACD_CaMKII, ca) with formula : Spine * koffRB * camR_ca4_ABCD_CaMKII
  :  (camR_ca4_ABCD_CaMKII) -> (camR_ca3_ABD_CaMKII, ca) with formula : Spine * koffRC * camR_ca4_ABCD_CaMKII
  :  (camR_ca4_ABCD_CaMKII) -> (camR_ca3_ABC_CaMKII, ca) with formula : Spine * koffRD * camR_ca4_ABCD_CaMKII
  :  (camR_PP2B, ca) -> (camR_ca1_A_PP2B) with formula : Spine * kon * camR_PP2B * ca
  :  (camR_PP2B, ca) -> (camR_ca1_B_PP2B) with formula : Spine * kon * camR_PP2B * ca
  :  (camR_PP2B, ca) -> (camR_ca1_C_PP2B) with formula : Spine * kon * camR_PP2B * ca
  :  (camR_PP2B, ca) -> (camR_ca1_D_PP2B) with formula : Spine * kon * camR_PP2B * ca
  :  (camR_ca1_A_PP2B) -> (camR_PP2B, ca) with formula : Spine * koffRA * camR_ca1_A_PP2B
  :  (camR_ca1_B_PP2B) -> (camR_PP2B, ca) with formula : Spine * koffRB * camR_ca1_B_PP2B
  :  (camR_ca1_C_PP2B) -> (camR_PP2B, ca) with formula : Spine * koffRC * camR_ca1_C_PP2B
  :  (camR_ca1_D_PP2B) -> (camR_PP2B, ca) with formula : Spine * koffRD * camR_ca1_D_PP2B
  :  (camR_ca1_A_PP2B, ca) -> (camR_ca2_AB_PP2B) with formula : Spine * kon * camR_ca1_A_PP2B * ca
  :  (camR_ca1_A_PP2B, ca) -> (camR_ca2_AC_PP2B) with formula : Spine * kon * camR_ca1_A_PP2B * ca
  :  (camR_ca1_A_PP2B, ca) -> (camR_ca2_AD_PP2B) with formula : Spine * kon * camR_ca1_A_PP2B * ca
  :  (camR_ca1_B_PP2B, ca) -> (camR_ca2_AB_PP2B) with formula : Spine * kon * camR_ca1_B_PP2B * ca
  :  (camR_ca1_B_PP2B, ca) -> (camR_ca2_BC_PP2B) with formula : Spine * kon * camR_ca1_B_PP2B * ca
  :  (camR_ca1_B_PP2B, ca) -> (camR_ca2_BD_PP2B) with formula : Spine * kon * camR_ca1_B_PP2B * ca
  :  (camR_ca1_C_PP2B, ca) -> (camR_ca2_AC_PP2B) with formula : Spine * kon * camR_ca1_C_PP2B * ca
  :  (camR_ca1_C_PP2B, ca) -> (camR_ca2_BC_PP2B) with formula : Spine * kon * camR_ca1_C_PP2B * ca
  :  (camR_ca1_C_PP2B, ca) -> (camR_ca2_CD_PP2B) with formula : Spine * kon * camR_ca1_C_PP2B * ca
  :  (camR_ca1_D_PP2B, ca) -> (camR_ca2_AD_PP2B) with formula : Spine * kon * camR_ca1_D_PP2B * ca
  :  (camR_ca1_D_PP2B, ca) -> (camR_ca2_BD_PP2B) with formula : Spine * kon * camR_ca1_D_PP2B * ca
  :  (camR_ca1_D_PP2B, ca) -> (camR_ca2_CD_PP2B) with formula : Spine * kon * camR_ca1_D_PP2B * ca
  :  (camR_ca2_AB_PP2B) -> (camR_ca1_B_PP2B, ca) with formula : Spine * koffRA * camR_ca2_AB_PP2B
  :  (camR_ca2_AB_PP2B) -> (camR_ca1_A_PP2B, ca) with formula : Spine * koffRB * camR_ca2_AB_PP2B
  :  (camR_ca2_AC_PP2B) -> (camR_ca1_C_PP2B, ca) with formula : Spine * koffRA * camR_ca2_AC_PP2B
  :  (camR_ca2_AC_PP2B) -> (camR_ca1_A_PP2B, ca) with formula : Spine * koffRC * camR_ca2_AC_PP2B
  :  (camR_ca2_AD_PP2B) -> (camR_ca1_D_PP2B, ca) with formula : Spine * koffRA * camR_ca2_AD_PP2B
  :  (camR_ca2_AD_PP2B) -> (camR_ca1_A_PP2B, ca) with formula : Spine * koffRD * camR_ca2_AD_PP2B
  :  (camR_ca2_BC_PP2B) -> (camR_ca1_C_PP2B, ca) with formula : Spine * koffRB * camR_ca2_BC_PP2B
  :  (camR_ca2_BC_PP2B) -> (camR_ca1_B_PP2B, ca) with formula : Spine * koffRC * camR_ca2_BC_PP2B
  :  (camR_ca2_BD_PP2B) -> (camR_ca1_D_PP2B, ca) with formula : Spine * koffRB * camR_ca2_BD_PP2B
  :  (camR_ca2_BD_PP2B) -> (camR_ca1_B_PP2B, ca) with formula : Spine * koffRD * camR_ca2_BD_PP2B
  :  (camR_ca2_CD_PP2B) -> (camR_ca1_D_PP2B, ca) with formula : Spine * koffRC * camR_ca2_CD_PP2B
  :  (camR_ca2_CD_PP2B) -> (camR_ca1_C_PP2B, ca) with formula : Spine * koffRD * camR_ca2_CD_PP2B
  :  (camR_ca2_AB_PP2B, ca) -> (camR_ca3_ABC_PP2B) with formula : Spine * kon * camR_ca2_AB_PP2B * ca
  :  (camR_ca2_AB_PP2B, ca) -> (camR_ca3_ABD_PP2B) with formula : Spine * kon * camR_ca2_AB_PP2B * ca
  :  (camR_ca2_AC_PP2B, ca) -> (camR_ca3_ABC_PP2B) with formula : Spine * kon * camR_ca2_AC_PP2B * ca
  :  (camR_ca2_AC_PP2B, ca) -> (camR_ca3_ACD_PP2B) with formula : Spine * kon * camR_ca2_AC_PP2B * ca
  :  (camR_ca2_AD_PP2B, ca) -> (camR_ca3_ABD_PP2B) with formula : Spine * kon * camR_ca2_AD_PP2B * ca
  :  (camR_ca2_AD_PP2B, ca) -> (camR_ca3_ACD_PP2B) with formula : Spine * kon * camR_ca2_AD_PP2B * ca
  :  (camR_ca2_BC_PP2B, ca) -> (camR_ca3_ABC_PP2B) with formula : Spine * kon * camR_ca2_BC_PP2B * ca
  :  (camR_ca2_BC_PP2B, ca) -> (camR_ca3_BCD_PP2B) with formula : Spine * kon * camR_ca2_BC_PP2B * ca
  :  (camR_ca2_BD_PP2B, ca) -> (camR_ca3_ABD_PP2B) with formula : Spine * kon * camR_ca2_BD_PP2B * ca
  :  (camR_ca2_BD_PP2B, ca) -> (camR_ca3_BCD_PP2B) with formula : Spine * kon * camR_ca2_BD_PP2B * ca
  :  (camR_ca2_CD_PP2B, ca) -> (camR_ca3_ACD_PP2B) with formula : Spine * kon * camR_ca2_CD_PP2B * ca
  :  (camR_ca2_CD_PP2B, ca) -> (camR_ca3_BCD_PP2B) with formula : Spine * kon * camR_ca2_CD_PP2B * ca
  :  (camR_ca3_ABC_PP2B) -> (camR_ca2_BC_PP2B, ca) with formula : Spine * koffRA * camR_ca3_ABC_PP2B
  :  (camR_ca3_ABC_PP2B) -> (camR_ca2_AC_PP2B, ca) with formula : Spine * koffRB * camR_ca3_ABC_PP2B
  :  (camR_ca3_ABC_PP2B) -> (camR_ca2_AB_PP2B, ca) with formula : Spine * koffRC * camR_ca3_ABC_PP2B
  :  (camR_ca3_ABD_PP2B) -> (camR_ca2_BD_PP2B, ca) with formula : Spine * koffRA * camR_ca3_ABD_PP2B
  :  (camR_ca3_ABD_PP2B) -> (camR_ca2_AD_PP2B, ca) with formula : Spine * koffRB * camR_ca3_ABD_PP2B
  :  (camR_ca3_ABD_PP2B) -> (camR_ca2_AB_PP2B, ca) with formula : Spine * koffRD * camR_ca3_ABD_PP2B
  :  (camR_ca3_ACD_PP2B) -> (camR_ca2_CD_PP2B, ca) with formula : Spine * koffRA * camR_ca3_ACD_PP2B
  :  (camR_ca3_ACD_PP2B) -> (camR_ca2_AD_PP2B, ca) with formula : Spine * koffRC * camR_ca3_ACD_PP2B
  :  (camR_ca3_ACD_PP2B) -> (camR_ca2_AC_PP2B, ca) with formula : Spine * koffRD * camR_ca3_ACD_PP2B
  :  (camR_ca3_BCD_PP2B) -> (camR_ca2_CD_PP2B, ca) with formula : Spine * koffRB * camR_ca3_BCD_PP2B
  :  (camR_ca3_BCD_PP2B) -> (camR_ca2_BD_PP2B, ca) with formula : Spine * koffRC * camR_ca3_BCD_PP2B
  :  (camR_ca3_BCD_PP2B) -> (camR_ca2_BC_PP2B, ca) with formula : Spine * koffRD * camR_ca3_BCD_PP2B
  :  (camR_ca3_ABC_PP2B, ca) -> (camR_ca4_ABCD_PP2B) with formula : Spine * kon * camR_ca3_ABC_PP2B * ca
  :  (camR_ca3_ABD_PP2B, ca) -> (camR_ca4_ABCD_PP2B) with formula : Spine * kon * camR_ca3_ABD_PP2B * ca
  :  (camR_ca3_ACD_PP2B, ca) -> (camR_ca4_ABCD_PP2B) with formula : Spine * kon * camR_ca3_ACD_PP2B * ca
  :  (camR_ca3_BCD_PP2B, ca) -> (camR_ca4_ABCD_PP2B) with formula : Spine * kon * camR_ca3_BCD_PP2B * ca
  :  (camR_ca4_ABCD_PP2B) -> (camR_ca3_BCD_PP2B, ca) with formula : Spine * koffRA * camR_ca4_ABCD_PP2B
  :  (camR_ca4_ABCD_PP2B) -> (camR_ca3_ACD_PP2B, ca) with formula : Spine * koffRB * camR_ca4_ABCD_PP2B
  :  (camR_ca4_ABCD_PP2B) -> (camR_ca3_ABD_PP2B, ca) with formula : Spine * koffRC * camR_ca4_ABCD_PP2B
  :  (camR_ca4_ABCD_PP2B) -> (camR_ca3_ABC_PP2B, ca) with formula : Spine * koffRD * camR_ca4_ABCD_PP2B
  :  (camR_ca1_B_CaMKII) -> (camR_CaMKII, ca) with formula : Spine * koffRB * camR_ca1_B_CaMKII
  :  (camT_ca3_ABC) -> (camT_ca2_AB, ca) with formula : Spine * koffTC * camT_ca3_ABC
  camR' =  - (Spine * kon * camR * ca)  - (Spine * kon * camR * ca)  - (Spine * kon * camR * ca)  - (Spine * kon * camR * ca)  + (Spine * koffRA * camR_ca1_A) + (Spine * koffRB * camR_ca1_B) + (Spine * koffRC * camR_ca1_C) + (Spine * koffRD * camR_ca1_D) - (Spine * kRT * camR)  + (Spine * kTR * camT) - (Spine * konCaMKII * camR * CaMKII)  + (Spine * koffCaMKII * camR_CaMKII) - (Spine * konPP2B * camR * PP2B)  + (Spine * koffPP2B * camR_PP2B) 
  ca' =  - (Spine * kon * camR * ca)  - (Spine * kon * camR * ca)  - (Spine * kon * camR * ca)  - (Spine * kon * camR * ca)  + (Spine * koffRA * camR_ca1_A) + (Spine * koffRB * camR_ca1_B) + (Spine * koffRC * camR_ca1_C) + (Spine * koffRD * camR_ca1_D) - (Spine * kon * camR_ca1_A * ca)  - (Spine * kon * camR_ca1_A * ca)  - (Spine * kon * camR_ca1_A * ca)  - (Spine * kon * camR_ca1_B * ca)  - (Spine * kon * camR_ca1_B * ca)  - (Spine * kon * camR_ca1_B * ca)  - (Spine * kon * camR_ca1_C * ca)  - (Spine * kon * camR_ca1_C * ca)  - (Spine * kon * camR_ca1_C * ca)  - (Spine * kon * camR_ca1_D * ca)  - (Spine * kon * camR_ca1_D * ca)  - (Spine * kon * camR_ca1_D * ca)  + (Spine * koffRB * camR_ca2_AB) + (Spine * koffRC * camR_ca2_AC) + (Spine * koffRD * camR_ca2_AD) + (Spine * koffRA * camR_ca2_AB) + (Spine * koffRC * camR_ca2_BC) + (Spine * koffRD * camR_ca2_BD) + (Spine * koffRA * camR_ca2_AC) + (Spine * koffRB * camR_ca2_BC) + (Spine * koffRD * camR_ca2_CD) + (Spine * koffRA * camR_ca2_AD) + (Spine * koffRB * camR_ca2_BD) + (Spine * koffRC * camR_ca2_CD) - (Spine * kon * camR_ca2_AB * ca)  - (Spine * kon * camR_ca2_AB * ca)  - (Spine * kon * camR_ca2_AC * ca)  - (Spine * kon * camR_ca2_AC * ca)  - (Spine * kon * camR_ca2_AD * ca)  - (Spine * kon * camR_ca2_AD * ca)  - (Spine * kon * camR_ca2_BC * ca)  - (Spine * kon * camR_ca2_BC * ca)  - (Spine * kon * camR_ca2_BD * ca)  - (Spine * kon * camR_ca2_BD * ca)  - (Spine * kon * camR_ca2_CD * ca)  - (Spine * kon * camR_ca2_CD * ca)  + (Spine * koffRA * camR_ca3_ABC) + (Spine * koffRB * camR_ca3_ABC) + (Spine * koffRC * camR_ca3_ABC) + (Spine * koffRA * camR_ca3_ABD) + (Spine * koffRB * camR_ca3_ABD) + (Spine * koffRD * camR_ca3_ABD) + (Spine * koffRA * camR_ca3_ACD) + (Spine * koffRC * camR_ca3_ACD) + (Spine * koffRD * camR_ca3_ACD) + (Spine * koffRB * camR_ca3_BCD) + (Spine * koffRC * camR_ca3_BCD) + (Spine * koffRD * camR_ca3_BCD) - (Spine * kon * camR_ca3_ABC * ca)  - (Spine * kon * camR_ca3_ABD * ca)  - (Spine * kon * camR_ca3_ACD * ca)  - (Spine * kon * camR_ca3_BCD * ca)  + (Spine * koffRD * camR_ca4_ABCD) + (Spine * koffRC * camR_ca4_ABCD) + (Spine * koffRB * camR_ca4_ABCD) + (Spine * koffRA * camR_ca4_ABCD) - (Spine * kon * camT * ca)  - (Spine * kon * camT * ca)  - (Spine * kon * camT * ca)  - (Spine * kon * camT * ca)  + (Spine * koffTA * camT_ca1_A) + (Spine * koffTB * camT_ca1_B) + (Spine * koffTC * camT_ca1_C) + (Spine * koffTD * camT_ca1_D) - (Spine * kon * camT_ca1_A * ca)  - (Spine * kon * camT_ca1_A * ca)  - (Spine * kon * camT_ca1_A * ca)  - (Spine * kon * camT_ca1_B * ca)  - (Spine * kon * camT_ca1_B * ca)  - (Spine * kon * camT_ca1_B * ca)  - (Spine * kon * camT_ca1_C * ca)  - (Spine * kon * camT_ca1_C * ca)  - (Spine * kon * camT_ca1_C * ca)  - (Spine * kon * camT_ca1_D * ca)  - (Spine * kon * camT_ca1_D * ca)  - (Spine * kon * camT_ca1_D * ca)  + (Spine * koffTA * camT_ca2_AB) + (Spine * koffTB * camT_ca2_AB) + (Spine * koffTA * camT_ca2_AC) + (Spine * koffTC * camT_ca2_AC) + (Spine * koffTA * camT_ca2_AD) + (Spine * koffTD * camT_ca2_AD) + (Spine * koffTB * camT_ca2_BC) + (Spine * koffTC * camT_ca2_BC) + (Spine * koffTB * camT_ca2_BD) + (Spine * koffTD * camT_ca2_BD) + (Spine * koffTC * camT_ca2_CD) + (Spine * koffTD * camT_ca2_CD) - (Spine * kon * camT_ca2_AB * ca)  - (Spine * kon * camT_ca2_AB * ca)  - (Spine * kon * camT_ca2_AC * ca)  - (Spine * kon * camT_ca2_AC * ca)  - (Spine * kon * camT_ca2_AD * ca)  - (Spine * kon * camT_ca2_AD * ca)  - (Spine * kon * camT_ca2_BC * ca)  - (Spine * kon * camT_ca2_BC * ca)  - (Spine * kon * camT_ca2_BD * ca)  - (Spine * kon * camT_ca2_BD * ca)  - (Spine * kon * camT_ca2_CD * ca)  - (Spine * kon * camT_ca2_CD * ca)  + (Spine * koffTB * camT_ca3_ABC) + (Spine * koffTA * camT_ca3_ABC) + (Spine * koffTD * camT_ca3_ABD) + (Spine * koffTB * camT_ca3_ABD) + (Spine * koffTA * camT_ca3_ABD) + (Spine * koffTD * camT_ca3_ACD) + (Spine * koffTC * camT_ca3_ACD) + (Spine * koffTA * camT_ca3_ACD) + (Spine * koffTD * camT_ca3_BCD) + (Spine * koffTC * camT_ca3_BCD) + (Spine * koffTB * camT_ca3_BCD) - (Spine * kon * camT_ca3_ABC * ca)  - (Spine * kon * camT_ca3_ABD * ca)  - (Spine * kon * camT_ca3_ACD * ca)  - (Spine * kon * camT_ca3_BCD * ca)  + (Spine * koffTD * camT_ca4_ABCD) + (Spine * koffTC * camT_ca4_ABCD) + (Spine * koffTB * camT_ca4_ABCD) + (Spine * koffTA * camT_ca4_ABCD) - (Spine * kon * camR_CaMKII * ca)  - (Spine * kon * camR_CaMKII * ca)  - (Spine * kon * camR_CaMKII * ca)  - (Spine * kon * camR_CaMKII * ca)  + (Spine * koffRA * camR_ca1_A_CaMKII) + (Spine * koffRC * camR_ca1_C_CaMKII) + (Spine * koffRD * camR_ca1_D_CaMKII) - (Spine * kon * camR_ca1_A_CaMKII * ca)  - (Spine * kon * camR_ca1_A_CaMKII * ca)  - (Spine * kon * camR_ca1_A_CaMKII * ca)  - (Spine * kon * camR_ca1_B_CaMKII * ca)  - (Spine * kon * camR_ca1_B_CaMKII * ca)  - (Spine * kon * camR_ca1_B_CaMKII * ca)  - (Spine * kon * camR_ca1_C_CaMKII * ca)  - (Spine * kon * camR_ca1_C_CaMKII * ca)  - (Spine * kon * camR_ca1_C_CaMKII * ca)  - (Spine * kon * camR_ca1_D_CaMKII * ca)  - (Spine * kon * camR_ca1_D_CaMKII * ca)  - (Spine * kon * camR_ca1_D_CaMKII * ca)  + (Spine * koffRA * camR_ca2_AB_CaMKII) + (Spine * koffRB * camR_ca2_AB_CaMKII) + (Spine * koffRA * camR_ca2_AC_CaMKII) + (Spine * koffRC * camR_ca2_AC_CaMKII) + (Spine * koffRA * camR_ca2_AD_CaMKII) + (Spine * koffRD * camR_ca2_AD_CaMKII) + (Spine * koffRB * camR_ca2_BC_CaMKII) + (Spine * koffRC * camR_ca2_BC_CaMKII) + (Spine * koffRB * camR_ca2_BD_CaMKII) + (Spine * koffRD * camR_ca2_BD_CaMKII) + (Spine * koffRC * camR_ca2_CD_CaMKII) + (Spine * koffRD * camR_ca2_CD_CaMKII) - (Spine * kon * camR_ca2_AB_CaMKII * ca)  - (Spine * kon * camR_ca2_AB_CaMKII * ca)  - (Spine * kon * camR_ca2_AC_CaMKII * ca)  - (Spine * kon * camR_ca2_AC_CaMKII * ca)  - (Spine * kon * camR_ca2_AD_CaMKII * ca)  - (Spine * kon * camR_ca2_AD_CaMKII * ca)  - (Spine * kon * camR_ca2_BC_CaMKII * ca)  - (Spine * kon * camR_ca2_BC_CaMKII * ca)  - (Spine * kon * camR_ca2_BD_CaMKII * ca)  - (Spine * kon * camR_ca2_BD_CaMKII * ca)  - (Spine * kon * camR_ca2_CD_CaMKII * ca)  - (Spine * kon * camR_ca2_CD_CaMKII * ca)  + (Spine * koffRC * camR_ca3_ABC_CaMKII) + (Spine * koffRB * camR_ca3_ABC_CaMKII) + (Spine * koffRA * camR_ca3_ABC_CaMKII) + (Spine * koffRD * camR_ca3_ABD_CaMKII) + (Spine * koffRB * camR_ca3_ABD_CaMKII) + (Spine * koffRA * camR_ca3_ABD_CaMKII) + (Spine * koffRD * camR_ca3_ACD_CaMKII) + (Spine * koffRC * camR_ca3_ACD_CaMKII) + (Spine * koffRA * camR_ca3_ACD_CaMKII) + (Spine * koffRD * camR_ca3_BCD_CaMKII) + (Spine * koffRC * camR_ca3_BCD_CaMKII) + (Spine * koffRB * camR_ca3_BCD_CaMKII) - (Spine * kon * camR_ca3_BCD_CaMKII * ca)  - (Spine * kon * camR_ca3_ACD_CaMKII * ca)  - (Spine * kon * camR_ca3_ABD_CaMKII * ca)  - (Spine * kon * camR_ca3_ABC_CaMKII * ca)  + (Spine * koffRA * camR_ca4_ABCD_CaMKII) + (Spine * koffRB * camR_ca4_ABCD_CaMKII) + (Spine * koffRC * camR_ca4_ABCD_CaMKII) + (Spine * koffRD * camR_ca4_ABCD_CaMKII) - (Spine * kon * camR_PP2B * ca)  - (Spine * kon * camR_PP2B * ca)  - (Spine * kon * camR_PP2B * ca)  - (Spine * kon * camR_PP2B * ca)  + (Spine * koffRA * camR_ca1_A_PP2B) + (Spine * koffRB * camR_ca1_B_PP2B) + (Spine * koffRC * camR_ca1_C_PP2B) + (Spine * koffRD * camR_ca1_D_PP2B) - (Spine * kon * camR_ca1_A_PP2B * ca)  - (Spine * kon * camR_ca1_A_PP2B * ca)  - (Spine * kon * camR_ca1_A_PP2B * ca)  - (Spine * kon * camR_ca1_B_PP2B * ca)  - (Spine * kon * camR_ca1_B_PP2B * ca)  - (Spine * kon * camR_ca1_B_PP2B * ca)  - (Spine * kon * camR_ca1_C_PP2B * ca)  - (Spine * kon * camR_ca1_C_PP2B * ca)  - (Spine * kon * camR_ca1_C_PP2B * ca)  - (Spine * kon * camR_ca1_D_PP2B * ca)  - (Spine * kon * camR_ca1_D_PP2B * ca)  - (Spine * kon * camR_ca1_D_PP2B * ca)  + (Spine * koffRA * camR_ca2_AB_PP2B) + (Spine * koffRB * camR_ca2_AB_PP2B) + (Spine * koffRA * camR_ca2_AC_PP2B) + (Spine * koffRC * camR_ca2_AC_PP2B) + (Spine * koffRA * camR_ca2_AD_PP2B) + (Spine * koffRD * camR_ca2_AD_PP2B) + (Spine * koffRB * camR_ca2_BC_PP2B) + (Spine * koffRC * camR_ca2_BC_PP2B) + (Spine * koffRB * camR_ca2_BD_PP2B) + (Spine * koffRD * camR_ca2_BD_PP2B) + (Spine * koffRC * camR_ca2_CD_PP2B) + (Spine * koffRD * camR_ca2_CD_PP2B) - (Spine * kon * camR_ca2_AB_PP2B * ca)  - (Spine * kon * camR_ca2_AB_PP2B * ca)  - (Spine * kon * camR_ca2_AC_PP2B * ca)  - (Spine * kon * camR_ca2_AC_PP2B * ca)  - (Spine * kon * camR_ca2_AD_PP2B * ca)  - (Spine * kon * camR_ca2_AD_PP2B * ca)  - (Spine * kon * camR_ca2_BC_PP2B * ca)  - (Spine * kon * camR_ca2_BC_PP2B * ca)  - (Spine * kon * camR_ca2_BD_PP2B * ca)  - (Spine * kon * camR_ca2_BD_PP2B * ca)  - (Spine * kon * camR_ca2_CD_PP2B * ca)  - (Spine * kon * camR_ca2_CD_PP2B * ca)  + (Spine * koffRA * camR_ca3_ABC_PP2B) + (Spine * koffRB * camR_ca3_ABC_PP2B) + (Spine * koffRC * camR_ca3_ABC_PP2B) + (Spine * koffRA * camR_ca3_ABD_PP2B) + (Spine * koffRB * camR_ca3_ABD_PP2B) + (Spine * koffRD * camR_ca3_ABD_PP2B) + (Spine * koffRA * camR_ca3_ACD_PP2B) + (Spine * koffRC * camR_ca3_ACD_PP2B) + (Spine * koffRD * camR_ca3_ACD_PP2B) + (Spine * koffRB * camR_ca3_BCD_PP2B) + (Spine * koffRC * camR_ca3_BCD_PP2B) + (Spine * koffRD * camR_ca3_BCD_PP2B) - (Spine * kon * camR_ca3_ABC_PP2B * ca)  - (Spine * kon * camR_ca3_ABD_PP2B * ca)  - (Spine * kon * camR_ca3_ACD_PP2B * ca)  - (Spine * kon * camR_ca3_BCD_PP2B * ca)  + (Spine * koffRA * camR_ca4_ABCD_PP2B) + (Spine * koffRB * camR_ca4_ABCD_PP2B) + (Spine * koffRC * camR_ca4_ABCD_PP2B) + (Spine * koffRD * camR_ca4_ABCD_PP2B) + (Spine * koffRB * camR_ca1_B_CaMKII) + (Spine * koffTC * camT_ca3_ABC) 
  camR_ca1_A' =  (Spine * kon * camR * ca) - (Spine * koffRA * camR_ca1_A)  - (Spine * kon * camR_ca1_A * ca)  - (Spine * kon * camR_ca1_A * ca)  - (Spine * kon * camR_ca1_A * ca)  + (Spine * koffRB * camR_ca2_AB) + (Spine * koffRC * camR_ca2_AC) + (Spine * koffRD * camR_ca2_AD) - (Spine * kRT * camR_ca1_A)  + (Spine * function_1(kTR, cA, camT_ca1_A)) - (Spine * konCaMKII * camR_ca1_A * CaMKII)  + (Spine * koffCaMKII * camR_ca1_A_CaMKII) - (Spine * konPP2B * camR_ca1_A * PP2B)  + (Spine * koffPP2B * camR_ca1_A_PP2B) 
  camR_ca1_B' =  (Spine * kon * camR * ca) - (Spine * koffRB * camR_ca1_B)  - (Spine * kon * camR_ca1_B * ca)  - (Spine * kon * camR_ca1_B * ca)  - (Spine * kon * camR_ca1_B * ca)  + (Spine * koffRA * camR_ca2_AB) + (Spine * koffRC * camR_ca2_BC) + (Spine * koffRD * camR_ca2_BD) - (Spine * kRT * camR_ca1_B)  + (Spine * function_2(kTR, cB, camT_ca1_B)) - (Spine * konCaMKII * camR_ca1_B * CaMKII)  + (Spine * koffCaMKII * camR_ca1_B_CaMKII) - (Spine * konPP2B * camR_ca1_B * PP2B)  + (Spine * koffPP2B * camR_ca1_B_PP2B) 
  camR_ca1_C' =  (Spine * kon * camR * ca) - (Spine * koffRC * camR_ca1_C)  - (Spine * kon * camR_ca1_C * ca)  - (Spine * kon * camR_ca1_C * ca)  - (Spine * kon * camR_ca1_C * ca)  + (Spine * koffRA * camR_ca2_AC) + (Spine * koffRB * camR_ca2_BC) + (Spine * koffRD * camR_ca2_CD) - (Spine * kRT * camR_ca1_C)  + (Spine * function_3(kTR, cC, camT_ca1_C)) - (Spine * konCaMKII * camR_ca1_C * CaMKII)  + (Spine * koffCaMKII * camR_ca1_C_CaMKII) - (Spine * konPP2B * camR_ca1_C * PP2B)  + (Spine * koffPP2B * camR_ca1_C_PP2B) 
  camR_ca1_D' =  (Spine * kon * camR * ca) - (Spine * koffRD * camR_ca1_D)  - (Spine * kon * camR_ca1_D * ca)  - (Spine * kon * camR_ca1_D * ca)  - (Spine * kon * camR_ca1_D * ca)  + (Spine * koffRA * camR_ca2_AD) + (Spine * koffRB * camR_ca2_BD) + (Spine * koffRC * camR_ca2_CD) - (Spine * kRT * camR_ca1_D)  + (Spine * function_4(kTR, cD, camT_ca1_D)) - (Spine * konCaMKII * camR_ca1_D * CaMKII)  + (Spine * koffCaMKII * camR_ca1_D_CaMKII) - (Spine * konPP2B * camR_ca1_D * PP2B)  + (Spine * koffPP2B * camR_ca1_D_PP2B) 
  camR_ca2_AB' =  (Spine * kon * camR_ca1_A * ca) + (Spine * kon * camR_ca1_B * ca) - (Spine * koffRB * camR_ca2_AB)  - (Spine * koffRA * camR_ca2_AB)  - (Spine * kon * camR_ca2_AB * ca)  - (Spine * kon * camR_ca2_AB * ca)  + (Spine * koffRC * camR_ca3_ABC) + (Spine * koffRD * camR_ca3_ABD) - (Spine * function_5(cA, cB, kRT, camR_ca2_AB))  + (Spine * function_11(kTR, cA, cB, camT_ca2_AB)) - (Spine * konCaMKII * camR_ca2_AB * CaMKII)  + (Spine * koffCaMKII * camR_ca2_AB_CaMKII) - (Spine * konPP2B * camR_ca2_AB * PP2B)  + (Spine * koffPP2B * camR_ca2_AB_PP2B) 
  camR_ca2_AC' =  (Spine * kon * camR_ca1_A * ca) + (Spine * kon * camR_ca1_C * ca) - (Spine * koffRC * camR_ca2_AC)  - (Spine * koffRA * camR_ca2_AC)  - (Spine * kon * camR_ca2_AC * ca)  - (Spine * kon * camR_ca2_AC * ca)  + (Spine * koffRB * camR_ca3_ABC) + (Spine * koffRD * camR_ca3_ACD) - (Spine * function_6(cA, cC, kRT, camR_ca2_AC))  + (Spine * function_12(kTR, cA, cC, camT_ca2_AC)) - (Spine * konCaMKII * camR_ca2_AC * CaMKII)  + (Spine * koffCaMKII * camR_ca2_AC_CaMKII) - (Spine * konPP2B * camR_ca2_AC * PP2B)  + (Spine * koffPP2B * camR_ca2_AC_PP2B) 
  camR_ca2_AD' =  (Spine * kon * camR_ca1_A * ca) + (Spine * kon * camR_ca1_D * ca) - (Spine * koffRD * camR_ca2_AD)  - (Spine * koffRA * camR_ca2_AD)  - (Spine * kon * camR_ca2_AD * ca)  - (Spine * kon * camR_ca2_AD * ca)  + (Spine * koffRB * camR_ca3_ABD) + (Spine * koffRC * camR_ca3_ACD) - (Spine * function_7(cA, cD, kRT, camR_ca2_AD))  + (Spine * function_13(kTR, cA, cD, camT_ca2_AD)) - (Spine * konCaMKII * camR_ca2_AD * CaMKII)  + (Spine * koffCaMKII * camR_ca2_AD_CaMKII) - (Spine * konPP2B * camR_ca2_AD * PP2B)  + (Spine * koffPP2B * camR_ca2_AD_PP2B) 
  camR_ca2_BC' =  (Spine * kon * camR_ca1_B * ca) + (Spine * kon * camR_ca1_C * ca) - (Spine * koffRC * camR_ca2_BC)  - (Spine * koffRB * camR_ca2_BC)  - (Spine * kon * camR_ca2_BC * ca)  - (Spine * kon * camR_ca2_BC * ca)  + (Spine * koffRA * camR_ca3_ABC) + (Spine * koffRD * camR_ca3_BCD) - (Spine * function_8(cB, cC, kRT, camR_ca2_BC))  + (Spine * function_14(kTR, cB, cC, camT_ca2_BC)) - (Spine * konCaMKII * camR_ca2_BC * CaMKII)  + (Spine * koffCaMKII * camR_ca2_BC_CaMKII) - (Spine * konPP2B * camR_ca2_BC * PP2B)  + (Spine * koffPP2B * camR_ca2_BC_PP2B) 
  camR_ca2_BD' =  (Spine * kon * camR_ca1_B * ca) + (Spine * kon * camR_ca1_D * ca) - (Spine * koffRD * camR_ca2_BD)  - (Spine * koffRB * camR_ca2_BD)  - (Spine * kon * camR_ca2_BD * ca)  - (Spine * kon * camR_ca2_BD * ca)  + (Spine * koffRA * camR_ca3_ABD) + (Spine * koffRC * camR_ca3_BCD) - (Spine * function_9(cB, cD, kRT, camR_ca2_BD))  + (Spine * function_15(kTR, cB, cD, camT_ca2_BD)) - (Spine * konCaMKII * camR_ca2_BD * CaMKII)  + (Spine * koffCaMKII * camR_ca2_BD_CaMKII) - (Spine * konPP2B * camR_ca2_BD * PP2B)  + (Spine * koffPP2B * camR_ca2_BD_PP2B) 
  camR_ca2_CD' =  (Spine * kon * camR_ca1_C * ca) + (Spine * kon * camR_ca1_D * ca) - (Spine * koffRD * camR_ca2_CD)  - (Spine * koffRC * camR_ca2_CD)  - (Spine * kon * camR_ca2_CD * ca)  - (Spine * kon * camR_ca2_CD * ca)  + (Spine * koffRA * camR_ca3_ACD) + (Spine * koffRB * camR_ca3_BCD) - (Spine * function_10(cC, cD, kRT, camR_ca2_CD))  + (Spine * function_16(kTR, cC, cD, camT_ca2_CD)) - (Spine * konCaMKII * camR_ca2_CD * CaMKII)  + (Spine * koffCaMKII * camR_ca2_CD_CaMKII) - (Spine * konPP2B * camR_ca2_CD * PP2B)  + (Spine * koffPP2B * camR_ca2_CD_PP2B) 
  camR_ca3_ABC' =  (Spine * kon * camR_ca2_AB * ca) + (Spine * kon * camR_ca2_AC * ca) + (Spine * kon * camR_ca2_BC * ca) - (Spine * koffRA * camR_ca3_ABC)  - (Spine * koffRB * camR_ca3_ABC)  - (Spine * koffRC * camR_ca3_ABC)  - (Spine * kon * camR_ca3_ABC * ca)  + (Spine * koffRD * camR_ca4_ABCD) - (Spine * function_17(cA, cB, cC, kRT, camR_ca3_ABC))  + (Spine * function_21(kTR, cA, cB, cC, camT_ca3_ABC)) - (Spine * konCaMKII * camR_ca3_ABC * CaMKII)  + (Spine * koffCaMKII * camR_ca3_ABC_CaMKII) - (Spine * konPP2B * camR_ca3_ABC * PP2B)  + (Spine * koffPP2B * camR_ca3_ABC_PP2B) 
  camR_ca3_ABD' =  (Spine * kon * camR_ca2_AB * ca) + (Spine * kon * camR_ca2_AD * ca) + (Spine * kon * camR_ca2_BD * ca) - (Spine * koffRA * camR_ca3_ABD)  - (Spine * koffRB * camR_ca3_ABD)  - (Spine * koffRD * camR_ca3_ABD)  - (Spine * kon * camR_ca3_ABD * ca)  + (Spine * koffRC * camR_ca4_ABCD) - (Spine * function_18(cA, cB, cD, kRT, camR_ca3_ABD))  + (Spine * function_22(kTR, cA, cB, cD, camT_ca3_ABD)) - (Spine * konCaMKII * camR_ca3_ABD * CaMKII)  + (Spine * koffCaMKII * camR_ca3_ABD_CaMKII) - (Spine * konPP2B * camR_ca3_ABD * PP2B)  + (Spine * koffPP2B * camR_ca3_ABD_PP2B) 
  camR_ca3_ACD' =  (Spine * kon * camR_ca2_AC * ca) + (Spine * kon * camR_ca2_AD * ca) + (Spine * kon * camR_ca2_CD * ca) - (Spine * koffRA * camR_ca3_ACD)  - (Spine * koffRC * camR_ca3_ACD)  - (Spine * koffRD * camR_ca3_ACD)  - (Spine * kon * camR_ca3_ACD * ca)  + (Spine * koffRB * camR_ca4_ABCD) - (Spine * function_19(cA, cC, cD, kRT, camR_ca3_ACD))  + (Spine * function_23(kTR, cA, cC, cD, camT_ca3_ACD)) - (Spine * konCaMKII * camR_ca3_ACD * CaMKII)  + (Spine * koffCaMKII * camR_ca3_ACD_CaMKII) - (Spine * konPP2B * camR_ca3_ACD * PP2B)  + (Spine * koffPP2B * camR_ca3_ACD_PP2B) 
  camR_ca3_BCD' =  (Spine * kon * camR_ca2_BC * ca) + (Spine * kon * camR_ca2_BD * ca) + (Spine * kon * camR_ca2_CD * ca) - (Spine * koffRB * camR_ca3_BCD)  - (Spine * koffRC * camR_ca3_BCD)  - (Spine * koffRD * camR_ca3_BCD)  - (Spine * kon * camR_ca3_BCD * ca)  + (Spine * koffRA * camR_ca4_ABCD) - (Spine * function_20(cB, cC, cD, kRT, camR_ca3_BCD))  + (Spine * function_24(kTR, cB, cC, cD, camT_ca3_BCD)) - (Spine * konCaMKII * camR_ca3_BCD * CaMKII)  + (Spine * koffCaMKII * camR_ca3_BCD_CaMKII) - (Spine * konPP2B * camR_ca3_BCD * PP2B)  + (Spine * koffPP2B * camR_ca3_BCD_PP2B) 
  camR_ca4_ABCD' =  (Spine * kon * camR_ca3_ABC * ca) + (Spine * kon * camR_ca3_ABD * ca) + (Spine * kon * camR_ca3_ACD * ca) + (Spine * kon * camR_ca3_BCD * ca) - (Spine * koffRD * camR_ca4_ABCD)  - (Spine * koffRC * camR_ca4_ABCD)  - (Spine * koffRB * camR_ca4_ABCD)  - (Spine * koffRA * camR_ca4_ABCD)  - (Spine * function_25(cA, cB, cC, cD, kRT, camR_ca4_ABCD))  + (Spine * function_26(kTR, cA, cB, cC, cD, camT_ca4_ABCD)) - (Spine * konCaMKII * camR_ca4_ABCD * CaMKII)  + (Spine * koffCaMKII * camR_ca4_ABCD_CaMKII) - (Spine * konPP2B * camR_ca4_ABCD * PP2B)  + (Spine * koffPP2B * camR_ca4_ABCD_PP2B) 
  camT' =  - (Spine * kon * camT * ca)  - (Spine * kon * camT * ca)  - (Spine * kon * camT * ca)  - (Spine * kon * camT * ca)  + (Spine * koffTA * camT_ca1_A) + (Spine * koffTB * camT_ca1_B) + (Spine * koffTC * camT_ca1_C) + (Spine * koffTD * camT_ca1_D) + (Spine * kRT * camR) - (Spine * kTR * camT)  
  camT_ca1_A' =  (Spine * kon * camT * ca) - (Spine * koffTA * camT_ca1_A)  - (Spine * kon * camT_ca1_A * ca)  - (Spine * kon * camT_ca1_A * ca)  - (Spine * kon * camT_ca1_A * ca)  + (Spine * koffTB * camT_ca2_AB) + (Spine * koffTC * camT_ca2_AC) + (Spine * koffTD * camT_ca2_AD) + (Spine * kRT * camR_ca1_A) - (Spine * function_1(kTR, cA, camT_ca1_A))  
  camT_ca1_B' =  (Spine * kon * camT * ca) - (Spine * koffTB * camT_ca1_B)  - (Spine * kon * camT_ca1_B * ca)  - (Spine * kon * camT_ca1_B * ca)  - (Spine * kon * camT_ca1_B * ca)  + (Spine * koffTA * camT_ca2_AB) + (Spine * koffTC * camT_ca2_BC) + (Spine * koffTD * camT_ca2_BD) + (Spine * kRT * camR_ca1_B) - (Spine * function_2(kTR, cB, camT_ca1_B))  
  camT_ca1_C' =  (Spine * kon * camT * ca) - (Spine * koffTC * camT_ca1_C)  - (Spine * kon * camT_ca1_C * ca)  - (Spine * kon * camT_ca1_C * ca)  - (Spine * kon * camT_ca1_C * ca)  + (Spine * koffTA * camT_ca2_AC) + (Spine * koffTB * camT_ca2_BC) + (Spine * koffTD * camT_ca2_CD) + (Spine * kRT * camR_ca1_C) - (Spine * function_3(kTR, cC, camT_ca1_C))  
  camT_ca1_D' =  (Spine * kon * camT * ca) - (Spine * koffTD * camT_ca1_D)  - (Spine * kon * camT_ca1_D * ca)  - (Spine * kon * camT_ca1_D * ca)  - (Spine * kon * camT_ca1_D * ca)  + (Spine * koffTA * camT_ca2_AD) + (Spine * koffTB * camT_ca2_BD) + (Spine * koffTC * camT_ca2_CD) + (Spine * kRT * camR_ca1_D) - (Spine * function_4(kTR, cD, camT_ca1_D))  
  camT_ca2_AB' =  (Spine * kon * camT_ca1_A * ca) + (Spine * kon * camT_ca1_B * ca) - (Spine * koffTA * camT_ca2_AB)  - (Spine * koffTB * camT_ca2_AB)  - (Spine * kon * camT_ca2_AB * ca)  - (Spine * kon * camT_ca2_AB * ca)  + (Spine * koffTD * camT_ca3_ABD) + (Spine * function_5(cA, cB, kRT, camR_ca2_AB)) - (Spine * function_11(kTR, cA, cB, camT_ca2_AB))  + (Spine * koffTC * camT_ca3_ABC) 
  camT_ca2_AC' =  (Spine * kon * camT_ca1_A * ca) + (Spine * kon * camT_ca1_C * ca) - (Spine * koffTA * camT_ca2_AC)  - (Spine * koffTC * camT_ca2_AC)  - (Spine * kon * camT_ca2_AC * ca)  - (Spine * kon * camT_ca2_AC * ca)  + (Spine * koffTB * camT_ca3_ABC) + (Spine * koffTD * camT_ca3_ACD) + (Spine * function_6(cA, cC, kRT, camR_ca2_AC)) - (Spine * function_12(kTR, cA, cC, camT_ca2_AC))  
  camT_ca2_AD' =  (Spine * kon * camT_ca1_A * ca) + (Spine * kon * camT_ca1_D * ca) - (Spine * koffTA * camT_ca2_AD)  - (Spine * koffTD * camT_ca2_AD)  - (Spine * kon * camT_ca2_AD * ca)  - (Spine * kon * camT_ca2_AD * ca)  + (Spine * koffTB * camT_ca3_ABD) + (Spine * koffTC * camT_ca3_ACD) + (Spine * function_7(cA, cD, kRT, camR_ca2_AD)) - (Spine * function_13(kTR, cA, cD, camT_ca2_AD))  
  camT_ca2_BC' =  (Spine * kon * camT_ca1_B * ca) + (Spine * kon * camT_ca1_C * ca) - (Spine * koffTB * camT_ca2_BC)  - (Spine * koffTC * camT_ca2_BC)  - (Spine * kon * camT_ca2_BC * ca)  - (Spine * kon * camT_ca2_BC * ca)  + (Spine * koffTA * camT_ca3_ABC) + (Spine * koffTD * camT_ca3_BCD) + (Spine * function_8(cB, cC, kRT, camR_ca2_BC)) - (Spine * function_14(kTR, cB, cC, camT_ca2_BC))  
  camT_ca2_BD' =  (Spine * kon * camT_ca1_B * ca) + (Spine * kon * camT_ca1_D * ca) - (Spine * koffTB * camT_ca2_BD)  - (Spine * koffTD * camT_ca2_BD)  - (Spine * kon * camT_ca2_BD * ca)  - (Spine * kon * camT_ca2_BD * ca)  + (Spine * koffTA * camT_ca3_ABD) + (Spine * koffTC * camT_ca3_BCD) + (Spine * function_9(cB, cD, kRT, camR_ca2_BD)) - (Spine * function_15(kTR, cB, cD, camT_ca2_BD))  
  camT_ca2_CD' =  (Spine * kon * camT_ca1_C * ca) + (Spine * kon * camT_ca1_D * ca) - (Spine * koffTC * camT_ca2_CD)  - (Spine * koffTD * camT_ca2_CD)  - (Spine * kon * camT_ca2_CD * ca)  - (Spine * kon * camT_ca2_CD * ca)  + (Spine * koffTA * camT_ca3_ACD) + (Spine * koffTB * camT_ca3_BCD) + (Spine * function_10(cC, cD, kRT, camR_ca2_CD)) - (Spine * function_16(kTR, cC, cD, camT_ca2_CD))  
  camT_ca3_ABC' =  (Spine * kon * camT_ca2_AB * ca) + (Spine * kon * camT_ca2_AC * ca) + (Spine * kon * camT_ca2_BC * ca) - (Spine * koffTB * camT_ca3_ABC)  - (Spine * koffTA * camT_ca3_ABC)  - (Spine * kon * camT_ca3_ABC * ca)  + (Spine * koffTD * camT_ca4_ABCD) + (Spine * function_17(cA, cB, cC, kRT, camR_ca3_ABC)) - (Spine * function_21(kTR, cA, cB, cC, camT_ca3_ABC))  - (Spine * koffTC * camT_ca3_ABC)  
  camT_ca3_ABD' =  (Spine * kon * camT_ca2_AB * ca) + (Spine * kon * camT_ca2_AD * ca) + (Spine * kon * camT_ca2_BD * ca) - (Spine * koffTD * camT_ca3_ABD)  - (Spine * koffTB * camT_ca3_ABD)  - (Spine * koffTA * camT_ca3_ABD)  - (Spine * kon * camT_ca3_ABD * ca)  + (Spine * koffTC * camT_ca4_ABCD) + (Spine * function_18(cA, cB, cD, kRT, camR_ca3_ABD)) - (Spine * function_22(kTR, cA, cB, cD, camT_ca3_ABD))  
  camT_ca3_ACD' =  (Spine * kon * camT_ca2_AC * ca) + (Spine * kon * camT_ca2_AD * ca) + (Spine * kon * camT_ca2_CD * ca) - (Spine * koffTD * camT_ca3_ACD)  - (Spine * koffTC * camT_ca3_ACD)  - (Spine * koffTA * camT_ca3_ACD)  - (Spine * kon * camT_ca3_ACD * ca)  + (Spine * koffTB * camT_ca4_ABCD) + (Spine * function_19(cA, cC, cD, kRT, camR_ca3_ACD)) - (Spine * function_23(kTR, cA, cC, cD, camT_ca3_ACD))  
  camT_ca3_BCD' =  (Spine * kon * camT_ca2_BC * ca) + (Spine * kon * camT_ca2_BD * ca) + (Spine * kon * camT_ca2_CD * ca) - (Spine * koffTD * camT_ca3_BCD)  - (Spine * koffTC * camT_ca3_BCD)  - (Spine * koffTB * camT_ca3_BCD)  - (Spine * kon * camT_ca3_BCD * ca)  + (Spine * koffTA * camT_ca4_ABCD) + (Spine * function_20(cB, cC, cD, kRT, camR_ca3_BCD)) - (Spine * function_24(kTR, cB, cC, cD, camT_ca3_BCD))  
  camT_ca4_ABCD' =  (Spine * kon * camT_ca3_ABC * ca) + (Spine * kon * camT_ca3_ABD * ca) + (Spine * kon * camT_ca3_ACD * ca) + (Spine * kon * camT_ca3_BCD * ca) - (Spine * koffTD * camT_ca4_ABCD)  - (Spine * koffTC * camT_ca4_ABCD)  - (Spine * koffTB * camT_ca4_ABCD)  - (Spine * koffTA * camT_ca4_ABCD)  + (Spine * function_25(cA, cB, cC, cD, kRT, camR_ca4_ABCD)) - (Spine * function_26(kTR, cA, cB, cC, cD, camT_ca4_ABCD))  
  CaMKII' =  - (Spine * konCaMKII * camR * CaMKII)  - (Spine * konCaMKII * camR_ca1_A * CaMKII)  - (Spine * konCaMKII * camR_ca1_B * CaMKII)  - (Spine * konCaMKII * camR_ca1_C * CaMKII)  - (Spine * konCaMKII * camR_ca1_D * CaMKII)  - (Spine * konCaMKII * camR_ca2_AB * CaMKII)  - (Spine * konCaMKII * camR_ca2_AC * CaMKII)  - (Spine * konCaMKII * camR_ca2_AD * CaMKII)  - (Spine * konCaMKII * camR_ca2_BC * CaMKII)  - (Spine * konCaMKII * camR_ca2_BD * CaMKII)  - (Spine * konCaMKII * camR_ca2_CD * CaMKII)  - (Spine * konCaMKII * camR_ca3_ABC * CaMKII)  - (Spine * konCaMKII * camR_ca3_ABD * CaMKII)  - (Spine * konCaMKII * camR_ca3_ACD * CaMKII)  - (Spine * konCaMKII * camR_ca3_BCD * CaMKII)  - (Spine * konCaMKII * camR_ca4_ABCD * CaMKII)  + (Spine * koffCaMKII * camR_CaMKII) + (Spine * koffCaMKII * camR_ca1_A_CaMKII) + (Spine * koffCaMKII * camR_ca1_B_CaMKII) + (Spine * koffCaMKII * camR_ca1_C_CaMKII) + (Spine * koffCaMKII * camR_ca1_D_CaMKII) + (Spine * koffCaMKII * camR_ca2_AB_CaMKII) + (Spine * koffCaMKII * camR_ca2_AC_CaMKII) + (Spine * koffCaMKII * camR_ca2_AD_CaMKII) + (Spine * koffCaMKII * camR_ca2_BC_CaMKII) + (Spine * koffCaMKII * camR_ca2_BD_CaMKII) + (Spine * koffCaMKII * camR_ca2_CD_CaMKII) + (Spine * koffCaMKII * camR_ca3_ABC_CaMKII) + (Spine * koffCaMKII * camR_ca3_ABD_CaMKII) + (Spine * koffCaMKII * camR_ca3_ACD_CaMKII) + (Spine * koffCaMKII * camR_ca3_BCD_CaMKII) + (Spine * koffCaMKII * camR_ca4_ABCD_CaMKII) 
  camR_CaMKII' =  (Spine * konCaMKII * camR * CaMKII) - (Spine * koffCaMKII * camR_CaMKII)  - (Spine * kon * camR_CaMKII * ca)  - (Spine * kon * camR_CaMKII * ca)  - (Spine * kon * camR_CaMKII * ca)  - (Spine * kon * camR_CaMKII * ca)  + (Spine * koffRA * camR_ca1_A_CaMKII) + (Spine * koffRC * camR_ca1_C_CaMKII) + (Spine * koffRD * camR_ca1_D_CaMKII) + (Spine * koffRB * camR_ca1_B_CaMKII) 
  camR_ca1_A_CaMKII' =  (Spine * konCaMKII * camR_ca1_A * CaMKII) - (Spine * koffCaMKII * camR_ca1_A_CaMKII)  + (Spine * kon * camR_CaMKII * ca) - (Spine * koffRA * camR_ca1_A_CaMKII)  - (Spine * kon * camR_ca1_A_CaMKII * ca)  - (Spine * kon * camR_ca1_A_CaMKII * ca)  - (Spine * kon * camR_ca1_A_CaMKII * ca)  + (Spine * koffRB * camR_ca2_AB_CaMKII) + (Spine * koffRC * camR_ca2_AC_CaMKII) + (Spine * koffRD * camR_ca2_AD_CaMKII) 
  camR_ca1_B_CaMKII' =  (Spine * konCaMKII * camR_ca1_B * CaMKII) - (Spine * koffCaMKII * camR_ca1_B_CaMKII)  + (Spine * kon * camR_CaMKII * ca) - (Spine * kon * camR_ca1_B_CaMKII * ca)  - (Spine * kon * camR_ca1_B_CaMKII * ca)  - (Spine * kon * camR_ca1_B_CaMKII * ca)  + (Spine * koffRA * camR_ca2_AB_CaMKII) + (Spine * koffRC * camR_ca2_BC_CaMKII) + (Spine * koffRD * camR_ca2_BD_CaMKII) - (Spine * koffRB * camR_ca1_B_CaMKII)  
  camR_ca1_C_CaMKII' =  (Spine * konCaMKII * camR_ca1_C * CaMKII) - (Spine * koffCaMKII * camR_ca1_C_CaMKII)  + (Spine * kon * camR_CaMKII * ca) - (Spine * koffRC * camR_ca1_C_CaMKII)  - (Spine * kon * camR_ca1_C_CaMKII * ca)  - (Spine * kon * camR_ca1_C_CaMKII * ca)  - (Spine * kon * camR_ca1_C_CaMKII * ca)  + (Spine * koffRA * camR_ca2_AC_CaMKII) + (Spine * koffRB * camR_ca2_BC_CaMKII) + (Spine * koffRD * camR_ca2_CD_CaMKII) 
  camR_ca1_D_CaMKII' =  (Spine * konCaMKII * camR_ca1_D * CaMKII) - (Spine * koffCaMKII * camR_ca1_D_CaMKII)  + (Spine * kon * camR_CaMKII * ca) - (Spine * koffRD * camR_ca1_D_CaMKII)  - (Spine * kon * camR_ca1_D_CaMKII * ca)  - (Spine * kon * camR_ca1_D_CaMKII * ca)  - (Spine * kon * camR_ca1_D_CaMKII * ca)  + (Spine * koffRA * camR_ca2_AD_CaMKII) + (Spine * koffRB * camR_ca2_BD_CaMKII) + (Spine * koffRC * camR_ca2_CD_CaMKII) 
  camR_ca2_AB_CaMKII' =  (Spine * konCaMKII * camR_ca2_AB * CaMKII) - (Spine * koffCaMKII * camR_ca2_AB_CaMKII)  + (Spine * kon * camR_ca1_A_CaMKII * ca) + (Spine * kon * camR_ca1_B_CaMKII * ca) - (Spine * koffRA * camR_ca2_AB_CaMKII)  - (Spine * koffRB * camR_ca2_AB_CaMKII)  - (Spine * kon * camR_ca2_AB_CaMKII * ca)  - (Spine * kon * camR_ca2_AB_CaMKII * ca)  + (Spine * koffRC * camR_ca3_ABC_CaMKII) + (Spine * koffRD * camR_ca3_ABD_CaMKII) 
  camR_ca2_AC_CaMKII' =  (Spine * konCaMKII * camR_ca2_AC * CaMKII) - (Spine * koffCaMKII * camR_ca2_AC_CaMKII)  + (Spine * kon * camR_ca1_A_CaMKII * ca) + (Spine * kon * camR_ca1_C_CaMKII * ca) - (Spine * koffRA * camR_ca2_AC_CaMKII)  - (Spine * koffRC * camR_ca2_AC_CaMKII)  - (Spine * kon * camR_ca2_AC_CaMKII * ca)  - (Spine * kon * camR_ca2_AC_CaMKII * ca)  + (Spine * koffRB * camR_ca3_ABC_CaMKII) + (Spine * koffRD * camR_ca3_ACD_CaMKII) 
  camR_ca2_AD_CaMKII' =  (Spine * konCaMKII * camR_ca2_AD * CaMKII) - (Spine * koffCaMKII * camR_ca2_AD_CaMKII)  + (Spine * kon * camR_ca1_A_CaMKII * ca) + (Spine * kon * camR_ca1_D_CaMKII * ca) - (Spine * koffRA * camR_ca2_AD_CaMKII)  - (Spine * koffRD * camR_ca2_AD_CaMKII)  - (Spine * kon * camR_ca2_AD_CaMKII * ca)  - (Spine * kon * camR_ca2_AD_CaMKII * ca)  + (Spine * koffRB * camR_ca3_ABD_CaMKII) + (Spine * koffRC * camR_ca3_ACD_CaMKII) 
  camR_ca2_BC_CaMKII' =  (Spine * konCaMKII * camR_ca2_BC * CaMKII) - (Spine * koffCaMKII * camR_ca2_BC_CaMKII)  + (Spine * kon * camR_ca1_B_CaMKII * ca) + (Spine * kon * camR_ca1_C_CaMKII * ca) - (Spine * koffRB * camR_ca2_BC_CaMKII)  - (Spine * koffRC * camR_ca2_BC_CaMKII)  - (Spine * kon * camR_ca2_BC_CaMKII * ca)  - (Spine * kon * camR_ca2_BC_CaMKII * ca)  + (Spine * koffRA * camR_ca3_ABC_CaMKII) + (Spine * koffRD * camR_ca3_BCD_CaMKII) 
  camR_ca2_BD_CaMKII' =  (Spine * konCaMKII * camR_ca2_BD * CaMKII) - (Spine * koffCaMKII * camR_ca2_BD_CaMKII)  + (Spine * kon * camR_ca1_B_CaMKII * ca) + (Spine * kon * camR_ca1_D_CaMKII * ca) - (Spine * koffRB * camR_ca2_BD_CaMKII)  - (Spine * koffRD * camR_ca2_BD_CaMKII)  - (Spine * kon * camR_ca2_BD_CaMKII * ca)  - (Spine * kon * camR_ca2_BD_CaMKII * ca)  + (Spine * koffRA * camR_ca3_ABD_CaMKII) + (Spine * koffRC * camR_ca3_BCD_CaMKII) 
  camR_ca2_CD_CaMKII' =  (Spine * konCaMKII * camR_ca2_CD * CaMKII) - (Spine * koffCaMKII * camR_ca2_CD_CaMKII)  + (Spine * kon * camR_ca1_C_CaMKII * ca) + (Spine * kon * camR_ca1_D_CaMKII * ca) - (Spine * koffRC * camR_ca2_CD_CaMKII)  - (Spine * koffRD * camR_ca2_CD_CaMKII)  - (Spine * kon * camR_ca2_CD_CaMKII * ca)  - (Spine * kon * camR_ca2_CD_CaMKII * ca)  + (Spine * koffRA * camR_ca3_ACD_CaMKII) + (Spine * koffRB * camR_ca3_BCD_CaMKII) 
  camR_ca3_ABC_CaMKII' =  (Spine * konCaMKII * camR_ca3_ABC * CaMKII) - (Spine * koffCaMKII * camR_ca3_ABC_CaMKII)  + (Spine * kon * camR_ca2_AB_CaMKII * ca) + (Spine * kon * camR_ca2_AC_CaMKII * ca) + (Spine * kon * camR_ca2_BC_CaMKII * ca) - (Spine * koffRC * camR_ca3_ABC_CaMKII)  - (Spine * koffRB * camR_ca3_ABC_CaMKII)  - (Spine * koffRA * camR_ca3_ABC_CaMKII)  - (Spine * kon * camR_ca3_ABC_CaMKII * ca)  + (Spine * koffRD * camR_ca4_ABCD_CaMKII) 
  camR_ca3_ABD_CaMKII' =  (Spine * konCaMKII * camR_ca3_ABD * CaMKII) - (Spine * koffCaMKII * camR_ca3_ABD_CaMKII)  + (Spine * kon * camR_ca2_AB_CaMKII * ca) + (Spine * kon * camR_ca2_AD_CaMKII * ca) + (Spine * kon * camR_ca2_BD_CaMKII * ca) - (Spine * koffRD * camR_ca3_ABD_CaMKII)  - (Spine * koffRB * camR_ca3_ABD_CaMKII)  - (Spine * koffRA * camR_ca3_ABD_CaMKII)  - (Spine * kon * camR_ca3_ABD_CaMKII * ca)  + (Spine * koffRC * camR_ca4_ABCD_CaMKII) 
  camR_ca3_ACD_CaMKII' =  (Spine * konCaMKII * camR_ca3_ACD * CaMKII) - (Spine * koffCaMKII * camR_ca3_ACD_CaMKII)  + (Spine * kon * camR_ca2_AC_CaMKII * ca) + (Spine * kon * camR_ca2_AD_CaMKII * ca) + (Spine * kon * camR_ca2_CD_CaMKII * ca) - (Spine * koffRD * camR_ca3_ACD_CaMKII)  - (Spine * koffRC * camR_ca3_ACD_CaMKII)  - (Spine * koffRA * camR_ca3_ACD_CaMKII)  - (Spine * kon * camR_ca3_ACD_CaMKII * ca)  + (Spine * koffRB * camR_ca4_ABCD_CaMKII) 
  camR_ca3_BCD_CaMKII' =  (Spine * konCaMKII * camR_ca3_BCD * CaMKII) - (Spine * koffCaMKII * camR_ca3_BCD_CaMKII)  + (Spine * kon * camR_ca2_BC_CaMKII * ca) + (Spine * kon * camR_ca2_BD_CaMKII * ca) + (Spine * kon * camR_ca2_CD_CaMKII * ca) - (Spine * koffRD * camR_ca3_BCD_CaMKII)  - (Spine * koffRC * camR_ca3_BCD_CaMKII)  - (Spine * koffRB * camR_ca3_BCD_CaMKII)  - (Spine * kon * camR_ca3_BCD_CaMKII * ca)  + (Spine * koffRA * camR_ca4_ABCD_CaMKII) 
  camR_ca4_ABCD_CaMKII' =  (Spine * konCaMKII * camR_ca4_ABCD * CaMKII) - (Spine * koffCaMKII * camR_ca4_ABCD_CaMKII)  + (Spine * kon * camR_ca3_BCD_CaMKII * ca) + (Spine * kon * camR_ca3_ACD_CaMKII * ca) + (Spine * kon * camR_ca3_ABD_CaMKII * ca) + (Spine * kon * camR_ca3_ABC_CaMKII * ca) - (Spine * koffRA * camR_ca4_ABCD_CaMKII)  - (Spine * koffRB * camR_ca4_ABCD_CaMKII)  - (Spine * koffRC * camR_ca4_ABCD_CaMKII)  - (Spine * koffRD * camR_ca4_ABCD_CaMKII)  
  PP2B' =  - (Spine * konPP2B * camR * PP2B)  - (Spine * konPP2B * camR_ca1_A * PP2B)  - (Spine * konPP2B * camR_ca1_B * PP2B)  - (Spine * konPP2B * camR_ca1_C * PP2B)  - (Spine * konPP2B * camR_ca1_D * PP2B)  - (Spine * konPP2B * camR_ca2_AB * PP2B)  - (Spine * konPP2B * camR_ca2_AC * PP2B)  - (Spine * konPP2B * camR_ca2_AD * PP2B)  - (Spine * konPP2B * camR_ca2_BC * PP2B)  - (Spine * konPP2B * camR_ca2_BD * PP2B)  - (Spine * konPP2B * camR_ca2_CD * PP2B)  - (Spine * konPP2B * camR_ca3_ABC * PP2B)  - (Spine * konPP2B * camR_ca3_ABD * PP2B)  - (Spine * konPP2B * camR_ca3_ACD * PP2B)  - (Spine * konPP2B * camR_ca3_BCD * PP2B)  - (Spine * konPP2B * camR_ca4_ABCD * PP2B)  + (Spine * koffPP2B * camR_PP2B) + (Spine * koffPP2B * camR_ca1_A_PP2B) + (Spine * koffPP2B * camR_ca1_B_PP2B) + (Spine * koffPP2B * camR_ca1_C_PP2B) + (Spine * koffPP2B * camR_ca1_D_PP2B) + (Spine * koffPP2B * camR_ca2_AB_PP2B) + (Spine * koffPP2B * camR_ca2_AC_PP2B) + (Spine * koffPP2B * camR_ca2_AD_PP2B) + (Spine * koffPP2B * camR_ca2_BC_PP2B) + (Spine * koffPP2B * camR_ca2_BD_PP2B) + (Spine * koffPP2B * camR_ca2_CD_PP2B) + (Spine * koffPP2B * camR_ca3_ABC_PP2B) + (Spine * koffPP2B * camR_ca3_ABD_PP2B) + (Spine * koffPP2B * camR_ca3_ACD_PP2B) + (Spine * koffPP2B * camR_ca3_BCD_PP2B) + (Spine * koffPP2B * camR_ca4_ABCD_PP2B) 
  camR_PP2B' =  (Spine * konPP2B * camR * PP2B) - (Spine * koffPP2B * camR_PP2B)  - (Spine * kon * camR_PP2B * ca)  - (Spine * kon * camR_PP2B * ca)  - (Spine * kon * camR_PP2B * ca)  - (Spine * kon * camR_PP2B * ca)  + (Spine * koffRA * camR_ca1_A_PP2B) + (Spine * koffRB * camR_ca1_B_PP2B) + (Spine * koffRC * camR_ca1_C_PP2B) + (Spine * koffRD * camR_ca1_D_PP2B) 
  camR_ca1_A_PP2B' =  (Spine * konPP2B * camR_ca1_A * PP2B) - (Spine * koffPP2B * camR_ca1_A_PP2B)  + (Spine * kon * camR_PP2B * ca) - (Spine * koffRA * camR_ca1_A_PP2B)  - (Spine * kon * camR_ca1_A_PP2B * ca)  - (Spine * kon * camR_ca1_A_PP2B * ca)  - (Spine * kon * camR_ca1_A_PP2B * ca)  + (Spine * koffRB * camR_ca2_AB_PP2B) + (Spine * koffRC * camR_ca2_AC_PP2B) + (Spine * koffRD * camR_ca2_AD_PP2B) 
  camR_ca1_B_PP2B' =  (Spine * konPP2B * camR_ca1_B * PP2B) - (Spine * koffPP2B * camR_ca1_B_PP2B)  + (Spine * kon * camR_PP2B * ca) - (Spine * koffRB * camR_ca1_B_PP2B)  - (Spine * kon * camR_ca1_B_PP2B * ca)  - (Spine * kon * camR_ca1_B_PP2B * ca)  - (Spine * kon * camR_ca1_B_PP2B * ca)  + (Spine * koffRA * camR_ca2_AB_PP2B) + (Spine * koffRC * camR_ca2_BC_PP2B) + (Spine * koffRD * camR_ca2_BD_PP2B) 
  camR_ca1_C_PP2B' =  (Spine * konPP2B * camR_ca1_C * PP2B) - (Spine * koffPP2B * camR_ca1_C_PP2B)  + (Spine * kon * camR_PP2B * ca) - (Spine * koffRC * camR_ca1_C_PP2B)  - (Spine * kon * camR_ca1_C_PP2B * ca)  - (Spine * kon * camR_ca1_C_PP2B * ca)  - (Spine * kon * camR_ca1_C_PP2B * ca)  + (Spine * koffRA * camR_ca2_AC_PP2B) + (Spine * koffRB * camR_ca2_BC_PP2B) + (Spine * koffRD * camR_ca2_CD_PP2B) 
  camR_ca1_D_PP2B' =  (Spine * konPP2B * camR_ca1_D * PP2B) - (Spine * koffPP2B * camR_ca1_D_PP2B)  + (Spine * kon * camR_PP2B * ca) - (Spine * koffRD * camR_ca1_D_PP2B)  - (Spine * kon * camR_ca1_D_PP2B * ca)  - (Spine * kon * camR_ca1_D_PP2B * ca)  - (Spine * kon * camR_ca1_D_PP2B * ca)  + (Spine * koffRA * camR_ca2_AD_PP2B) + (Spine * koffRB * camR_ca2_BD_PP2B) + (Spine * koffRC * camR_ca2_CD_PP2B) 
  camR_ca2_AB_PP2B' =  (Spine * konPP2B * camR_ca2_AB * PP2B) - (Spine * koffPP2B * camR_ca2_AB_PP2B)  + (Spine * kon * camR_ca1_A_PP2B * ca) + (Spine * kon * camR_ca1_B_PP2B * ca) - (Spine * koffRA * camR_ca2_AB_PP2B)  - (Spine * koffRB * camR_ca2_AB_PP2B)  - (Spine * kon * camR_ca2_AB_PP2B * ca)  - (Spine * kon * camR_ca2_AB_PP2B * ca)  + (Spine * koffRC * camR_ca3_ABC_PP2B) + (Spine * koffRD * camR_ca3_ABD_PP2B) 
  camR_ca2_AC_PP2B' =  (Spine * konPP2B * camR_ca2_AC * PP2B) - (Spine * koffPP2B * camR_ca2_AC_PP2B)  + (Spine * kon * camR_ca1_A_PP2B * ca) + (Spine * kon * camR_ca1_C_PP2B * ca) - (Spine * koffRA * camR_ca2_AC_PP2B)  - (Spine * koffRC * camR_ca2_AC_PP2B)  - (Spine * kon * camR_ca2_AC_PP2B * ca)  - (Spine * kon * camR_ca2_AC_PP2B * ca)  + (Spine * koffRB * camR_ca3_ABC_PP2B) + (Spine * koffRD * camR_ca3_ACD_PP2B) 
  camR_ca2_AD_PP2B' =  (Spine * konPP2B * camR_ca2_AD * PP2B) - (Spine * koffPP2B * camR_ca2_AD_PP2B)  + (Spine * kon * camR_ca1_A_PP2B * ca) + (Spine * kon * camR_ca1_D_PP2B * ca) - (Spine * koffRA * camR_ca2_AD_PP2B)  - (Spine * koffRD * camR_ca2_AD_PP2B)  - (Spine * kon * camR_ca2_AD_PP2B * ca)  - (Spine * kon * camR_ca2_AD_PP2B * ca)  + (Spine * koffRB * camR_ca3_ABD_PP2B) + (Spine * koffRC * camR_ca3_ACD_PP2B) 
  camR_ca2_BC_PP2B' =  (Spine * konPP2B * camR_ca2_BC * PP2B) - (Spine * koffPP2B * camR_ca2_BC_PP2B)  + (Spine * kon * camR_ca1_B_PP2B * ca) + (Spine * kon * camR_ca1_C_PP2B * ca) - (Spine * koffRB * camR_ca2_BC_PP2B)  - (Spine * koffRC * camR_ca2_BC_PP2B)  - (Spine * kon * camR_ca2_BC_PP2B * ca)  - (Spine * kon * camR_ca2_BC_PP2B * ca)  + (Spine * koffRA * camR_ca3_ABC_PP2B) + (Spine * koffRD * camR_ca3_BCD_PP2B) 
  camR_ca2_BD_PP2B' =  (Spine * konPP2B * camR_ca2_BD * PP2B) - (Spine * koffPP2B * camR_ca2_BD_PP2B)  + (Spine * kon * camR_ca1_B_PP2B * ca) + (Spine * kon * camR_ca1_D_PP2B * ca) - (Spine * koffRB * camR_ca2_BD_PP2B)  - (Spine * koffRD * camR_ca2_BD_PP2B)  - (Spine * kon * camR_ca2_BD_PP2B * ca)  - (Spine * kon * camR_ca2_BD_PP2B * ca)  + (Spine * koffRA * camR_ca3_ABD_PP2B) + (Spine * koffRC * camR_ca3_BCD_PP2B) 
  camR_ca2_CD_PP2B' =  (Spine * konPP2B * camR_ca2_CD * PP2B) - (Spine * koffPP2B * camR_ca2_CD_PP2B)  + (Spine * kon * camR_ca1_C_PP2B * ca) + (Spine * kon * camR_ca1_D_PP2B * ca) - (Spine * koffRC * camR_ca2_CD_PP2B)  - (Spine * koffRD * camR_ca2_CD_PP2B)  - (Spine * kon * camR_ca2_CD_PP2B * ca)  - (Spine * kon * camR_ca2_CD_PP2B * ca)  + (Spine * koffRA * camR_ca3_ACD_PP2B) + (Spine * koffRB * camR_ca3_BCD_PP2B) 
  camR_ca3_ABC_PP2B' =  (Spine * konPP2B * camR_ca3_ABC * PP2B) - (Spine * koffPP2B * camR_ca3_ABC_PP2B)  + (Spine * kon * camR_ca2_AB_PP2B * ca) + (Spine * kon * camR_ca2_AC_PP2B * ca) + (Spine * kon * camR_ca2_BC_PP2B * ca) - (Spine * koffRA * camR_ca3_ABC_PP2B)  - (Spine * koffRB * camR_ca3_ABC_PP2B)  - (Spine * koffRC * camR_ca3_ABC_PP2B)  - (Spine * kon * camR_ca3_ABC_PP2B * ca)  + (Spine * koffRD * camR_ca4_ABCD_PP2B) 
  camR_ca3_ABD_PP2B' =  (Spine * konPP2B * camR_ca3_ABD * PP2B) - (Spine * koffPP2B * camR_ca3_ABD_PP2B)  + (Spine * kon * camR_ca2_AB_PP2B * ca) + (Spine * kon * camR_ca2_AD_PP2B * ca) + (Spine * kon * camR_ca2_BD_PP2B * ca) - (Spine * koffRA * camR_ca3_ABD_PP2B)  - (Spine * koffRB * camR_ca3_ABD_PP2B)  - (Spine * koffRD * camR_ca3_ABD_PP2B)  - (Spine * kon * camR_ca3_ABD_PP2B * ca)  + (Spine * koffRC * camR_ca4_ABCD_PP2B) 
  camR_ca3_ACD_PP2B' =  (Spine * konPP2B * camR_ca3_ACD * PP2B) - (Spine * koffPP2B * camR_ca3_ACD_PP2B)  + (Spine * kon * camR_ca2_AC_PP2B * ca) + (Spine * kon * camR_ca2_AD_PP2B * ca) + (Spine * kon * camR_ca2_CD_PP2B * ca) - (Spine * koffRA * camR_ca3_ACD_PP2B)  - (Spine * koffRC * camR_ca3_ACD_PP2B)  - (Spine * koffRD * camR_ca3_ACD_PP2B)  - (Spine * kon * camR_ca3_ACD_PP2B * ca)  + (Spine * koffRB * camR_ca4_ABCD_PP2B) 
  camR_ca3_BCD_PP2B' =  (Spine * konPP2B * camR_ca3_BCD * PP2B) - (Spine * koffPP2B * camR_ca3_BCD_PP2B)  + (Spine * kon * camR_ca2_BC_PP2B * ca) + (Spine * kon * camR_ca2_BD_PP2B * ca) + (Spine * kon * camR_ca2_CD_PP2B * ca) - (Spine * koffRB * camR_ca3_BCD_PP2B)  - (Spine * koffRC * camR_ca3_BCD_PP2B)  - (Spine * koffRD * camR_ca3_BCD_PP2B)  - (Spine * kon * camR_ca3_BCD_PP2B * ca)  + (Spine * koffRA * camR_ca4_ABCD_PP2B) 
  camR_ca4_ABCD_PP2B' =  (Spine * konPP2B * camR_ca4_ABCD * PP2B) - (Spine * koffPP2B * camR_ca4_ABCD_PP2B)  + (Spine * kon * camR_ca3_ABC_PP2B * ca) + (Spine * kon * camR_ca3_ABD_PP2B * ca) + (Spine * kon * camR_ca3_ACD_PP2B * ca) + (Spine * kon * camR_ca3_BCD_PP2B * ca) - (Spine * koffRA * camR_ca4_ABCD_PP2B)  - (Spine * koffRB * camR_ca4_ABCD_PP2B)  - (Spine * koffRC * camR_ca4_ABCD_PP2B)  - (Spine * koffRD * camR_ca4_ABCD_PP2B)  
}
