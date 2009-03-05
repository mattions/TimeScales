
# created by eml2em program
# from file: biomd183.eml, date: Tue Mar  3 14:31:32 2009
#

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
	# no property
}

System System( / )
{
	StepperID	DE1;

	Variable Variable( SIZE )
	{
		Value	1;
	}
	
	
}

System System( /Spine )
{
	StepperID	DE1;

	Variable Variable( SIZE )
	{
		Value	1e-15;
	}
	
	Variable Variable( camR )
	{
		MolarConc	1.45e-9;
		Value	0.8729;
	}
	
	Variable Variable( ca )
	{
		MolarConc	1e-8;
		Value	6.02;
	}
	
	Variable Variable( camR_ca1_A )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_C )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_D )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AB )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AC )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_BC )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_BD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_CD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ABC )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ABD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ACD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_BCD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca4_ABCD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT )
	{
		MolarConc	3e-5;
		Value	18060.0;
	}
	
	Variable Variable( camT_ca1_A )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca1_B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca1_C )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca1_D )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca2_AB )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca2_AC )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca2_AD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca2_BC )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca2_BD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca2_CD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca3_ABC )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca3_ABD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca3_ACD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca3_BCD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camT_ca4_ABCD )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( CaMKII )
	{
		MolarConc	7e-5;
		Value	42140.0;
	}
	
	Variable Variable( camR_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_A_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_B_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_C_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_D_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AB_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AC_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AD_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_BC_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_BD_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_CD_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ABC_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ABD_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ACD_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_BCD_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca4_ABCD_CaMKII )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( PP2B )
	{
		MolarConc	1.6e-6;
		Value	963.2;
	}
	
	Variable Variable( camR_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_A_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_B_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_C_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_D_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AB_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AC_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_AD_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_BC_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_BD_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_CD_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ABC_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ABD_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ACD_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_BCD_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca4_ABCD_PP2B )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( free_cam_ca4_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca4_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca4_ratio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca4_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca4_totalRatio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( free_camR_ca3_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( free_camT_ca3_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( free_cam_ca3_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( CaMKII_camR_ca3 )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( PP2B_camR_ca3 )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca3_ratio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca3_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca3_totalRatio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( free_camR_ca2_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( free_camT_ca2_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( free_cam_ca2_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( CaMKII_camR_ca2 )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( PP2B_camR_ca2 )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca2_ratio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca2_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca2_totalRatio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( free_camR_ca1_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( free_camT_ca1_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( free_cam_ca1_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( CaMKII_camR_ca1 )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( PP2B_camR_ca1 )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca1_ratio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca1_total )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca1_totalRatio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( free_cam_ca0_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca0_total )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( camR_ca0_ratio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( cam_ca0_total )
	{
		MolarConc	2.000097e-07;
		Value	120.4058394;
	}
	
	Variable Variable( cam_ca0_totalRatio )
	{
		MolarConc	0.0;
		Value	0.0;
	}
	
	Variable Variable( cam_total )
	{
		MolarConc	2.000097e-07;
		Value	120.4058394;
	}
	
	Variable Variable( total_CaMKII_bound )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( totalCaMKII )
	{
		MolarConc	7e-05;
		Value	42140.0;
	}
	
	Variable Variable( CaMKIIbar )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( total_PP2B_bound )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( totalPP2B )
	{
		MolarConc	1.6e-06;
		Value	963.2;
	}
	
	Variable Variable( PP2Bbar )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( camR_unbound )
	{
		MolarConc	9.7e-12;
		Value	0.0058394;
	}
	
	Variable Variable( totalcamR )
	{
		MolarConc	9.7e-12;
		Value	0.0058394;
	}
	
	Variable Variable( totalcamT )
	{
		MolarConc	2e-07;
		Value	120.4;
	}
	
	Variable Variable( Rbar )
	{
		MolarConc	4.84976478640786e-05;
		Value	29195.5840142;
	}
	
	Variable Variable( moles_bound_ca_per_moles_cam )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( epsilon )
	{
		MolarConc	4.84976478640786e-05;
		Value	29195.5840142;
	}
	
	Variable Variable( ybar )
	{
		MolarConc	0;
		Value	0.0;
	}
	
	Variable Variable( ybar_div__1_minus_ybar )
	{
		MolarConc	0;
		Value	0.0;
	}
	
# commentig out the calcium process

#	Process ExpressionFluxProcess( ca_pump )
#	{
#		C	1e-08;
#		n	1;
#		t	0.0048;
#		StepperID	DE1;
#		Expression	"((pow((S0.MolarConc-C),n))/t)*self.getSuperSystem().SizeN_A";
#		VariableReferenceList	[ S0 Variable:/Spine:ca -1 ];
#	}
	
#	Process ConstantFluxProcess( ca_in )
#	{
#		k	0.0;
#		StepperID	DE1;
#		VariableReferenceList	[ P0 Variable:/Spine:ca 1 ];
#	}
	
	Process MassActionFluxProcess( reaction_0 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_A 1 ];
	}
	
	Process MassActionFluxProcess( reaction_1 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_2 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_C 1 ];
	}
	
	Process MassActionFluxProcess( reaction_3 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_D 1 ];
	}
	
	Process MassActionFluxProcess( reaction_4 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A -1 ] [ P0 Variable:/Spine:camR 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_5 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B -1 ] [ P0 Variable:/Spine:camR 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_6 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C -1 ] [ P0 Variable:/Spine:camR 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_7 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D -1 ] [ P0 Variable:/Spine:camR 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_8 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AB 1 ];
	}
	
	Process MassActionFluxProcess( reaction_9 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_10 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_11 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AB 1 ];
	}
	
	Process MassActionFluxProcess( reaction_12 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_13 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_14 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_15 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_16 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_CD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_17 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_18 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_19 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_CD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_20 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB -1 ] [ P0 Variable:/Spine:camR_ca1_A 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_21 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC -1 ] [ P0 Variable:/Spine:camR_ca1_A 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_22 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD -1 ] [ P0 Variable:/Spine:camR_ca1_A 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_23 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB -1 ] [ P0 Variable:/Spine:camR_ca1_B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_24 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC -1 ] [ P0 Variable:/Spine:camR_ca1_B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_25 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD -1 ] [ P0 Variable:/Spine:camR_ca1_B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_26 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC -1 ] [ P0 Variable:/Spine:camR_ca1_C 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_27 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC -1 ] [ P0 Variable:/Spine:camR_ca1_C 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_28 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD -1 ] [ P0 Variable:/Spine:camR_ca1_C 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_29 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD -1 ] [ P0 Variable:/Spine:camR_ca1_D 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_30 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD -1 ] [ P0 Variable:/Spine:camR_ca1_D 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_31 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD -1 ] [ P0 Variable:/Spine:camR_ca1_D 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_32 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_33 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_34 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_35 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_36 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_37 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_38 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_39 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_40 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_41 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_42 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_43 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_44 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC -1 ] [ P0 Variable:/Spine:camR_ca2_BC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_45 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC -1 ] [ P0 Variable:/Spine:camR_ca2_AC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_46 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC -1 ] [ P0 Variable:/Spine:camR_ca2_AB 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_47 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD -1 ] [ P0 Variable:/Spine:camR_ca2_BD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_48 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD -1 ] [ P0 Variable:/Spine:camR_ca2_AD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_49 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD -1 ] [ P0 Variable:/Spine:camR_ca2_AB 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_50 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD -1 ] [ P0 Variable:/Spine:camR_ca2_CD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_51 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD -1 ] [ P0 Variable:/Spine:camR_ca2_AD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_52 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD -1 ] [ P0 Variable:/Spine:camR_ca2_AC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_53 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD -1 ] [ P0 Variable:/Spine:camR_ca2_CD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_54 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD -1 ] [ P0 Variable:/Spine:camR_ca2_BD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_55 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD -1 ] [ P0 Variable:/Spine:camR_ca2_BC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_56 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_57 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_58 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_59 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_60 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD -1 ] [ P0 Variable:/Spine:camR_ca3_ABC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_61 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD -1 ] [ P0 Variable:/Spine:camR_ca3_ABD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_62 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD -1 ] [ P0 Variable:/Spine:camR_ca3_ACD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_63 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD -1 ] [ P0 Variable:/Spine:camR_ca3_BCD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_64 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca1_A 1 ];
	}
	
	Process MassActionFluxProcess( reaction_65 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca1_B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_66 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca1_C 1 ];
	}
	
	Process MassActionFluxProcess( reaction_67 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca1_D 1 ];
	}
	
	Process MassActionFluxProcess( reaction_68 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_A -1 ] [ P0 Variable:/Spine:camT 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_69 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_B -1 ] [ P0 Variable:/Spine:camT 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_70 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_C -1 ] [ P0 Variable:/Spine:camT 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_71 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_D -1 ] [ P0 Variable:/Spine:camT 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_72 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_A -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_AB 1 ];
	}
	
	Process MassActionFluxProcess( reaction_73 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_A -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_AC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_74 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_A -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_AD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_75 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_AB 1 ];
	}
	
	Process MassActionFluxProcess( reaction_76 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_BC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_77 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_BD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_78 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_C -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_AC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_79 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_C -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_BC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_80 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_C -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_CD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_81 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_D -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_AD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_82 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_D -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_BD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_83 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_D -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca2_CD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_84 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AB -1 ] [ P0 Variable:/Spine:camT_ca1_B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_85 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AB -1 ] [ P0 Variable:/Spine:camT_ca1_A 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_86 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AC -1 ] [ P0 Variable:/Spine:camT_ca1_C 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_87 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AC -1 ] [ P0 Variable:/Spine:camT_ca1_A 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_88 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AD -1 ] [ P0 Variable:/Spine:camT_ca1_D 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_89 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AD -1 ] [ P0 Variable:/Spine:camT_ca1_A 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_90 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BC -1 ] [ P0 Variable:/Spine:camT_ca1_C 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_91 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BC -1 ] [ P0 Variable:/Spine:camT_ca1_B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_92 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BD -1 ] [ P0 Variable:/Spine:camT_ca1_D 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_93 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BD -1 ] [ P0 Variable:/Spine:camT_ca1_B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_94 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_CD -1 ] [ P0 Variable:/Spine:camT_ca1_D 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_95 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_CD -1 ] [ P0 Variable:/Spine:camT_ca1_C 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_96 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AB -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ABC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_97 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AB -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ABD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_98 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ABC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_99 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ACD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_100 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ABD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_101 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ACD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_102 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ABC 1 ];
	}
	
	Process MassActionFluxProcess( reaction_103 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_BCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_104 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ABD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_105 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_BCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_106 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_CD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_ACD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_107 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_CD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca3_BCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_108 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABC -1 ] [ P0 Variable:/Spine:camT_ca2_AC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_109 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABC -1 ] [ P0 Variable:/Spine:camT_ca2_BC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_110 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABD -1 ] [ P0 Variable:/Spine:camT_ca2_AB 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_111 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABD -1 ] [ P0 Variable:/Spine:camT_ca2_AD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_112 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABD -1 ] [ P0 Variable:/Spine:camT_ca2_BD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_113 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ACD -1 ] [ P0 Variable:/Spine:camT_ca2_AC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_114 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ACD -1 ] [ P0 Variable:/Spine:camT_ca2_AD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_115 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ACD -1 ] [ P0 Variable:/Spine:camT_ca2_CD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_116 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_BCD -1 ] [ P0 Variable:/Spine:camT_ca2_BC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_117 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_BCD -1 ] [ P0 Variable:/Spine:camT_ca2_BD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_118 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_BCD -1 ] [ P0 Variable:/Spine:camT_ca2_CD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_119 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABC -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_120 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_121 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ACD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_122 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_BCD -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camT_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_123 )
	{
		k	3.66161616162;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca4_ABCD -1 ] [ P0 Variable:/Spine:camT_ca3_ABC 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_124 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca4_ABCD -1 ] [ P0 Variable:/Spine:camT_ca3_ABD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_125 )
	{
		k	4.19191919192;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca4_ABCD -1 ] [ P0 Variable:/Spine:camT_ca3_ACD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_126 )
	{
		k	2101.01010101;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca4_ABCD -1 ] [ P0 Variable:/Spine:camT_ca3_BCD 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_127 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR -1 ] [ P0 Variable:/Spine:camT 1 ];
	}
	
	Process MassActionFluxProcess( reaction_128 )
	{
		k	48.3792936623;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT -1 ] [ P0 Variable:/Spine:camR 1 ];
	}
	
	Process MassActionFluxProcess( reaction_129 )
	{
		k	62928.5308902;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A -1 ] [ P0 Variable:/Spine:camT_ca1_A 1 ];
	}
	
	Process MassActionFluxProcess( reaction_130 )
	{
		k	62928.5308902;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B -1 ] [ P0 Variable:/Spine:camT_ca1_B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_131 )
	{
		k	62928.5308902;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C -1 ] [ P0 Variable:/Spine:camT_ca1_C 1 ];
	}
	
	Process MassActionFluxProcess( reaction_132 )
	{
		k	62928.5308902;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D -1 ] [ P0 Variable:/Spine:camT_ca1_D 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_133 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow(cA,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_A -1 ] [ P0 Variable:/Spine:camR_ca1_A 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_134 )
	{
		kTR	48.3792936623;
		cB	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow(cB,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_B -1 ] [ P0 Variable:/Spine:camR_ca1_B 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_135 )
	{
		kTR	48.3792936623;
		cC	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow(cC,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_C -1 ] [ P0 Variable:/Spine:camR_ca1_C 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_136 )
	{
		kTR	48.3792936623;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow(cD,((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca1_D -1 ] [ P0 Variable:/Spine:camR_ca1_D 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_137 )
	{
		cA	0.00396;
		cB	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB -1 ] [ P0 Variable:/Spine:camT_ca2_AB 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_138 )
	{
		cA	0.00396;
		cC	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cA*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC -1 ] [ P0 Variable:/Spine:camT_ca2_AC 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_139 )
	{
		cA	0.00396;
		cD	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cA*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD -1 ] [ P0 Variable:/Spine:camT_ca2_AD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_140 )
	{
		cB	0.00396;
		cC	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC -1 ] [ P0 Variable:/Spine:camT_ca2_BC 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_141 )
	{
		cB	0.00396;
		cD	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD -1 ] [ P0 Variable:/Spine:camT_ca2_BD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_142 )
	{
		cC	0.00396;
		cD	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD -1 ] [ P0 Variable:/Spine:camT_ca2_CD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_143 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		cB	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AB -1 ] [ P0 Variable:/Spine:camR_ca2_AB 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_144 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		cC	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AC -1 ] [ P0 Variable:/Spine:camR_ca2_AC 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_145 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_AD -1 ] [ P0 Variable:/Spine:camR_ca2_AD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_146 )
	{
		kTR	48.3792936623;
		cB	0.00396;
		cC	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BC -1 ] [ P0 Variable:/Spine:camR_ca2_BC 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_147 )
	{
		kTR	48.3792936623;
		cB	0.00396;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_BD -1 ] [ P0 Variable:/Spine:camR_ca2_BD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_148 )
	{
		kTR	48.3792936623;
		cC	0.00396;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca2_CD -1 ] [ P0 Variable:/Spine:camR_ca2_CD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_149 )
	{
		cA	0.00396;
		cB	0.00396;
		cC	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC -1 ] [ P0 Variable:/Spine:camT_ca3_ABC 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_150 )
	{
		cA	0.00396;
		cB	0.00396;
		cD	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD -1 ] [ P0 Variable:/Spine:camT_ca3_ABD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_151 )
	{
		cA	0.00396;
		cC	0.00396;
		cD	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cA*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD -1 ] [ P0 Variable:/Spine:camT_ca3_ACD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_152 )
	{
		cB	0.00396;
		cC	0.00396;
		cD	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD -1 ] [ P0 Variable:/Spine:camT_ca3_BCD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_153 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		cB	0.00396;
		cC	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB*cC),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABC -1 ] [ P0 Variable:/Spine:camR_ca3_ABC 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_154 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		cB	0.00396;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABD -1 ] [ P0 Variable:/Spine:camR_ca3_ABD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_155 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		cC	0.00396;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ACD -1 ] [ P0 Variable:/Spine:camR_ca3_ACD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_156 )
	{
		kTR	48.3792936623;
		cB	0.00396;
		cC	0.00396;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_BCD -1 ] [ P0 Variable:/Spine:camR_ca3_BCD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_157 )
	{
		cA	0.00396;
		cB	0.00396;
		cC	0.00396;
		cD	0.00396;
		kRT	1000000.0;
		StepperID	DE1;
		Expression	"(S0.MolarConc*kRT*(pow((cA*cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD -1 ] [ P0 Variable:/Spine:camT_ca4_ABCD 1 ];
	}
	
	Process ExpressionFluxProcess( reaction_158 )
	{
		kTR	48.3792936623;
		cA	0.00396;
		cB	0.00396;
		cC	0.00396;
		cD	0.00396;
		StepperID	DE1;
		Expression	"((S0.MolarConc*kTR)/(pow((cA*cB*cC*cD),((1.0)/(2.0)))))*self.getSuperSystem().SizeN_A";
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca4_ABCD -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD 1 ];
	}
	
	Process MassActionFluxProcess( reaction_159 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_160 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_A_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_161 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_B_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_162 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_C_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_163 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_D_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_164 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AB_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_165 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_166 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_167 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_168 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_169 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_CD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_170 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_171 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_172 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_173 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_174 )
	{
		k	3200000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD -1 ] [ S1 Variable:/Spine:CaMKII -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_175 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_CaMKII -1 ] [ P0 Variable:/Spine:camR 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_176 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_A 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_177 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_B 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_178 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_C 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_179 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_D 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_180 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AB 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_181 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AC 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_182 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AD 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_183 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BC 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_184 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BD 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_185 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_CD 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_186 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ABC 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_187 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ABD 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_188 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ACD 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_189 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_BCD 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_190 )
	{
		k	0.343;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD 1 ] [ P1 Variable:/Spine:CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_191 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_192 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_A_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_193 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_B_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_194 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_C_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_195 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_D_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_196 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AB_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_197 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_198 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_199 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_200 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_201 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_CD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_202 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_203 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_204 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_205 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_206 )
	{
		k	46000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD -1 ] [ S1 Variable:/Spine:PP2B -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_207 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_PP2B -1 ] [ P0 Variable:/Spine:camR 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_208 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_A 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_209 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_B 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_210 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_C 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_211 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_D 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_212 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AB 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_213 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AC 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_214 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AD 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_215 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BC 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_216 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BD 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_217 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_CD 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_218 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ABC 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_219 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ABD 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_220 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ACD 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_221 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_BCD 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_222 )
	{
		k	0.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD 1 ] [ P1 Variable:/Spine:PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_223 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_A_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_224 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_B_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_225 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_C_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_226 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_D_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_227 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_CaMKII -1 ] [ P0 Variable:/Spine:camR_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_228 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_CaMKII -1 ] [ P0 Variable:/Spine:camR_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_229 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_CaMKII -1 ] [ P0 Variable:/Spine:camR_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_230 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AB_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_231 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_232 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_233 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AB_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_234 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_235 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_236 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_237 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_238 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_CD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_239 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_240 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_241 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_CD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_242 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_B_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_243 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_A_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_244 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_C_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_245 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_A_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_246 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_D_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_247 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_A_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_248 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_C_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_249 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_B_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_250 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_D_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_251 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_B_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_252 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_D_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_253 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca1_C_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_254 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_255 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_256 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_257 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_258 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_259 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_260 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_261 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_262 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_263 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_264 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_265 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_266 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AB_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_267 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AC_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_268 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BC_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_269 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AB_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_270 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_271 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_272 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AC_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_273 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_AD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_274 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_CD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_275 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BC_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_276 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_BD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_277 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca2_CD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_278 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_279 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_280 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_281 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_CaMKII -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_CaMKII 1 ];
	}
	
	Process MassActionFluxProcess( reaction_282 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_283 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_284 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_285 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_CaMKII -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_286 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_A_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_287 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_B_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_288 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_C_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_289 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca1_D_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_290 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_PP2B -1 ] [ P0 Variable:/Spine:camR_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_291 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_PP2B -1 ] [ P0 Variable:/Spine:camR_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_292 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_PP2B -1 ] [ P0 Variable:/Spine:camR_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_293 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_PP2B -1 ] [ P0 Variable:/Spine:camR_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_294 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AB_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_295 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_296 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_A_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_297 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AB_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_298 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_299 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_300 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_301 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_302 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_C_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_CD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_303 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_AD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_304 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_BD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_305 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_D_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca2_CD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_306 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_B_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_307 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_A_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_308 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_C_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_309 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_A_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_310 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_D_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_311 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_A_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_312 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_C_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_313 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_B_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_314 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_D_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_315 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_B_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_316 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_D_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_317 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca1_C_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_318 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_319 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AB_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_320 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_321 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AC_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_322 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_323 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_AD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_324 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_325 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BC_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_326 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_327 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_BD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_328 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_329 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca2_CD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_330 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BC_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_331 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AC_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_332 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AB_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_333 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_334 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_335 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AB_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_336 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_CD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_337 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_338 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_AC_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_339 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_CD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_340 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_341 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca2_BC_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_342 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABC_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_343 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ABD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_344 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_ACD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_345 )
	{
		k	1000000.0;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca3_BCD_PP2B -1 ] [ S1 Variable:/Spine:ca -1 ] [ P0 Variable:/Spine:camR_ca4_ABCD_PP2B 1 ];
	}
	
	Process MassActionFluxProcess( reaction_346 )
	{
		k	8.32;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_BCD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_347 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ACD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_348 )
	{
		k	17.4;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ABD_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_349 )
	{
		k	0.0145;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca4_ABCD_PP2B -1 ] [ P0 Variable:/Spine:camR_ca3_ABC_PP2B 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_350 )
	{
		k	0.0166;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camR_ca1_B_CaMKII -1 ] [ P0 Variable:/Spine:camR_CaMKII 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process MassActionFluxProcess( reaction_351 )
	{
		k	4393.93939394;
		StepperID	DE1;
		VariableReferenceList	[ S0 Variable:/Spine:camT_ca3_ABC -1 ] [ P0 Variable:/Spine:camT_ca2_AB 1 ] [ P1 Variable:/Spine:ca 1 ];
	}
	
	Process PythonProcess( add_free_cam_ca4_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_cam_ca4_total 1 ] [ X1 Variable:/Spine:camT_ca4_ABCD 0 ] [ X0 Variable:/Spine:camR_ca4_ABCD 0 ];
	}
	
	Process PythonProcess( add_camR_ca4_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca4_total 1 ] [ X1 Variable:/Spine:camR_ca4_ABCD_CaMKII 0 ] [ X2 Variable:/Spine:camR_ca4_ABCD_PP2B 0 ] [ X0 Variable:/Spine:camR_ca4_ABCD 0 ];
	}
	
	Process PythonProcess( add_camR_ca4_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca4_ratio 1 ] [ X0 Variable:/Spine:camR_ca4_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca4_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca4_total 1 ] [ X2 Variable:/Spine:camR_ca4_ABCD_CaMKII 0 ] [ X3 Variable:/Spine:camR_ca4_ABCD_PP2B 0 ] [ X1 Variable:/Spine:camT_ca4_ABCD 0 ] [ X0 Variable:/Spine:camR_ca4_ABCD 0 ];
	}
	
	Process PythonProcess( add_cam_ca4_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca4_totalRatio 1 ] [ X0 Variable:/Spine:cam_ca4_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_free_camR_ca3_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_camR_ca3_total 1 ] [ X1 Variable:/Spine:camR_ca3_ABD 0 ] [ X2 Variable:/Spine:camR_ca3_ACD 0 ] [ X0 Variable:/Spine:camR_ca3_ABC 0 ] [ X3 Variable:/Spine:camR_ca3_BCD 0 ];
	}
	
	Process PythonProcess( add_free_camT_ca3_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_camT_ca3_total 1 ] [ X2 Variable:/Spine:camT_ca3_ACD 0 ] [ X1 Variable:/Spine:camT_ca3_ABD 0 ] [ X0 Variable:/Spine:camT_ca3_ABC 0 ] [ X3 Variable:/Spine:camT_ca3_BCD 0 ];
	}
	
	Process PythonProcess( add_free_cam_ca3_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_cam_ca3_total 1 ] [ X1 Variable:/Spine:free_camT_ca3_total 0 ] [ X0 Variable:/Spine:free_camR_ca3_total 0 ];
	}
	
	Process PythonProcess( add_CaMKII_camR_ca3 )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:CaMKII_camR_ca3 1 ] [ X2 Variable:/Spine:camR_ca3_ACD_CaMKII 0 ] [ X0 Variable:/Spine:camR_ca3_ABC_CaMKII 0 ] [ X1 Variable:/Spine:camR_ca3_ABD_CaMKII 0 ] [ X3 Variable:/Spine:camR_ca3_BCD_CaMKII 0 ];
	}
	
	Process PythonProcess( add_PP2B_camR_ca3 )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:PP2B_camR_ca3 1 ] [ X0 Variable:/Spine:camR_ca3_ABC_PP2B 0 ] [ X2 Variable:/Spine:camR_ca3_ACD_PP2B 0 ] [ X1 Variable:/Spine:camR_ca3_ABD_PP2B 0 ] [ X3 Variable:/Spine:camR_ca3_BCD_PP2B 0 ];
	}
	
	Process PythonProcess( add_camR_ca3_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca3_total 1 ] [ X2 Variable:/Spine:CaMKII_camR_ca3 0 ] [ X0 Variable:/Spine:free_camR_ca3_total 0 ] [ X1 Variable:/Spine:PP2B_camR_ca3 0 ];
	}
	
	Process PythonProcess( add_camR_ca3_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca3_ratio 1 ] [ X0 Variable:/Spine:camR_ca3_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca3_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca3_total 1 ] [ X0 Variable:/Spine:CaMKII_camR_ca3 0 ] [ X1 Variable:/Spine:PP2B_camR_ca3 0 ] [ X2 Variable:/Spine:free_cam_ca3_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca3_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca3_totalRatio 1 ] [ X0 Variable:/Spine:cam_ca3_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_free_camR_ca2_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value+X5.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_camR_ca2_total 1 ] [ X2 Variable:/Spine:camR_ca2_AD 0 ] [ X3 Variable:/Spine:camR_ca2_BC 0 ] [ X4 Variable:/Spine:camR_ca2_BD 0 ] [ X1 Variable:/Spine:camR_ca2_AC 0 ] [ X5 Variable:/Spine:camR_ca2_CD 0 ] [ X0 Variable:/Spine:camR_ca2_AB 0 ];
	}
	
	Process PythonProcess( add_free_camT_ca2_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value+X5.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_camT_ca2_total 1 ] [ X3 Variable:/Spine:camT_ca2_BC 0 ] [ X4 Variable:/Spine:camT_ca2_BD 0 ] [ X5 Variable:/Spine:camT_ca2_CD 0 ] [ X1 Variable:/Spine:camT_ca2_AC 0 ] [ X0 Variable:/Spine:camT_ca2_AB 0 ] [ X2 Variable:/Spine:camT_ca2_AD 0 ];
	}
	
	Process PythonProcess( add_free_cam_ca2_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_cam_ca2_total 1 ] [ X1 Variable:/Spine:free_camT_ca2_total 0 ] [ X0 Variable:/Spine:free_camR_ca2_total 0 ];
	}
	
	Process PythonProcess( add_CaMKII_camR_ca2 )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value+X5.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:CaMKII_camR_ca2 1 ] [ X0 Variable:/Spine:camR_ca2_AB_CaMKII 0 ] [ X2 Variable:/Spine:camR_ca2_AD_CaMKII 0 ] [ X5 Variable:/Spine:camR_ca2_CD_CaMKII 0 ] [ X3 Variable:/Spine:camR_ca2_BC_CaMKII 0 ] [ X4 Variable:/Spine:camR_ca2_BD_CaMKII 0 ] [ X1 Variable:/Spine:camR_ca2_AC_CaMKII 0 ];
	}
	
	Process PythonProcess( add_PP2B_camR_ca2 )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value+X5.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:PP2B_camR_ca2 1 ] [ X2 Variable:/Spine:camR_ca2_AD_PP2B 0 ] [ X4 Variable:/Spine:camR_ca2_BD_PP2B 0 ] [ X5 Variable:/Spine:camR_ca2_CD_PP2B 0 ] [ X0 Variable:/Spine:camR_ca2_AB_PP2B 0 ] [ X1 Variable:/Spine:camR_ca2_AC_PP2B 0 ] [ X3 Variable:/Spine:camR_ca2_BC_PP2B 0 ];
	}
	
	Process PythonProcess( add_camR_ca2_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca2_total 1 ] [ X1 Variable:/Spine:CaMKII_camR_ca2 0 ] [ X2 Variable:/Spine:PP2B_camR_ca2 0 ] [ X0 Variable:/Spine:free_camR_ca2_total 0 ];
	}
	
	Process PythonProcess( add_camR_ca2_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca2_ratio 1 ] [ X1 Variable:/Spine:cam_total 0 ] [ X0 Variable:/Spine:camR_ca2_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca2_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca2_total 1 ] [ X1 Variable:/Spine:CaMKII_camR_ca2 0 ] [ X2 Variable:/Spine:PP2B_camR_ca2 0 ] [ X0 Variable:/Spine:free_cam_ca2_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca2_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca2_totalRatio 1 ] [ X0 Variable:/Spine:cam_ca2_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_free_camR_ca1_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_camR_ca1_total 1 ] [ X3 Variable:/Spine:camR_ca1_D 0 ] [ X1 Variable:/Spine:camR_ca1_B 0 ] [ X2 Variable:/Spine:camR_ca1_C 0 ] [ X0 Variable:/Spine:camR_ca1_A 0 ];
	}
	
	Process PythonProcess( add_free_camT_ca1_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_camT_ca1_total 1 ] [ X3 Variable:/Spine:camT_ca1_D 0 ] [ X0 Variable:/Spine:camT_ca1_A 0 ] [ X1 Variable:/Spine:camT_ca1_B 0 ] [ X2 Variable:/Spine:camT_ca1_C 0 ];
	}
	
	Process PythonProcess( add_free_cam_ca1_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value+X5.Value+X6.Value+X7.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_cam_ca1_total 1 ] [ X3 Variable:/Spine:camR_ca1_D 0 ] [ X1 Variable:/Spine:camR_ca1_B 0 ] [ X2 Variable:/Spine:camR_ca1_C 0 ] [ X0 Variable:/Spine:camR_ca1_A 0 ] [ X7 Variable:/Spine:camT_ca1_D 0 ] [ X4 Variable:/Spine:camT_ca1_A 0 ] [ X5 Variable:/Spine:camT_ca1_B 0 ] [ X6 Variable:/Spine:camT_ca1_C 0 ];
	}
	
	Process PythonProcess( add_CaMKII_camR_ca1 )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:CaMKII_camR_ca1 1 ] [ X2 Variable:/Spine:camR_ca1_C_CaMKII 0 ] [ X1 Variable:/Spine:camR_ca1_B_CaMKII 0 ] [ X3 Variable:/Spine:camR_ca1_D_CaMKII 0 ] [ X0 Variable:/Spine:camR_ca1_A_CaMKII 0 ];
	}
	
	Process PythonProcess( add_PP2B_camR_ca1 )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:PP2B_camR_ca1 1 ] [ X3 Variable:/Spine:camR_ca1_D_PP2B 0 ] [ X2 Variable:/Spine:camR_ca1_C_PP2B 0 ] [ X1 Variable:/Spine:camR_ca1_B_PP2B 0 ] [ X0 Variable:/Spine:camR_ca1_A_PP2B 0 ];
	}
	
	Process PythonProcess( add_camR_ca1_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca1_total 1 ] [ X1 Variable:/Spine:CaMKII_camR_ca1 0 ] [ X0 Variable:/Spine:free_camR_ca1_total 0 ] [ X2 Variable:/Spine:PP2B_camR_ca1 0 ];
	}
	
	Process PythonProcess( add_camR_ca1_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca1_ratio 1 ] [ X0 Variable:/Spine:camR_ca1_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca1_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca1_total 1 ] [ X1 Variable:/Spine:CaMKII_camR_ca1 0 ] [ X2 Variable:/Spine:PP2B_camR_ca1 0 ] [ X0 Variable:/Spine:free_cam_ca1_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca1_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca1_totalRatio 1 ] [ X1 Variable:/Spine:cam_total 0 ] [ X0 Variable:/Spine:cam_ca1_total 0 ];
	}
	
	Process PythonProcess( add_free_cam_ca0_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:free_cam_ca0_total 1 ] [ X0 Variable:/Spine:camR 0 ] [ X1 Variable:/Spine:camT 0 ];
	}
	
	Process PythonProcess( add_camR_ca0_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca0_total 1 ] [ X0 Variable:/Spine:camR 0 ] [ X1 Variable:/Spine:camR_CaMKII 0 ] [ X2 Variable:/Spine:camR_PP2B 0 ];
	}
	
	Process PythonProcess( add_camR_ca0_ratio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_ca0_ratio 1 ] [ X0 Variable:/Spine:camR_ca0_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_cam_ca0_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca0_total 1 ] [ X0 Variable:/Spine:camR 0 ] [ X3 Variable:/Spine:camR_PP2B 0 ] [ X2 Variable:/Spine:camR_CaMKII 0 ] [ X1 Variable:/Spine:camT 0 ];
	}
	
	Process PythonProcess( add_cam_ca0_totalRatio )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_ca0_totalRatio 1 ] [ X0 Variable:/Spine:cam_ca0_total 0 ] [ X1 Variable:/Spine:cam_total 0 ];
	}
	
	Process PythonProcess( add_cam_total )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:cam_total 1 ] [ X3 Variable:/Spine:cam_ca3_total 0 ] [ X0 Variable:/Spine:cam_ca0_total 0 ] [ X2 Variable:/Spine:cam_ca2_total 0 ] [ X4 Variable:/Spine:cam_ca4_total 0 ] [ X1 Variable:/Spine:cam_ca1_total 0 ];
	}
	
	Process PythonProcess( add_total_CaMKII_bound )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:total_CaMKII_bound 1 ] [ X2 Variable:/Spine:CaMKII_camR_ca2 0 ] [ X3 Variable:/Spine:CaMKII_camR_ca3 0 ] [ X1 Variable:/Spine:CaMKII_camR_ca1 0 ] [ X0 Variable:/Spine:camR_CaMKII 0 ] [ X4 Variable:/Spine:camR_ca4_ABCD_CaMKII 0 ];
	}
	
	Process PythonProcess( add_totalCaMKII )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:totalCaMKII 1 ] [ X1 Variable:/Spine:CaMKII 0 ] [ X0 Variable:/Spine:total_CaMKII_bound 0 ];
	}
	
	Process PythonProcess( add_CaMKIIbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:CaMKIIbar 1 ] [ X0 Variable:/Spine:total_CaMKII_bound 0 ] [ X1 Variable:/Spine:totalCaMKII 0 ];
	}
	
	Process PythonProcess( add_total_PP2B_bound )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:total_PP2B_bound 1 ] [ X4 Variable:/Spine:camR_ca4_ABCD_PP2B 0 ] [ X3 Variable:/Spine:PP2B_camR_ca3 0 ] [ X2 Variable:/Spine:PP2B_camR_ca2 0 ] [ X0 Variable:/Spine:camR_PP2B 0 ] [ X1 Variable:/Spine:PP2B_camR_ca1 0 ];
	}
	
	Process PythonProcess( add_totalPP2B )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:totalPP2B 1 ] [ X0 Variable:/Spine:total_PP2B_bound 0 ] [ X1 Variable:/Spine:PP2B 0 ];
	}
	
	Process PythonProcess( add_PP2Bbar )
	{
		FireMethod	"P0.Value=(X0.Value/X1.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:PP2Bbar 1 ] [ X0 Variable:/Spine:total_PP2B_bound 0 ] [ X1 Variable:/Spine:totalPP2B 0 ];
	}
	
	Process PythonProcess( add_camR_unbound )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value+X5.Value+X6.Value+X7.Value+X8.Value+X9.Value+X10.Value+X11.Value+X12.Value+X13.Value+X14.Value+X15.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:camR_unbound 1 ] [ X7 Variable:/Spine:camR_ca2_AD 0 ] [ X8 Variable:/Spine:camR_ca2_BC 0 ] [ X9 Variable:/Spine:camR_ca2_BD 0 ] [ X13 Variable:/Spine:camR_ca3_ACD 0 ] [ X6 Variable:/Spine:camR_ca2_AC 0 ] [ X5 Variable:/Spine:camR_ca2_AB 0 ] [ X0 Variable:/Spine:camR 0 ] [ X4 Variable:/Spine:camR_ca1_D 0 ] [ X10 Variable:/Spine:camR_ca2_CD 0 ] [ X2 Variable:/Spine:camR_ca1_B 0 ] [ X3 Variable:/Spine:camR_ca1_C 0 ] [ X15 Variable:/Spine:camR_ca4_ABCD 0 ] [ X1 Variable:/Spine:camR_ca1_A 0 ] [ X14 Variable:/Spine:camR_ca3_BCD 0 ] [ X12 Variable:/Spine:camR_ca3_ABD 0 ] [ X11 Variable:/Spine:camR_ca3_ABC 0 ];
	}
	
	Process PythonProcess( add_totalcamR )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:totalcamR 1 ] [ X2 Variable:/Spine:total_PP2B_bound 0 ] [ X1 Variable:/Spine:total_CaMKII_bound 0 ] [ X0 Variable:/Spine:camR_unbound 0 ];
	}
	
	Process PythonProcess( add_totalcamT )
	{
		FireMethod	"P0.Value=(X0.Value+X1.Value+X2.Value+X3.Value+X4.Value+X5.Value+X6.Value+X7.Value+X8.Value+X9.Value+X10.Value+X11.Value+X12.Value+X13.Value+X14.Value+X15.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:totalcamT 1 ] [ X13 Variable:/Spine:camT_ca3_ACD 0 ] [ X12 Variable:/Spine:camT_ca3_ABD 0 ] [ X11 Variable:/Spine:camT_ca3_ABC 0 ] [ X8 Variable:/Spine:camT_ca2_BC 0 ] [ X14 Variable:/Spine:camT_ca3_BCD 0 ] [ X0 Variable:/Spine:camT 0 ] [ X6 Variable:/Spine:camT_ca2_AC 0 ] [ X15 Variable:/Spine:camT_ca4_ABCD 0 ] [ X9 Variable:/Spine:camT_ca2_BD 0 ] [ X10 Variable:/Spine:camT_ca2_CD 0 ] [ X4 Variable:/Spine:camT_ca1_D 0 ] [ X5 Variable:/Spine:camT_ca2_AB 0 ] [ X7 Variable:/Spine:camT_ca2_AD 0 ] [ X1 Variable:/Spine:camT_ca1_A 0 ] [ X2 Variable:/Spine:camT_ca1_B 0 ] [ X3 Variable:/Spine:camT_ca1_C 0 ];
	}
	
	Process PythonProcess( add_Rbar )
	{
		FireMethod	"P0.Value=(X0.Value/(X0.Value+X1.Value))";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:Rbar 1 ] [ X0 Variable:/Spine:totalcamR 0 ] [ X1 Variable:/Spine:totalcamT 0 ];
	}
	
	Process PythonProcess( add_moles_bound_ca_per_moles_cam )
	{
		FireMethod	"P0.Value=((((4.0)*X0.Value)+((3.0)*X1.Value)+((2.0)*X2.Value)+X3.Value)/X4.Value)";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:moles_bound_ca_per_moles_cam 1 ] [ X1 Variable:/Spine:cam_ca3_total 0 ] [ X4 Variable:/Spine:cam_total 0 ] [ X2 Variable:/Spine:cam_ca2_total 0 ] [ X0 Variable:/Spine:cam_ca4_total 0 ] [ X3 Variable:/Spine:cam_ca1_total 0 ];
	}
	
	Process PythonProcess( add_epsilon )
	{
		FireMethod	"P0.Value=(X0.Value/(X0.Value+X1.Value))";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:epsilon 1 ] [ X0 Variable:/Spine:camR 0 ] [ X1 Variable:/Spine:camT 0 ];
	}
	
	Process PythonProcess( add_ybar )
	{
		FireMethod	"P0.Value=(X0.Value/(4.0))";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:ybar 1 ] [ X0 Variable:/Spine:moles_bound_ca_per_moles_cam 0 ];
	}
	
	Process PythonProcess( add_ybar_div__1_minus_ybar )
	{
		FireMethod	"P0.Value=(X0.Value/((1.0)-X0.Value))";
		StepperID	Passive;
		VariableReferenceList	[ P0 Variable:/Spine:ybar_div__1_minus_ybar 1 ] [ X0 Variable:/Spine:ybar 0 ];
	}
	
	
}

