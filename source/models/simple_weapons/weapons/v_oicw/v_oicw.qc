// Created by Crowbar 0.63

$modelname "simple_weapons/weapons/v_oicw.mdl"

$body "studio" "v_oicw.smd"

$surfaceprop "default"
$contents "solid"

$cdmaterials "models\weapons\v_hand\"
$cdmaterials "models\simple_weapons\weapons"

$attachment "muzzle" "ValveBiped.Bip01_Spine4" 0.00 -0.00 0.00 rotate -0 0 -90
$attachment "1" "ValveBiped.Bip01_Spine05" 0.00 0.00 0.00 rotate -0 -180 90

$sequence "idle01" {
	"v_oicw_anims\idle01.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 50
	loop
}

$sequence "fire01" {
	"v_oicw_anims\fire01.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SMG1 muzzle" }
	{ event 6001 0 "1" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 120
}

$sequence "fire02" {
	"v_oicw_anims\fire02.smd"
	activity "ACT_VM_RECOIL1" 1
	{ event AE_MUZZLEFLASH 0 "SMG1 muzzle" }
	{ event 6001 0 "1" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 40
}

$sequence "fire03" {
	"v_oicw_anims\fire03.smd"
	activity "ACT_VM_RECOIL2" 1
	{ event AE_MUZZLEFLASH 0 "SMG1 muzzle" }
	{ event 6001 0 "1" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 40
}

$sequence "fire04" {
	"v_oicw_anims\fire04.smd"
	activity "ACT_VM_RECOIL3" 1
	{ event AE_MUZZLEFLASH 0 "SMG1 muzzle" }
	{ event 6001 0 "1" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 40
}

$sequence "secondaryfire" {
	"v_oicw_anims\secondaryfire.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	{ event AE_MUZZLEFLASH 0 "SMG1 muzzle" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 40
}

$sequence "reload" {
	"v_oicw_anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event AE_CL_PLAYSOUND 0 "Weapon_AR2.Reload" }
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 35
}

$sequence "dryfire" {
	"v_oicw_anims\dryfire.smd"
	activity "ACT_VM_DRYFIRE" 1
	fadein 0.2
	fadeout 0.2
	node "Fire"
	fps 30
}

$sequence "draw" {
	"v_oicw_anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 40
}

$sequence "holster" {
	"v_oicw_anims\holster.smd"
	activity "ACT_VM_HOLSTER" 1
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 45
}

$sequence "idletolow" {
	"v_oicw_anims\idletolow.smd"
	activity "ACT_VM_LOWERED_TO_IDLE" 1
	fadein 0.2
	fadeout 0.2
	transition "Ready" "Low"
	fps 30
}

$sequence "lowtoidle" {
	"v_oicw_anims\lowtoidle.smd"
	activity "ACT_VM_IDLE_TO_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	transition "Low" "Ready"
	fps 30
}

$sequence "lowidle" {
	"v_oicw_anims\lowidle.smd"
	activity "ACT_VM_IDLE_LOWERED" 1
	fadein 0.2
	fadeout 0.2
	node "Low"
	fps 40
	loop
}
