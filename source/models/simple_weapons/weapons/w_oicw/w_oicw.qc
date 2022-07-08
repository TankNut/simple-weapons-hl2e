// Created by Crowbar 0.63

$modelname "simple_weapons\weapons\w_oicw.mdl"

$body "studio" "w_oicw.smd"

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "ValveBiped.muzzle" -10.50 -1.00 0.00 rotate 0 -0 -86
$attachment "1" "ValveBiped.w_shotgun" 1 0 3 rotate 0 0 0

$sequence "idle1" {
	"w_oicw_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "fire" {
	"w_oicw_anims\fire.smd"
	activity "ACT_RANGE_ATTACK_AR2" 1
	{ event AE_NPC_MUZZLEFLASH 0 "SMG1 muzzle" }
	{ event 3007 0 "1" }
	{ event 6001 0 "1" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_oicw_physics.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}
