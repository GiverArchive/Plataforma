right = keyboard_check(vk_right) || keyboard_check(ord("D"));
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
jump = keyboard_check(vk_space) || keyboard_check(vk_up);

if(left)
{
	x -= spd;
	image_xscale = -1;
}

if(right)
{
	x += spd;
	image_xscale = 1;
}