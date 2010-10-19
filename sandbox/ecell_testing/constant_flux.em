#
# A very simple model with one michaelis-uni-uni reaction.
#

Stepper ODEStepper( DE1 )
#Stepper FixedODE1Stepper( DE1 )
{
	# no property
}

System System( / )
{
        Name "The root system";
	StepperID	DE1;

	Variable Variable( SIZE )
	{
		Value	1e-18;
	}

	Variable Variable( S1 )
	{
		Value	0;
	}
	
	Variable Variable( S2 )
	{
		Value	0;
	}
	
	Variable Variable( E )
	{
		Value	1000;
	}
	
	Process ConstantFluxProcess( C_S1 )
	{
		k 10;
		VariableReferenceList	[ S0 :.:S1 1 ];
		
	}
	
	Process ConstantFluxProcess( C_S2 )
	{
		k 0.003;
		VariableReferenceList	[ S0 :.:S2 1 ];
		
	}	
}

