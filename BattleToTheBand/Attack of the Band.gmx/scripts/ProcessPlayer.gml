var xx,yy,c1,c2;



// Apply gravity (and jumping)
y = y+grav;
grav+=0.4;
if( grav>=10 ) grav=10;

// If falling, check UNDER the player
if( grav>0 )
{
    if( dir=1){
        //sprite_index = jump_right;
    }else{
        //sprite_index = jump_left;
    }
    c2 = -1;
    c1 = GetCollision(x-10,y+32);
    if( (x&$1f)>0 ) {
        c2=GetCollision(x+16,y+32);
    }
    if( c1>=0 || c2>=0 )
    {
        jump = 0;
        grav=0;
        y = (y&$ffffffe0);
    }
}
else{
    // Otherwise, check above player
    if( jump )
    {
        if( dir=1){
            //sprite_index = fall_right;
        }else{
            //sprite_index = fall_left;
        }    
    }else{
        grav=0;
        jump=true;
    }
    c2 = -1;
    c1 = GetCollision(x - 10,y+32);
    if( (x&$1f)>0 ) {
        c2=GetCollision(x + 16,y + 32);
    }
    if( c1>=0 || c2>=0 )
    {
        jump = 0;
        y = (y&$ffffffe0);
        
        
        if( dir=1){
            //sprite_index = walk_right;
        }else{
            //sprite_index = walk_left;
        }           
    }
}    

// If moving left, check LEFT collision
if( keyboard_check(vk_left) ) 
{
   lastdir = 1;
    if(i >=5)
    {       
     left++;
     i = 0;
    }
   
   if(left > 5)
   {
       left = 4;
   }
   image_index = left;
  
    i++;
    dir=-1;
    if(!jump){
        //sprite_index = walk_left;
    }
    x=x-xspeed;
    c2=-1;
    c1 = GetCollision(x-10,y);
    if( (y&$1f)>0 ) c2=GetCollision(x-10,y+32);
    if(  c1>=0 ) || ( c2>=0 )
    {
        x = (x&$ffffffe0) + 10;
    }    
}else if( keyboard_check(vk_right) )
{
    lastdir = 0;
    if(i >=5)
    {       
     right++;
     i = 0;
    }
   
   if(right > 3)
   {
       right = 2;
   }
   image_index = right;
  
    i++;
   
    // Otherwise, check collision to the right
    dir=1;
    if(!jump){
        //sprite_index = walk_right;
    }
    x=x+xspeed;
    c2 = -1;
    c1 = GetCollision(x+16,y);
    if( (y&$1f)>0 ) c2=GetCollision(x+16,y+32);
    if(  c1>=0 ) || ( c2>=0 )
    {
        x = (x&$fffffff0);
    }    
} else {
    // If standing still, don't animate)
    image_index = lastdir;
    right = 2;
    left = 4;
    image_speed = 0;
}

if(y > room_height){
    Die();
}

// destroy on bullet death
//destroy on bullet death
if(instance_exists(enemy_bullet)){
    inst = instance_nearest(x, y, enemy_bullet);
    if(inst.x - x < 2){
        if(abs(inst.y - y) < 25){
            with(inst){
                instance_destroy();
            }
            health -= 10;
            if (health < 1){
                Die();
            }
        }
    }
}





