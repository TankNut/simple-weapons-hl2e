// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/w_arp.mdl"

$body "studio" "w_arp.smd"

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\simple_weapons\weapons\"
$cdmaterials "models\Weapons\V_Pistol\"
$cdmaterials "models\props_combine\"
$cdmaterials "models\Combine_Turrets\Ceiling_turret\"

$attachment "muzzle" "muzzle" 1.70 -0.09 0.90 rotate 0 -0 -0

$sequence "idle" {
	"w_arp_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "attack1" {
	"w_arp_anims\attack1.smd"
	activity "ACT_RANGE_ATTACK_PISTOL" 1
	{ event 3014 1 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_arp_physics.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}
