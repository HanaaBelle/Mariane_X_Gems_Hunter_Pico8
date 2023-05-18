--boite-de-dialogues--

function init_dialogue()
    dialogues={}
end

function create_dialogue(name,...)
    dialogue_title=name

    dialogues={...}
end

function update_dialogue()
    if (btn(❎)) then
        --del(tableau,element) --> del( table, value )
        --deli(tableau,element) --> deli( table, [index] )
        deli(dialogues,1)
    end
end

function draw_dialogues()
    if dialogues[1] then
        local x,y,w,z=30,10,40,2
        palt(13,true)
        spr(14,29,2)
        rectfill(39,1,39+#dialogue_title*4,z+6,2)
        print(dialogue_title,w,z,7)
        print(dialogues[1],x,y,7)
        printh('hello')
    end
end