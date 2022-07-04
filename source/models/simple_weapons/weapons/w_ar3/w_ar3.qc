// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/w_ar3.mdl"

$body "studio" "w_ar3"

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\weapons\w_Irifle\"
$cdmaterials "models\props_combine\"
$cdmaterials "models\combine_turrets\"
$cdmaterials "models\Combine_Turrets\Ceiling_turret\"
$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "ValveBiped.Weapon_bone" 24.00 0.80 -4.95 rotate 11 2 177

$sequence "idle" {
	"w_ar3_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "attack1" {
	"w_ar3_anims\attack1.smd"
	activity "ACT_RANGE_ATTACK_SMG1" 1
	{ event AE_NPC_MUZZLEFLASH 0 "COMBINE MUZZLE" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "attackoffcenter" {
	"w_ar3_anims\attackoffcenter.smd"
	{ event AE_NPC_MUZZLEFLASH 0 "COMBINE MUZZLE" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$collisionmodel "w_ar3_physics.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}
