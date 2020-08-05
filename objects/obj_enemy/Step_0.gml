if(!place_free(x + spd * dir, y) || place_free(x + spd * dir, y + 1))
{
	dir *= -1;
	image_xscale *= -1;
}

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

x += spd * dir;

