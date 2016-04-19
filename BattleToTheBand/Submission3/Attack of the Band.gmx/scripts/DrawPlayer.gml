if(keyboard_check(vk_left))
{
    image_speed = 1;
    image_index = 4;
    if(image_index > 5)
    {
        image_index = 4;
    }
}
else if(keyboard_check(vk_right))
{
    image_speed = 1;
    image_index = 2;
    if(image_index > 3)
    {
        image_index = 2;
    }
}
