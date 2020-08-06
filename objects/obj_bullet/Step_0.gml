x += 10 * dir;

if(x < 0 && x > room_width)
{
	instance_destroy();
}