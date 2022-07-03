// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/c_autogun.mdl"

$body "studio" "c_autogun.smd"

$surfaceprop "default"
$contents "solid"

$cdmaterials "models\Weapons\w_rocket_launcher\"
$cdmaterials "models\props_combine\"
$cdmaterials "models\combine_turrets\"
$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "base" -0.50 -0.90 23.00 rotate -90 -90 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0.000000 0.000000 -79.749939 -89.999870 -90.000099 0.000000 0.000000 0.000000 -0.000000 0.000000 -0.000000
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033349 1.000767 1.937658 -73.711746 168.619293 91.480484 -0.000000 0.000000 0.000000 -0.000000 0.000002 -0.000000
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028137 0.000007 -0.000001 2.738738 -33.527828 -90.504929 -0.000000 0.000000 0.000000 0.000002 0.000000 0.000000
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692553 0.000020 -0.000006 -0.000000 -3.458603 -0.000172 0.000000 0.000000 0.000000 0.000002 -0.000001 -0.000000
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481672 -0.000067 -0.000042 -6.108418 2.531442 90.136803 0.000000 0.000000 0.000000 -0.000001 -0.000002 -0.000000
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859699 -0.142406 -1.191996 8.682373 -50.431690 -26.822447 0.000000 0.000002 -0.000001 -0.000000 0.000000 -0.000002
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312550 0.000002 0.000000 0.000056 -25.193981 0.000109 0.000000 0.000000 0.000000 -0.000002 0.000005 -0.000003
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729363 0.000000 -0.000002 0.000113 -13.997123 0.000051 0.000000 0.000000 0.000000 -0.000002 0.000007 -0.000005
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942326 0.046768 -0.431464 4.194567 -46.466015 -8.696639 0.000000 0.000002 0.000000 0.000000 0.000003 -0.000001
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539095 0.000000 -0.000001 -0.000000 -14.197831 -0.000001 -0.000001 0.000000 0.000000 -0.000000 0.000004 -0.000001
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196327 0.000000 -0.000000 0.000229 -24.682964 0.000056 0.000000 0.000000 0.000000 -0.000000 0.000002 -0.000001
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883698 -0.046767 0.431422 1.251167 -33.682072 4.921651 0.000000 0.000000 0.000000 0.000000 0.000005 0.000001
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719570 -0.000011 0.000005 0.315643 -20.997984 0.000116 0.000000 0.000002 0.000000 -0.000000 0.000002 0.000001
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209169 0.000006 -0.000005 0.177045 -12.398520 -0.000056 0.000001 -0.000004 0.000000 0.000001 0.000000 0.000001
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859867 -0.137946 1.332447 -2.449109 -30.465141 20.308430 0.000002 0.000000 0.000000 0.000000 -0.000002 -0.000002
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719433 0.000000 0.000000 0.233480 -20.798826 -0.000060 0.000000 0.000000 0.000000 -0.000000 0.000003 0.000000
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099663 0.000000 0.000001 0.148510 -13.999305 -0.000002 0.000001 0.000000 0.000000 -0.000002 0.000003 -0.000002
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806057 -0.348927 1.321253 -38.915695 -45.195717 -70.054688 0.000000 0.000000 0.000002 -0.000000 0.000002 -0.000003
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789778 -0.000008 0.000000 -0.000000 13.093349 0.000053 0.000000 0.000001 -0.000002 -0.000001 -0.000000 -0.000005
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207008 -0.000002 0.000002 0.000001 20.790228 -0.000005 0.000000 0.000000 0.000000 0.000001 -0.000001 -0.000005
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.937610 73.712036 168.618774 -95.596611 0.000000 0.000000 0.000000 -0.000000 0.000002 0.000000
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0.000002 0.000002 -0.462147 -33.623798 93.935287 0.000000 0.000000 0.000000 -0.000003 -0.000000 0.000000
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692560 -0.000008 0.000006 -0.000003 -3.459004 -0.000172 0.000000 0.000000 0.000000 -0.000000 -0.000000 0.000000
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481707 -0.000015 0.000009 6.108245 2.532302 -89.664055 0.000002 0.000000 0.000000 -0.000000 0.000002 -0.000000
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859684 -0.132586 1.193094 -9.056570 -50.352970 26.713072 0.000000 0.000000 0.000000 -0.000000 -0.000007 -0.000007
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312557 -0.000008 0.000000 0.000168 -25.191698 -0.000063 0.000000 0.000000 0.000000 -0.000004 -0.000003 -0.000009
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729366 0.000006 -0.000001 -0.000061 -13.995581 -0.000067 0.000000 0.000000 0.000000 -0.000003 0.000000 -0.000009
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942310 0.050311 0.431028 -4.537309 -46.421272 8.598663 0.000000 0.000000 0.000000 -0.000001 -0.000003 -0.000003
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539101 -0.000008 -0.000002 0.000056 -14.196467 -0.000060 0.000000 0.000000 0.000000 -0.000001 -0.000003 -0.000003
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 0.000006 -0.000000 -0.000003 -24.680796 0.000055 0.000000 0.000000 0.000000 -0.000003 -0.000007 -0.000001
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883659 -0.050337 -0.431058 -1.512723 -33.672737 -4.922166 0.000000 0.000000 0.000000 0.000000 -0.000004 0.000001
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719578 0.000004 -0.000002 -0.456646 -20.995300 -0.000056 0.000000 0.000000 0.000000 0.000001 -0.000009 0.000001
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209183 0.000002 0.000003 -0.255653 -12.397441 0.000058 -0.000001 0.000000 0.000000 0.000001 -0.000009 0.000001
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.148954 -1.331299 2.209955 -30.481754 -20.306828 -0.000002 0.000002 0.000000 -0.000000 -0.000003 0.000005
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719427 0.000008 0.000004 -0.378952 -20.796598 -0.000055 0.000000 0.000000 0.000000 0.000002 -0.000005 0.000002
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099667 0.000004 0.000000 -0.241558 -13.997880 0.000058 0.000002 0.000002 0.000000 0.000002 -0.000007 0.000002
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806013 -0.359844 -1.318338 38.596783 -45.467934 69.981468 0.000000 0.000000 0.000002 -0.000004 0.000010 0.000000
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789783 0.000002 -0.000002 -0.000062 13.095360 -0.000227 0.000000 0.000000 0.000000 -0.000005 0.000010 0.000003
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.206999 0.000006 0.000002 -0.000062 20.793102 -0.000112 0.000000 0.000000 0.000000 -0.000007 0.000006 0.000003
$definebone "base" "" -16.057949 -24.995756 64.720612 -0.000000 0.000000 89.999985 0.000000 0.000000 0.000000 -0.000000 0.000000 0.000000

$bonemerge "ValveBiped.Bip01_Spine4"
$bonemerge "ValveBiped.Bip01_L_Clavicle"
$bonemerge "ValveBiped.Bip01_L_UpperArm"
$bonemerge "ValveBiped.Bip01_L_Forearm"
$bonemerge "ValveBiped.Bip01_L_Hand"
$bonemerge "ValveBiped.Bip01_L_Finger4"
$bonemerge "ValveBiped.Bip01_L_Finger41"
$bonemerge "ValveBiped.Bip01_L_Finger42"
$bonemerge "ValveBiped.Bip01_L_Finger3"
$bonemerge "ValveBiped.Bip01_L_Finger31"
$bonemerge "ValveBiped.Bip01_L_Finger32"
$bonemerge "ValveBiped.Bip01_L_Finger2"
$bonemerge "ValveBiped.Bip01_L_Finger21"
$bonemerge "ValveBiped.Bip01_L_Finger22"
$bonemerge "ValveBiped.Bip01_L_Finger1"
$bonemerge "ValveBiped.Bip01_L_Finger11"
$bonemerge "ValveBiped.Bip01_L_Finger12"
$bonemerge "ValveBiped.Bip01_L_Finger0"
$bonemerge "ValveBiped.Bip01_L_Finger01"
$bonemerge "ValveBiped.Bip01_L_Finger02"
$bonemerge "ValveBiped.Bip01_R_Clavicle"
$bonemerge "ValveBiped.Bip01_R_UpperArm"
$bonemerge "ValveBiped.Bip01_R_Forearm"
$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "ValveBiped.Bip01_R_Finger4"
$bonemerge "ValveBiped.Bip01_R_Finger41"
$bonemerge "ValveBiped.Bip01_R_Finger42"
$bonemerge "ValveBiped.Bip01_R_Finger3"
$bonemerge "ValveBiped.Bip01_R_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger32"
$bonemerge "ValveBiped.Bip01_R_Finger2"
$bonemerge "ValveBiped.Bip01_R_Finger21"
$bonemerge "ValveBiped.Bip01_R_Finger22"
$bonemerge "ValveBiped.Bip01_R_Finger1"
$bonemerge "ValveBiped.Bip01_R_Finger11"
$bonemerge "ValveBiped.Bip01_R_Finger12"
$bonemerge "ValveBiped.Bip01_R_Finger0"
$bonemerge "ValveBiped.Bip01_R_Finger01"
$bonemerge "ValveBiped.Bip01_R_Finger02"

$sectionframes 30 159

$sequence "idle1" {
	"c_autogun_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "Idle"
	fps 30
	loop
}

$sequence "draw" {
	"c_autogun_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	node "Idle"
	snap
	fps 30
}

$sequence "fire" {
	"c_autogun_anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 30
}

$sequence "reload" {
	"c_autogun_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	node "Idle"
	fps 30
}

$sequence "up_to_down" {
	"c_autogun_anims\up_to_down.smd"
	activity "ACT_VM_IDLE_TO_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	transition "Idle" "Low"
	fps 15
}

$sequence "down_to_up" {
	"c_autogun_anims\down_to_up.smd"
	activity "ACT_VM_LOWERED_TO_IDLE" 1
	fadein 0.2
	fadeout 0.2
	transition "Low" "Idle"
	fps 15
}

$sequence "down_idle" {
	"c_autogun_anims\down_idle.smd"
	activity "ACT_VM_IDLE_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	node "Low"
	fps 30
	loop
}
