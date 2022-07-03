// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/w_autogun.mdl"

$body "studio" "w_autogun.smd"

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\Weapons\w_rocket_launcher\"
$cdmaterials "models\props_combine\"
$cdmaterials "models\combine_turrets\"
$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "ValveBiped.Weapon_bone" -12.00 0.10 -2.20 rotate 10 180 0

$sequence "idle1" {
	"w_autogun_anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "w_autogun_physics.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}
