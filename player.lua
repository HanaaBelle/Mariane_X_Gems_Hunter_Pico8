
function create_player()
	player={x=6,
            y=8,
            dx=0,
            dy=0,
            ox=0,
            oy=0,
            startox=0,
            startoy=0,
            anim_t=0,
	        sprite=9,
	        gems=0}
end

--player.x c'est équivalent à player["x"] pour obtenir la valeur de l'élément qui est 6
--l'index dans un tableau en pico-8 commence par 1
--player[1]=6 , 1 pour le 1er élément du tableau 

function player_movements()
    newx=player.x
    newy=player.y

    if player.anim_t==0 then
        --newox=0
        --newoy=0
        newox,newoy=0,0
        --dx,dy=0,0.98
        if (btn(➡️)) then 
            newx+=1
            newox=-8
            player.flip=false
        end
        if (btn(⬅️)) then
            newx-=1
            newox=8
            player.flip=true  
        end
        if (btn(⬆️)) then
            newy-=1
            newoy=8
        end
        if (btn(⬇️)) then 
            newy+=1
            newoy=-8
        end   
    end 

    interact(newx,newy)
    
    if not check_flag(0, newx, newy) and (player.x != newx or player.y != newy) and (player.gems!=6) then
        --y-a-un-obstacle-on avance--
        player.x=mid(0, newx, 127)
        player.y=mid(0, newy, 63)
        player.startox=newox
        player.startoy=newoy
        player.anim_t=1
        --ou-faire:
        --if (player.x<0) player.x=0
        --if (player.y<0) player.y=0
        --if (player.x>50) player.x=50
        --if (player.y>25) player.y=25
    else
        --sfx(0)
    end

    if (is_grownded()) then
        player.dy = 0
        if (btn(⬆️)) then
            player.dy = -6
        else
            player.dy += 0.98
            if (player.dy > 4) then
                player.dy = 4
            end
        end
    end

    --animation---
    player.anim_t=max(player.anim_t-0.125,0)
    player.ox=player.startox*player.anim_t
    player.oy=player.startoy*player.anim_t

    --if player.anim_t>=0.5 then
      --  player.sprite=10
    --else player.sprite=9--]]

    --ou utilser la programmation ternaire
    --player.sprite=player.anim_t>=0.5 and 10 or 9    (on peut le mettre commme parametre dans le spr de la fct draw_player)

end

function interact(x,y)
    if check_flag(1,x,y) then
        pick_up_gems(x,y)
    end
end 

function is_grownded()
    grownd = mget(flr(player.x+4)/8,(flr(player.y)/8)+1)
    if (grownd == 8) then
        return fget(grownd,2)
    end
end

function draw_player()
	--spr(player.sprite, player.x*8, player.y*8)
    --spr(idsprite,x,y,largeur,hauteur,miroirx(flip retourner à gauche et à droite),miroiry)
    spr(player.anim_t>=0.5 and 10 or 9, player.x*8 + player.ox, player.y*8 + player.oy, 1, 1, player.flip)
end

