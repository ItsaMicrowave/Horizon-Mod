SMODS.Atlas{
    key = 'chessbooster',
    path = 'booster_pack.png',
    px =  71,
    py = 95
}


SMODS.Booster{
    key = 'chess_normal_1',
    atlas = 'chessbooster',
    pos = {x=0,y=0},
    kind = 'Chess',
    config = {extra = 2, choose = 1},
    cost = 10,
    draw_hand = false,
    create_card = function(self, card)
        return create_card("chess", G.pack_cards, nil, nil, true, true, nil, "chesshahaha")
    end,
    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 5 then
            return true
        end
    end,
    ease_background_colour = function(self)
        ease_background_colour{new_colour = HEX('4f6439'), special_colour = HEX('4f6439'), contrast = 1}
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 0, 0,0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {HEX('769656')},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    select_card = 'chess',
    weight = 0.3,
    group_key = 'k_hrzi_chess_pack'
}

SMODS.Booster{
    key = 'chess_normal_2',
    atlas = 'chessbooster',
    pos = {x=1,y=0},
    kind = 'Chess',
    config = {extra = 2, choose = 1},
    cost = 10,
    draw_hand = false,
    create_card = function(self, card)
        return create_card("chess", G.pack_cards, nil, nil, true, true, nil, "chesshahaasdfsdfaha")
    end,
    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 5 then
            return true
        end
    end,
    ease_background_colour = function(self)
        ease_background_colour{new_colour = HEX('4f6439'), special_colour = HEX('4f6439'), contrast = 1}
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 0, 0,0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {HEX('769656')},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    select_card = 'chess',
    weight = 0.3,
    group_key = 'k_hrzi_chess_pack'
}


SMODS.Booster{
    key = 'chess_jumbo_1',
    atlas = 'chessbooster',
    pos = {x=2,y=0},
    kind = 'Chess',
    config = {extra = 4, choose = 1},
    cost = 13,
    draw_hand = false,
    create_card = function(self, card)
        return create_card("chess", G.pack_cards, nil, nil, true, true, nil, "chesshahaasdfsdfaha")
    end,
    in_pool = function(self, args)
        if G.GAME.round_resets.ante >= 5 then
            return true
        end
    end,
    ease_background_colour = function(self)
        ease_background_colour{new_colour = HEX('4f6439'), special_colour = HEX('4f6439'), contrast = 1}
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 0, 0,0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = {HEX('769656')},
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    select_card = 'chess',
    weight = 0.2,
    group_key = 'k_hrzi_chess_pack'
}