// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/w_crossbow_he.mdl"

$body "studio" "w_crossbow_he.smd"

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\weapons\v_crossbow\"
$cdmaterials "Models\items\"

$attachment "muzzle" "muzzle" 0 0 0 rotate 0 0 0

$sequence "idle" {
	"w_crossbow_he_anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "attack1" {
	"w_crossbow_he_anims\attack1.smd"
	activity "ACT_RANGE_ATTACK_SMG1" 1
	{ event 3007 0 "1" }
	{ event 3002 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "attackoffcenter" {
	"w_crossbow_he_anims\attackoffcenter.smd"
	{ event 3007 0 "1" }
	{ event 3002 0 "lefthand" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$collisionmodel "w_crossbow_he_physics.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}
