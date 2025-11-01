SMODS.Consumable:take_ownership('ankh', {
    use = function(self, card, area, copier)
        local deletable_jokers = {}
        local copyable_jokers = {}

        for _, joker in pairs(G.jokers.cards) do
            local def = joker.config.center
            
            if not SMODS.is_eternal(joker, card) then 
                deletable_jokers[#deletable_jokers + 1] = joker 
            end
     
            if def and not def.no_copy then
                copyable_jokers[#copyable_jokers + 1] = joker
            end
        end

    
        local chosen_joker = pseudorandom_element(copyable_jokers, 'ankh_choice')

   
        if chosen_joker then
            local _first_dissolve = nil
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.75,
                func = function()
                    for _, joker in pairs(deletable_jokers) do
                        if joker ~= chosen_joker then
                            joker:start_dissolve(nil, _first_dissolve)
                            _first_dissolve = true
                        end
                    end
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.4,
                func = function()
                    local copied_joker = copy_card(chosen_joker, nil, nil, nil,
                        chosen_joker.edition and chosen_joker.edition.negative)
                    copied_joker:start_materialize()
                    copied_joker:add_to_deck()
                    if copied_joker.edition and copied_joker.edition.negative then
                        copied_joker:set_edition(nil, true)
                    end
                    G.jokers:emplace(copied_joker)
                    return true
                end
            }))
        else
        end
     end
}
)

--- PLANET CODE ---

 
 --- Asteroid
 
 
 SMODS.Atlas{
    key = 'asteroid',
    path = 'asteroid.png',
    px = 71,
    py = 95,


}

SMODS.Consumable{
    object_type = "Consumable",
    set = "Planet",
    name = "asteroid",
    key = "asteroid",
    pos = { x = 0, y = 0 },

    config = { hand_type = 'hrzi_Rampart', softlock = true },

    cost = 3,
    atlas = "asteroid",
    order = 3,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)           
       
        local levelone = G.GAME.hands["hrzi_Rampart"].level or 1
        local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
        if levelone == 1 then
            planetcolourone = G.C.UI.TEXT_DARK
        end
        return {
            vars = {
                G.GAME.hands["hrzi_Rampart"].level,
                G.GAME.hands["hrzi_Rampart"].l_mult,
                G.GAME.hands["hrzi_Rampart"].l_chips,
                colours = { planetcolourone },
            },
        }
    end,
}

SMODS.Atlas{
    key = 'ganymede',
    path = 'ganymede.png',
    px = 71,
    py = 95
}

SMODS.Consumable{
    object_type = "Consumable",
    atlas = 'ganymede',
    pos = {x=0,y=0},
    set = "Planet",
    name = "ganymede",
    key = "ganymede",

    loc_txt = {
       
    },


    config = { hand_type = 'hrzi_Suited_Monarchs', softlock = true },

    cost = 3,
    order = 3,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)           
       
        local levelone = G.GAME.hands["hrzi_Suited_Monarchs"].level or 1
        local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
        if levelone == 1 then
            planetcolourone = G.C.UI.TEXT_DARK
        end
        return {
            vars = {
                G.GAME.hands["hrzi_Suited_Monarchs"].level,
                G.GAME.hands["hrzi_Suited_Monarchs"].l_mult,
                G.GAME.hands["hrzi_Suited_Monarchs"].l_chips,
                colours = { planetcolourone },
            },
        }
    end,

}

SMODS.Atlas{
    key = 'titan',
    path = 'titan.png',
    px = 71,
    py = 95
}

SMODS.Consumable{
    object_type = "Consumable",
    atlas = 'titan',
    pos = {x=0,y=0},
    set = "Planet",
    name = "titan",
    key = "titan",


    config = { hand_type = 'hrzi_Monarchal', softlock = true },

    cost = 3,
    order = 3,
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, center)           
       
        local levelone = G.GAME.hands["hrzi_Monarchal"].level or 1
        local planetcolourone = G.C.HAND_LEVELS[math.min(levelone, 7)]
        if levelone == 1 then
            planetcolourone = G.C.UI.TEXT_DARK
        end
        return {
            vars = {
                G.GAME.hands["hrzi_Monarchal"].level,
                G.GAME.hands["hrzi_Monarchal"].l_mult,
                G.GAME.hands["hrzi_Monarchal"].l_chips,
                colours = { planetcolourone },
            },
        }
    end,
}


--- PLANET CODE END ---




--- CONSUMABLE CODE START ---


SMODS.ConsumableType {
    key = 'chess',
    primary_colour = HEX('769656'),
    secondary_colour = HEX('769656'),
    loc_txt = {
            name = 'Chess Card',
            collection = 'Chess Cards',
            undiscoverd = {
                name = 'Unknown Chess Card',
                text = {
                    'Find this piece in an unseeded run',
                    'to find out what it does'
                }
            }
    },
    collection_rows = { 4, 4 },
    shop_rate = 0.0,
}


SMODS.Atlas{
    key = 'undischess',
    path = 'undischess.png',
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'chessconsumable1',
    path = 'chessconsumable1.png',
    px = 71,
    py = 95
}

SMODS.UndiscoveredSprite{
    key =  'chess',
    atlas = 'undischess',
    pos = {x=0,y=0},
}


SMODS.Consumable{
    key = 'pawn',
    atlas = 'chessconsumable1',
    pos = {x=0,y=0},
    pixel_size = {h = 95/1.2},
    set = 'chess',
    cost = 10,
    config = {
        extra = {
            pawn_number = 1,
            exponent = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.pawn_number + (G.GAME.hrzi_pawn_used or 0),
                card.ability.extra.exponent
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card)


        local _hand, _tally = nil, -1
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            if v ~= _hand then
                pawn_level = ((card.ability.extra.pawn_number + (G.GAME.hrzi_pawn_used or 0)) ^ card.ability.extra.exponent) + 20
            end
            
            update_hand_text(
                    { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
                    { handname = localize(_hand, 'poker_hands'), chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level = G.GAME.hands[_hand].level }
                )
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.2,
                    func = function()
                        play_sound("tarot1")
                        card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = true
                        return true
                    end,
                }))
                update_hand_text({ delay = 0 }, { mult = "+" .. (to_number(G.GAME.hands[_hand].l_mult) * pawn_level), StatusText = true })
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.9,
                    func = function()
                        play_sound("tarot1")
                        card:juice_up(0.8, 0.5)
                        return true
                    end,
                }))
                update_hand_text({ delay = 0 }, { chips = "+" ..  (to_number(G.GAME.hands[_hand].l_chips) * pawn_level), StatusText = true })
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.9,
                    func = function()
                        play_sound("tarot1")
                        card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = nil
                        return true
                    end,
                }))

                level_up_hand(used_consumable, _hand, true, pawn_level)

                update_hand_text({ sound = "button", volume = 0.7, pitch = 0.9, delay = 0 }, { chips = to_number(G.GAME.hands[_hand].chips), mult = to_number(G.GAME.hands[_hand].mult),level = to_number(G.GAME.hands[_hand].level)})
                delay(1.3)

                update_hand_text(
                    { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
                    { mult = 0, chips = 0, handname = "", level = "" }
                )

                G.GAME.hrzi_pawn_used = (G.GAME.hrzi_pawn_used or 0) + 1
    end
}

--[[
        update_hand_text({ sound = "button", volume = 0.7, pitch = 0.8, delay = 0}, {
            handname = localize(_hand, "poker_hands"),
            chips = G.GAME.hands[_hand].chips,
            mult = G.GAME.hands[_hand].mult,
            level = G.GAME.hands[_hand].level,
        })
        delay(2.6)
        update_hand_text(
            { sound = "button", volume = 0.7, pitch = 1.1, delay = 0},
            { mult = 0, chips = 0, handname = "", level = "" }
        )
]]
---level_up_hand(used_consumable, _hand, true, pawn_level)


SMODS.Consumable{
    key = 'king',
    atlas = 'chessconsumable1',
    pos = {x=1,y=0},
    pixel_size = {h = 95/1.2},
    cost = 10,
    set = 'chess',

    config = {
        extra = {
            slots = 1,
            odds = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.slots,
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.9,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                G.jokers:juice_up(0.1,0.1)
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.slots
                return true
            end,
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.9,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                G.consumeables:juice_up(0.1,0.1)
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slots
                return true
            end,
        }))
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.9,
            func = function()
                play_sound("tarot1")
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                G.hand:change_size(card.ability.extra.slots)
                if not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack  then
                    G.FUNCS.draw_from_deck_to_hand(card.ability.extra.slots)
                end
                return true
            end,
        }))
    end
}


SMODS.Consumable{
    key = 'rook',
    atlas = 'chessconsumable1',
    pos = {x=0,y=1},
    pixel_size = {h = 95/1.2},
    cost = 10,
    set = 'chess',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_hrzi_orthogonal
    end,


    can_use = function(self, card)
        return true
    end,

    use = function(self, card)
        G.GAME.hrzi_rook_used = (G.GAME.hrzi_rook_used or 0) + 1
        if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
            if #SMODS.find_card('j_hrzi_orthogonal') < 1 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.9,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.8, 0.5)
                        G.TAROT_INTERRUPT_PULSE = true
                        local new_card = create_card('Orthogonal', G.jokers, nil,nil,nil,nil,'j_hrzi_orthogonal')
                        new_card:add_to_deck()
                        G.jokers:emplace(new_card)
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Consumable{
    key = 'board',
    atlas = 'chessconsumable1',
    pos = {x=3,y=0},
    pixel_size = {h = 95/1.2},
    cost = 10,
    set = 'chess',

    config = {
        extra = {
            uses = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return{ vars = {card.ability.extra.uses}}
    end,


    can_use = function(self, card)
        if not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack then
            return true
        end
    end,

    keep_on_use = function(self, card)
        if card.ability.extra.uses > 1 then
            return true
        end
    end,

    use = function(self, card, area)
        card.ability.extra.uses = card.ability.extra.uses - 1
        for a, b in pairs(G.hand.cards) do
            b.ability.perma_repetitions = (b.ability.perma_repetitions or 0) + 1
        end
        for a, b in pairs(G.deck.cards) do
            b.ability.perma_repetitions = (b.ability.perma_repetitions or 0) + 1
        end
        G.FUNCS.draw_from_deck_to_hand(#G.deck.cards)

    end
}


SMODS.Consumable{
    key = 'knight',
    set = 'chess',
    atlas = 'chessconsumable1',
    pos = {x=2,y=1},
    pixel_size = {h = 95/1.2},
    cost = 10,

    config = {
        extra = {
            divide = 5,
            odds = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        return{ vars = {
            card.ability.extra.divide + (G.GAME.hrzi_knight_used or 0),
            (G.GAME.probabilities.normal or 1),
            card.ability.extra.odds
            }
        }
    end,


    can_use = function(self, card)
        if not G.blind_select and G.STATE ~= G.STATES.ROUND_EVAL and not G.shop and not G.booster_pack then
            return true
        end
    end,

    keep_on_use = function(self, card)
        if pseudorandom('knightttt') > G.GAME.probabilities.normal / card.ability.extra.odds then
            return true
        end

    end,

    use = function(self, card)
        G.GAME.hrzi_knight_used = (G.GAME.hrzi_knight_used or 0) + 1
        if G.GAME.blind.boss == true then
            G.GAME.blind.chips = G.GAME.blind.chips/(card.ability.extra.divide + (G.GAME.hrzi_knight_used or 0))
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:disable()
            play_sound('timpani')
        elseif not G.GAME.blind.boss then
            G.E_MANAGER:add_event(Event({
                trigger  = 'after',
                delay    = 0,
                blocking = false,
                func     = function()
                    if G.STATE == G.STATES.SELECTING_HAND then --edit
                        SMODS.juice_up_blind()
                        G.GAME.chips     = G.GAME.blind.chips
                        G.STATE          = G.STATES.HAND_PLAYED
                        G.STATE_COMPLETE = true
                        end_round()
                        return true
                    end
                end
            }))
        end
    end
}



SMODS.Consumable{
    key = 'queen',
    atlas = 'chessconsumable1',
    pos = {x=2,y=0},
    pixel_size = {h = 95/1.2},
    cost = 10,
    set = 'chess',


    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        if #editionless_jokers == 0 then
            local valid_jokers = {}
            for _, c in ipairs(G.jokers.cards) do
                    table.insert(valid_jokers, c)
            end

            if #valid_jokers > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local selected = pseudorandom_element(valid_jokers, pseudoseed('quenstufflololol'))
                        local duplicate = copy_card(selected, nil)
                        duplicate:set_edition('e_negative', true)
                        duplicate:add_to_deck()
                        G.jokers:emplace(duplicate)
                        return true
                    end
                }))
            end
        else
            local selected_jokers = {}
            for i = 1, 5 do
                local joker = pseudorandom_element(editionless_jokers, pseudoseed("queenstuff_" .. i))
                table.insert(selected_jokers, joker)

                for index, j in ipairs(editionless_jokers) do
                    if j == joker then
                        table.remove(editionless_jokers, index)
                        break
                    end
                end
            end
        
            for _, joker in ipairs(selected_jokers) do
                local edition = poll_edition('queenstuff', nil, true, true,
                    { 'e_polychrome', 'e_holo', 'e_foil' })
                joker:set_edition(edition, true)
            end
        
            check_for_unlock({ type = 'have_edition' })
        end
    end
}


SMODS.Consumable{
key = 'bishop',
set = 'chess',
atlas = 'chessconsumable1',
cost = 10,
pos = {x=1,y=1},
pixel_size = {h = 95/1.2},
config = {
    extra = {
        minmoney = 50,
        maxmoney = 750
    }
},

loc_vars = function(self, info_queue, card)
    return{
        vars = {card.ability.extra.minmoney,
        card.ability.extra.maxmoney,
    }
    }
end,

can_use = function(self, card)
    return true
end,

use = function(self, card, area)
    local bishopmoney = G.GAME.dollars * 6
    local payout_amount
    
    if bishopmoney < to_big(card.ability.extra.minmoney) then
        payout_amount = card.ability.extra.minmoney
    elseif bishopmoney > to_big(card.ability.extra.maxmoney) then
        payout_amount = card.ability.extra.maxmoney
    else
        payout_amount = bishopmoney
    end
    
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            play_sound('timpani')
            card:juice_up(0.3, 0.5)
            ease_dollars(payout_amount, true)
            return true
        end
    }))
end
}

--[[
SMODS.Consumable{
    key = 'avarice',
    set = 'Spectral',
    loc_txt = {
        name = 'Avarice',
        text = {
            'Mulitply {C:money}Money{} by {C:attention}-1{}',
            'Gain a {C:tarot}Tarot{}, {C:planet}Planet{}',
            'and {C:chess}Chess{} Card',
            '{C:inactive}Doesnt require room'
        }
    },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area)
        ease_dollars(to_big(-2)*G.GAME.dollars, true)
    end
}
--- Tags
]]


SMODS.Atlas{
    key = 'resourcetags',
    path = 'resourcetags.png',
    px = 34,
    py = 34
}

SMODS.Tag{
    key = 'soup',
    atlas = 'resourcetags', 
    in_pool = function(self, args)
        return false
    end,
    pos = {x=1,y=0},

    apply = function(self, tag, context)
        if context.type == 'shop_start' then
            tag:yep('+', G.C.MONEY)
            local soup_money = math.random(3,7)
            return{
                G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.2, func = function()
                    play_sound('timpani')
                    ease_dollars(soup_money, true)
                    return true end }))
            }
        end
    end
}

SMODS.Tag{
    key = 'water',
    atlas = 'resourcetags', 
    in_pool = function(self, args)
        return false
    end,
    pos = {x=0,y=0},

    loc_vars = function(self, info_queue, tag)
        local numerator, denominator = SMODS.get_probability_vars(tag, 1, 2, 'tagwaterhahahha')
        return {
            vars = {numerator, denominator}
        }
    end,

    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            if SMODS.pseudorandom_probability(tag, 'tagwaterhahahha', 1, 2) then
                tag:yep('+', G.C.BLUE)
                return{
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                        ease_discard(1)
                        return true end }))
                }
            else 
                tag:yep('X', G.C.RED)
            end
        end
    end
}

SMODS.Tag{
    key = 'medkit',
    atlas = 'resourcetags', 
    in_pool = function(self, args)
        return false
    end,
    pos = {x=2,y=0},

    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            tag:yep('+', G.C.GREEN)
            local medh_size = math.random(2,4)
            G.hand:change_size(medh_size)
            G.GAME.round_resets.temp_handsize = (G.GAME.round_resets.temp_handsize or 0) + medh_size
            return true
        end
    end
}