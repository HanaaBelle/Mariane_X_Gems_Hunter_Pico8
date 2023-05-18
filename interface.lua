---UI---
 
function draw_ui()
    camera() --camera(0,0)

    palt(3,true)
    palt(0,false)

    spr(11,2,2)

    palt()

    print_outline("*"..player.gems,10,4)
end

function print_outline(text, x,y)
    print(text,x-1,y,0)
    print(text,x+1,y,0)
    print(text,x,y-1,0)
    print(text,x,y+1,0)
    print(text,x,y,7)
end