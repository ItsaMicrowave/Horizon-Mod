--- huge credit to vanilla remade, extremely pog
--- 
SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	post_trigger = true,
	cardareas = {
		deck = true,
		discard = true,
	},
}

assert(SMODS.load_file("src/joker.lua"))()
assert(SMODS.load_file("src/consumable.lua"))()
assert(SMODS.load_file("src/hands.lua"))()
assert(SMODS.load_file("src/booster.lua"))()

G.C.HRZI = {
    CHESS = HEX("769656")
}

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.hrzi_chess = G.C.HRZI.CHESS

    return loc_colour_ref(_c, _default)
end

do
    local original_play_cards_from_highlighted = G.FUNCS.play_cards_from_highlighted
    G.FUNCS.play_cards_from_highlighted = function(e)
        SMODS.calculate_context({hrzi_play_button = true})

        original_play_cards_from_highlighted(e)
    end
end

SMODS.Atlas{
    key = 'placeholder',
    path = 'placeholder.png',
    px = 71,
    py = 95, 
}

SMODS.Atlas{
    key = 'chessplaceholder',
    path = 'chessplaceholder.png',
    px = 71,
    py = 95
}


SMODS.Rarity{
    key = 'chess',
    loc_txt = {
        name = 'Chess'
    },
    badge_colour = HEX('769656'),
    hidden = true,
    default_rate = 0
}

local start_run_ref = Game.start_run
function Game:start_run(args)
    self.GAME.starting_params.chess_slots = 1
    self.chess = CardArea(0, 0, G.CARD_W * 1.2, G.CARD_H*0.9, {
        card_limit = self.GAME.starting_params.chess_slots,
        type = "joker",
        highlight_limit = 1,
        view_deck = true
    })
    start_run_ref(self, args)
    set_screen_positions()
end

local set_screen_positions_func = set_screen_positions
function set_screen_positions()
    set_screen_positions_func()

    if G.chess then
        G.chess.T.x = G.TILE_W - G.chess.T.w - 0.3
        G.chess.T.y = 5.75
        G.chess:hard_set_VT()
    end
end

local emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.consumeables and card.ability.set == 'chess' then
        G.chess:emplace(card, location, stay_flipped)
        return
    end
    emplace_ref(self, card, location, stay_flipped)
end


SMODS.Sound{
    key = 'hrzi_iamsniper',
    path = 'iamsniper.wav'
}

SMODS.Sound{
    key = 'hrzi_nowstart',
    path = 'nowstart.wav'
}

SMODS.Sound{
    key = 'hrzi_headshotea',
    path = 'headshotea.wav'
}

SMODS.Sound{
    key = 'hrzi_chessadd',
    path = 'chessadd.wav'
}

SMODS.Sound{
    key = 'hrzi_scream',
    path = 'scream.wav'
}

SMODS.Sound{
    key = 'hrzi_gulp',
    path = 'gulp.wav'
}
 