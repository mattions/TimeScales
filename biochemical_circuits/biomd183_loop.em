@{MAIN_STEPPER='DE1'}
@{MAIN_PROCESS='MassActionFluxProcess'}
@{HYBRID_STEPPER='DE1'}
@{HYBRID_PROCESS='MassActionFluxProcess'}
Stepper ODEStepper( DE1 )
{
	AbsoluteEpsilon	0.1;
	StateToleranceFactor	1.0;
	MinStepInterval	2e-300;
	RelativeEpsilon	0.1;
	Tolerance	1e-06;
	StepInterval	1e-08;
	DerivativeToleranceFactor	1.0;
	MaxStepInterval	1.0;
	IsEpsilonChecked	0;
	AbsoluteToleranceFactor	1.0;
}
Stepper PassiveStepper( Passive )
{
	#no property
}
@{cA=0.00396}
@{cB=0.00396}
@{cC=0.00396}
@{cD=0.00396}
@{L=20670.0}
@{KRA=8.32e-06}
@{KRB=1.66e-08}
@{KRC=1.74e-05}
@{KRD=1.45e-08}
@{kon=1000000.0}
@{koffRA=KRA*kon}
@{koffRB=KRB*kon}
@{koffRC=KRC*kon}
@{koffRD=KRD*kon}
@{koffTA=koffRA/cA}
@{koffTB=koffRB/cB}
@{koffTC=koffRC/cC}
@{koffTD=koffRD/cD}
@{kTR=48.379294}
@{kRT=kTR*L}
@{konCaMKII=3200000.0}
@{koffCaMKII=0.343}
@{koffCaMKIIp=0.001}
@{autoCaMKIIp=6.3}
@{konPP2B=4.6e7}
@{koffPP2B=0.4}
@{konD_PKA=5.6e6}
@{koffD_PKA=10.8}
@{kcatD_PKA=2.7}
@{konDp_PP2B=4.1e6}
@{koffDp_PP2B=6.4}
@{kcatDp_PP2B=0.2}
@{konPP1a_Dp=4e6}
@{koffPP1a_Dp=0.4}
@{konCaMKIIp_PP1aDp=0.0}
@{koffCaMKIIp_PP1aDp=0.0}
@{konCaMKIIp_PP1a=3e6}
@{koffCaMKIIp_PP1a=0.5}
@{kcatCaMKIIp_PP1a=2.0}
@{konCaMKIIpPP1a_Dp=0.0}
@{koffCaMKIIpPP1a_Dp=0.0}
System System( / )
{
	StepperID	@(MAIN_STEPPER);
	Variable Variable(SIZE)
	{
		Value	1;
	}
}
System System( /Spine )
{
	StepperID	@(MAIN_STEPPER);
	Variable Variable(SIZE)
	{
		Value	1e-15;
	}
##1.45e-9
	Variable Variable( camR )
	{
		MolarConc	1.45e-9;
		Value	@(1e-15*6.02e23*1.45e-9);
	}
##3e-5
	Variable Variable( camT )
	{
		MolarConc	3e-5;
		Value	@(1e-15*6.02e23*3e-5);
	}
	Variable Variable( ca )
	{
		MolarConc	1e-8;
		Value	@(1e-15*6.02e23*1e-8);
	}
	Variable Variable( CaMKII )
	{
		MolarConc	70e-6;
		Value	@(1e-15*6.02e23*70e-6);
	}
	Variable Variable( PP2B )
	{
		MolarConc	1.6e-6;
		Value	@(1e-15*6.02e23*1.6e-6);
	}
##3e-6#I1 or DARPP-32
	Variable Variable( D )
	{
		MolarConc	3e-6;
		Value	@(1e-15*6.02e23*3e-6);
	}
##basal PKA from my MAPK model, I calculated(1.2e-8)
	Variable Variable( PKA )
	{
		MolarConc	1.2e-8;
		Value	@(1e-15*6.02e23*1.2e-8);
	}
##2e-6
	Variable Variable( PP1a )
	{
		MolarConc	2.0e-6;
		Value	@(1e-15*6.02e23*2.0e-6);
	}
##80e-6
	Variable Variable( CBPfast )
	{
		MolarConc	80e-6;
		Value	@(1e-15*6.02e23*80e-6);
	}
##80e-6
	Variable Variable( CBPmedia )
	{
		MolarConc	80e-6;
		Value	@(1e-15*6.02e23*80e-6);
	}
##20e-6
	Variable Variable( CBPslow )
	{
		MolarConc	20e-6;
		Value	@(1e-15*6.02e23*20e-6);
	}
##20e-6
	Variable Variable( CBPvslow )
	{
		MolarConc	20e-6;
		Value	@(1e-15*6.02e23*20e-6);
	}
##3e-5
	Variable Variable( cam_total )
	{
		MolarConc	3.0e-5;
		Value	@(1e-15*6.02e23*3.0e-5);
	}
	Variable Variable( totalCaMKII )
	{
		MolarConc	70e-6;
		Value	@(1e-15*6.02e23*70e-6);
	}
	Variable Variable( totalPP2B )
	{
		MolarConc	1.6e-06;
		Value	@(1e-15*6.02e23*1.6e-06);
	}
##1.45e-9
	Variable Variable( totalcamR )
	{
		MolarConc	1.45e-9;
		Value	@(1e-15*6.02e23*1.45e-9);
	}
##3e-5
	Variable Variable( totalcamT )
	{
		MolarConc	3e-5;
		Value	@(1e-15*6.02e23*3e-5);
	}
##3e-6
	Variable Variable( totD )
	{
		MolarConc	3e-6;
		Value	@(1e-15*6.02e23*3e-6);
	}
##2e-6
	Variable Variable( totPP1 )
	{
		MolarConc	2e-6;
		Value	@(1e-15*6.02e23*2e-6);
	}
## the maximum PKA will be putted into the system.
	Variable Variable( totPKA )
	{
		MolarConc	1.2e-6;
		Value	@(1e-15*6.02e23*1.2e-6);
	}
##80e-6
	Variable Variable( CBPfasttotal )
	{
		MolarConc	80e-6;
		Value	@(1e-15*6.02e23*80e-6);
	}
##80e-6
	Variable Variable( CBPmediatotal )
	{
		MolarConc	80e-6;
		Value	@(1e-15*6.02e23*80e-6);
	}
##20e-6
	Variable Variable( CBPslowtotal )
	{
		MolarConc	20e-6;
		Value	@(1e-15*6.02e23*20e-6);
	}
##20e-6
	Variable Variable( CBPvslowtotal )
	{
		MolarConc	20e-6;
		Value	@(1e-15*6.02e23*20e-6);
	}
	Variable Variable( CBPfastca )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CBPmediaca )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CBPslowca )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CBPvslowca )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_A )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_C )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_D )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AB )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AC )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BC )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_CD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABC )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ACD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_BCD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca4_ABCD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca1_A )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca1_B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca1_C )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca1_D )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca2_AB )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca2_AC )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca2_AD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca2_BC )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca2_BD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca2_CD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca3_ABC )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca3_ABD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca3_ACD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca3_BCD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camT_ca4_ABCD )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_A_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_B_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_C_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_D_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AB_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AC_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AD_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BC_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BD_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_CD_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABC_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABD_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ACD_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_BCD_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca4_ABCD_CaMKII )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_A_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_B_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_C_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_D_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AB_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_CD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ACD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_BCD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca4_ABCD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_A_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_B_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_C_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_D_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AB_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AC_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AD_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BC_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BD_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_CD_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABC_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABD_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ACD_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_BCD_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca4_ABCD_CaMKIIp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
##I1 or DARPP-32 phosphorylated/activated format
	Variable Variable( Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( D_PKA )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca1_A_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca1_B_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca1_C_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca1_D_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca2_AB_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca2_AC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca2_AD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca2_BC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca2_BD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca2_CD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca3_ABC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca3_ABD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca3_ACD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca3_BCD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( Dp_camR_ca4_ABCD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca1_A_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca1_B_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca1_C_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca1_D_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca2_AB_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca2_AC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca2_AD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca2_BC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca2_BD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca2_CD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca3_ABC_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca3_ABD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca3_ACD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca3_BCD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PP1a_Dp_camR_ca4_ABCD_PP2B )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_A_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_B_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_C_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_D_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AB_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AC_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AD_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BC_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BD_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_CD_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABC_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABD_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ACD_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_BCD_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca4_ABCD_CaMKIIp_PP1a )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_A_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_B_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_C_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca1_D_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AB_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AC_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_AD_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BC_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_BD_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca2_CD_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABC_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ABD_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_ACD_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca3_BCD_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camR_ca4_ABCD_CaMKIIp_PP1a_Dp )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( free_cam_ca4_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca4_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca4_ratio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca4_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca4_totalRatio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_camR_ca3_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_camT_ca3_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_cam_ca3_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( CaMKII_camR_ca3 )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( PP2B_camR_ca3 )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca3_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca3_ratio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca3_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( cam_ca3_totalRatio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_camR_ca2_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_camT_ca2_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_cam_ca2_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( CaMKII_camR_ca2 )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( PP2B_camR_ca2 )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca2_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca2_ratio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca2_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca2_totalRatio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_camR_ca1_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_camT_ca1_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_cam_ca1_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( CaMKII_camR_ca1 )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( PP2B_camR_ca1 )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca1_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca1_ratio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca1_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca1_totalRatio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( free_cam_ca0_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca0_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_ca0_ratio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca0_total )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( cam_ca0_totalRatio )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( total_CaMKII_bound )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( total_CaMKII_active )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( CaMKIIbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( total_CaMKIIp )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( CaMKIIpbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( total_PP2B_bound )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( PP2Bbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camR_unbound )
	{
		MolarConc	1.45e-9;
		Value	@(1e-15*6.02e23*1.45e-9);
	}
	Variable Variable( Rbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( moles_bound_ca_per_moles_cam )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( epsilon )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( ybar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( ybar_div__1_minus_ybar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( totDp )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( Dpbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( totPP1a )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( PP1abar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( PKAinmodel )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( PKAbar )
	{
		MolarConc	0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( camCaMKIIbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0.0);
	}
	Variable Variable( camPP2Bbar )
	{
		MolarConc	0.001;
		Value	@(1e-15*6.02e23*0.001);
	}
	Variable Variable( CBPfastbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CBPmediabar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CBPslowbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( CBPvslowbar )
	{
		MolarConc	0.0;
		Value	@(1e-15*6.02e23*0);
	}
	Variable Variable( AMPAR_P )
	{
		Name	AMPAR_P;
		Value	0.0;
	}
	Variable Variable( AMPAR )
	{
		Name	AMPAR;
		Value	0.0;
	}	
	
	
	
	
	
	Process ExpressionFluxProcess( ca_pump )
	{
		vmax	4e-3;
		km	1e-6;
		StepperID	@(MAIN_STEPPER);
		Expression	"(vmax*(S0.MolarConc/(S0.MolarConc+km)))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:ca -1];
	}
	Process ExpressionFluxProcess( ca_leak )
	{
		vmax	4e-3;
		initial	1e-8;
		km	1e-6;
		StepperID	@(MAIN_STEPPER);
		Expression	"(vmax*(initial/(initial+km)))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [P0 Variable:/Spine:ca 1];
	}
	Process ConstantFluxProcess( ca_in )
	{
		k	0;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [P0 Variable:/Spine:ca 1];
	}
	Process ExpressionFluxProcess( PKA_pump )
	{
		vmax	0.0;
		km	1e-6;
		StepperID	@(MAIN_STEPPER);
		Expression	"(vmax*(S0.MolarConc/(S0.MolarConc+km)))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:PKA -1];
	}
	Process ExpressionFluxProcess( PKA_leak )
	{
		vmax	0.0;
		initial	1.2e-8;
		km	1e-6;
		StepperID	@(MAIN_STEPPER);
		Expression	"(vmax*(initial/(initial+km)))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [P0 Variable:/Spine:PKA 1];
	}
	Process @(MAIN_PROCESS)( CBPfast_ca_on )
	{
		k	1e9;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPfast -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:CBPfastca 1];
	}
	Process @(MAIN_PROCESS)( CBPfast_ca_off )
	{
		k	1e3;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPfastca -1] [P0 Variable:/Spine:CBPfast 1] [P1 Variable:/Spine:ca 1];
	}
	Process @(MAIN_PROCESS)( CBPmedia_ca_on )
	{
		k	1e8;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPmedia -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:CBPmediaca 1];
	}
	Process @(MAIN_PROCESS)( CBPmedia_ca_off )
	{
		k	1e2;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPmediaca -1] [P0 Variable:/Spine:CBPmedia 1] [P1 Variable:/Spine:ca 1];
	}
	Process @(MAIN_PROCESS)( CBPslow_ca_on )
	{
		k	1e7;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPslow -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:CBPslowca 1];
	}
	Process @(MAIN_PROCESS)( CBPslow_ca_off )
	{
		k	10;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPslowca -1] [P0 Variable:/Spine:CBPslow 1] [P1 Variable:/Spine:ca 1];
	}
	Process @(MAIN_PROCESS)( CBPvslow_ca_on )
	{
		k	1e6;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPvslow -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:CBPvslowca 1];
	}
	Process @(MAIN_PROCESS)( CBPvslow_ca_off )
	{
		k	1;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CBPvslowca -1] [P0 Variable:/Spine:CBPvslow 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR site A
	Process @(MAIN_PROCESS)( reaction_0 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_A 1];
	}
##Ca binding to camR site B
	Process @(MAIN_PROCESS)( reaction_1 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_B 1];
	}
##Ca binding to camR site C
	Process @(MAIN_PROCESS)( reaction_2 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_C 1];
	}
##Ca binding to camR site D
	Process @(MAIN_PROCESS)( reaction_3 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_D 1];
	}
##Ca dissociating from camR_ca1_A site A
	Process @(MAIN_PROCESS)( reaction_4 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [P0 Variable:/Spine:camR 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca1_B site B
	Process @(MAIN_PROCESS)( reaction_5 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [P0 Variable:/Spine:camR 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca1_C site C
	Process @(MAIN_PROCESS)( reaction_6 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [P0 Variable:/Spine:camR 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca1_D site D
	Process @(MAIN_PROCESS)( reaction_7 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [P0 Variable:/Spine:camR 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca1_A site B
	Process @(MAIN_PROCESS)( reaction_8 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB 1];
	}
##Ca binding to camR_ca1_A site C
	Process @(MAIN_PROCESS)( reaction_9 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC 1];
	}
##Ca binding to camR_ca1_A site D
	Process @(MAIN_PROCESS)( reaction_10 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD 1];
	}
##Ca binding to camR_ca1_B site A
	Process @(MAIN_PROCESS)( reaction_11 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB 1];
	}
##Ca binding to camR_ca1_B site C
	Process @(MAIN_PROCESS)( reaction_12 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC 1];
	}
##Ca binding to camR_ca1_B site D
	Process @(MAIN_PROCESS)( reaction_13 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD 1];
	}
##Ca binding to camR_ca1_C site A
	Process @(MAIN_PROCESS)( reaction_14 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC 1];
	}
##Ca binding to camR_ca1_C site B
	Process @(MAIN_PROCESS)( reaction_15 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC 1];
	}
##Ca binding to camR_ca1_C site D
	Process @(MAIN_PROCESS)( reaction_16 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD 1];
	}
##Ca binding to camR_ca1_D site A
	Process @(MAIN_PROCESS)( reaction_17 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD 1];
	}
##Ca binding to camR_ca1_D site B
	Process @(MAIN_PROCESS)( reaction_18 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD 1];
	}
##Ca binding to camR_ca1_D site C
	Process @(MAIN_PROCESS)( reaction_19 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD 1];
	}
##Ca dissociating from camR_ca2_AB site B
	Process @(MAIN_PROCESS)( reaction_20 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [P0 Variable:/Spine:camR_ca1_A 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AC site C
	Process @(MAIN_PROCESS)( reaction_21 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC -1] [P0 Variable:/Spine:camR_ca1_A 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AD site D
	Process @(MAIN_PROCESS)( reaction_22 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [P0 Variable:/Spine:camR_ca1_A 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AB site A
	Process @(MAIN_PROCESS)( reaction_23 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [P0 Variable:/Spine:camR_ca1_B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BC site C
	Process @(MAIN_PROCESS)( reaction_24 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [P0 Variable:/Spine:camR_ca1_B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BD site D
	Process @(MAIN_PROCESS)( reaction_25 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [P0 Variable:/Spine:camR_ca1_B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AC site A
	Process @(MAIN_PROCESS)( reaction_26 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC -1] [P0 Variable:/Spine:camR_ca1_C 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BC site B
	Process @(MAIN_PROCESS)( reaction_27 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [P0 Variable:/Spine:camR_ca1_C 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_CD site D
	Process @(MAIN_PROCESS)( reaction_28 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [P0 Variable:/Spine:camR_ca1_C 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AD site A
	Process @(MAIN_PROCESS)( reaction_29 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [P0 Variable:/Spine:camR_ca1_D 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BD site B
	Process @(MAIN_PROCESS)( reaction_30 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [P0 Variable:/Spine:camR_ca1_D 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_CD site C
	Process @(MAIN_PROCESS)( reaction_31 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [P0 Variable:/Spine:camR_ca1_D 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca2_AB site C
	Process @(MAIN_PROCESS)( reaction_32 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC 1];
	}
##Ca binding to camR_ca2_AB site D
	Process @(MAIN_PROCESS)( reaction_33 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD 1];
	}
##Ca binding to camR_ca2_AC site B
	Process @(MAIN_PROCESS)( reaction_34 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC 1];
	}
##Ca binding to camR_ca2_AC site D
	Process @(MAIN_PROCESS)( reaction_35 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD 1];
	}
##Ca binding to camR_ca2_AD site B
	Process @(MAIN_PROCESS)( reaction_36 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD 1];
	}
##Ca binding to camR_ca2_AD site C
	Process @(MAIN_PROCESS)( reaction_37 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD 1];
	}
##Ca binding to camR_ca2_BC site A
	Process @(MAIN_PROCESS)( reaction_38 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC 1];
	}
##Ca binding to camR_ca2_BC site D
	Process @(MAIN_PROCESS)( reaction_39 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD 1];
	}
##Ca binding to camR_ca2_BD site A
	Process @(MAIN_PROCESS)( reaction_40 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD 1];
	}
##Ca binding to camR_ca2_BD site C
	Process @(MAIN_PROCESS)( reaction_41 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD 1];
	}
##Ca binding to camR_ca2_CD site A
	Process @(MAIN_PROCESS)( reaction_42 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD 1];
	}
##Ca binding to camR_ca2_CD site B
	Process @(MAIN_PROCESS)( reaction_43 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD 1];
	}
##Ca dissociating from camR_ca3_ABC site A
	Process @(MAIN_PROCESS)( reaction_44 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [P0 Variable:/Spine:camR_ca2_BC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ABC site B
	Process @(MAIN_PROCESS)( reaction_45 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [P0 Variable:/Spine:camR_ca2_AC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ABC site C
	Process @(MAIN_PROCESS)( reaction_46 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [P0 Variable:/Spine:camR_ca2_AB 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ABD site A
	Process @(MAIN_PROCESS)( reaction_47 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [P0 Variable:/Spine:camR_ca2_BD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ABD site B
	Process @(MAIN_PROCESS)( reaction_48 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [P0 Variable:/Spine:camR_ca2_AD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ABD site D
	Process @(MAIN_PROCESS)( reaction_49 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [P0 Variable:/Spine:camR_ca2_AB 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ACD site A
	Process @(MAIN_PROCESS)( reaction_50 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [P0 Variable:/Spine:camR_ca2_CD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ACD site C
	Process @(MAIN_PROCESS)( reaction_51 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [P0 Variable:/Spine:camR_ca2_AD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_ACD site D
	Process @(MAIN_PROCESS)( reaction_52 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [P0 Variable:/Spine:camR_ca2_AC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_BCD site B
	Process @(MAIN_PROCESS)( reaction_53 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [P0 Variable:/Spine:camR_ca2_CD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_BCD site C
	Process @(MAIN_PROCESS)( reaction_54 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [P0 Variable:/Spine:camR_ca2_BD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca3_BCD site D
	Process @(MAIN_PROCESS)( reaction_55 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [P0 Variable:/Spine:camR_ca2_BC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca3_ABC site D
	Process @(MAIN_PROCESS)( reaction_56 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD 1];
	}
##Ca binding to camR_ca3_ABD site C
	Process @(MAIN_PROCESS)( reaction_57 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD 1];
	}
##Ca binding to camR_ca3_ACD site B
	Process @(MAIN_PROCESS)( reaction_58 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD 1];
	}
##Ca binding to camR_ca3_BCD site A
	Process @(MAIN_PROCESS)( reaction_59 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD 1];
	}
##Ca dissociating from camR_ca4_ABCD site D
	Process @(MAIN_PROCESS)( reaction_60 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [P0 Variable:/Spine:camR_ca3_ABC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca4_ABCD site C
	Process @(MAIN_PROCESS)( reaction_61 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [P0 Variable:/Spine:camR_ca3_ABD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca4_ABCD site B
	Process @(MAIN_PROCESS)( reaction_62 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [P0 Variable:/Spine:camR_ca3_ACD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca4_ABCD site A
	Process @(MAIN_PROCESS)( reaction_63 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [P0 Variable:/Spine:camR_ca3_BCD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camT site A
	Process @(MAIN_PROCESS)( reaction_64 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca1_A 1];
	}
##Ca binding to camT site B
	Process @(MAIN_PROCESS)( reaction_65 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca1_B 1];
	}
##Ca binding to camT site C
	Process @(MAIN_PROCESS)( reaction_66 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca1_C 1];
	}
##Ca binding to camT site D
	Process @(MAIN_PROCESS)( reaction_67 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca1_D 1];
	}
##Ca dissociating from camT_ca1_A site A
	Process @(MAIN_PROCESS)( reaction_68 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_A -1] [P0 Variable:/Spine:camT 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca1_B site B
	Process @(MAIN_PROCESS)( reaction_69 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_B -1] [P0 Variable:/Spine:camT 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca1_C site C
	Process @(MAIN_PROCESS)( reaction_70 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_C -1] [P0 Variable:/Spine:camT 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca1_D site D
	Process @(MAIN_PROCESS)( reaction_71 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_D -1] [P0 Variable:/Spine:camT 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camT_ca1_A site B
	Process @(MAIN_PROCESS)( reaction_72 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_A -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_AB 1];
	}
##Ca binding to camT_ca1_A site C
	Process @(MAIN_PROCESS)( reaction_73 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_A -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_AC 1];
	}
##Ca binding to camT_ca1_A site D
	Process @(MAIN_PROCESS)( reaction_74 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_A -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_AD 1];
	}
##Ca binding to camT_ca1_B site A
	Process @(MAIN_PROCESS)( reaction_75 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_AB 1];
	}
##Ca binding to camT_ca1_B site C
	Process @(MAIN_PROCESS)( reaction_76 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_BC 1];
	}
##Ca binding to camT_ca1_B site D
	Process @(MAIN_PROCESS)( reaction_77 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_BD 1];
	}
##Ca binding to camT_ca1_C site A
	Process @(MAIN_PROCESS)( reaction_78 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_C -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_AC 1];
	}
##Ca binding to camT_ca1_C site B
	Process @(MAIN_PROCESS)( reaction_79 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_C -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_BC 1];
	}
##Ca binding to camT_ca1_C site D
	Process @(MAIN_PROCESS)( reaction_80 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_C -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_CD 1];
	}
##Ca binding to camT_ca1_D site A
	Process @(MAIN_PROCESS)( reaction_81 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_D -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_AD 1];
	}
##Ca binding to camT_ca1_D site B
	Process @(MAIN_PROCESS)( reaction_82 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_D -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_BD 1];
	}
##Ca binding to camT_ca1_D site C
	Process @(MAIN_PROCESS)( reaction_83 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_D -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca2_CD 1];
	}
##Ca dissociating from camT_ca2_AB site A
	Process @(MAIN_PROCESS)( reaction_84 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AB -1] [P0 Variable:/Spine:camT_ca1_B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_AB site B
	Process @(MAIN_PROCESS)( reaction_85 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AB -1] [P0 Variable:/Spine:camT_ca1_A 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_AC site A
	Process @(MAIN_PROCESS)( reaction_86 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AC -1] [P0 Variable:/Spine:camT_ca1_C 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_AC site C
	Process @(MAIN_PROCESS)( reaction_87 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AC -1] [P0 Variable:/Spine:camT_ca1_A 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_AD site A
	Process @(MAIN_PROCESS)( reaction_88 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AD -1] [P0 Variable:/Spine:camT_ca1_D 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_AD site D
	Process @(MAIN_PROCESS)( reaction_89 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AD -1] [P0 Variable:/Spine:camT_ca1_A 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_BC site B
	Process @(MAIN_PROCESS)( reaction_90 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BC -1] [P0 Variable:/Spine:camT_ca1_C 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_BC site C
	Process @(MAIN_PROCESS)( reaction_91 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BC -1] [P0 Variable:/Spine:camT_ca1_B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_BD site B
	Process @(MAIN_PROCESS)( reaction_92 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BD -1] [P0 Variable:/Spine:camT_ca1_D 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_BD site D
	Process @(MAIN_PROCESS)( reaction_93 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BD -1] [P0 Variable:/Spine:camT_ca1_B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_CD site C
	Process @(MAIN_PROCESS)( reaction_94 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_CD -1] [P0 Variable:/Spine:camT_ca1_D 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca2_CD site D
	Process @(MAIN_PROCESS)( reaction_95 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_CD -1] [P0 Variable:/Spine:camT_ca1_C 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camT_ca2_AB site C
	Process @(MAIN_PROCESS)( reaction_96 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AB -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ABC 1];
	}
##Ca binding to camT_ca2_AB site D
	Process @(MAIN_PROCESS)( reaction_97 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AB -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ABD 1];
	}
##Ca binding to camT_ca2_AC site B
	Process @(MAIN_PROCESS)( reaction_98 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ABC 1];
	}
##Ca binding to camT_ca2_AC site D
	Process @(MAIN_PROCESS)( reaction_99 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ACD 1];
	}
##Ca binding to camT_ca2_AD site B
	Process @(MAIN_PROCESS)( reaction_100 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ABD 1];
	}
##Ca binding to camT_ca2_AD site C
	Process @(MAIN_PROCESS)( reaction_101 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ACD 1];
	}
##Ca binding to camT_ca2_BC site A
	Process @(MAIN_PROCESS)( reaction_102 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ABC 1];
	}
##Ca binding to camT_ca2_BC site D
	Process @(MAIN_PROCESS)( reaction_103 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_BCD 1];
	}
##Ca binding to camT_ca2_BD site A
	Process @(MAIN_PROCESS)( reaction_104 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ABD 1];
	}
##Ca binding to camT_ca2_BD site C
	Process @(MAIN_PROCESS)( reaction_105 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_BCD 1];
	}
##Ca binding to camT_ca2_CD site A
	Process @(MAIN_PROCESS)( reaction_106 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_CD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_ACD 1];
	}
##Ca binding to camT_ca2_CD site B
	Process @(MAIN_PROCESS)( reaction_107 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_CD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca3_BCD 1];
	}
##Ca dissociating from camT_ca3_ABC site B
	Process @(MAIN_PROCESS)( reaction_108 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABC -1] [P0 Variable:/Spine:camT_ca2_AC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ABC site A
	Process @(MAIN_PROCESS)( reaction_109 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABC -1] [P0 Variable:/Spine:camT_ca2_BC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ABD site D
	Process @(MAIN_PROCESS)( reaction_110 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABD -1] [P0 Variable:/Spine:camT_ca2_AB 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ABD site B
	Process @(MAIN_PROCESS)( reaction_111 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABD -1] [P0 Variable:/Spine:camT_ca2_AD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ABD site A
	Process @(MAIN_PROCESS)( reaction_112 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABD -1] [P0 Variable:/Spine:camT_ca2_BD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ACD site D
	Process @(MAIN_PROCESS)( reaction_113 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ACD -1] [P0 Variable:/Spine:camT_ca2_AC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ACD site C
	Process @(MAIN_PROCESS)( reaction_114 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ACD -1] [P0 Variable:/Spine:camT_ca2_AD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ACD site A
	Process @(MAIN_PROCESS)( reaction_115 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ACD -1] [P0 Variable:/Spine:camT_ca2_CD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_BCD site D
	Process @(MAIN_PROCESS)( reaction_116 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_BCD -1] [P0 Variable:/Spine:camT_ca2_BC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_BCD site C
	Process @(MAIN_PROCESS)( reaction_117 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_BCD -1] [P0 Variable:/Spine:camT_ca2_BD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_BCD site B
	Process @(MAIN_PROCESS)( reaction_118 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_BCD -1] [P0 Variable:/Spine:camT_ca2_CD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camT_ca3_ABC site D
	Process @(MAIN_PROCESS)( reaction_119 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABC -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca4_ABCD 1];
	}
##Ca binding to camT_ca3_ABD site C
	Process @(MAIN_PROCESS)( reaction_120 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca4_ABCD 1];
	}
##Ca binding to camT_ca3_ACD site B
	Process @(MAIN_PROCESS)( reaction_121 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ACD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca4_ABCD 1];
	}
##Ca binding to camT_ca3_BCD site A
	Process @(MAIN_PROCESS)( reaction_122 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_BCD -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camT_ca4_ABCD 1];
	}
##Ca dissociating from camT_ca4_ABCD site D
	Process @(MAIN_PROCESS)( reaction_123 )
	{
		k	@koffTD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca4_ABCD -1] [P0 Variable:/Spine:camT_ca3_ABC 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca4_ABCD site C
	Process @(MAIN_PROCESS)( reaction_124 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca4_ABCD -1] [P0 Variable:/Spine:camT_ca3_ABD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca4_ABCD site B
	Process @(MAIN_PROCESS)( reaction_125 )
	{
		k	@koffTB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca4_ABCD -1] [P0 Variable:/Spine:camT_ca3_ACD 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca4_ABCD site A
	Process @(MAIN_PROCESS)( reaction_126 )
	{
		k	@koffTA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca4_ABCD -1] [P0 Variable:/Spine:camT_ca3_BCD 1] [P1 Variable:/Spine:ca 1];
	}
##Transition camR to camT
	Process @(MAIN_PROCESS)( reaction_127 )
	{
		k	@kRT;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [P0 Variable:/Spine:camT 1];
	}
##Transition camT to camR
	Process @(MAIN_PROCESS)( reaction_128 )
	{
		k	@kTR;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT -1] [P0 Variable:/Spine:camR 1];
	}
##Transition camR_ca1_A to camT_ca1_A
	Process ExpressionFluxProcess( reaction_129 )
	{
		kRT	@kRT;
		cA	@cA;
		StepperID	@(MAIN_STEPPER);
		Expression	"S0.MolarConc*kRT*pow(cA,1.0/2.0)*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [P0 Variable:/Spine:camT_ca1_A 1];
	}
##Transition camR_ca1_B to camT_ca1_B
	Process ExpressionFluxProcess( reaction_130 )
	{
		kRT	@kRT;
		cB	@cB;
		StepperID	@(MAIN_STEPPER);
		Expression	"S0.MolarConc*kRT*pow(cB,1.0/2.0)*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [P0 Variable:/Spine:camT_ca1_B 1];
	}
##Transition camR_ca1_C to camT_ca1_C
	Process ExpressionFluxProcess( reaction_131 )
	{
		kRT	@kRT;
		cC	@cC;
		StepperID	@(MAIN_STEPPER);
		Expression	"S0.MolarConc*kRT*pow(cC,1.0/2.0)*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [P0 Variable:/Spine:camT_ca1_C 1];
	}
##Transition camR_ca1_D to camT_ca1_D
	Process ExpressionFluxProcess( reaction_132 )
	{
		kRT	@kRT;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"S0.MolarConc*kRT*pow(cD,1.0/2.0)*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [P0 Variable:/Spine:camT_ca1_D 1];
	}
##Transition camT_ca1_A to camR_ca1_A
	Process ExpressionFluxProcess( reaction_133 )
	{
		kTR	@kTR;
		cA	@cA;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow(cA,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_A -1] [P0 Variable:/Spine:camR_ca1_A 1];
	}
##Transition camT_ca1_B to camR_ca1_B
	Process ExpressionFluxProcess( reaction_134 )
	{
		kTR	@kTR;
		cB	@cB;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow(cB,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_B -1] [P0 Variable:/Spine:camR_ca1_B 1];
	}
##Transition camT_ca1_C to camR_ca1_C
	Process ExpressionFluxProcess( reaction_135 )
	{
		kTR	@kTR;
		cC	@cC;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow(cC,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_C -1] [P0 Variable:/Spine:camR_ca1_C 1];
	}
##Transition camT_ca1_D to camR_ca1_D
	Process ExpressionFluxProcess( reaction_136 )
	{
		kTR	@kTR;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow(cD,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca1_D -1] [P0 Variable:/Spine:camR_ca1_D 1];
	}
##Transition camR_ca2_AB to camT_ca2_AB
	Process ExpressionFluxProcess( reaction_137 )
	{
		cA	@cA;
		cB	@cB;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [P0 Variable:/Spine:camT_ca2_AB 1];
	}
##Transition camR_ca2_AC to camT_ca2_AC
	Process ExpressionFluxProcess( reaction_138 )
	{
		cA	@cA;
		cC	@cC;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cA*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC -1] [P0 Variable:/Spine:camT_ca2_AC 1];
	}
##Transition camR_ca2_AD to camT_ca2_AD
	Process ExpressionFluxProcess( reaction_139 )
	{
		cA	@cA;
		cD	@cD;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cA*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [P0 Variable:/Spine:camT_ca2_AD 1];
	}
##Transition camR_ca2_BC to camT_ca2_BC
	Process ExpressionFluxProcess( reaction_140 )
	{
		cB	@cB;
		cC	@cC;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [P0 Variable:/Spine:camT_ca2_BC 1];
	}
##Transition camR_ca2_BD to camT_ca2_BD
	Process ExpressionFluxProcess( reaction_141 )
	{
		cB	@cB;
		cD	@cD;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [P0 Variable:/Spine:camT_ca2_BD 1];
	}
##Transition camR_ca2_CD to camT_ca2_CD
	Process ExpressionFluxProcess( reaction_142 )
	{
		cC	@cC;
		cD	@cD;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [P0 Variable:/Spine:camT_ca2_CD 1];
	}
##Transition camT_ca2_AB to camR_ca2_AB
	Process ExpressionFluxProcess( reaction_143 )
	{
		kTR	@kTR;
		cA	@cA;
		cB	@cB;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AB -1] [P0 Variable:/Spine:camR_ca2_AB 1];
	}
##Transition camT_ca2_AC to camR_ca2_AC
	Process ExpressionFluxProcess( reaction_144 )
	{
		kTR	@kTR;
		cA	@cA;
		cC	@cC;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AC -1] [P0 Variable:/Spine:camR_ca2_AC 1];
	}
##Transition camT_ca2_AD to camR_ca2_AD
	Process ExpressionFluxProcess( reaction_145 )
	{
		kTR	@kTR;
		cA	@cA;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_AD -1] [P0 Variable:/Spine:camR_ca2_AD 1];
	}
##Transition camT_ca2_BC to camR_ca2_BC
	Process ExpressionFluxProcess( reaction_146 )
	{
		kTR	@kTR;
		cB	@cB;
		cC	@cC;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BC -1] [P0 Variable:/Spine:camR_ca2_BC 1];
	}
##Transition camT_ca2_BD to camR_ca2_BD
	Process ExpressionFluxProcess( reaction_147 )
	{
		kTR	@kTR;
		cB	@cB;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_BD -1] [P0 Variable:/Spine:camR_ca2_BD 1];
	}
##Transition camT_ca2_CD to camR_ca2_CD
	Process ExpressionFluxProcess( reaction_148 )
	{
		kTR	@kTR;
		cC	@cC;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca2_CD -1] [P0 Variable:/Spine:camR_ca2_CD 1];
	}
##Transition camR_ca3_ABC to camT_ca3_ABC
	Process ExpressionFluxProcess( reaction_149 )
	{
		cA	@cA;
		cB	@cB;
		cC	@cC;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [P0 Variable:/Spine:camT_ca3_ABC 1];
	}
##Transition camR_ca3_ABD to camT_ca3_ABD
	Process ExpressionFluxProcess( reaction_150 )
	{
		cA	@cA;
		cB	@cB;
		cD	@cD;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [P0 Variable:/Spine:camT_ca3_ABD 1];
	}
##Transition camR_ca3_ACD to camT_ca3_ACD
	Process ExpressionFluxProcess( reaction_151 )
	{
		cA	@cA;
		cC	@cC;
		cD	@cD;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cA*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [P0 Variable:/Spine:camT_ca3_ACD 1];
	}
##Transition camR_ca3_BCD to camT_ca3_BCD
	Process ExpressionFluxProcess( reaction_152 )
	{
		cB	@cB;
		cC	@cC;
		cD	@cD;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [P0 Variable:/Spine:camT_ca3_BCD 1];
	}
##Transition camT_ca3_ABC to camR_ca3_ABC
	Process ExpressionFluxProcess( reaction_153 )
	{
		kTR	@kTR;
		cA	@cA;
		cB	@cB;
		cC	@cC;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABC -1] [P0 Variable:/Spine:camR_ca3_ABC 1];
	}
##Transition camT_ca3_ABD to camR_ca3_ABD
	Process ExpressionFluxProcess( reaction_154 )
	{
		kTR	@kTR;
		cA	@cA;
		cB	@cB;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABD -1] [P0 Variable:/Spine:camR_ca3_ABD 1];
	}
##Transition camT_ca3_ACD to camR_ca3_ACD
	Process ExpressionFluxProcess( reaction_155 )
	{
		kTR	@kTR;
		cA	@cA;
		cC	@cC;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ACD -1] [P0 Variable:/Spine:camR_ca3_ACD 1];
	}
##Transition camT_ca3_BCD to camR_ca3_BCD
	Process ExpressionFluxProcess( reaction_156 )
	{
		kTR	@kTR;
		cB	@cB;
		cC	@cC;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_BCD -1] [P0 Variable:/Spine:camR_ca3_BCD 1];
	}
##Transition camR_ca4_ABCD to camT_ca4_ABCD
	Process ExpressionFluxProcess( reaction_157 )
	{
		cA	@cA;
		cB	@cB;
		cC	@cC;
		cD	@cD;
		kRT	@kRT;
		StepperID	@(MAIN_STEPPER);
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [P0 Variable:/Spine:camT_ca4_ABCD 1];
	}
##Transition camT_ca4_ABCD to camR_ca4_ABCD
	Process ExpressionFluxProcess( reaction_158 )
	{
		kTR	@kTR;
		cA	@cA;
		cB	@cB;
		cC	@cC;
		cD	@cD;
		StepperID	@(MAIN_STEPPER);
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca4_ABCD -1] [P0 Variable:/Spine:camR_ca4_ABCD 1];
	}
##CaMKII binding to camR
	Process @(MAIN_PROCESS)( reaction_159 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_CaMKII 1];
	}
##CaMKII binding to camR_ca1_A
	Process @(MAIN_PROCESS)( reaction_160 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca1_A_CaMKII 1];
	}
##CaMKII binding to camR_ca1_B
	Process @(MAIN_PROCESS)( reaction_161 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca1_B_CaMKII 1];
	}
##CaMKII binding to camR_ca1_C
	Process @(MAIN_PROCESS)( reaction_162 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca1_C_CaMKII 1];
	}
##CaMKII binding to camR_ca1_D
	Process @(MAIN_PROCESS)( reaction_163 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca1_D_CaMKII 1];
	}
##CaMKII binding to camR_ca2_AB
	Process @(MAIN_PROCESS)( reaction_164 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKII 1];
	}
##CaMKII binding to camR_ca2_AC
	Process @(MAIN_PROCESS)( reaction_165 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKII 1];
	}
##CaMKII binding to camR_ca2_AD
	Process @(MAIN_PROCESS)( reaction_166 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKII 1];
	}
##CaMKII binding to camR_ca2_BC
	Process @(MAIN_PROCESS)( reaction_167 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKII 1];
	}
##CaMKII binding to camR_ca2_BD
	Process @(MAIN_PROCESS)( reaction_168 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKII 1];
	}
##CaMKII binding to camR_ca2_CD
	Process @(MAIN_PROCESS)( reaction_169 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKII 1];
	}
##CaMKII binding to camR_ca3_ABC
	Process @(MAIN_PROCESS)( reaction_170 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1];
	}
##CaMKII binding to camR_ca3_ABD
	Process @(MAIN_PROCESS)( reaction_171 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1];
	}
##CaMKII binding to camR_ca3_ACD
	Process @(MAIN_PROCESS)( reaction_172 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1];
	}
##CaMKII binding to camR_ca3_BCD
	Process @(MAIN_PROCESS)( reaction_173 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1];
	}
##CaMKII binding to camR_ca4_ABCD
	Process @(MAIN_PROCESS)( reaction_174 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [S1 Variable:/Spine:CaMKII -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1];
	}
##CaMKII dissociation from camR
	Process @(MAIN_PROCESS)( reaction_175 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKII -1] [P0 Variable:/Spine:camR 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca1_A
	Process @(MAIN_PROCESS)( reaction_176 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKII -1] [P0 Variable:/Spine:camR_ca1_A 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca1_B
	Process @(MAIN_PROCESS)( reaction_177 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKII -1] [P0 Variable:/Spine:camR_ca1_B 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca1_C
	Process @(MAIN_PROCESS)( reaction_178 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKII -1] [P0 Variable:/Spine:camR_ca1_C 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca1_D
	Process @(MAIN_PROCESS)( reaction_179 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKII -1] [P0 Variable:/Spine:camR_ca1_D 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca2_AB
	Process @(MAIN_PROCESS)( reaction_180 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AB 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca2_AC
	Process @(MAIN_PROCESS)( reaction_181 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AC 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca2_AD
	Process @(MAIN_PROCESS)( reaction_182 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AD 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca2_BC
	Process @(MAIN_PROCESS)( reaction_183 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKII -1] [P0 Variable:/Spine:camR_ca2_BC 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca2_BD
	Process @(MAIN_PROCESS)( reaction_184 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_BD 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca2_CD
	Process @(MAIN_PROCESS)( reaction_185 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_CD 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca3_ABC
	Process @(MAIN_PROCESS)( reaction_186 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABC 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca3_ABD
	Process @(MAIN_PROCESS)( reaction_187 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABD 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca3_ACD
	Process @(MAIN_PROCESS)( reaction_188 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ACD 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca3_BCD
	Process @(MAIN_PROCESS)( reaction_189 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_BCD 1] [P1 Variable:/Spine:CaMKII 1];
	}
##CaMKII dissociation from camR_ca4_ABCD
	Process @(MAIN_PROCESS)( reaction_190 )
	{
		k	@(koffCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1] [P0 Variable:/Spine:camR_ca4_ABCD 1] [P1 Variable:/Spine:CaMKII 1];
	}
##PP2B binding to camR
	Process @(MAIN_PROCESS)( reaction_191 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_PP2B 1];
	}
##PP2B binding to camR_ca1_A
	Process @(MAIN_PROCESS)( reaction_192 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca1_A_PP2B 1];
	}
##PP2B binding to camR_ca1_B
	Process @(MAIN_PROCESS)( reaction_193 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca1_B_PP2B 1];
	}
##PP2B binding to camR_ca1_C
	Process @(MAIN_PROCESS)( reaction_194 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca1_C_PP2B 1];
	}
##PP2B binding to camR_ca1_D
	Process @(MAIN_PROCESS)( reaction_195 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca1_D_PP2B 1];
	}
##PP2B binding to camR_ca2_AC
	Process @(MAIN_PROCESS)( reaction_196 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca2_AB_PP2B 1];
	}
##PP2B binding to camR_ca2_AD
	Process @(MAIN_PROCESS)( reaction_198 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca2_AD_PP2B 1];
	}
##PP2B binding to camR_ca2_BC
	Process @(MAIN_PROCESS)( reaction_199 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca2_BC_PP2B 1];
	}
##PP2B binding to camR_ca2_BD
	Process @(MAIN_PROCESS)( reaction_200 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca2_BD_PP2B 1];
	}
##PP2B binding to camR_ca2_CD
	Process @(MAIN_PROCESS)( reaction_201 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca2_CD_PP2B 1];
	}
##PP2B binding to camR_ca3_ABC
	Process @(MAIN_PROCESS)( reaction_202 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca3_ABC_PP2B 1];
	}
##PP2B binding to camR_ca3_ABD
	Process @(MAIN_PROCESS)( reaction_203 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca3_ABD_PP2B 1];
	}
##PP2B binding to camR_ca3_ACD
	Process @(MAIN_PROCESS)( reaction_204 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca3_ACD_PP2B 1];
	}
##PP2B binding to camR_ca3_BCD
	Process @(MAIN_PROCESS)( reaction_205 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca3_BCD_PP2B 1];
	}
##PP2B binding to camR_ca4_ABCD
	Process @(MAIN_PROCESS)( reaction_206 )
	{
		k	@(konPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [S1 Variable:/Spine:PP2B -1] [P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1];
	}
##PP2B dissociation from camR
	Process @(MAIN_PROCESS)( reaction_207 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_PP2B -1] [P0 Variable:/Spine:camR 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca1_A
	Process @(MAIN_PROCESS)( reaction_208 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_PP2B -1] [P0 Variable:/Spine:camR_ca1_A 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca1_B
	Process @(MAIN_PROCESS)( reaction_209 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_PP2B -1] [P0 Variable:/Spine:camR_ca1_B 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca1_C
	Process @(MAIN_PROCESS)( reaction_210 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_PP2B -1] [P0 Variable:/Spine:camR_ca1_C 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca1_D
	Process @(MAIN_PROCESS)( reaction_211 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_PP2B -1] [P0 Variable:/Spine:camR_ca1_D 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca2_AB
	Process @(MAIN_PROCESS)( reaction_212 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_PP2B -1] [P0 Variable:/Spine:camR_ca2_AB 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca2_AC
	Process @(MAIN_PROCESS)( reaction_213 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_PP2B -1] [P0 Variable:/Spine:camR_ca2_AC 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca2_AD
	Process @(MAIN_PROCESS)( reaction_214 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_PP2B -1] [P0 Variable:/Spine:camR_ca2_AD 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca2_BC
	Process @(MAIN_PROCESS)( reaction_215 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_PP2B -1] [P0 Variable:/Spine:camR_ca2_BC 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca2_BD
	Process @(MAIN_PROCESS)( reaction_216 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_PP2B -1] [P0 Variable:/Spine:camR_ca2_BD 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca2_CD
	Process @(MAIN_PROCESS)( reaction_217 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_PP2B -1] [P0 Variable:/Spine:camR_ca2_CD 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca3_ABC
	Process @(MAIN_PROCESS)( reaction_218 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_PP2B -1] [P0 Variable:/Spine:camR_ca3_ABC 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca3_ABD
	Process @(MAIN_PROCESS)( reaction_219 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_PP2B -1] [P0 Variable:/Spine:camR_ca3_ABD 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca3_ACD
	Process @(MAIN_PROCESS)( reaction_220 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_PP2B -1] [P0 Variable:/Spine:camR_ca3_ACD 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca3_BCD
	Process @(MAIN_PROCESS)( reaction_221 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_PP2B -1] [P0 Variable:/Spine:camR_ca3_BCD 1] [P1 Variable:/Spine:PP2B 1];
	}
##PP2B dissociation from camR_ca4_ABCD
	Process @(MAIN_PROCESS)( reaction_222 )
	{
		k	@(koffPP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:camR_ca4_ABCD 1] [P1 Variable:/Spine:PP2B 1];
	}
##Ca binding to camR_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_223 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_A_CaMKII 1];
	}
##Ca binding to camR_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_224 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_B_CaMKII 1];
	}
##Ca binding to camR_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_225 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_C_CaMKII 1];
	}
##Ca binding to camR_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_226 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_D_CaMKII 1];
	}
##Ca dissociation from camR_ca1_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_227 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKII -1] [P0 Variable:/Spine:camR_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_228 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKII -1] [P0 Variable:/Spine:camR_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_229 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKII -1] [P0 Variable:/Spine:camR_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca1_A_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_230 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKII 1];
	}
##Ca binding to camR_ca1_A_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_231 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKII 1];
	}
##Ca binding to camR_ca1_A_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_232 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKII 1];
	}
##Ca binding to camR_ca1_B_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_233 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKII 1];
	}
##Ca binding to camR_ca1_B_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_234 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKII 1];
	}
##Ca binding to camR_ca1_B_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_235 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKII 1];
	}
##Ca binding to camR_ca1_C_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_236 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKII 1];
	}
##Ca binding to camR_ca1_C_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_237 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKII 1];
	}
##Ca binding to camR_ca1_C_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_238 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKII 1];
	}
##Ca binding to camR_ca1_D_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_239 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKII 1];
	}
##Ca binding to camR_ca1_D_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_240 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKII 1];
	}
##Ca binding to camR_ca1_D_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_241 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKII 1];
	}
##Ca dissociation from camR_ca2_AB_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_242 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKII -1] [P0 Variable:/Spine:camR_ca1_B_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AB_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_243 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKII -1] [P0 Variable:/Spine:camR_ca1_A_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AC_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_244 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKII -1] [P0 Variable:/Spine:camR_ca1_C_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AC_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_245 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKII -1] [P0 Variable:/Spine:camR_ca1_A_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AD_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_246 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKII -1] [P0 Variable:/Spine:camR_ca1_D_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AD_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_247 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKII -1] [P0 Variable:/Spine:camR_ca1_A_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BC_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_248 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKII -1] [P0 Variable:/Spine:camR_ca1_C_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BC_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_249 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKII -1] [P0 Variable:/Spine:camR_ca1_B_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BD_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_250 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKII -1] [P0 Variable:/Spine:camR_ca1_D_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BD_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_251 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKII -1] [P0 Variable:/Spine:camR_ca1_B_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_CD_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_252 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKII -1] [P0 Variable:/Spine:camR_ca1_D_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_CD_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_253 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKII -1] [P0 Variable:/Spine:camR_ca1_C_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca2_AB_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_254 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1];
	}
##Ca binding to camR_ca2_AB_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_255 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1];
	}
##Ca binding to camR_ca2_AC_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_256 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1];
	}
##Ca binding to camR_ca2_AC_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_257 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1];
	}
##Ca binding to camR_ca2_AD_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_258 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1];
	}
##Ca binding to camR_ca2_AD_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_259 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1];
	}
##Ca binding to camR_ca2_BC_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_260 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1];
	}
##Ca binding to camR_ca2_BC_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_261 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1];
	}
##Ca binding to camR_ca2_BD_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_262 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1];
	}
##Ca binding to camR_ca2_BD_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_263 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1];
	}
##Ca binding to camR_ca2_CD_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_264 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1];
	}
##Ca binding to camR_ca2_CD_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_265 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1];
	}
##Ca dissociation from camR_ca3_ABC_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_266 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABC_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_267 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABC_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_268 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_269 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_270 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_271 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_272 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_273 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_274 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_275 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_276 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_277 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca3_BCD_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_278 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1];
	}
##Ca binding to camR_ca3_ACD_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_279 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1];
	}
##Ca binding to camR_ca3_ABD_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_280 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1];
	}
##Ca binding to camR_ca3_ABC_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_281 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site A
	Process @(MAIN_PROCESS)( reaction_282 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_283 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site C
	Process @(MAIN_PROCESS)( reaction_284 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site D
	Process @(MAIN_PROCESS)( reaction_285 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_PP2B site A
	Process @(MAIN_PROCESS)( reaction_286 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_A_PP2B 1];
	}
##Ca binding to camR_PP2B site B
	Process @(MAIN_PROCESS)( reaction_287 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_B_PP2B 1];
	}
##Ca binding to camR_PP2B site C
	Process @(MAIN_PROCESS)( reaction_288 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_C_PP2B 1];
	}
##Ca binding to camR_PP2B site D
	Process @(MAIN_PROCESS)( reaction_289 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_D_PP2B 1];
	}
##Ca dissociation from camR_ca1_A_PP2B site A
	Process @(MAIN_PROCESS)( reaction_290 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_PP2B -1] [P0 Variable:/Spine:camR_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_B_PP2B site B
	Process @(MAIN_PROCESS)( reaction_291 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_PP2B -1] [P0 Variable:/Spine:camR_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_C_PP2B site C
	Process @(MAIN_PROCESS)( reaction_292 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_PP2B -1] [P0 Variable:/Spine:camR_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_D_PP2B site D
	Process @(MAIN_PROCESS)( reaction_293 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_PP2B -1] [P0 Variable:/Spine:camR_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca1_A_PP2B site B
	Process @(MAIN_PROCESS)( reaction_294 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB_PP2B 1];
	}
##Ca binding to camR_ca1_A_PP2B site C
	Process @(MAIN_PROCESS)( reaction_295 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC_PP2B 1];
	}
##Ca binding to camR_ca1_A_PP2B site D
	Process @(MAIN_PROCESS)( reaction_296 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD_PP2B 1];
	}
##Ca binding to camR_ca1_B_PP2B site A
	Process @(MAIN_PROCESS)( reaction_297 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB_PP2B 1];
	}
##Ca binding to camR_ca1_B_PP2B site C
	Process @(MAIN_PROCESS)( reaction_298 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC_PP2B 1];
	}
##Ca binding to camR_ca1_B_PP2B site D
	Process @(MAIN_PROCESS)( reaction_299 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD_PP2B 1];
	}
##Ca binding to camR_ca1_C_PP2B site A
	Process @(MAIN_PROCESS)( reaction_300 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC_PP2B 1];
	}
##Ca binding to camR_ca1_C_PP2B site B
	Process @(MAIN_PROCESS)( reaction_301 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC_PP2B 1];
	}
##Ca binding to camR_ca1_C_PP2B site D
	Process @(MAIN_PROCESS)( reaction_302 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD_PP2B 1];
	}
##Ca binding to camR_ca1_D_PP2B site A
	Process @(MAIN_PROCESS)( reaction_303 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD_PP2B 1];
	}
##Ca binding to camR_ca1_D_PP2B site B
	Process @(MAIN_PROCESS)( reaction_304 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD_PP2B 1];
	}
##Ca binding to camR_ca1_D_PP2B site C
	Process @(MAIN_PROCESS)( reaction_305 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD_PP2B 1];
	}
##Ca dissociating from camR_ca2_AB_PP2B site A
	Process @(MAIN_PROCESS)( reaction_306 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_PP2B -1] [P0 Variable:/Spine:camR_ca1_B_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AB_PP2B site B
	Process @(MAIN_PROCESS)( reaction_307 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_PP2B -1] [P0 Variable:/Spine:camR_ca1_A_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AC_PP2B site A
	Process @(MAIN_PROCESS)( reaction_308 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_PP2B -1] [P0 Variable:/Spine:camR_ca1_C_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AC_PP2B site C
	Process @(MAIN_PROCESS)( reaction_309 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_PP2B -1] [P0 Variable:/Spine:camR_ca1_A_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AD_PP2B site A
	Process @(MAIN_PROCESS)( reaction_310 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_PP2B -1] [P0 Variable:/Spine:camR_ca1_D_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_AD_PP2B site D
	Process @(MAIN_PROCESS)( reaction_311 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_PP2B -1] [P0 Variable:/Spine:camR_ca1_A_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BC_PP2B site B
	Process @(MAIN_PROCESS)( reaction_312 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_PP2B -1] [P0 Variable:/Spine:camR_ca1_C_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BC_PP2B site C
	Process @(MAIN_PROCESS)( reaction_313 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_PP2B -1] [P0 Variable:/Spine:camR_ca1_B_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BD_PP2B site B
	Process @(MAIN_PROCESS)( reaction_314 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_PP2B -1] [P0 Variable:/Spine:camR_ca1_D_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_BD_PP2B site D
	Process @(MAIN_PROCESS)( reaction_315 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_PP2B -1] [P0 Variable:/Spine:camR_ca1_B_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_CD_PP2B site C
	Process @(MAIN_PROCESS)( reaction_316 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_PP2B -1] [P0 Variable:/Spine:camR_ca1_D_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca2_CD_PP2B site D
	Process @(MAIN_PROCESS)( reaction_317 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_PP2B -1] [P0 Variable:/Spine:camR_ca1_C_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca2_AB_PP2B site C
	Process @(MAIN_PROCESS)( reaction_318 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_PP2B 1];
	}
##Ca binding to camR_ca2_AB_PP2B site D
	Process @(MAIN_PROCESS)( reaction_319 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_PP2B 1];
	}
##Ca binding to camR_ca2_AC_PP2B site B
	Process @(MAIN_PROCESS)( reaction_320 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_PP2B 1];
	}
##Ca binding to camR_ca2_AC_PP2B site D
	Process @(MAIN_PROCESS)( reaction_321 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_PP2B 1];
	}
##Ca binding to camR_ca2_AD_PP2B site B
	Process @(MAIN_PROCESS)( reaction_322 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_PP2B 1];
	}
##Ca binding to camR_ca2_AD_PP2B site C
	Process @(MAIN_PROCESS)( reaction_323 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_PP2B 1];
	}
##Ca binding to camR_ca2_BC_PP2B site A
	Process @(MAIN_PROCESS)( reaction_324 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_PP2B 1];
	}
##Ca binding to camR_ca2_BC_PP2B site D
	Process @(MAIN_PROCESS)( reaction_325 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_PP2B 1];
	}
##Ca binding to camR_ca2_BD_PP2B site A
	Process @(MAIN_PROCESS)( reaction_326 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_PP2B 1];
	}
##Ca binding to camR_ca2_BD_PP2B site C
	Process @(MAIN_PROCESS)( reaction_327 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_PP2B 1];
	}
##Ca binding to camR_ca2_CD_PP2B site A
	Process @(MAIN_PROCESS)( reaction_328 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_PP2B 1];
	}
##Ca binding to camR_ca2_CD_PP2B site B
	Process @(MAIN_PROCESS)( reaction_329 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_PP2B 1];
	}
##Ca dissociation from camR_ca3_ABC_PP2B site A
	Process @(MAIN_PROCESS)( reaction_330 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_PP2B -1] [P0 Variable:/Spine:camR_ca2_BC_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABC_PP2B site B
	Process @(MAIN_PROCESS)( reaction_331 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_PP2B -1] [P0 Variable:/Spine:camR_ca2_AC_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABC_PP2B site C
	Process @(MAIN_PROCESS)( reaction_332 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_PP2B -1] [P0 Variable:/Spine:camR_ca2_AB_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_PP2B site A
	Process @(MAIN_PROCESS)( reaction_333 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_PP2B -1] [P0 Variable:/Spine:camR_ca2_BD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_PP2B site B
	Process @(MAIN_PROCESS)( reaction_334 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_PP2B -1] [P0 Variable:/Spine:camR_ca2_AD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_PP2B site D
	Process @(MAIN_PROCESS)( reaction_335 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_PP2B -1] [P0 Variable:/Spine:camR_ca2_AB_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_PP2B site A
	Process @(MAIN_PROCESS)( reaction_336 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_PP2B -1] [P0 Variable:/Spine:camR_ca2_CD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_PP2B site C
	Process @(MAIN_PROCESS)( reaction_337 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_PP2B -1] [P0 Variable:/Spine:camR_ca2_AD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_PP2B site D
	Process @(MAIN_PROCESS)( reaction_338 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_PP2B -1] [P0 Variable:/Spine:camR_ca2_AC_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_PP2B site B
	Process @(MAIN_PROCESS)( reaction_339 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_PP2B -1] [P0 Variable:/Spine:camR_ca2_CD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_PP2B site C
	Process @(MAIN_PROCESS)( reaction_340 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_PP2B -1] [P0 Variable:/Spine:camR_ca2_BD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_PP2B site D
	Process @(MAIN_PROCESS)( reaction_341 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_PP2B -1] [P0 Variable:/Spine:camR_ca2_BC_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca3_ABC_PP2B site D
	Process @(MAIN_PROCESS)( reaction_342 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1];
	}
##Ca binding to camR_ca3_ABD_PP2B site C
	Process @(MAIN_PROCESS)( reaction_343 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1];
	}
##Ca binding to camR_ca3_ACD_PP2B site B
	Process @(MAIN_PROCESS)( reaction_344 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1];
	}
##Ca binding to camR_ca3_BCD_PP2B site A
	Process @(MAIN_PROCESS)( reaction_345 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_PP2B -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1];
	}
##Ca dissociating from camR_ca4_ABCD_PP2B site A
	Process @(MAIN_PROCESS)( reaction_346 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:camR_ca3_BCD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca4_ABCD_PP2B site B
	Process @(MAIN_PROCESS)( reaction_347 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:camR_ca3_ACD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca4_ABCD_PP2B site C
	Process @(MAIN_PROCESS)( reaction_348 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:camR_ca3_ABD_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camR_ca4_ABCD_PP2B site D
	Process @(MAIN_PROCESS)( reaction_349 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:camR_ca3_ABC_PP2B 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_CaMKII site B
	Process @(MAIN_PROCESS)( reaction_350 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKII -1] [P0 Variable:/Spine:camR_CaMKII 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociating from camT_ca3_ABC site C
	Process @(MAIN_PROCESS)( reaction_351 )
	{
		k	@koffTC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camT_ca3_ABC -1] [P0 Variable:/Spine:camT_ca2_AB 1] [P1 Variable:/Spine:ca 1];
	}
##camR_CaMKII_autophosphorylation
	Process PythonFluxProcess( r352 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S1.MolarConc)**5+3.128*(S0.MolarConc/S1.MolarConc)**4-4.249*(S0.MolarConc/S1.MolarConc)**3+2.998*(S0.MolarConc/S1.MolarConc)**2+0.05152*(S0.MolarConc/S1.MolarConc)-0.001008)*k*S2.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S1 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S2 Variable:/Spine:camR_CaMKII -1] [P0 Variable:/Spine:camR_CaMKIIp 1];
	}
##camR_ca1_A_CaMKII_autophosphorylation
	Process PythonFluxProcess( r353 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca1_A_CaMKII -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1];
	}
##camR_ca1_B_CaMKII_autophosphorylation
	Process PythonFluxProcess( r354 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S1 Variable:/Spine:camR_ca1_B_CaMKII -1] [S0 Variable:/Spine:total_CaMKII_active 0] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1];
	}
##camR_ca1_C_CaMKII_autophosphorylation
	Process PythonFluxProcess( r355 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S1 Variable:/Spine:camR_ca1_C_CaMKII -1] [S0 Variable:/Spine:total_CaMKII_active 0] [S2 Variable:/Spine:totalCaMKII 0] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1];
	}
##camR_ca1_D_CaMKII_autophosphorylation
	Process PythonFluxProcess( r356 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca1_D_CaMKII -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1];
	}
##camR_ca2_AB_CaMKII_autophosphorylation
	Process PythonFluxProcess( r357 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca2_AB_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1];
	}
##camR_ca2_AC_CaMKII_autophosphorylation
	Process PythonFluxProcess( r358 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca2_AC_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1];
	}
##camR_ca2_AD_CaMKII_autophosphorylation
	Process PythonFluxProcess( r359 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca2_AD_CaMKII -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1];
	}
##camR_ca2_BC_CaMKII_autophosphorylation
	Process PythonFluxProcess( r360 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca2_BC_CaMKII -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1];
	}
##camR_ca2_BD_CaMKII_autophosphorylation
	Process PythonFluxProcess( r361 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S1 Variable:/Spine:camR_ca2_BD_CaMKII -1] [S0 Variable:/Spine:total_CaMKII_active 0] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1];
	}
##camR_ca2_CD_CaMKII_autophosphorylation
	Process PythonFluxProcess( r362 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S1 Variable:/Spine:camR_ca2_CD_CaMKII -1] [S0 Variable:/Spine:total_CaMKII_active 0] [S2 Variable:/Spine:totalCaMKII 0] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1];
	}
##camR_ca3_ABC_CaMKII_autophosphorylation
	Process PythonFluxProcess( r363 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca3_ABC_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1];
	}
##camR_ca3_ABD_CaMKII_autophosphorylation
	Process PythonFluxProcess( r364 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca3_ABD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1];
	}
##camR_ca3_ACD_CaMKII_autophosphorylation
	Process PythonFluxProcess( r365 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca3_ACD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1];
	}
##camR_ca3_BCD_CaMKII_autophosphorylation
	Process PythonFluxProcess( r366 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [S1 Variable:/Spine:camR_ca3_BCD_CaMKII -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1];
	}
##camR_ca4_ABCD_CaMKII_autophosphorylation
	Process PythonFluxProcess( r367 )
	{
		k	@(autoCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		Expression	"(-0.929*(S0.MolarConc/S2.MolarConc)**5+3.128*(S0.MolarConc/S2.MolarConc)**4-4.249*(S0.MolarConc/S2.MolarConc)**3+2.998*(S0.MolarConc/S2.MolarConc)**2+0.05152*(S0.MolarConc/S2.MolarConc)-0.001008)*k*S1.MolarConc*self.getSuperSystem().SizeN_A";
		VariableReferenceList	 [S1 Variable:/Spine:camR_ca4_ABCD_CaMKII -1] [S2 Variable:/Spine:totalCaMKII 0] [S0 Variable:/Spine:total_CaMKII_active 0] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1];
	}
##camR_CaMKIIp_on
	Process @(MAIN_PROCESS)( r368 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_CaMKIIp 1];
	}
##camR_CaMKIIp_off
	Process @(MAIN_PROCESS)( r369 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp -1] [P0 Variable:/Spine:camR 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca1_A_CaMKIIp_on
	Process @(MAIN_PROCESS)( r370 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1];
	}
##camR_ca1_A_CaMKIIp_off
	Process @(MAIN_PROCESS)( r371 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_A 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca1_B_CaMKIIp_on
	Process @(MAIN_PROCESS)( r372 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1];
	}
##camR_ca1_B_CaMKIIp_off
	Process @(MAIN_PROCESS)( r373 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_B 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca1_C_CaMKIIp_on
	Process @(MAIN_PROCESS)( r374 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1];
	}
##camR_ca1_C_CaMKIIp_off
	Process @(MAIN_PROCESS)( r375 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_C 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca1_D_CaMKIIp_on
	Process @(MAIN_PROCESS)( r376 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1];
	}
##camR_ca1_D_CaMKIIp_off
	Process @(MAIN_PROCESS)( r377 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_D 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca2_AB_CaMKIIp_on
	Process @(MAIN_PROCESS)( r378 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1];
	}
##camR_ca2_AB_CaMKIIp_off
	Process @(MAIN_PROCESS)( r379 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AB 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca2_AC_CaMKIIp_on
	Process @(MAIN_PROCESS)( r380 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1];
	}
##camR_ca2_AC_CaMKIIp_off
	Process @(MAIN_PROCESS)( r381 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AC 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca2_AD_CaMKIIp_on
	Process @(MAIN_PROCESS)( r382 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1];
	}
##camR_ca2_AD_CaMKIIp_off
	Process @(MAIN_PROCESS)( r383 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AD 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca2_BC_CaMKIIp_on
	Process @(MAIN_PROCESS)( r384 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1];
	}
##camR_ca2_BC_CaMKIIp_off
	Process @(MAIN_PROCESS)( r385 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BC 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca2_BD_CaMKIIp_on
	Process @(MAIN_PROCESS)( r386 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1];
	}
##camR_ca2_BD_CaMKIIp_off
	Process @(MAIN_PROCESS)( r387 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BD 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca2_CD_CaMKIIp_on
	Process @(MAIN_PROCESS)( r388 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1];
	}
##camR_ca2_CD_CaMKIIp_off
	Process @(MAIN_PROCESS)( r389 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_CD 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca3_ABC_CaMKIIp_on
	Process @(MAIN_PROCESS)( r390 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1];
	}
##camR_ca3_ABC_CaMKIIp_off
	Process @(MAIN_PROCESS)( r391 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ABC 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca3_ABD_CaMKIIp_on
	Process @(MAIN_PROCESS)( r392 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1];
	}
##camR_ca3_ABD_CaMKIIp_off
	Process @(MAIN_PROCESS)( r393 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ABD 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca3_ACD_CaMKIIp_on
	Process @(MAIN_PROCESS)( r394 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1];
	}
##camR_ca3_ACD_CaMKIIp_off
	Process @(MAIN_PROCESS)( r395 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ACD 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca3_BCD_CaMKIIp_on
	Process @(MAIN_PROCESS)( r396 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1];
	}
##camR_ca3_BCD_CaMKIIp_off
	Process @(MAIN_PROCESS)( r397 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_BCD 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##camR_ca4_ABCD_CaMKIIp_on
	Process @(MAIN_PROCESS)( r398 )
	{
		k	@(konCaMKII);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD -1] [S1 Variable:/Spine:CaMKIIp -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1];
	}
##camR_ca4_ABCD_CaMKIIp_off
	Process @(MAIN_PROCESS)( r399 )
	{
		k	@(koffCaMKIIp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca4_ABCD 1] [P1 Variable:/Spine:CaMKIIp 1];
	}
##Ca binding to camR_CaMKII site A
	Process @(MAIN_PROCESS)( r504 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1];
	}
##Ca binding to camR_CaMKII site B
	Process @(MAIN_PROCESS)( r505 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1];
	}
##Ca binding to camR_CaMKII site C
	Process @(MAIN_PROCESS)( r506 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1];
	}
##Ca binding to camR_CaMKII site D
	Process @(MAIN_PROCESS)( r507 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1];
	}
##Ca dissociation from camR_ca1_CaMKII site A
	Process @(MAIN_PROCESS)( r508 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp -1] [P0 Variable:/Spine:camR_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_CaMKII site B
	Process @(MAIN_PROCESS)( r567 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp -1] [P0 Variable:/Spine:camR_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_CaMKII site C
	Process @(MAIN_PROCESS)( r509 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp -1] [P0 Variable:/Spine:camR_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca1_CaMKII site D
	Process @(MAIN_PROCESS)( r510 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp -1] [P0 Variable:/Spine:camR_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca1_A_CaMKII site B
	Process @(MAIN_PROCESS)( r511 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1];
	}
##Ca binding to camR_ca1_A_CaMKII site C
	Process @(MAIN_PROCESS)( r512 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1];
	}
##Ca binding to camR_ca1_A_CaMKII site D
	Process @(MAIN_PROCESS)( r513 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1];
	}
##Ca binding to camR_ca1_B_CaMKII site A
	Process @(MAIN_PROCESS)( r514 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1];
	}
##Ca binding to camR_ca1_B_CaMKII site C
	Process @(MAIN_PROCESS)( r515 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1];
	}
##Ca binding to camR_ca1_B_CaMKII site D
	Process @(MAIN_PROCESS)( r516 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1];
	}
##Ca binding to camR_ca1_C_CaMKII site A
	Process @(MAIN_PROCESS)( r517 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1];
	}
##Ca binding to camR_ca1_C_CaMKII site B
	Process @(MAIN_PROCESS)( r518 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1];
	}
##Ca binding to camR_ca1_C_CaMKII site D
	Process @(MAIN_PROCESS)( r519 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1];
	}
##Ca binding to camR_ca1_D_CaMKII site A
	Process @(MAIN_PROCESS)( r520 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1];
	}
##Ca binding to camR_ca1_D_CaMKII site B
	Process @(MAIN_PROCESS)( r521 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1];
	}
##Ca binding to camR_ca1_D_CaMKII site C
	Process @(MAIN_PROCESS)( r522 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1];
	}
##Ca dissociation from camR_ca2_AB_CaMKII site A
	Process @(MAIN_PROCESS)( r523 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AB_CaMKII site B
	Process @(MAIN_PROCESS)( r524 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AC_CaMKII site A
	Process @(MAIN_PROCESS)( r525 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AC_CaMKII site C
	Process @(MAIN_PROCESS)( r526 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AD_CaMKII site A
	Process @(MAIN_PROCESS)( r527 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_AD_CaMKII site D
	Process @(MAIN_PROCESS)( r528 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BC_CaMKII site B
	Process @(MAIN_PROCESS)( r529 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BC_CaMKII site C
	Process @(MAIN_PROCESS)( r530 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BD_CaMKII site B
	Process @(MAIN_PROCESS)( r531 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_BD_CaMKII site D
	Process @(MAIN_PROCESS)( r532 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_CD_CaMKII site C
	Process @(MAIN_PROCESS)( r533 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca2_CD_CaMKII site D
	Process @(MAIN_PROCESS)( r534 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca2_AB_CaMKII site C
	Process @(MAIN_PROCESS)( r535 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1];
	}
##Ca binding to camR_ca2_AB_CaMKII site D
	Process @(MAIN_PROCESS)( r536 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_AC_CaMKII site B
	Process @(MAIN_PROCESS)( r537 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1];
	}
##Ca binding to camR_ca2_AC_CaMKII site D
	Process @(MAIN_PROCESS)( r538 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_AD_CaMKII site B
	Process @(MAIN_PROCESS)( r539 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_AD_CaMKII site C
	Process @(MAIN_PROCESS)( r540 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_BC_CaMKII site A
	Process @(MAIN_PROCESS)( r541 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1];
	}
##Ca binding to camR_ca2_BC_CaMKII site D
	Process @(MAIN_PROCESS)( r542 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_BD_CaMKII site A
	Process @(MAIN_PROCESS)( r543 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_BD_CaMKII site C
	Process @(MAIN_PROCESS)( r544 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_CD_CaMKII site A
	Process @(MAIN_PROCESS)( r545 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1];
	}
##Ca binding to camR_ca2_CD_CaMKII site B
	Process @(MAIN_PROCESS)( r546 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1];
	}
##Ca dissociation from camR_ca3_ABC_CaMKII site C
	Process @(MAIN_PROCESS)( r547 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABC_CaMKII site B
	Process @(MAIN_PROCESS)( r548 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABC_CaMKII site A
	Process @(MAIN_PROCESS)( r549 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_CaMKII site D
	Process @(MAIN_PROCESS)( r550 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_CaMKII site B
	Process @(MAIN_PROCESS)( r551 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ABD_CaMKII site A
	Process @(MAIN_PROCESS)( r552 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_CaMKII site D
	Process @(MAIN_PROCESS)( r553 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_CaMKII site C
	Process @(MAIN_PROCESS)( r554 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_ACD_CaMKII site A
	Process @(MAIN_PROCESS)( r555 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_CaMKII site D
	Process @(MAIN_PROCESS)( r556 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_CaMKII site C
	Process @(MAIN_PROCESS)( r557 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca3_BCD_CaMKII site B
	Process @(MAIN_PROCESS)( r558 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca binding to camR_ca3_BCD_CaMKII site A
	Process @(MAIN_PROCESS)( r559 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1];
	}
##Ca binding to camR_ca3_ACD_CaMKII site B
	Process @(MAIN_PROCESS)( r560 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1];
	}
##Ca binding to camR_ca3_ABD_CaMKII site C
	Process @(MAIN_PROCESS)( r561 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1];
	}
##Ca binding to camR_ca3_ABC_CaMKII site D
	Process @(MAIN_PROCESS)( r562 )
	{
		k	@kon;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp -1] [S1 Variable:/Spine:ca -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site A
	Process @(MAIN_PROCESS)( r563 )
	{
		k	@koffRA;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site B
	Process @(MAIN_PROCESS)( r564 )
	{
		k	@koffRB;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site C
	Process @(MAIN_PROCESS)( r565 )
	{
		k	@koffRC;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##Ca dissociation from camR_ca4_ABCD_CaMKII site D
	Process @(MAIN_PROCESS)( r566 )
	{
		k	@koffRD;
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1] [P1 Variable:/Spine:ca 1];
	}
##D_PKA_on
	Process @(MAIN_PROCESS)( r400 )
	{
		k	@(konD_PKA);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:D -1] [S1 Variable:/Spine:PKA -1] [P0 Variable:/Spine:D_PKA 1];
	}
##D_PKA_off
	Process @(MAIN_PROCESS)( r401 )
	{
		k	@(koffD_PKA);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:D_PKA -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:PKA 1];
	}
##D_PKA_cat
	Process @(MAIN_PROCESS)( r402 )
	{
		k	@(kcatD_PKA);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:D_PKA -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:PKA 1];
	}
##Dp_camR_PP2B_on
	Process @(MAIN_PROCESS)( r403 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_PP2B -1] [P0 Variable:/Spine:Dp_camR_PP2B 1];
	}
##Dp_camR_PP2B_off
	Process @(MAIN_PROCESS)( r404 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_PP2B 1];
	}
##Dp_camR_PP2B_cat
	Process @(MAIN_PROCESS)( r405 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_PP2B 1];
	}
##Dp_camR_ca1_A_PP2B_on
	Process @(MAIN_PROCESS)( r406 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca1_A_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca1_A_PP2B 1];
	}
##Dp_camR_ca1_A_PP2B_off
	Process @(MAIN_PROCESS)( r407 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_A_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca1_A_PP2B 1];
	}
##Dp_camR_ca1_A_PP2B_cat
	Process @(MAIN_PROCESS)( r408 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_A_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca1_A_PP2B 1];
	}
##Dp_camR_ca1_B_PP2B_on
	Process @(MAIN_PROCESS)( r409 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca1_B_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca1_B_PP2B 1];
	}
##Dp_camR_ca1_B_PP2B_off
	Process @(MAIN_PROCESS)( r410 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_B_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca1_B_PP2B 1];
	}
##Dp_camR_ca1_B_PP2B_cat
	Process @(MAIN_PROCESS)( r411 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_B_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca1_B_PP2B 1];
	}
##Dp_camR_ca1_C_PP2B_on
	Process @(MAIN_PROCESS)( r412 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca1_C_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca1_C_PP2B 1];
	}
##Dp_camR_ca1_C_PP2B_off
	Process @(MAIN_PROCESS)( r413 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_C_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca1_C_PP2B 1];
	}
##Dp_camR_ca1_C_PP2B_cat
	Process @(MAIN_PROCESS)( r414 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_C_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca1_C_PP2B 1];
	}
##Dp_camR_ca1_D_PP2B_on
	Process @(MAIN_PROCESS)( r415 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca1_D_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca1_D_PP2B 1];
	}
##Dp_camR_ca1_D_PP2B_off
	Process @(MAIN_PROCESS)( r416 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_D_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca1_D_PP2B 1];
	}
##Dp_camR_ca1_D_PP2B_cat
	Process @(MAIN_PROCESS)( r417 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca1_D_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca1_D_PP2B 1];
	}
##Dp_camR_ca2_AB_PP2B_on
	Process @(MAIN_PROCESS)( r418 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca2_AB_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca2_AB_PP2B 1];
	}
##Dp_camR_ca2_AB_PP2B_off
	Process @(MAIN_PROCESS)( r419 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_AB_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca2_AB_PP2B 1];
	}
##Dp_camR_ca2_AB_PP2B_cat
	Process @(MAIN_PROCESS)( r420 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_AB_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca2_AB_PP2B 1];
	}
##Dp_camR_ca2_AC_PP2B_on
	Process @(MAIN_PROCESS)( r421 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca2_AC_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca2_AC_PP2B 1];
	}
##Dp_camR_ca2_AC_PP2B_off
	Process @(MAIN_PROCESS)( r422 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_AC_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca2_AC_PP2B 1];
	}
##Dp_camR_ca2_AC_PP2B_cat
	Process @(MAIN_PROCESS)( r423 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_AC_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca2_AC_PP2B 1];
	}
##Dp_camR_ca2_AD_PP2B_on
	Process @(MAIN_PROCESS)( r424 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca2_AD_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca2_AD_PP2B 1];
	}
##Dp_camR_ca2_AD_PP2B_off
	Process @(MAIN_PROCESS)( r425 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_AD_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca2_AD_PP2B 1];
	}
##Dp_camR_ca2_AD_PP2B_cat
	Process @(MAIN_PROCESS)( r426 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_AD_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca2_AD_PP2B 1];
	}
##Dp_camR_ca2_BC_PP2B_on
	Process @(MAIN_PROCESS)( r427 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca2_BC_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca2_BC_PP2B 1];
	}
##Dp_camR_ca2_BC_PP2B_off
	Process @(MAIN_PROCESS)( r428 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_BC_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca2_BC_PP2B 1];
	}
##Dp_camR_ca2_BC_PP2B_cat
	Process @(MAIN_PROCESS)( r429 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_BC_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca2_BC_PP2B 1];
	}
##Dp_camR_ca2_BD_PP2B_on
	Process @(MAIN_PROCESS)( r430 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca2_BD_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca2_BD_PP2B 1];
	}
##Dp_camR_ca2_BD_PP2B_off
	Process @(MAIN_PROCESS)( r431 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_BD_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca2_BD_PP2B 1];
	}
##Dp_camR_ca2_BD_PP2B_cat
	Process @(MAIN_PROCESS)( r432 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_BD_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca2_BD_PP2B 1];
	}
##Dp_camR_ca2_CD_PP2B_on
	Process @(MAIN_PROCESS)( r433 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca2_CD_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca2_CD_PP2B 1];
	}
##Dp_camR_ca2_CD_PP2B_off
	Process @(MAIN_PROCESS)( r434 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_CD_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca2_CD_PP2B 1];
	}
##Dp_camR_ca2_CD_PP2B_cat
	Process @(MAIN_PROCESS)( r435 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca2_CD_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca2_CD_PP2B 1];
	}
##Dp_camR_ca3_ABC_PP2B_on
	Process @(MAIN_PROCESS)( r436 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca3_ABC_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca3_ABC_PP2B 1];
	}
##Dp_camR_ca3_ABC_PP2B_off
	Process @(MAIN_PROCESS)( r437 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_ABC_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca3_ABC_PP2B 1];
	}
##Dp_camR_ca3_ABC_PP2B_cat
	Process @(MAIN_PROCESS)( r438 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_ABC_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca3_ABC_PP2B 1];
	}
##Dp_camR_ca3_ABD_PP2B_on
	Process @(MAIN_PROCESS)( r439 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca3_ABD_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca3_ABD_PP2B 1];
	}
##Dp_camR_ca3_ABD_PP2B_off
	Process @(MAIN_PROCESS)( r440 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_ABD_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca3_ABD_PP2B 1];
	}
##Dp_camR_ca3_ABD_PP2B_cat
	Process @(MAIN_PROCESS)( r441 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_ABD_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca3_ABD_PP2B 1];
	}
##Dp_camR_ca3_ACD_PP2B_on
	Process @(MAIN_PROCESS)( r442 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca3_ACD_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca3_ACD_PP2B 1];
	}
##Dp_camR_ca3_ACD_PP2B_off
	Process @(MAIN_PROCESS)( r443 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_ACD_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca3_ACD_PP2B 1];
	}
##Dp_camR_ca3_ACD_PP2B_cat
	Process @(MAIN_PROCESS)( r444 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_ACD_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca3_ACD_PP2B 1];
	}
##Dp_camR_ca3_BCD_PP2B_on
	Process @(MAIN_PROCESS)( r445 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca3_BCD_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca3_BCD_PP2B 1];
	}
##Dp_camR_ca3_BCD_PP2B_off
	Process @(MAIN_PROCESS)( r446 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_BCD_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca3_BCD_PP2B 1];
	}
##Dp_camR_ca3_BCD_PP2B_cat
	Process @(MAIN_PROCESS)( r447 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca3_BCD_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca3_BCD_PP2B 1];
	}
##Dp_camR_ca4_ABCD_PP2B_on
	Process @(MAIN_PROCESS)( r448 )
	{
		k	@(konDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp -1] [S1 Variable:/Spine:camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B 1];
	}
##Dp_camR_ca4_ABCD_PP2B_off
	Process @(MAIN_PROCESS)( r449 )
	{
		k	@(koffDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:Dp 1] [P1 Variable:/Spine:camR_ca4_ABCD_PP2B 1];
	}
##Dp_camR_ca4_ABCD_PP2B_cat
	Process @(MAIN_PROCESS)( r450 )
	{
		k	@(kcatDp_PP2B);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B -1] [P0 Variable:/Spine:D 1] [P1 Variable:/Spine:camR_ca4_ABCD_PP2B 1];
	}
##PP1a_Dp_on
	Process @(MAIN_PROCESS)( r451 )
	{
		k	@(konPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:PP1a_Dp 1];
	}
##PP1a_Dp_off
	Process @(MAIN_PROCESS)( r452 )
	{
		k	@(koffPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r453 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:CaMKIIp_PP1a 1];
	}
##CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r454 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CaMKIIp_PP1a -1] [P0 Variable:/Spine:CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r455 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CaMKIIp_PP1a -1] [P0 Variable:/Spine:CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r456 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_CaMKIIp_PP1a 1];
	}
##camR_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r457 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r458 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_A_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r459 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a 1];
	}
##camR_ca1_A_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r460 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_A_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r461 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_A_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_B_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r462 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a 1];
	}
##camR_ca1_B_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r463 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_B_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r464 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_B_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_C_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r465 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a 1];
	}
##camR_ca1_C_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r466 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_C_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r467 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_C_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_D_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r468 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a 1];
	}
##camR_ca1_D_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r469 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca1_D_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r470 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca1_D_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_AB_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r471 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a 1];
	}
##camR_ca2_AB_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r472 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_AB_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r473 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_AC_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r474 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a 1];
	}
##camR_ca2_AC_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r475 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_AC_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r476 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_AD_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r477 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a 1];
	}
##camR_ca2_AD_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r478 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_AD_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r479 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_BC_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r480 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a 1];
	}
##camR_ca2_BC_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r481 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_BC_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r482 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_BD_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r483 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a 1];
	}
##camR_ca2_BD_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r484 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_BD_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r485 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_CD_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r486 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a 1];
	}
##camR_ca2_CD_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r487 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca2_CD_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r488 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_ABC_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r489 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a 1];
	}
##camR_ca3_ABC_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r490 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_ABC_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r491 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_ABD_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r492 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a 1];
	}
##camR_ca3_ABD_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r493 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_ABD_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r494 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_ACD_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r495 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a 1];
	}
##camR_ca3_ACD_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r496 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_ACD_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r497 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_BCD_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r498 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a 1];
	}
##camR_ca3_BCD_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r499 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca3_BCD_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r500 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca4_ABCD_CaMKIIp_PP1a_on
	Process @(MAIN_PROCESS)( r501 )
	{
		k	@(konCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp -1] [S1 Variable:/Spine:PP1a -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 1];
	}
##camR_ca4_ABCD_CaMKIIp_PP1a_off
	Process @(MAIN_PROCESS)( r502 )
	{
		k	@(koffCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1] [P1 Variable:/Spine:PP1a 1];
	}
##camR_ca4_ABCD_CaMKIIp_PP1a_cat
	Process @(MAIN_PROCESS)( r503 )
	{
		k	@(kcatCaMKIIp_PP1a);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1] [P1 Variable:/Spine:PP1a 1];
	}
##CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r568 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:CaMKIIp_PP1a_Dp 1];
	}
##CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r569 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r570 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 1];
	}
##camR_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r571 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca1_A_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r572 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_A_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r573 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca1_B_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r574 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_B_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r575 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca1_C_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r576 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_C_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r577 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca1_D_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r578 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_D_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r579 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca2_AB_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r580 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_AB_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r581 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca2_AC_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r582 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_AC_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r583 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca2_AD_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r584 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_AD_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r585 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca2_BC_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r586 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_BC_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r587 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca2_BD_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r588 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_BD_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r589 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca2_CD_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r590 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_CD_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r591 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca3_ABC_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r592 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_ABC_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r593 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca3_ABD_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r594 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_ABD_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r595 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca3_ACD_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r596 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_ACD_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r597 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca3_BCD_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r598 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_BCD_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r599 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##camR_ca4_ABCD_CaMKIIp_PP1aDp_on
	Process @(MAIN_PROCESS)( r600 )
	{
		k	@(konCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp -1] [S1 Variable:/Spine:PP1a_Dp -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca4_ABCD_CaMKIIp_PP1aDp_off
	Process @(MAIN_PROCESS)( r601 )
	{
		k	@(koffCaMKIIp_PP1aDp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 1] [P1 Variable:/Spine:PP1a_Dp 1];
	}
##CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r602 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:CaMKIIp_PP1a_Dp 1];
	}
##CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r603 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r604 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 1];
	}
##camR_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r605 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca1_A_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r606 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_A_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r607 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca1_B_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r608 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_B_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r609 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca1_C_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r610 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_C_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r611 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca1_D_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r612 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca1_D_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r613 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca2_AB_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r614 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_AB_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r615 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca2_AC_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r616 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_AC_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r617 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca2_AD_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r618 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_AD_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r619 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca2_BC_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r620 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_BC_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r621 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca2_BD_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r622 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_BD_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r623 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca2_CD_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r624 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca2_CD_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r625 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca3_ABC_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r626 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_ABC_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r627 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca3_ABD_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r628 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_ABD_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r629 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca3_ACD_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r630 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_ACD_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r631 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca3_BCD_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r632 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca3_BCD_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r633 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
##camR_ca4_ABCD_CaMKIIpPP1a_Dp_on
	Process @(MAIN_PROCESS)( r634 )
	{
		k	@(konCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a -1] [S1 Variable:/Spine:Dp -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 1];
	}
##camR_ca4_ABCD_CaMKIIpPP1a_Dp_off
	Process @(MAIN_PROCESS)( r635 )
	{
		k	@(koffCaMKIIpPP1a_Dp);
		StepperID	@(MAIN_STEPPER);
		VariableReferenceList	 [S0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp -1] [P0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 1] [P1 Variable:/Spine:Dp 1];
	}
	Process PythonProcess( add_free_cam_ca4_total )
	{
		FireMethod	"P0.Value=(X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_cam_ca4_total 1] [X0 Variable:/Spine:camT_ca4_ABCD 0] [X1 Variable:/Spine:camR_ca4_ABCD 0];
	}
###
	Process PythonProcess( add_camR_ca4_total )
	{
		FireMethod	"P0.Value=(X7.Value+X5.Value+X6.Value+X4.Value+X3.Value+X2.Value+X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca4_total 1] [X1 Variable:/Spine:PP1a_Dp_camR_ca4_ABCD_PP2B 0] [X4 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 0] [X3 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B 0] [X7 Variable:/Spine:camR_ca4_ABCD 0] [X6 Variable:/Spine:camR_ca4_ABCD_PP2B 0] [X5 Variable:/Spine:camR_ca4_ABCD_CaMKII 0] [X2 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 0];
	}
	Process PythonProcess( add_camR_ca4_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca4_ratio 1] [X0 Variable:/Spine:camR_ca4_total 0] [X1 Variable:/Spine:cam_total 0];
	}
###
	Process PythonProcess( add_cam_ca4_total )
	{
		FireMethod	"P0.Value=(X8.Value+X7.Value+X5.Value+X6.Value+X4.Value+X3.Value+X2.Value+X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca4_total 1] [X1 Variable:/Spine:PP1a_Dp_camR_ca4_ABCD_PP2B 0] [X4 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 0] [X7 Variable:/Spine:camT_ca4_ABCD 0] [X3 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B 0] [X8 Variable:/Spine:camR_ca4_ABCD 0] [X6 Variable:/Spine:camR_ca4_ABCD_PP2B 0] [X5 Variable:/Spine:camR_ca4_ABCD_CaMKII 0] [X2 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 0];
	}
	Process PythonProcess( add_cam_ca4_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca4_totalRatio 1] [X0 Variable:/Spine:cam_ca4_total 0] [X1 Variable:/Spine:cam_total 0];
	}
	Process PythonProcess( add_free_camR_ca3_total )
	{
		FireMethod	"P0.Value=(X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_camR_ca3_total 1] [X0 Variable:/Spine:camR_ca3_BCD 0] [X3 Variable:/Spine:camR_ca3_ABC 0] [X1 Variable:/Spine:camR_ca3_ACD 0] [X2 Variable:/Spine:camR_ca3_ABD 0];
	}
	Process PythonProcess( add_free_camT_ca3_total )
	{
		FireMethod	"P0.Value=(X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_camT_ca3_total 1] [X1 Variable:/Spine:camT_ca3_ACD 0] [X2 Variable:/Spine:camT_ca3_ABD 0] [X3 Variable:/Spine:camT_ca3_ABC 0] [X0 Variable:/Spine:camT_ca3_BCD 0];
	}
	Process PythonProcess( add_free_cam_ca3_total )
	{
		FireMethod	"P0.Value=(X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_cam_ca3_total 1] [X0 Variable:/Spine:free_camT_ca3_total 0] [X1 Variable:/Spine:free_camR_ca3_total 0];
	}
###
	Process PythonProcess( add_CaMKII_camR_ca3 )
	{
		FireMethod	"P0.Value=(X15.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CaMKII_camR_ca3 1] [X9 Variable:/Spine:camR_ca3_ACD_CaMKIIp 0] [X2 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp 0] [X13 Variable:/Spine:camR_ca3_ACD_CaMKII 0] [X10 Variable:/Spine:camR_ca3_ABD_CaMKIIp 0] [X4 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a 0] [X0 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp 0] [X5 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a 0] [X15 Variable:/Spine:camR_ca3_ABC_CaMKII 0] [X12 Variable:/Spine:camR_ca3_BCD_CaMKII 0] [X1 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp 0] [X7 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a 0] [X8 Variable:/Spine:camR_ca3_BCD_CaMKIIp 0] [X11 Variable:/Spine:camR_ca3_ABC_CaMKIIp 0] [X3 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp 0] [X6 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a 0] [X14 Variable:/Spine:camR_ca3_ABD_CaMKII 0];
	}
###
	Process PythonProcess( add_PP2B_camR_ca3 )
	{
		FireMethod	"P0.Value=(X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:PP2B_camR_ca3 1] [X11 Variable:/Spine:camR_ca3_ABC_PP2B 0] [X5 Variable:/Spine:Dp_camR_ca3_ACD_PP2B 0] [X2 Variable:/Spine:PP1a_Dp_camR_ca3_ABD_PP2B 0] [X9 Variable:/Spine:camR_ca3_ACD_PP2B 0] [X4 Variable:/Spine:Dp_camR_ca3_BCD_PP2B 0] [X8 Variable:/Spine:camR_ca3_BCD_PP2B 0] [X3 Variable:/Spine:PP1a_Dp_camR_ca3_ABC_PP2B 0] [X6 Variable:/Spine:Dp_camR_ca3_ABD_PP2B 0] [X1 Variable:/Spine:PP1a_Dp_camR_ca3_ACD_PP2B 0] [X7 Variable:/Spine:Dp_camR_ca3_ABC_PP2B 0] [X0 Variable:/Spine:PP1a_Dp_camR_ca3_BCD_PP2B 0] [X10 Variable:/Spine:camR_ca3_ABD_PP2B 0];
	}
	Process PythonProcess( add_camR_ca3_total )
	{
		FireMethod	"P0.Value=(X0.Value+X2.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca3_total 1] [X1 Variable:/Spine:CaMKII_camR_ca3 0] [X0 Variable:/Spine:free_camR_ca3_total 0] [X2 Variable:/Spine:PP2B_camR_ca3 0];
	}
	Process PythonProcess( add_camR_ca3_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca3_ratio 1] [X0 Variable:/Spine:camR_ca3_total 0] [X1 Variable:/Spine:cam_total 0];
	}
	Process PythonProcess( add_cam_ca3_total )
	{
		FireMethod	"P0.Value=(X1.Value+X2.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca3_total 1] [X0 Variable:/Spine:free_cam_ca3_total 0] [X2 Variable:/Spine:PP2B_camR_ca3 0] [X1 Variable:/Spine:CaMKII_camR_ca3 0];
	}
	Process PythonProcess( add_cam_ca3_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca3_totalRatio 1] [X0 Variable:/Spine:cam_ca3_total 0] [X1 Variable:/Spine:cam_total 0];
	}
	Process PythonProcess( add_free_camR_ca2_total )
	{
		FireMethod	"P0.Value=(X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_camR_ca2_total 1] [X3 Variable:/Spine:camR_ca2_AD 0] [X2 Variable:/Spine:camR_ca2_BC 0] [X1 Variable:/Spine:camR_ca2_BD 0] [X4 Variable:/Spine:camR_ca2_AC 0] [X5 Variable:/Spine:camR_ca2_AB 0] [X0 Variable:/Spine:camR_ca2_CD 0];
	}
	Process PythonProcess( add_free_camT_ca2_total )
	{
		FireMethod	"P0.Value=(X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_camT_ca2_total 1] [X2 Variable:/Spine:camT_ca2_BC 0] [X1 Variable:/Spine:camT_ca2_BD 0] [X5 Variable:/Spine:camT_ca2_AB 0] [X4 Variable:/Spine:camT_ca2_AC 0] [X0 Variable:/Spine:camT_ca2_CD 0] [X3 Variable:/Spine:camT_ca2_AD 0];
	}
	Process PythonProcess( add_free_cam_ca2_total )
	{
		FireMethod	"P0.Value=(X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_cam_ca2_total 1] [X0 Variable:/Spine:free_camT_ca2_total 0] [X1 Variable:/Spine:free_camR_ca2_total 0];
	}
###
	Process PythonProcess( add_CaMKII_camR_ca2 )
	{
		FireMethod	"P0.Value=(X23.Value+X22.Value+X21.Value+X20.Value+X19.Value+X18.Value+X17.Value+X16.Value+X15.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CaMKII_camR_ca2 1] [X13 Variable:/Spine:camR_ca2_BD_CaMKIIp 0] [X21 Variable:/Spine:camR_ca2_AD_CaMKII 0] [X12 Variable:/Spine:camR_ca2_CD_CaMKIIp 0] [X16 Variable:/Spine:camR_ca2_AC_CaMKIIp 0] [X9 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a 0] [X6 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a 0] [X14 Variable:/Spine:camR_ca2_BC_CaMKIIp 0] [X3 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp 0] [X0 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp 0] [X2 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp 0] [X23 Variable:/Spine:camR_ca2_AB_CaMKII 0] [X18 Variable:/Spine:camR_ca2_CD_CaMKII 0] [X20 Variable:/Spine:camR_ca2_BC_CaMKII 0] [X17 Variable:/Spine:camR_ca2_AB_CaMKIIp 0] [X19 Variable:/Spine:camR_ca2_BD_CaMKII 0] [X10 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a 0] [X4 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp 0] [X5 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp 0] [X7 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a 0] [X11 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a 0] [X22 Variable:/Spine:camR_ca2_AC_CaMKII 0] [X8 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a 0] [X15 Variable:/Spine:camR_ca2_AD_CaMKIIp 0] [X1 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp 0];
	}
###
	Process PythonProcess( add_PP2B_camR_ca2 )
	{
		FireMethod	"P0.Value=(X17.Value+X16.Value+X15.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:PP2B_camR_ca2 1] [X10 Variable:/Spine:Dp_camR_ca2_AC_PP2B 0] [X5 Variable:/Spine:PP1a_Dp_camR_ca2_AB_PP2B 0] [X16 Variable:/Spine:camR_ca2_AC_PP2B 0] [X6 Variable:/Spine:Dp_camR_ca2_CD_PP2B 0] [X3 Variable:/Spine:PP1a_Dp_camR_ca2_AD_PP2B 0] [X15 Variable:/Spine:camR_ca2_AD_PP2B 0] [X1 Variable:/Spine:PP1a_Dp_camR_ca2_BD_PP2B 0] [X11 Variable:/Spine:Dp_camR_ca2_AB_PP2B 0] [X12 Variable:/Spine:camR_ca2_CD_PP2B 0] [X0 Variable:/Spine:PP1a_Dp_camR_ca2_CD_PP2B 0] [X17 Variable:/Spine:camR_ca2_AB_PP2B 0] [X13 Variable:/Spine:camR_ca2_BD_PP2B 0] [X7 Variable:/Spine:Dp_camR_ca2_BD_PP2B 0] [X9 Variable:/Spine:Dp_camR_ca2_AD_PP2B 0] [X14 Variable:/Spine:camR_ca2_BC_PP2B 0] [X4 Variable:/Spine:PP1a_Dp_camR_ca2_AC_PP2B 0] [X8 Variable:/Spine:Dp_camR_ca2_BC_PP2B 0] [X2 Variable:/Spine:PP1a_Dp_camR_ca2_BC_PP2B 0];
	}
	Process PythonProcess( add_camR_ca2_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca2_total 1] [X1 Variable:/Spine:CaMKII_camR_ca2 0] [X2 Variable:/Spine:PP2B_camR_ca2 0] [X0 Variable:/Spine:free_camR_ca2_total 0];
	}
	Process PythonProcess( add_camR_ca2_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca2_ratio 1] [X1 Variable:/Spine:cam_total 0] [X0 Variable:/Spine:camR_ca2_total 0];
	}
	Process PythonProcess( add_cam_ca2_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca2_total 1] [X1 Variable:/Spine:CaMKII_camR_ca2 0] [X2 Variable:/Spine:PP2B_camR_ca2 0] [X0 Variable:/Spine:free_cam_ca2_total 0];
	}
	Process PythonProcess( add_cam_ca2_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca2_totalRatio 1] [X0 Variable:/Spine:cam_ca2_total 0] [X1 Variable:/Spine:cam_total 0];
	}
	Process PythonProcess( add_free_camR_ca1_total )
	{
		FireMethod	"P0.Value=(X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_camR_ca1_total 1] [X0 Variable:/Spine:camR_ca1_D 0] [X2 Variable:/Spine:camR_ca1_B 0] [X1 Variable:/Spine:camR_ca1_C 0] [X3 Variable:/Spine:camR_ca1_A 0];
	}
	Process PythonProcess( add_free_camT_ca1_total )
	{
		FireMethod	"P0.Value=(X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_camT_ca1_total 1] [X0 Variable:/Spine:camT_ca1_D 0] [X3 Variable:/Spine:camT_ca1_A 0] [X2 Variable:/Spine:camT_ca1_B 0] [X1 Variable:/Spine:camT_ca1_C 0];
	}
	Process PythonProcess( add_free_cam_ca1_total )
	{
		FireMethod	"P0.Value=(X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_cam_ca1_total 1] [X4 Variable:/Spine:camR_ca1_D 0] [X6 Variable:/Spine:camR_ca1_B 0] [X5 Variable:/Spine:camR_ca1_C 0] [X7 Variable:/Spine:camR_ca1_A 0] [X0 Variable:/Spine:camT_ca1_D 0] [X3 Variable:/Spine:camT_ca1_A 0] [X2 Variable:/Spine:camT_ca1_B 0] [X1 Variable:/Spine:camT_ca1_C 0];
	}
###
	Process PythonProcess( add_CaMKII_camR_ca1 )
	{
		FireMethod	"P0.Value=(X15.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CaMKII_camR_ca1 1] [X7 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a 0] [X5 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a 0] [X10 Variable:/Spine:camR_ca1_B_CaMKIIp 0] [X12 Variable:/Spine:camR_ca1_D_CaMKII 0] [X1 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp 0] [X6 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a 0] [X9 Variable:/Spine:camR_ca1_C_CaMKIIp 0] [X2 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp 0] [X8 Variable:/Spine:camR_ca1_D_CaMKIIp 0] [X11 Variable:/Spine:camR_ca1_A_CaMKIIp 0] [X4 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a 0] [X3 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp 0] [X15 Variable:/Spine:camR_ca1_A_CaMKII 0] [X13 Variable:/Spine:camR_ca1_C_CaMKII 0] [X14 Variable:/Spine:camR_ca1_B_CaMKII 0] [X0 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp 0];
	}
###
	Process PythonProcess( add_PP2B_camR_ca1 )
	{
		FireMethod	"P0.Value=(X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:PP2B_camR_ca1 1] [X11 Variable:/Spine:camR_ca1_A_PP2B 0] [X8 Variable:/Spine:camR_ca1_D_PP2B 0] [X1 Variable:/Spine:PP1a_Dp_camR_ca1_C_PP2B 0] [X6 Variable:/Spine:Dp_camR_ca1_B_PP2B 0] [X7 Variable:/Spine:Dp_camR_ca1_A_PP2B 0] [X4 Variable:/Spine:Dp_camR_ca1_D_PP2B 0] [X10 Variable:/Spine:camR_ca1_B_PP2B 0] [X0 Variable:/Spine:PP1a_Dp_camR_ca1_D_PP2B 0] [X9 Variable:/Spine:camR_ca1_C_PP2B 0] [X2 Variable:/Spine:PP1a_Dp_camR_ca1_B_PP2B 0] [X3 Variable:/Spine:PP1a_Dp_camR_ca1_A_PP2B 0] [X5 Variable:/Spine:Dp_camR_ca1_C_PP2B 0];
	}
	Process PythonProcess( add_camR_ca1_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca1_total 1] [X1 Variable:/Spine:CaMKII_camR_ca1 0] [X0 Variable:/Spine:free_camR_ca1_total 0] [X2 Variable:/Spine:PP2B_camR_ca1 0];
	}
	Process PythonProcess( add_camR_ca1_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca1_ratio 1] [X0 Variable:/Spine:camR_ca1_total 0] [X1 Variable:/Spine:cam_total 0];
	}
	Process PythonProcess( add_cam_ca1_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca1_total 1] [X1 Variable:/Spine:CaMKII_camR_ca1 0] [X2 Variable:/Spine:PP2B_camR_ca1 0] [X0 Variable:/Spine:free_cam_ca1_total 0];
	}
	Process PythonProcess( add_cam_ca1_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca1_totalRatio 1] [X1 Variable:/Spine:cam_total 0] [X0 Variable:/Spine:cam_ca1_total 0];
	}
	Process PythonProcess( add_free_cam_ca0_total )
	{
		FireMethod	"P0.Value=(X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:free_cam_ca0_total 1] [X1 Variable:/Spine:camR 0] [X0 Variable:/Spine:camT 0];
	}
###
	Process PythonProcess( add_camR_ca0_total )
	{
		FireMethod	"P0.Value=(X7.Value+X5.Value+X6.Value+X4.Value+X3.Value+X2.Value+X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca0_total 1] [X6 Variable:/Spine:camR_PP2B 0] [X5 Variable:/Spine:camR_CaMKII 0] [X7 Variable:/Spine:camR 0] [X0 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 0] [X4 Variable:/Spine:camR_CaMKIIp 0] [X3 Variable:/Spine:Dp_camR_PP2B 0] [X2 Variable:/Spine:camR_CaMKIIp_PP1a 0] [X1 Variable:/Spine:PP1a_Dp_camR_PP2B 0];
	}
	Process PythonProcess( add_camR_ca0_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_ca0_ratio 1] [X0 Variable:/Spine:camR_ca0_total 0] [X1 Variable:/Spine:cam_total 0];
	}
###
	Process PythonProcess( add_cam_ca0_total )
	{
		FireMethod	"P0.Value=(X8.Value+X7.Value+X5.Value+X6.Value+X4.Value+X3.Value+X2.Value+X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca0_total 1] [X6 Variable:/Spine:camR_PP2B 0] [X5 Variable:/Spine:camR_CaMKII 0] [X8 Variable:/Spine:camR 0] [X7 Variable:/Spine:camT 0] [X0 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 0] [X4 Variable:/Spine:camR_CaMKIIp 0] [X3 Variable:/Spine:Dp_camR_PP2B 0] [X2 Variable:/Spine:camR_CaMKIIp_PP1a 0] [X1 Variable:/Spine:PP1a_Dp_camR_PP2B 0];
	}
	Process PythonProcess( add_cam_ca0_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:cam_ca0_totalRatio 1] [X0 Variable:/Spine:cam_ca0_total 0] [X1 Variable:/Spine:cam_total 0];
	}
###
	Process PythonProcess( add_total_CaMKIIp )
	{
		FireMethod	"P0.Value=(X50.Value+X49.Value+X48.Value+X46.Value+X45.Value+X44.Value+X43.Value+X42.Value+X29.Value+X28.Value+X27.Value+X26.Value+X41.Value+X40.Value+X39.Value+X38.Value+X37.Value+X36.Value+X25.Value+X24.Value+X23.Value+X22.Value+X21.Value+X20.Value+X35.Value+X34.Value+X33.Value+X32.Value+X19.Value+X18.Value+X17.Value+X16.Value+X30.Value+X15.Value+X47.Value+X31.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:total_CaMKIIp 1] [X29 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a 0] [X27 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a 0] [X37 Variable:/Spine:camR_ca2_BD_CaMKIIp 0] [X48 Variable:/Spine:camR_CaMKIIp 0] [X16 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a 0] [X33 Variable:/Spine:camR_ca3_ACD_CaMKIIp 0] [X36 Variable:/Spine:camR_ca2_CD_CaMKIIp 0] [X28 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a 0] [X23 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a 0] [X13 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp 0] [X25 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a 0] [X19 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a 0] [X38 Variable:/Spine:camR_ca2_BC_CaMKIIp 0] [X8 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 0] [X5 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp 0] [X3 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp 0] [X44 Variable:/Spine:camR_ca1_B_CaMKIIp 0] [X7 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp 0] [X12 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp 0] [X17 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a 0] [X2 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp 0] [X31 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 0] [X26 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a 0] [X14 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp 0] [X50 Variable:/Spine:CaMKIIp 0] [X24 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a 0] [X9 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp 0] [X32 Variable:/Spine:camR_ca3_BCD_CaMKIIp 0] [X10 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp 0] [X49 Variable:/Spine:CaMKIIp_PP1a 0] [X42 Variable:/Spine:camR_ca1_D_CaMKIIp 0] [X43 Variable:/Spine:camR_ca1_C_CaMKIIp 0] [X21 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a 0] [X41 Variable:/Spine:camR_ca2_AB_CaMKIIp 0] [X35 Variable:/Spine:camR_ca3_ABC_CaMKIIp 0] [X20 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a 0] [X15 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 0] [X18 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a 0] [X30 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 0] [X22 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a 0] [X39 Variable:/Spine:camR_ca2_AD_CaMKIIp 0] [X34 Variable:/Spine:camR_ca3_ABD_CaMKIIp 0] [X1 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp 0] [X6 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp 0] [X45 Variable:/Spine:camR_ca1_A_CaMKIIp 0] [X47 Variable:/Spine:CaMKIIp_PP1a_Dp 0] [X46 Variable:/Spine:camR_CaMKIIp_PP1a 0] [X40 Variable:/Spine:camR_ca2_AC_CaMKIIp 0] [X4 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp 0] [X11 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp 0];
	}
###
	Process PythonProcess( add_CaMKIIpbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CaMKIIpbar 1] [X0 Variable:/Spine:total_CaMKIIp 0] [X1 Variable:/Spine:totalCaMKII 0];
	}
###bound means bound to camR*
	Process PythonProcess( add_total_CaMKII_bound )
	{
		FireMethod	"P0.Value=(X10.Value+X8.Value+X7.Value+X6.Value+X4.Value+X9.Value+X5.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:total_CaMKII_bound 1] [X2 Variable:/Spine:camR_ca4_ABCD_CaMKIIp 0] [X10 Variable:/Spine:camR_CaMKII 0] [X7 Variable:/Spine:CaMKII_camR_ca2 0] [X6 Variable:/Spine:CaMKII_camR_ca3 0] [X8 Variable:/Spine:CaMKII_camR_ca1 0] [X3 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 0] [X9 Variable:/Spine:camR_CaMKIIp 0] [X4 Variable:/Spine:camR_ca4_ABCD_CaMKII 0] [X1 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 0] [X5 Variable:/Spine:camR_CaMKIIp_PP1a 0];
	}
	Process PythonProcess( add_total_CaMKII_active )
	{
		FireMethod	"P0.Value=X0.Value+X3.Value+X2.Value+X1.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:total_CaMKII_active 1] [X1 Variable:/Spine:CaMKIIp_PP1a_Dp 0] [X2 Variable:/Spine:CaMKIIp_PP1a 0] [X0 Variable:/Spine:total_CaMKII_bound 0] [X3 Variable:/Spine:CaMKIIp 0];
	}
###
	Process PythonProcess( add_totalCaMKII )
	{
		FireMethod	"P0.Value=(X0.Value+X4.Value+X3.Value+X2.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totalCaMKII 1] [X4 Variable:/Spine:CaMKII 0] [X1 Variable:/Spine:CaMKIIp_PP1a_Dp 0] [X2 Variable:/Spine:CaMKIIp_PP1a 0] [X0 Variable:/Spine:total_CaMKII_bound 0] [X3 Variable:/Spine:CaMKIIp 0];
	}
###update to activatedCaMKII/totalCaMKII
	Process PythonProcess( add_CaMKIIbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CaMKIIbar 1] [X1 Variable:/Spine:totalCaMKII 0] [X0 Variable:/Spine:total_CaMKII_active 0];
	}
	Process PythonProcess( add_camCaMKIIbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camCaMKIIbar 1] [X0 Variable:/Spine:total_CaMKII_bound 0] [X1 Variable:/Spine:cam_total 0];
	}
	Process PythonProcess( add_camPP2Bbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camPP2Bbar 1] [X0 Variable:/Spine:total_PP2B_bound 0] [X1 Variable:/Spine:cam_total 0];
	}
###
	Process PythonProcess( add_total_PP2B_bound )
	{
		FireMethod	"P0.Value=(X8.Value+X6.Value+X5.Value+X4.Value+X2.Value+X7.Value+X1.Value+X3.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:total_PP2B_bound 1] [X0 Variable:/Spine:PP1a_Dp_camR_ca4_ABCD_PP2B 0] [X8 Variable:/Spine:camR_PP2B 0] [X3 Variable:/Spine:PP1a_Dp_camR_PP2B 0] [X1 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B 0] [X2 Variable:/Spine:camR_ca4_ABCD_PP2B 0] [X5 Variable:/Spine:PP2B_camR_ca2 0] [X4 Variable:/Spine:PP2B_camR_ca3 0] [X6 Variable:/Spine:PP2B_camR_ca1 0] [X7 Variable:/Spine:Dp_camR_PP2B 0];
	}
	Process PythonProcess( add_totalPP2B )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totalPP2B 1] [X0 Variable:/Spine:total_PP2B_bound 0] [X1 Variable:/Spine:PP2B 0];
	}
	Process PythonProcess( add_PP2Bbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:PP2Bbar 1] [X0 Variable:/Spine:total_PP2B_bound 0] [X1 Variable:/Spine:totalPP2B 0];
	}
	Process PythonProcess( add_camR_unbound )
	{
		FireMethod	"P0.Value=(X15.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:camR_unbound 1] [X8 Variable:/Spine:camR_ca2_AD 0] [X7 Variable:/Spine:camR_ca2_BC 0] [X6 Variable:/Spine:camR_ca2_BD 0] [X9 Variable:/Spine:camR_ca2_AC 0] [X2 Variable:/Spine:camR_ca3_ACD 0] [X5 Variable:/Spine:camR_ca2_CD 0] [X15 Variable:/Spine:camR 0] [X11 Variable:/Spine:camR_ca1_D 0] [X10 Variable:/Spine:camR_ca2_AB 0] [X13 Variable:/Spine:camR_ca1_B 0] [X12 Variable:/Spine:camR_ca1_C 0] [X0 Variable:/Spine:camR_ca4_ABCD 0] [X14 Variable:/Spine:camR_ca1_A 0] [X1 Variable:/Spine:camR_ca3_BCD 0] [X3 Variable:/Spine:camR_ca3_ABD 0] [X4 Variable:/Spine:camR_ca3_ABC 0];
	}
	Process PythonProcess( add_totalcamR )
	{
		FireMethod	"P0.Value=(X2.Value+X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totalcamR 1] [X1 Variable:/Spine:total_PP2B_bound 0] [X0 Variable:/Spine:total_CaMKII_bound 0] [X2 Variable:/Spine:camR_unbound 0];
	}
	Process PythonProcess( add_totalcamT )
	{
		FireMethod	"P0.Value=(X15.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totalcamT 1] [X2 Variable:/Spine:camT_ca3_ACD 0] [X12 Variable:/Spine:camT_ca1_C 0] [X3 Variable:/Spine:camT_ca3_ABD 0] [X4 Variable:/Spine:camT_ca3_ABC 0] [X10 Variable:/Spine:camT_ca2_AB 0] [X15 Variable:/Spine:camT 0] [X11 Variable:/Spine:camT_ca1_D 0] [X7 Variable:/Spine:camT_ca2_BC 0] [X6 Variable:/Spine:camT_ca2_BD 0] [X5 Variable:/Spine:camT_ca2_CD 0] [X9 Variable:/Spine:camT_ca2_AC 0] [X0 Variable:/Spine:camT_ca4_ABCD 0] [X8 Variable:/Spine:camT_ca2_AD 0] [X14 Variable:/Spine:camT_ca1_A 0] [X13 Variable:/Spine:camT_ca1_B 0] [X1 Variable:/Spine:camT_ca3_BCD 0];
	}
	Process PythonProcess( add_Rbar )
	{
		FireMethod	"P0.Value=(X1.Value/(X1.Value+X0.Value))";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:Rbar 1] [X1 Variable:/Spine:totalcamR 0] [X0 Variable:/Spine:totalcamT 0];
	}
	Process PythonProcess( add_moles_bound_ca_per_moles_cam )
	{
		FireMethod	"P0.Value=((((4.0)*X3.Value)+((3.0)*X2.Value)+((2.0)*X1.Value)+X0.Value)/X4.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:moles_bound_ca_per_moles_cam 1] [X2 Variable:/Spine:cam_ca3_total 0] [X4 Variable:/Spine:cam_total 0] [X1 Variable:/Spine:cam_ca2_total 0] [X3 Variable:/Spine:cam_ca4_total 0] [X0 Variable:/Spine:cam_ca1_total 0];
	}
	Process PythonProcess( add_epsilon )
	{
		FireMethod	"P0.Value=(X1.Value/(X1.Value+X0.Value))";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:epsilon 1] [X1 Variable:/Spine:camR 0] [X0 Variable:/Spine:camT 0];
	}
	Process PythonProcess( add_ybar )
	{
		FireMethod	"P0.Value=(X0.Value/(4.0))";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:ybar 1] [X0 Variable:/Spine:moles_bound_ca_per_moles_cam 0];
	}
	Process PythonProcess( add_ybar_div__1_minus_ybar )
	{
		FireMethod	"P0.Value=(X0.Value/((1.0)-X0.Value))";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:ybar_div__1_minus_ybar 1] [X0 Variable:/Spine:ybar 0];
	}
	Process PythonProcess( add_totD )
	{
		FireMethod	"P0.Value=X52.Value+X51.Value+X50.Value+X48.Value+X45.Value+X44.Value+X43.Value+X42.Value+X41.Value+X40.Value+X39.Value+X38.Value+X37.Value+X36.Value+X35.Value+X34.Value+X33.Value+X32.Value+X30.Value+X49.Value+X47.Value+X31.Value+X15.Value+X14.Value+X13.Value+X12.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value+X46.Value+X29.Value+X28.Value+X27.Value+X26.Value+X25.Value+X24.Value+X23.Value+X22.Value+X21.Value+X20.Value+X19.Value+X18.Value+X17.Value+X16.Value+X11.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totD 1] [X36 Variable:/Spine:Dp_camR_ca2_CD_PP2B 0] [X35 Variable:/Spine:Dp_camR_ca3_ABC_PP2B 0] [X13 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp 0] [X30 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B 0] [X23 Variable:/Spine:PP1a_Dp_camR_ca2_AD_PP2B 0] [X44 Variable:/Spine:Dp_camR_ca1_B_PP2B 0] [X14 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp 0] [X19 Variable:/Spine:PP1a_Dp_camR_ca3_ABC_PP2B 0] [X39 Variable:/Spine:Dp_camR_ca2_AD_PP2B 0] [X25 Variable:/Spine:PP1a_Dp_camR_ca2_AB_PP2B 0] [X50 Variable:/Spine:D_PKA 0] [X8 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp 0] [X26 Variable:/Spine:PP1a_Dp_camR_ca1_D_PP2B 0] [X40 Variable:/Spine:Dp_camR_ca2_AC_PP2B 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 0] [X43 Variable:/Spine:Dp_camR_ca1_C_PP2B 0] [X52 Variable:/Spine:D 0] [X5 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp 0] [X3 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp 0] [X7 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp 0] [X18 Variable:/Spine:PP1a_Dp_camR_ca3_ABD_PP2B 0] [X47 Variable:/Spine:CaMKIIp_PP1a_Dp 0] [X45 Variable:/Spine:Dp_camR_ca1_A_PP2B 0] [X42 Variable:/Spine:Dp_camR_ca1_D_PP2B 0] [X41 Variable:/Spine:Dp_camR_ca2_AB_PP2B 0] [X2 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp 0] [X31 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 0] [X15 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp 0] [X37 Variable:/Spine:Dp_camR_ca2_BD_PP2B 0] [X27 Variable:/Spine:PP1a_Dp_camR_ca1_C_PP2B 0] [X9 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp 0] [X51 Variable:/Spine:Dp 0] [X11 Variable:/Spine:PP1a_Dp_camR_ca4_ABCD_PP2B 0] [X10 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp 0] [X20 Variable:/Spine:PP1a_Dp_camR_ca2_CD_PP2B 0] [X33 Variable:/Spine:Dp_camR_ca3_ACD_PP2B 0] [X46 Variable:/Spine:PP1a_Dp_camR_PP2B 0] [X32 Variable:/Spine:Dp_camR_ca3_BCD_PP2B 0] [X49 Variable:/Spine:PP1a_Dp 0] [X21 Variable:/Spine:PP1a_Dp_camR_ca2_BD_PP2B 0] [X16 Variable:/Spine:PP1a_Dp_camR_ca3_BCD_PP2B 0] [X17 Variable:/Spine:PP1a_Dp_camR_ca3_ACD_PP2B 0] [X28 Variable:/Spine:PP1a_Dp_camR_ca1_B_PP2B 0] [X29 Variable:/Spine:PP1a_Dp_camR_ca1_A_PP2B 0] [X38 Variable:/Spine:Dp_camR_ca2_BC_PP2B 0] [X22 Variable:/Spine:PP1a_Dp_camR_ca2_BC_PP2B 0] [X48 Variable:/Spine:Dp_camR_PP2B 0] [X1 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp 0] [X6 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp 0] [X34 Variable:/Spine:Dp_camR_ca3_ABD_PP2B 0] [X4 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp 0] [X24 Variable:/Spine:PP1a_Dp_camR_ca2_AC_PP2B 0] [X12 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp 0];
	}
	Process PythonProcess( add_totDp )
	{
		FireMethod	"P0.Value=X50.Value+X48.Value+X45.Value+X44.Value+X43.Value+X42.Value+X41.Value+X40.Value+X39.Value+X38.Value+X37.Value+X36.Value+X35.Value+X34.Value+X33.Value+X32.Value+X30.Value+X49.Value+X47.Value+X31.Value+X15.Value+X14.Value+X13.Value+X12.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value+X46.Value+X29.Value+X28.Value+X27.Value+X26.Value+X25.Value+X24.Value+X23.Value+X22.Value+X21.Value+X20.Value+X19.Value+X18.Value+X17.Value+X16.Value+X11.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totDp 1] [X36 Variable:/Spine:Dp_camR_ca2_CD_PP2B 0] [X35 Variable:/Spine:Dp_camR_ca3_ABC_PP2B 0] [X13 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp 0] [X30 Variable:/Spine:Dp_camR_ca4_ABCD_PP2B 0] [X23 Variable:/Spine:PP1a_Dp_camR_ca2_AD_PP2B 0] [X44 Variable:/Spine:Dp_camR_ca1_B_PP2B 0] [X14 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp 0] [X19 Variable:/Spine:PP1a_Dp_camR_ca3_ABC_PP2B 0] [X39 Variable:/Spine:Dp_camR_ca2_AD_PP2B 0] [X25 Variable:/Spine:PP1a_Dp_camR_ca2_AB_PP2B 0] [X8 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp 0] [X26 Variable:/Spine:PP1a_Dp_camR_ca1_D_PP2B 0] [X40 Variable:/Spine:Dp_camR_ca2_AC_PP2B 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 0] [X43 Variable:/Spine:Dp_camR_ca1_C_PP2B 0] [X5 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp 0] [X3 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp 0] [X7 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp 0] [X18 Variable:/Spine:PP1a_Dp_camR_ca3_ABD_PP2B 0] [X47 Variable:/Spine:CaMKIIp_PP1a_Dp 0] [X45 Variable:/Spine:Dp_camR_ca1_A_PP2B 0] [X42 Variable:/Spine:Dp_camR_ca1_D_PP2B 0] [X41 Variable:/Spine:Dp_camR_ca2_AB_PP2B 0] [X2 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp 0] [X31 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 0] [X15 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp 0] [X37 Variable:/Spine:Dp_camR_ca2_BD_PP2B 0] [X27 Variable:/Spine:PP1a_Dp_camR_ca1_C_PP2B 0] [X9 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp 0] [X50 Variable:/Spine:Dp 0] [X11 Variable:/Spine:PP1a_Dp_camR_ca4_ABCD_PP2B 0] [X10 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp 0] [X20 Variable:/Spine:PP1a_Dp_camR_ca2_CD_PP2B 0] [X33 Variable:/Spine:Dp_camR_ca3_ACD_PP2B 0] [X46 Variable:/Spine:PP1a_Dp_camR_PP2B 0] [X32 Variable:/Spine:Dp_camR_ca3_BCD_PP2B 0] [X49 Variable:/Spine:PP1a_Dp 0] [X21 Variable:/Spine:PP1a_Dp_camR_ca2_BD_PP2B 0] [X16 Variable:/Spine:PP1a_Dp_camR_ca3_BCD_PP2B 0] [X17 Variable:/Spine:PP1a_Dp_camR_ca3_ACD_PP2B 0] [X28 Variable:/Spine:PP1a_Dp_camR_ca1_B_PP2B 0] [X29 Variable:/Spine:PP1a_Dp_camR_ca1_A_PP2B 0] [X38 Variable:/Spine:Dp_camR_ca2_BC_PP2B 0] [X22 Variable:/Spine:PP1a_Dp_camR_ca2_BC_PP2B 0] [X48 Variable:/Spine:Dp_camR_PP2B 0] [X1 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp 0] [X6 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp 0] [X34 Variable:/Spine:Dp_camR_ca3_ABD_PP2B 0] [X4 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp 0] [X24 Variable:/Spine:PP1a_Dp_camR_ca2_AC_PP2B 0] [X12 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp 0];
	}
	Process PythonProcess( add_Dpbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:Dpbar 1] [X0 Variable:/Spine:totDp 0] [X1 Variable:/Spine:totD 0];
	}
	Process PythonProcess( add_totPP1 )
	{
		FireMethod	"P0.Value=X51.Value+X50.Value+X49.Value+X47.Value+X44.Value+X43.Value+X42.Value+X41.Value+X36.Value+X35.Value+X34.Value+X33.Value+X32.Value+X31.Value+X24.Value+X23.Value+X22.Value+X21.Value+X16.Value+X48.Value+X45.Value+X15.Value+X14.Value+X13.Value+X12.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value+X46.Value+X40.Value+X39.Value+X38.Value+X37.Value+X30.Value+X29.Value+X28.Value+X27.Value+X26.Value+X25.Value+X20.Value+X19.Value+X18.Value+X17.Value+X11.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totPP1 1] [X44 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a 0] [X42 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a 0] [X51 Variable:/Spine:PP1a 0] [X13 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a_Dp 0] [X28 Variable:/Spine:PP1a_Dp_camR_ca2_AD_PP2B 0] [X34 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a 0] [X14 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a_Dp 0] [X20 Variable:/Spine:PP1a_Dp_camR_ca3_ABC_PP2B 0] [X31 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a 0] [X24 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a 0] [X8 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a_Dp 0] [X37 Variable:/Spine:PP1a_Dp_camR_ca1_D_PP2B 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a_Dp 0] [X5 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a_Dp 0] [X3 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a_Dp 0] [X40 Variable:/Spine:PP1a_Dp_camR_ca1_A_PP2B 0] [X7 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a_Dp 0] [X19 Variable:/Spine:PP1a_Dp_camR_ca3_ABD_PP2B 0] [X22 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a 0] [X49 Variable:/Spine:CaMKIIp_PP1a 0] [X36 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a 0] [X2 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a_Dp 0] [X45 Variable:/Spine:camR_CaMKIIp_PP1a_Dp 0] [X41 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a 0] [X15 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a_Dp 0] [X35 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a 0] [X9 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a_Dp 0] [X47 Variable:/Spine:camR_CaMKIIp_PP1a 0] [X11 Variable:/Spine:PP1a_Dp_camR_ca4_ABCD_PP2B 0] [X10 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a_Dp 0] [X25 Variable:/Spine:PP1a_Dp_camR_ca2_CD_PP2B 0] [X38 Variable:/Spine:PP1a_Dp_camR_ca1_C_PP2B 0] [X46 Variable:/Spine:PP1a_Dp_camR_PP2B 0] [X50 Variable:/Spine:PP1a_Dp 0] [X43 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a 0] [X26 Variable:/Spine:PP1a_Dp_camR_ca2_BD_PP2B 0] [X17 Variable:/Spine:PP1a_Dp_camR_ca3_BCD_PP2B 0] [X32 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a 0] [X30 Variable:/Spine:PP1a_Dp_camR_ca2_AB_PP2B 0] [X18 Variable:/Spine:PP1a_Dp_camR_ca3_ACD_PP2B 0] [X39 Variable:/Spine:PP1a_Dp_camR_ca1_B_PP2B 0] [X16 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 0] [X23 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a 0] [X27 Variable:/Spine:PP1a_Dp_camR_ca2_BC_PP2B 0] [X33 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a 0] [X21 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a 0] [X1 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a_Dp 0] [X6 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a_Dp 0] [X48 Variable:/Spine:CaMKIIp_PP1a_Dp 0] [X4 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a_Dp 0] [X29 Variable:/Spine:PP1a_Dp_camR_ca2_AC_PP2B 0] [X12 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a_Dp 0];
	}
	Process PythonProcess( add_totPP1a )
	{
		FireMethod	"P0.Value=X17.Value+X16.Value+X15.Value+X14.Value+X13.Value+X12.Value+X11.Value+X10.Value+X9.Value+X8.Value+X7.Value+X6.Value+X5.Value+X4.Value+X3.Value+X2.Value+X1.Value+X0.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:totPP1a 1] [X14 Variable:/Spine:camR_ca1_A_CaMKIIp_PP1a 0] [X12 Variable:/Spine:camR_ca1_C_CaMKIIp_PP1a 0] [X16 Variable:/Spine:CaMKIIp_PP1a 0] [X7 Variable:/Spine:camR_ca2_BC_CaMKIIp_PP1a 0] [X1 Variable:/Spine:camR_ca3_BCD_CaMKIIp_PP1a 0] [X15 Variable:/Spine:camR_CaMKIIp_PP1a 0] [X13 Variable:/Spine:camR_ca1_B_CaMKIIp_PP1a 0] [X8 Variable:/Spine:camR_ca2_AD_CaMKIIp_PP1a 0] [X2 Variable:/Spine:camR_ca3_ACD_CaMKIIp_PP1a 0] [X11 Variable:/Spine:camR_ca1_D_CaMKIIp_PP1a 0] [X10 Variable:/Spine:camR_ca2_AB_CaMKIIp_PP1a 0] [X4 Variable:/Spine:camR_ca3_ABC_CaMKIIp_PP1a 0] [X6 Variable:/Spine:camR_ca2_BD_CaMKIIp_PP1a 0] [X17 Variable:/Spine:PP1a 0] [X9 Variable:/Spine:camR_ca2_AC_CaMKIIp_PP1a 0] [X5 Variable:/Spine:camR_ca2_CD_CaMKIIp_PP1a 0] [X0 Variable:/Spine:camR_ca4_ABCD_CaMKIIp_PP1a 0] [X3 Variable:/Spine:camR_ca3_ABD_CaMKIIp_PP1a 0];
	}
	Process PythonProcess( add_PP1abar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:PP1abar 1] [X1 Variable:/Spine:totPP1 0] [X0 Variable:/Spine:totPP1a 0];
	}
	Process PythonProcess( add_CBPfastbar )
	{
		FireMethod	"P0.Value=X1.Value/X0.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CBPfastbar 1] [X1 Variable:/Spine:CBPfastca 0] [X0 Variable:/Spine:CBPfasttotal 0];
	}
	Process PythonProcess( add_CBPmediabar )
	{
		FireMethod	"P0.Value=X1.Value/X0.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CBPmediabar 1] [X1 Variable:/Spine:CBPmediaca 0] [X0 Variable:/Spine:CBPmediatotal 0];
	}
	Process PythonProcess( add_CBPslowbar )
	{
		FireMethod	"P0.Value=X1.Value/X0.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CBPslowbar 1] [X0 Variable:/Spine:CBPslowtotal 0] [X1 Variable:/Spine:CBPslowca 0];
	}
	Process PythonProcess( add_CBPvslowbar )
	{
		FireMethod	"P0.Value=X1.Value/X0.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:CBPvslowbar 1] [X1 Variable:/Spine:CBPvslowca 0] [X0 Variable:/Spine:CBPvslowtotal 0];
	}
	Process PythonProcess( add_PKA )
	{
		FireMethod	"P0.Value=X1.Value+X0.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:PKAinmodel 1] [X1 Variable:/Spine:PKA 0] [X0 Variable:/Spine:D_PKA 0];
	}
	Process PythonProcess( add_PKAbar )
	{
		FireMethod	"P0.Value=X0.Value/X1.Value";
		StepperID	Passive;
		VariableReferenceList	[P0 Variable:/Spine:PKAbar 1] [X1 Variable:/Spine:totPKA 0] [X0 Variable:/Spine:PKAinmodel 0];
	}
	
	# Calculating the variation of the AMPAR
	Process ExpressionFluxProcess( AMPAR_Phosphorylation )
	{
        	
		StepperID	@(MAIN_STEPPER);
        kcat 0.5; # Supplemental Material Hayer and Bhalla 2005
        KM  90.0001e-6; # (transforming uM in M) Supplemental Material Hayer and Bhalla 2005
        n 4; # For cooperativity.
        
        Expression	"kcat * S1.MolarConc * pow(S0.MolarConc, n) / (pow(KM, n) + pow(S0.MolarConc, n))";
								
		VariableReferenceList	 	[S0 Variable:/Spine:total_CaMKII_active 0]
		                            [S1 Variable:/Spine:AMPAR -1]
		                            [P0 Variable:/Spine:AMPAR_P 1];
	}
	
	Process ExpressionFluxProcess( AMPAR_Dephosphorylation )
	{
        	
		StepperID	@(MAIN_STEPPER);
        kcat 2; 
        KM 4.97061e-6; # (transofmring uM in M. From Hayer and Bhalla 2005)
        n 4;
        
        Expression	"kcat * S1.MolarConc * pow(S0.MolarConc, n) / (pow(KM, n) + pow(S0.MolarConc, n))";
								
		VariableReferenceList	 	[S0 Variable:/Spine:total_PP2B_bound 0]
		                            [S1 Variable:/Spine:AMPAR_P -1]
		                            [P0 Variable:/Spine:AMPAR 1];
	}
	

}
