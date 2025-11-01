--- POKER HAND CODE

 --- Rampart
 SMODS.PokerHand{
    key = 'Rampart',
    visible = false,
    mult = 10,
    chips = 60,
    l_mult = 3,
    l_chips = 30,
    example = {
        {'S_A', true, enhancement = 'm_stone'},
        {'S_A', true, enhancement = 'm_stone'},
        {'S_A', true, enhancement = 'm_stone'},
        {'S_A', true, enhancement = 'm_stone'},
        {'S_A', true, enhancement = 'm_stone'},
    },
 

 
    evaluate = function(parts, hand)
        return parts.hrzi_5stone
    end,
 }

 SMODS.PokerHand{
    key = 'Monarchal',
    visible = true,
    mult = 3,
    chips = 40,
    l_mult = 2,
    l_chips = 30,
    example = {
        {'S_K',true},
        {'H_Q', true},
        {'D_J', true},
        {"C_Q", true},
        {'H_K', true}
    },
 
    evaluate = function(parts, hand)
        return parts.hrzi_monarchal
    end,
 }
 
 SMODS.PokerHand{
    key = 'Suited_Monarchs',
    visible = false,
    mult = 7,
    chips = 100,
    l_mult = 3,
    l_chips = 35,
    example = {
        {'H_K', true},
        {'H_Q', true},
        {'H_K', true},
        {'H_J', true},
        {'H_J', true}
 
    },
 
    evaluate = function(parts, hand)
        return next(parts.hrzi_monarchal) and next(parts.hrzi_flush)
        and { SMODS.merge_lists(parts.hrzi_monarchal, parts.hrzi_flush) } or {}
    end,
 }

 SMODS.PokerHandPart{
    key = 'flush',
    func = function(hand)
        local ret = {}
        local four_fingers = next(find_joker('Four Fingers'))
        local suits = SMODS.Suit.obj_buffer
        if #hand < (5 - (four_fingers and 1 or 0)) then
            return ret
        else
            for j = 1, #suits do
                local t = {}
                local suit = suits[j]
                local flush_count = 0
                for i = 1, #hand do
                    if hand[i]:is_suit(suit, nil, true) then
                        flush_count = flush_count + 1; t[#t + 1] = hand[i]
                    end
                end
                if flush_count >= (5 - (four_fingers and 1 or 0)) then
                    table.insert(ret, t)
                    return ret
                end
            end
            return {}
        end
    end
}


SMODS.PokerHandPart{
    key = 'monarchal',
    func = function(hand)
        local faces = {}
        for i, card in ipairs(hand) do
            if card:is_face() then
                faces[#faces+1] = card
            end
        end
        return (#faces == 5) and {faces} or {}
    end
}

SMODS.PokerHandPart{
    key = '5stone',
    func = function(hand)
        local stones = {}
        for i, card in ipairs(hand) do
            if card.ability and card.ability.name == 'Stone Card' or card.config.center_key == 'm_stone' then
                stones[#stones+1] = card
            end
        end
        return (#stones == 5) and {stones} or {}
    end

}
 --- HAND CODE END ---
