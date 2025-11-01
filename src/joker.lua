--- thx jen!

local function most_abundant_suit()
    if not G.playing_cards then return nil end
    
    local suit_counts = {}
    local max_count = 0
    local tied_suits = {} 
    

    for k, v in ipairs(G.playing_cards) do
        if v.ability.name ~= 'Stone Card' then 
            local current_suit = v.base.suit
            suit_counts[current_suit] = (suit_counts[current_suit] or 0) + 1
            local current_count = suit_counts[current_suit]
            
            if current_count > max_count then
                max_count = current_count
                tied_suits = {current_suit} 
            elseif current_count == max_count then

                local already_exists = false
                for _, suit in ipairs(tied_suits) do
                    if suit == current_suit then
                        already_exists = true
                        break
                    end
                end
                if not already_exists then
                    table.insert(tied_suits, current_suit)
                end
            end
        end
    end
    

    if #tied_suits == 0 then
        return nil 
    elseif #tied_suits == 1 then
        return tied_suits[1] 
    else

        return pseudorandom_element(tied_suits, pseudoseed('tie_breaker'))
    end
end
 

--- JOKER CODE ---
SMODS.Joker:take_ownership('perkeo', {
    name = 'Perkeo',
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
        return {vars = {center.ability.extra}}
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            local valid_consumables = {}
            for _, c in ipairs(G.consumeables.cards) do
                local def = c.config.center
                if def and not def.no_perkeo then
                    table.insert(valid_consumables, c)
                end
            end

            if #valid_consumables > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local selected = pseudorandom_element(valid_consumables, pseudoseed('perkeo2'))
                        local duplicate = copy_card(selected, nil)
                        duplicate:set_edition('e_negative', true)
                        duplicate:add_to_deck()
                        G.consumeables:emplace(duplicate)
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = localize('k_duplicated_ex') })
            end
        end
    end
},
true
)



--[[[
--- Test Joker 
SMODS.Atlas{
    key = 'test',
    path = 'test.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'jtest',
    loc_txt = {
        name = 'Faggoty Waggoty',
        text = {
            '{X:mult,C:white}x#1#{} Mult',
            '{s:3}gay faggot gay gay :3 gay uwu{}',
            '{X:dark_edition,C:white}faggot{}',
            '{C:edition}Edition{}',
        },
    },

    atlas = 'test',
    pos = {x=0, y=0},
    rarity = 4,
    cost = 1,

    config = { 
        extra = {
            Xmult = 1.1e302
        }
    },

    loc_vars = function(self,info_queue,center)
        return {vars = {center.ability.extra.Xmult}} 
    end,

    calculate = function(self,card,context)
        if context.joker_main then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. card.ability.extra.Xmult,
                colour = G.C.MULT
            }
        end

        if context.setting_blind then
            local new_card = create_card('hrzi_ability', G.consumeables, nil, nil, nil, nil, 'yin_c')
            new_card:add_to_deck()
            G.consumeables:emplace(new_card) 
        end
    end,

}
]]

--- Supreme Justice
SMODS.Atlas{
    key = 'supreme_justice',
    path = 'supreme_justice.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'supreme_justice',

    atlas = 'supreme_justice',
    pos = {x=0, y=0},
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_justice
        info_queue[#info_queue+1] = G.P_CENTERS.c_deja_vu
    end, 

    calculate = function(self, card, context)
            if context.hand_drawn and G.GAME.current_round.hands_left == 1 then
                local any_forced = nil
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_card.ability.forced_selection then
                        any_forced = true
                    end
                end
                if not any_forced then
                    G.hand:unhighlight_all()
                    if #G.hand.cards > 0 then
                        local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('jsjusticelolol'))
                        forced_card.ability = forced_card.ability or {} 
                        forced_card.ability.forced_selection = true
                        forced_card:set_ability('m_glass', nil, true)
                        forced_card:set_seal('Red', true)
                    end
                end
            end
    end, 
}


--- Skygazer
SMODS.Atlas{
    key = 'skygazer',
    path = 'skygazer.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'skygazer',

    atlas = 'skygazer',
    pos = {x=0, y=0},
    rarity = 3,
    cost = 12,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
 

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        info_queue[#info_queue+1] = G.P_CENTERS.c_moon
        info_queue[#info_queue+1] = G.P_CENTERS.c_sun
        info_queue[#info_queue+1] = G.P_CENTERS.c_world
        info_queue[#info_queue+1] = G.P_CENTERS.c_star
    end, 

    calculate = function(self, card, context)
        if context.setting_blind then
            local mostsuit = most_abundant_suit()
            if mostsuit == 'Spades' then
                for i = 1, 3 do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1 * i, 
                        func = function()
                            local new_card = create_card('World', G.consumeables, nil, nil, nil, nil, 'c_world')
                            new_card:set_edition({negative = true}, true)
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            return true
                        end
                    }))
                end
            elseif mostsuit == 'Hearts' then
                for i = 1, 3 do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1 * i, 
                        func = function()
                            local new_card = create_card('Sun', G.consumeables, nil, nil, nil, nil, 'c_sun')
                            new_card:set_edition({negative = true}, true)
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            return true
                        end
                    }))
                end
            elseif mostsuit == 'Diamonds' then
                for i = 1, 3 do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1 * i, 
                        func = function()
                            local new_card = create_card('Star', G.consumeables, nil, nil, nil, nil, 'c_star')
                            new_card:set_edition({negative = true}, true)
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            return true
                        end
                    }))
                end
            elseif mostsuit == 'Clubs' then
                for i = 1, 3 do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1 * i, 
                        func = function()
                            local new_card = create_card('Moon', G.consumeables, nil, nil, nil, nil, 'c_moon')
                            new_card:set_edition({negative = true}, true)
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            return true
                        end
                    }))
                end
            end
        end
    end, 

}

--- Gacha
SMODS.Atlas{
    key = 'gacha',
    path = 'gacha.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'gacha',

    atlas = 'gacha',
    pos = {x=0, y=0},
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,


loc_vars = function(self, info_queue, card)
end,

calculate = function(self, card, context)
    if context.open_booster then 
        local money_pool = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,2,2,2,3,3,5,8,12,25}
        local amount = money_pool[math.random(#money_pool)]
        G.GAME.dollars = G.GAME.dollars + amount
        return{
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                play_sound('timpani')
                ease_dollars(amount, true)
                return true end }))
        }
    end
end,
}


--- End Credits
SMODS.Atlas{
    key = 'end_credits',
    path = 'end_credits.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'end_credits',

    atlas = 'end_credits',
    pos = {x=0,y=0},
    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = {
        extra = {
            Xmult = 1,
            Xmult_mod = 0.1
        }
    },


    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
                card = card,
                message = 'X' .. card.ability.extra.Xmult,
                Xmult_mod = card.ability.extra.Xmult
            }
        end
    end

}


--- Quarry
local money_added_tracker = {}

SMODS.Atlas{
    key = 'quarry',
    path = 'quarry.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'quarry',

    atlas = 'quarry',
    pos = {x=0,y=0},
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    config = {
        extra = {
            money = 1
        }
    },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return { vars = {card.ability.extra.money}}
    end,

    calculate = function(self, card, context)
        if context.individual then
            if context.cardarea == G.play then
                if SMODS.has_enhancement(context.other_card, 'm_stone') then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            play_sound('timpani')
                            ease_dollars(card.ability.extra.money, true)
                            return true
                        end,
                    }))
                    if not money_added_tracker[context.other_card] then
                        money_added_tracker[context.other_card] = true
                    end
                    return {
                        card = card,
                        message = 'Mined!',
                        colour = G.C.MONEY
                    }
                end
            end
        end
    end,
}


--- Event Horizon
SMODS.Atlas{
    key = 'event_horizon',
    path = 'event_horizon.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'event_horizon',

    atlas = 'event_horizon',
    pos = {x=0,y=0},
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_black_hole
    end, 


    calculate = function(self, card, context)
        if context.ending_shop then
            local planets_destroyed = 0
            for i = #G.consumeables.cards, 1, -1 do
                local c = G.consumeables.cards[i]
                if c.ability and c.ability.set == 'Planet' then
                    c:remove()
                    planets_destroyed = planets_destroyed + 1
                end
            end
            for i = 2, planets_destroyed do
                local new_card = create_card('Black Hole', G.consumeables, nil, nil, nil, nil, 'c_black_hole')
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                return{
                    card = card,
                    message = 'Collapse!',
                    colour = G.C.PURPLE
                }
            end
        end
    end


}


--- To Apotheosis
SMODS.Atlas{
    key = 'to_apotheosis',
    path = 'to_apotheosis.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'to_apotheosis',

    atlas = 'to_apotheosis',
    pos = {x=0,y=0},
    soul_pos = {x = 1,y=0},
    rarity = 4,
    cost = 18,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            Xmult = 1,
            Xmult_mod = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult}}
    end,

calculate = function(self, card, context)
	if ((context.before and next(context.poker_hands['Five of a Kind'])) or  (context.before and next(context.poker_hands['Flush House'])) or (context.before and next(context.poker_hands['Flush Five'])) or (context.before and next(context.poker_hands['hrzi_Rampart'])) or (context.before and next(context.poker_hands['hrzi_Suited_Monarchs']))) then
		card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
		return {
			message = 'Ascended',
			colour = G.C.MULT,
		}
	end
    

	if context.joker_main then
		return {
            card = card,
			Xmult_mod = card.ability.extra.Xmult,
            message = 'X' .. card.ability.extra.Xmult,
            colour = G.C.MULT,
		}
	end
end

}


--- Geologist 
SMODS.Atlas{
    key = 'geologist',
    path = 'geologist.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'geologist',
    loc_txt = {

    },

    atlas = 'geologist',
    pos = {x=0, y=0},
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            mult = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone

        local stone_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * stone_tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local stone_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
            end
            return {
                mult = card.ability.extra.mult * stone_tally
            }
        end
    end,
}


local stoneXchiptracker = {}

--- Stonehenge
SMODS.Atlas{
    key = 'stonehenge',
    path = 'stonehenge.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'stonehenge',
    atlas = 'stonehenge',
    pos = {x=0,y=0},
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = {
        extra = {
            Xchips = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {vars = {card.ability.extra.Xchips}}
    end,

    reset = function(self)
        stoneXchiptracker = {}
    end,
    calculate = function(self, card, context)
        if context.individual then
            if context.cardarea == G.play then
                if SMODS.has_enhancement(context.other_card, 'm_stone') then
                    card.ability.extra.Xchips = card.ability.extra.Xchips + 0.5
                    if not stoneXchiptracker[context.other_card] then
                        stoneXchiptracker[context.other_card] = true
                    end
                    return {
                        card = card,
                        xchips = card.ability.extra.Xchips,
                        colour = G.C.CHIPS
                    }
                end
            end
        end

        if context.after and card.ability.extra.Xchips > 1 then
            card.ability.extra.Xchips = 1
            stoneXchiptracker = {}
            return {
                card = card,
                message = 'Reset!',
                colour = G.C.CHIPS
            }
        end
    end
}


--- Brainwashing
SMODS.Atlas{
    key = 'brainwashing',
    path = 'brainwashing.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'brainwashing',


    atlas = 'brainwashing',
    pos = {x = 0, y = 0},
    soul_pos = {x=1,y=0},
    rarity = 4,
    cost = 18,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    config = {
        extra = {
            Emult = 1.75,
            countdown = 3,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        return { vars = {card.ability.extra.Emult, card.ability.extra.countdown}}
    end,

    calculate = function(self, card, context)

        local contains_wild = false
        for _, played_card in ipairs(G.play.cards) do
            if SMODS.get_enhancements(played_card)["m_wild"] then
                contains_wild = true
                break  
            end
        end
    

        if context.after and not context.blueprint then
            if not contains_wild then
                card.ability.extra.countdown = card.ability.extra.countdown - 1
            end
            contains_wild = false
        end
    

        if card.ability.extra.countdown > 0 then
            if context.joker_main then
                return {
                    card = card,
                    Emult_mod = card.ability.extra.Emult,
                    message = '^' .. card.ability.extra.Emult,
                    colour = G.C.DARK_EDITION
                }
            end
        end
    

        if card.ability.extra.countdown <= 0 and context.after and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.jokers:remove_card(card)
                    card:remove()
                    card = nil
                    return true
                end
            }))
        end
    end
   
}


--- Monopoly Man
SMODS.Atlas{
    key = 'wallstreet',
    path = 'wallstreet.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'monopoly_man',


    atlas = 'wallstreet',
    pos = {x = 0, y = 0},
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    config = {
        extra = 0
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return { vars = {card.ability.extra}}
    end,


    calculate = function(self, card, context)
        if context.discard and context.other_card then
            if not context.other_card.debuff and SMODS.has_enhancement(context.other_card, 'm_gold') then
                local divisions = math.floor(G.GAME.dollars / 40)
                if divisions > to_big(0) then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = 'Reduced!', colour = G.C.MONEY })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function() 
                            G.GAME.blind.chips = G.GAME.blind.chips / (to_big(2) * divisions)
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            SMODS.juice_up_blind()
                            return true
                        end
                    }))
                end
            end
        end
    end
} 



--- Sinful Deal
SMODS.Atlas{
    key = 'sinful_deal',
    path = 'sinful_deal.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'sinful_deal',

    atlas = 'sinful_deal',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,   
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_devil
    end,
}

SMODS.Booster:take_ownership_by_kind('Arcana', {
    create_card = function(self, card, i)
        local _card
        if #SMODS.find_card('j_hrzi_sinful_deal') > 0 and i == 1 then
            _card = {
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key = 'c_devil',
                key_append = "pl1"
            }
        else
            _card = { set = "Tarot", area = G.pack_cards, skip_materialize = true, soulable = true, key_append =
            "pl2" }
        end
        return _card
    end,
    loc_vars = pack_loc_vars,
},
true
)



--- Creme de la Crop
SMODS.Atlas{
    key = 'cremedlc',
    path = 'cremedlc.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'cremedlc',

    atlas = 'cremedlc',
    pos = {x = 0, y = 0},
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    perishable_compat = true,
    eternal_compat = true,

    config = {
        extra = 0
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_negative
        return { vars = {card.ability.extra}}
    end,

    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == 'Joker' and not context.blueprint then
            if card.ability.extra <= 9 then
                card.ability.extra = card.ability.extra + 1
                return{
                    message = card.ability.extra .. '/' .. 10,
                    colour = G.C.ATTENTION
                }
            end
        end

        if card.ability.extra >= 10 then
            local eval = function(card) return not card.REMOVED end
            juice_card_until(card, eval, true)
        end

        if context.selling_self and card.ability.extra >= 10 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local copyjoker = G.jokers.cards[1]
                    copyjoker:set_edition({negative = true})
                    return true
                end
            }))
        end
    end
}


---Headshot
SMODS.Atlas{
    key = 'headshot',
    path = 'headshot.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'headshot',

    atlas = 'headshot',
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,

    add_to_deck = function(self, card, debuff)
        play_sound("hrzi_iamsniper")
    end,

    calculate = function(self, card, context)
        if not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack then
            if context.selling_card and context.card.config.center.set == "Joker" then
                G.GAME.blind.chips = G.GAME.blind.chips * 0.65
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                
                return {
                    card = card,
                    message = 'Headshot!',
                    colour = G.C.MULT,
                    play_sound("hrzi_headshotea")
                }
            end
        end

        if context.setting_blind then
            play_sound("hrzi_nowstart")
        end
        
    end
}

---YinYang
--[[[SMODS.Atlas{
    key = 'yinyang',
    path = 'yinyang.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'jyinyang',
    loc_txt = {
        name = 'Yin Yang',
        text = {
            'Create a {C:attention}Yin{} and {C:attention}Yang{}',
            '{C:inactive}(Gets destroyed if this joker is sold){}',
        }
    },

    atlas = 'yinyang',
    pos = {x=0,y=0},
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    perishable_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, center)

    end,

    calculate = function(self, card, context)
        
        local new_card = create_card('Yin', G.consumeables, nil, nil, nil, nil, 'c_yin')
        new_card:set_edition({negative = true}, true)
        new_card:add_to_deck()
        G.consumeables:emplace(new_card)

        local new_card = create_card('Yang', G.consumeables, nil, nil, nil, nil, 'c_yang')
        new_card:set_edition({negative = true}, true)
        new_card:add_to_deck()
        G.consumeables:emplace(new_card)
    end
}
]]


---The Chosen
SMODS.Atlas{
    key = 'thechosen',
    path = 'thechosen.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'thechosen',

    atlas = 'thechosen',
    pos = {x=0,y=0},
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            Xmult = 6
        }
    },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.Xmult,
                localize(G.GAME.current_round.thechosen_card.suit, 'suits_singular'),
                colours = { G.C.SUITS[G.GAME.current_round.thechosen_card.suit] },
            }
        }
    end,

    calculate = function(self, card, context)

        if context.joker_main then
            if #context.full_hand == 1 then
                local played_card = context.full_hand[1]
                if played_card:is_suit(G.GAME.current_round.thechosen_card.suit) and played_card:get_id() == 14 then
                    return {
                        card = card,
                        Xmult_mod = card.ability.extra.Xmult,
                        message = 'X'.. card.ability.extra.Xmult,
                        colour = G.C.MULT
                    }
                end
            end
        end

    end
}

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.thechosen_card = { suit = 'Spades' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	G.GAME.current_round.thechosen_card = { suit = 'Spades' }
	local valid_thechosen_cards = {}
	for _, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_suit(v) then 
			valid_thechosen_cards[#valid_thechosen_cards + 1] = v
		end
	end
	if valid_thechosen_cards[1] then
		local thechosen_card = pseudorandom_element(valid_thechosen_cards, pseudoseed('5tcs' .. G.GAME.round_resets.ante))
		G.GAME.current_round.thechosen_card.suit = thechosen_card.base.suit
	end
end

-- ]]

SMODS.Atlas{
    key = 'ecstatic',
    path = 'ecstatic.png',
    px = 71,
    py = 95,
}

SMODS.Joker {
    atlas = 'ecstatic',
    pos = {x=0,y=0},
    key = 'ecstatic',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 4,
    config = { 
        extra = { 
            mult = 12 } 
        },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.mult, } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['hrzi_Rampart']) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = 'frenzy',
    path = 'frenzy.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    atlas = 'frenzy',
    pos = {x=0,y=0},
    key = 'frenzy',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 4,
    config = { 
        extra = { 
            mult = 10 } 
        },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.mult, } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['hrzi_Monarchal']) then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

SMODS.Atlas{
    key = 'manic',
    path = 'manic.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    atlas = 'manic',
    pos = {x=0,y=0},
    key = 'manic',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 4,

    config = { 
        extra = { 
            chips = 80 } 
        },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.chips, } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['hrzi_Rampart']) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Atlas{
    key = 'hysterical',
    path = 'hysterical.png',
    px = 71,
    py = 95
}

SMODS.Joker {
    atlas = 'hysterical',
    pos = {x=0,y=0},
    key = 'hysterical',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 4,

    config = { 
        extra = { 
            chips = 100 } 
        },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.chips, } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['hrzi_Monarchal']) then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

SMODS.Atlas{
    key = 'conjure',
    path = 'conjure.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'conjure',
    atlas = 'conjure',
    pos = {x=0,y=0},
    config = {
        extra = {
            counter = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_hrzi_king
        info_queue[#info_queue+1] = G.P_CENTERS.c_hrzi_queen
        return{ 
            vars = {card.ability.extra.counter}
        }
    end,

    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    calculate = function(self, card, context)
        if context.ending_shop and #G.chess.cards < G.chess.config.card_limit then
            if #SMODS.find_card('c_emperor') > 0 and #SMODS.find_card('c_empress') > 0 then
                card.ability.extra.counter = card.ability.extra.counter - 1
                if pseudorandom('blahblahblah') < 1 / 2 then
                    SMODS.add_card({key = 'c_hrzi_king'})
                else
                    SMODS.add_card({key = 'c_hrzi_queen'})
                end
                if card.ability.extra.counter == 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true
                        end
                    }))
                end
            end
        end
    end
}



SMODS.Atlas{
    key = 'orthog',
    path = 'orthog.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'orthogonal',
    atlas = 'orthog',
    pos = {x=0,y=0},
    soul_pos = {x=1,y=0},

    rarity = 'hrzi_chess',
    no_collection = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    in_pool = function(self, args)
        return false
    end,

    config = {
        extra = {
            repetitions = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        --[[
        if card.area and card.area == G.jokers then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
            end
            local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            }
            return { main_end = main_end }
        end]]
        return{ vars = {
            card.ability.extra.repetitions + (G.GAME.hrzi_rook_used or 0)
        }}
    end,

    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card and not context.blueprint then
            local ind = 1
            for i, v in ipairs(G.jokers.cards) do
                if v == card then
                    ind = i
                end
            end
            local left_joker = G.jokers.cards[ind - 1]
            if (context.other_card == left_joker) then
                return {
                    message = 'Again!',
                    colour = G.C.HRZI.CHESS,
                    repetitions = card.ability.extra.repetitions + (G.GAME.hrzi_rook_used or 0),
                    card = card
                }
            end
        end
    end
 
}

SMODS.Atlas{
    key = 'dawn',
    path = 'dawn.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'dawn',
    atlas = 'dawn',
    pos = {x=0,y = 0 },
  
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    
    config = {
        extra = {
            money = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return{vars = {card.ability.extra.money}}
    end,

    calculate = function(self, card, context)
        if (context.post_trigger or context.forcetrigger) and G.GAME.current_round.hands_played == 0 then
            ease_dollars(card.ability.extra.money)
        end
    end
}
--[[
SMODS.Joker{
    key = 'golden',
    atlas = 'dawn',
    loc_txt = {
        name = 'Golden',
        text = {
            'Lose all money and turn it into this cards sell value',
            'After every round, increase sell value by %10'
        }
    },

    rarity = 3,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    add_to_deck = function(self, card, debuff)
        local goldenmoney = G.GAME.dollars 
        ease_dollars(-goldenmoney) 
        card.ability.extra_value = goldenmoney
        card:set_cost()
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra_value = math.floor(card.ability.extra_value * 1.1)
            card:set_cost()       
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}
]]
---context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint

SMODS.Atlas{
    key = 'endure',
    path = 'endure.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'endure',
    atlas = 'endure',
    pos = {x=0,y=0},

    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    config = {
        extra = {
            rounds = 2,
            counter = 0,
        }
    },

    loc_vars = function(self, info_queue, card)
        return{ vars = {card.ability.extra.rounds, card.ability.extra.counter}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            card.ability.extra.counter = card.ability.extra.counter + 1
            if card.ability.extra.counter == card.ability.extra.rounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.extra.counter < card.ability.extra.rounds) and
                    (card.ability.extra.counter .. '/' .. card.ability.extra.rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end

        if context.selling_self and (card.ability.extra.counter >= card.ability.extra.rounds) and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Joker', legendary = true })
                    check_for_unlock { type = 'spawn_legendary' }
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
            ease_ante(1)
            G.GAME.win_ante = G.GAME.win_ante + 2
        end
    end

}

SMODS.Atlas{
    key = 'products',
    path = 'products.png',
    px = 71,
    py = 95
}
---add gift card synergy later lmao
SMODS.Joker{
    key = 'products',
    atlas = 'products',
    pos = {x=0,y=0},
    
    rarity = 2,
    cost = 6,
    eternal_compat = true,
    blueprint_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            chip_gain = 1,
            mult_gain = 1,
            chips = 0,
            mult = 0
        }
    },

    loc_vars = function(self,info_queue,card)
        return{ vars={
            card.ability.extra.chip_gain,
            card.ability.extra.mult_gain,
            card.ability.extra.chips,
            card.ability.extra.mult,
        }}
    end,

    add_to_deck = function(self, card, debuff)
        play_sound('hrzi_gulp')
    end,

    calculate = function(self, card, context)
        if context.buying_card and not context.blueprint and not (context.card == card) then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            play_sound('hrzi_scream')
            return{
                message = 'Bought!',
                colour = G.C.ATTENTION
            }
        end

        if context.joker_main and (card.ability.extra.chips > 0 and card.ability.extra.mult > 0) then
            return{
                chip_mod = card.ability.extra.chips,
                mult_mod = card.ability.extra.mult,
                message = 'Products!',
                colour = G.C.MONEY,
                card = card
            }
        end
    end
}


local function get_ordinal_suffix(num)
    if not num or num == 0 then return "0th" end
    
    local last_digit = num % 10
    local last_two_digits = num % 100
    
    if last_two_digits >= 11 and last_two_digits <= 13 then
        return num .. "th"
    elseif last_digit == 1 then
        return num .. "st"
    elseif last_digit == 2 then
        return num .. "nd"
    elseif last_digit == 3 then
        return num .. "rd"
    else
        return num .. "th"
    end
end

SMODS.Atlas{
    key = 'map',
    path = 'map.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'map',
    atlas = 'map',

    rarity = 1,
    cost = 4,
    eternal_compat = true,
    blueprint_compat = false,
    perishable_compat = true,

    config = {
        extra = {
            targetpos = 1,
            Xmult = 3  
        }
    },

    add_to_deck = function(self, card, from_debuff)
        if #G.jokers.cards > 0 then
            local random_num = math.random(1, #G.jokers.cards)
            card.ability.extra.targetpos = random_num 
        else
            card.ability.extra.targetpos = 0 
        end
    end,

    loc_vars = function(self, info_queue, card)
        local target_pos = card.ability.extra.targetpos or 1
        local xmult_val = card.ability.extra.Xmult or 3
        local ordinal_pos = get_ordinal_suffix(target_pos) 
        
        return {
            vars = {
                xmult_val,      
                ordinal_pos,
                target_pos
            }
        }
    end,

    calculate = function(self, card, context)
        card.ability.extra.Xmult = card.ability.extra.Xmult or 3
        card.ability.extra.targetpos = card.ability.extra.targetpos or 1        
        local my_pos
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        
        if context.joker_main and my_pos == card.ability.extra.targetpos then
            return {
                card = card,
                Xmult_mod = card.ability.extra.Xmult,
                message = 'X' .. tostring(card.ability.extra.Xmult) .. ' Mult',
                colour = G.C.MULT
            }
        end

        if (context.final_scoring_step and context.cardarea == G.jokers) or my_pos > #G.jokers.cards then
            if #G.jokers.cards > 0 then
                local random_num = math.random(1, #G.jokers.cards)
                card.ability.extra.targetpos = random_num 
            else
                card.ability.extra.targetpos = 0 
            end
        end
    end
}


SMODS.Atlas{
    key = 'cogreed',
    path = 'cogreed.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'cogreed',
    atlas = 'cogreed',

    rarity = 2,
    cost = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            odds = 8
        }
    },

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.buying_card and not context.blueprint and not (context.card == card) then
            if pseudorandom('greedyboyhahahhahha') < G.GAME.probabilities.normal / card.ability.extra.odds then
                SMODS.destroy_cards(card, nil, nil, true)
                G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
            end
        end

        if context.selling_self then
            for i = 1, 40 do
				G.E_MANAGER:add_event(Event({
					delay = 0.1,
					func = function()
						G.playing_card = (G.playing_card and G.playing_card + 1) or 1
						local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, pseudorandom_element(G.P_CARDS, pseudoseed('cogreedhahhaha')), G.P_CENTERS.m_stone, {playing_card = G.playing_card})
						if math.floor(i/2) ~= i then play_sound('card1') end
						table.insert(G.playing_cards, card)
						G.deck:emplace(card)
                        SMODS.debuff_card(card, true, 'j_hrzi_cogreed')
						return true
					end
				}))
			end
        end
    end
}

local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    if next(SMODS.find_card("j_hrzi_cogreed")) then
        if (self.ability.set == 'Planet' or self.ability.set == 'Tarot' or self.ability.set == 'Joker' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then self.cost = 0 end
        self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
        self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
    end
end

SMODS.Atlas{
    key = 'cupid',
    path = 'cupid.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'cupid',
    atlas = 'cupid',
    

    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            odds = 4
        }
    },

    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cupidmakesmefeelsostupid')
        return { vars = {numerator, denominator}}
    end,

    calculate = function(self, card, context)
        if context.check then 
            -- Reset all cards first
            for i, v in pairs(G.hand.cards) do 
                v.wild_spread = false
                v.wild_spreaded = false 
            end
            
            -- Only mark highlighted cards as destroyers if they have Wild enhancement
            for i, v in pairs(G.hand.highlighted) do
                if SMODS.has_enhancement(v, 'm_wild') then
                    v.wild_spread = true
                end
            end
            
            -- Spread Wild enhancement to adjacent cards
            if SMODS.pseudorandom_probability(card, 'cupidhahhahha', 1, card.ability.extra.odds) then
                for i, v in pairs(G.hand.cards) do
                    if v.wild_spread and not v.wild_spreaded then
                        if G.hand.cards[i-1] then
                            G.hand.cards[i-1]:set_ability('m_wild', nil, true)
                            G.hand.cards[i-1]:juice_up()
                        end
                        if G.hand.cards[i+1] then
                            G.hand.cards[i+1]:set_ability('m_wild', nil, true)
                            G.hand.cards[i+1]:juice_up()
                        end
                        v.wild_spread = false
                        v.wild_spreaded = true
                    end
                end
            end
        end
    end
}

SMODS.Atlas{
    key = 'streetart',
    path = 'streetart.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'streetart',
    atlas = 'streetart',

    rarity = 1,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            mult = 1,
            type = 'hrzi_flush'
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        return{ vars = {
            card.ability.extra.mult,
            card.ability.extra.type
    }}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_wild') then
            if G.GAME.current_round.current_hand.handname == "Flush" or G.GAME.current_round.current_hand.handname == "Straight Flush" or G.GAME.current_round.current_hand.handname == "Suited Monarchs"  then
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.mult
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end
    end
}

---G.GAME.current_round.current_hand.handname == "Flush" or G.GAME.current_round.current_hand.handname == "Straight Flush" or G.GAME.current_round.current_hand.handname == "hrzi_Suited_Monarchs"

SMODS.Atlas{
    key = 'emergency',
    path = 'emergency.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'emergency',
    atlas = 'emergency',

    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = false,

    config = {
        extra = {
            odds = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.tag_hrzi_soup
        info_queue[#info_queue+1] = G.P_CENTERS.tag_hrzi_water
        info_queue[#info_queue+1] = G.P_CENTERS.tag_hrzi_medkit
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sixtysecondshahha')
        return { vars = {numerator, denominator} }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop then
            if SMODS.pseudorandom_probability(card, 'sixtysecondshahha', 1, card.ability.extra.odds) then
                local roll = math.random(100)  
                if roll <= 45 then
                    add_tag(Tag('tag_hrzi_soup'))
                    return{
                        card = card,
                        message = 'Soup!',
                        colour = G.C.RED
                    }
                elseif roll <= 90 then 
                    add_tag(Tag('tag_hrzi_water'))
                    return{
                        card = card,
                        message = 'Water!',
                        colour = G.C.BLUE
                    }
                else 
                    add_tag(Tag('tag_hrzi_medkit'))
                    return{
                        card = card,
                        message = 'Medkit!',
                        colour = G.C.GREEN
                    }
                end
            end
        end
    end
}

SMODS.Atlas{
    key = 'blazing',
    path = 'blazing.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'blazingsun',
    atlas = 'blazing',

    rarity = 3,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    config = {
        extra = {
            chipmod = 3,
            chips = 0,
            suit = 'Hearts'
        }
    },

    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.chipmod,
                card.ability.extra.chips,
                localize(card.ability.extra.suit, 'suits_singular')
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            local hearts = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_suit(card.ability.extra.suit) and not scored_card.debuff and not scored_card.blazed and scored_card:get_id() ~= 2 then
                    hearts[#hearts+1] = scored_card
                    scored_card.blazed = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            assert(SMODS.modify_rank(scored_card, -1))
                            scored_card:juice_up()
                            scored_card.blazed = nil
                            return true
                        end
                    }))
                end
            end

            if #hearts > 0 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipmod * #hearts
                return{
                    message = '+'..card.ability.extra.chips,
                    colour = G.C.BLUE
                }
            end
        end
         
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
    
}

SMODS.Atlas{
    key = 'envelope',
    path = 'envelope.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'envelope',
    atlas = 'envelope',

    rarity = 1,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.current_hand.handname == "Full House" then
            local any_forced = nil
            for _, playing_card in ipairs(G.hand.cards) do
                if SMODS.has_enhancement(playing_card, P_SEALS) then
                    any_forced = true
                end
            end
            if not any_forced and #G.hand.cards > 0 then
                local enve_card = pseudorandom_element(G.hand.cards, pseudoseed('envelopelolol'))
                enve_card.ability = enve_card.ability or {} 
                enve_card:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = 'envelopelolol' }), true)
                --thx vanilla remade lol
                enve_card:juice_up(0.3,0.5)
            end
        end
    end
}
