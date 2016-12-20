function i2m(x)=x*25.4;
function ASA(alpha,a,beta) = ((a/sin(alpha))*sin(beta));
//echo("ASA(90, 19.05, 60) == 16.5, but was ", ASA(90,19.05,60));

//Table Height
dim_tableHeight = i2m(29);

//Table Length
dim_tableLength = 2800;

// Table Width
dim_tableWidth = 1000;

// Table top
dim_tableTop = 20;

// Leg gap
dim_legGap = 1800;

// Ply Thickness
dim_ply = 12;

// Ply stack
qty_ply = 6;

//Critical dim
dim_critical = dim_ply * qty_ply;

//Vertical angle
ang_vertical = 10;

//Base thickness
dim_thickness = 80;

//Horizontal angle
ang_horizontal = 120;

// base extension
dim_baseExtension = ASA(ang_horizontal / 2 , dim_critical / 2, 90 - (ang_horizontal / 2 ));

// y brace
dim_yBrace = 150;

// Lower leg length
dim_lowerLeg = 360;

// Lower rad
rad_lower = 100;

// Upper rad
rad_upper = 50;

