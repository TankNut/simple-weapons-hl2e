// Created by Crowbar 0.63

$modelname "simple_weapons/crossbow_bolt_he.mdl"

$body "studio" "crossbow_bolt_he.smd"

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\weapons\v_crossbow\"
$cdmaterials "Models\items\"

$sequence "idle" {
	"crossbow_bolt_he_anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}
