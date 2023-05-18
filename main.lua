--hanaa
function _init()
	create_player()
    init_camera()
    init_dialogue()
    create_dialogue("Hey!I'm Robin.", "Press X to start!")
end

--dialogues={"Salut !" ,"Au revoir !"}
--dialogues[1] ça affiche "Salut !"

function _update()

        if not dialogues[1] then
            player_movements()
        
        end  
	
    update_camera()
    update_dialogue()

end

function _draw()
    cls()
    draw_map()
    draw_player()
    draw_ui()
    draw_dialogues()
    
    if player.gems ==6 then
        local x,y=30,8
        --local w,z=50,2
        --print(dialogue_title,w,z,7)
        print("Congrats! You Won.",x,y,7)
        sfx(2) 
    end 
end
