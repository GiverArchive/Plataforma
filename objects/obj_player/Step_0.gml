if(life <= 0)
{
	room_restart(); // Game Over bem barrelinha
}

right = keyboard_check(vk_right) || keyboard_check(ord("D"));
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
jump = keyboard_check(vk_space) || keyboard_check(vk_up);
shoot = keyboard_check(ord("F"));

if(jump)
{
	jumped = true;
}

if(jumped)
{
	jumped = false;
	
	if(!jumping)
	{
		if(!place_free(x, y + 1) && place_free(x, y - jump_spd))
		{
			jumping = true;
		}
	}
}

if(jumping)
{
	jump_time++;
	
	if(jump_time >= jump_steps)
	{
		jump_time = 0;
		jumping = false;
	}
	else
	{
		if(place_free(x, y - jump_spd))
		{
			y -= jump_spd;
		}
	}
}
else
{
	if(place_free(x, y + fall_spd))
	{
		y += fall_spd;
		fall_spd += fall_multiplier;
	}
	else
	{
		while(place_empty(x, y + 1))
		{
			y++;
		}
		
		fall_spd = spd;
	}
}

if(left && place_free(x - spd, y))
{
	x -= spd;
	image_xscale = -1;
}

if(right && place_free(x + spd, y))
{
	x += spd;
	image_xscale = 1;
}

if(shoot && !shoot_locked)
{
	shoot_locked = true;
	var obj = instance_create_depth(x, y, 10, obj_bullet);
	obj.dir = image_xscale;
}

if(shoot_locked)
{
	passed_time++;
	
	if(passed_time >= max_passed_time)
	{
		shoot_locked = false;
		passed_time = 0;
	}
}

if(place_meeting(x, y, obj_enemy) && random(100) < 30)
{
	life--;
}

while(place_meeting(x, y, obj_slope))
{
	y--;
}