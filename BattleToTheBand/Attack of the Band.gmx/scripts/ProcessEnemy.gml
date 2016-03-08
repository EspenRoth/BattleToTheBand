    var xx,yy,c1,c2;



// Apply gravity (and jumping)
y = y+grav;
grav+=0.4;
if( grav>=10 ) grav=10;

// If falling, check UNDER the player
if( grav<0 )
{
    if( dir=1){
        //sprite_index = jump_right;
    }else{
        //sprite_index = jump_left;
    }
    c2 = -1;
    c1 = GetCollision(x,y);
    if( (x&$1f)>0 ) {
        c2=GetCollision(x+32,y);
    }
    if( c1>=0 || c2>=0 )
    {
        grav=0;
        y = (y&$ffffffe0)+32;
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
    c1 = GetCollision(x,y+32);
    if( (x&$1f)>0 ) {
        c2=GetCollision(x+32,y+32);
    }
    if( c1>=0 || c2>=0 )
    {
        y = (y&$ffffffe0);
        jump=0;
        
        if( dir=1){
            //sprite_index = walk_right;
        }else{
            //sprite_index = walk_left;
        }           
    }
}    


    // If standing still, don't animate
    image_index =0;
    
// destroy on bullet death
if(instance_exists(player_bullet)){
    if(abs(player_bullet.x - x) < 15){
        if(abs(player_bullet.y - y) < 50){
        with(other){
            instance_destroy();
            }
            instance_destroy();
        }
    }

}







