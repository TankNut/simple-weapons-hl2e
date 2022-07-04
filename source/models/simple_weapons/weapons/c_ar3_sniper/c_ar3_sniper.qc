// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/c_ar3_sniper.mdl"

$body "studio" "c_ar3_sniper.smd"

$surfaceprop "default"
$contents "solid"

$cdmaterials "models\weapons\w_Irifle\"
$cdmaterials "models\props_combine\"
$cdmaterials "models\combine_turrets\"
$cdmaterials "models\Combine_Turrets\Ceiling_turret\"
$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "ValveBiped.base" 0.20 0.95 25.00 rotate -90 -90 0

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

$sectionframes 30 120

$sequence "idle01" {
	"c_ar3_sniper_anims\idle01.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 25
}

$sequence "reload" {
	"c_ar3_sniper_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 11 "Weapon_MAC10.Clipout" }
	{ event 5004 25 "Weapon_AR2.Reload_Rotate" }
	{ event 5004 33 "Weapon_MAC10.Clipin" }
	{ event 5004 40 "Weapon_AR2.Reload_Push" }
	fadein 0.2
	fadeout 0.2
	fps 25
}

$sequence "fire01" {
	"c_ar3_sniper_anims\fire01.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "COMBINE MUZZLE" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "draw" {
	"c_ar3_sniper_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 25
}
