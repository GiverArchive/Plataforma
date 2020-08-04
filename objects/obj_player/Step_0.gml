right = keyboard_check(vk_right) || keyboard_check(ord("D"));
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
jump = keyboard_check(vk_space) || keyboard_check(vk_up);

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
		y -= jump_spd;
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