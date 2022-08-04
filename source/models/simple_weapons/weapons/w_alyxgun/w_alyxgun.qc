// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/w_alyxgun.mdl"

$body "studio" "w_alyxgun.smd"

$lod 15
{
	replacemodel "w_alyxgun.smd" "w_alyxgun_lod1.smd"
	replacebone "ValveBiped.Anim_Attachment_RH" "ValveBiped.Bip01_R_Hand"
	nofacial
}

$surfaceprop "weapon"
$contents "solid"

$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "ValveBiped.GunControl_muzzle" 0.01 0.17 3.08 rotate -88.68 174.49 -172.4
$attachment "1" "ValveBiped.GunControl_back" -0.78 -0.17 -0.23 rotate 3.7 154.41 91.81

$hboxset "default"
$hbox 0 "ValveBiped" 0 -3.33 0 1.784 0 5.777 ""
$hbox 0 "ValveBiped.GunControl" -0.757 -5.958 -2.426 0.709 1.501 5.884 ""
$hbox 0 "ValveBiped.GunControl_back" -0.813 -1.513 -3.426 0.885 0.457 3.392 ""
$hbox 0 "ValveBiped.GunControl_front" -0.777 -1.766 -2.905 0.645 1.068 2.286 ""
$hbox 0 "ValveBiped.GunControl_handle" -0.848 -3.313 -0.542 0.741 0 0.529 ""

$poseparameter "active" 0 1 loop 0

$animation "weapon_pistol" "w_alyxgun_anims\weapon_pistol.smd" {
	fps 30
}

$animation "weapon_smg" "w_alyxgun_anims\weapon_smg.smd" {
	fps 30
}

$sequence "alyxpistol_idle" {
	"w_alyxgun_anims\alyxpistol_idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "attack1" {
	"w_alyxgun_anims\attack1.smd"
	activity "ACT_RANGE_ATTACK_PISTOL" 1
	{ event AE_NPC_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "alyx_blend" {
	"weapon_pistol"
	"weapon_smg"
	autoplay
	blend "active" 0 1
	blendwidth 2
	fadein 0.2
	fadeout 0.2
}

$collisionmodel "w_alyxgun_physics.smd"
{
	$mass 2
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "
}
