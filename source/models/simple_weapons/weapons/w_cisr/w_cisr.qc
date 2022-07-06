// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/w_cisr.mdl"

$body "studio" "w_cisr.smd"

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "ValveBiped.Bip01_R_Hand" 49.00 -1.18 -14.84 rotate 13 0 -178
$attachment "laser" "ValveBiped.Bip01_R_Hand" 21.40 -0.55 -10.20 rotate 13 0 -178

$sequence "idle1" {
	"w_cisr_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "fire" {
	"w_cisr_anims\fire.smd"
	activity "ACT_RANGE_ATTACK_AR2" 1
	{ event AE_NPC_MUZZLEFLASH 0 "COMBINE MUZZLE" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_cisr_physics.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}
