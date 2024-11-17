right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

// Geschwindigkeiten regeln
xspd = (right_key - left_key) * movespd;
yspd = (down_key - up_key) * movespd;

// Pause
if instance_exists(objPauser) { 
	xspd = 0;
	yspd = 0;
}

// Sprite ändern
mask_index = sprite[DOWN];
if yspd == 0 {
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
}
if xspd > 0 && face == LEFT {face = RIGHT};
if xspd < 0 && face == RIGHT {face = LEFT};
if xspd == 0 {
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
}
if yspd > 0 && face == UP {face = DOWN};
if yspd < 0 && face == DOWN {face = UP};
sprite_index = sprite[face];

// Kollisionen
if place_meeting(x + xspd, y, objWall) || place_meeting(x + xspd, y, objTable1) == true {
	xspd = 0;
}
if place_meeting(x, y + yspd, objWall) || place_meeting(x + xspd, y, objTable1) == true {
	yspd = 0;
}

// Spieler bewegen
x += xspd;
y += yspd;

// Animiere
if xspd == 0 && yspd == 0 {
	image_index = 1;
}

// Tiefe
depth = -bbox_bottom;