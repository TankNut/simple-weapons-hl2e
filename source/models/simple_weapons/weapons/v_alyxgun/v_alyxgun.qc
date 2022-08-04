// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/v_alyxgun.mdl"

$body "studio" "v_alyxgun.smd"

$surfaceprop "default"
$contents "solid"

$cdmaterials "models\simple_weapons\weapons\"

$attachment "muzzle" "ValveBiped.muzzle" 0 0 0 rotate 0 0 0
$attachment "1" "ValveBiped.eject" -1 0 0 rotate 0 90 -180

$sequence "idle01" {
	"v_alyxgun_anims\idle01.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "fire" {
	"v_alyxgun_anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "draw" {
	"v_alyxgun_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "holster" {
	"v_alyxgun_anims\holster.smd"
	activity "ACT_VM_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "reload" {
	"v_alyxgun_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "pistol2smg" {
	"v_alyxgun_anims\pistol2smg.smd"
	activity "ACT_VM_PULLBACK_HIGH" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "smg2pistol" {
	"v_alyxgun_anims\smg2pistol.smd"
	activity "ACT_VM_PULLBACK_LOW" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 45
}

$sequence "smg_idle01" {
	"v_alyxgun_anims\smg_idle01.smd"
	activity "ACT_VM_HITLEFT" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
	loop
}

$sequence "smg_fire" {
	"v_alyxgun_anims\smg_fire.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	fps 30
	snap
}

$sequence "smg_draw" {
	"v_alyxgun_anims\smg_draw.smd"
	activity "ACT_VM_HAULBACK" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "smg_holster" {
	"v_alyxgun_anims\smg_holster.smd"
	activity "ACT_HL2MP_ALYXGUN_SMG_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}

$sequence "smg_reload" {
	"v_alyxgun_anims\smg_reload.smd"
	activity "ACT_VM_FIDGET" 1
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}
