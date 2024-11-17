if place_meeting(x, y, objPlayer) && !instance_exists(objWarp) {
	var inst = instance_create_depth(0, 0, -9999, objWarp);
	inst.targetX = targetX;
	inst.targetY = targetY;
	inst.targetRM = targetRM;
	inst.targetFace = targetFace;
}