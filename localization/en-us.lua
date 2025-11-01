return{
    descriptions = {
        --Back={},
        --Blind={},
        chess = {
            c_hrzi_pawn = {
                name = 'Pawn',
                text = {
                    'Gives ({C:attention}#1#{}{C:dark_edition}^#2#{}+20) levels to',
                    'your most played poker hand',
                    '{C:inactive,s:0.8}Gets stronger each time{}',
                    '{C:inactive,s:0.8}Max of{} {C:attention,s:0.8}8{}'
                }
            },

            c_hrzi_king = {
                name = 'King',
                text = {
                    '{C:attention}+#1#{} Joker slot',
                    '{C:attention}+#1#{} Consumable slot',
                    '{C:attention}+#1#{} Hand size',
                }
            },

            c_hrzi_rook = {
                name = 'Rook',
                text = {
                    'Creates {C:chess}The Orthogonal{}',
                    'Makes {C:chess}The Orthogonal{}', 
                    'stronger after each use'
                }
            },

            c_hrzi_board = {
                name = 'Chess Board',
                text = {
                    'Draw your entire deck',
                    'All cards gain {C:attention}1 retrigger{}',
                    '{C:inactive,s:0.8}Can be used #1# more times'
                }
            },

            c_hrzi_knight = {
                name = 'Knight',
                text = {
                    'If used on {C:attention}boss blind{} then disable boss blind',
                    'and reduce blind requirement by {C:attention}#1#',
                    'If not on boss blind, win the current blind',
                    '{C:green}#2# in #3#{} chance to not keep after usage',
                }
            },

            c_hrzi_queen = {
                name = 'Queen',
                text = {
                    'Gives {C:attention}5{} random jokers an edition',
                    'If all jokers have editions',
                    'Create one {C:dark_edition}Negative{} copy of a random joker',
                }
            },

            c_hrzi_bishop = {
                name = 'Bishop',
                text = {
                'Sevenfolds money',
                '{C:inactive}Min of {}{C:money}$#1#',
                '{C:inactive}Max of {}{C:money}$#2#'        
                }
            }
        },
        --Edition={},
        --Enhanced={},
        Joker = {
            j_hrzi_supreme_justice = {
                name = 'Supreme Justice',
                text = {
                    'On the last hand',
                    'A random card becomes {C:attention}Glass{} and gets a {C:red}Red{} Seal',
                    'That card is always selected'
                    }
            },

            j_hrzi_skygazer = {
                name = 'Skygazer',
                text = {
                    'When Blind is {C:attention}selected{}',
                    'Create 3 {C:dark_edition}Negative{} copies of the',
                    '{C:tarot}suit changing Tarot card{} of your most',
                    'abundant suit',
                    '{C:inactive,s:0.8}(Spades = World, Hearts = Sun, Diamonds = Star, Clubs = Moon)',
                    '{C:inactive,s:0.8}(Will choose at random if there is a tie)',
                }
            },

            j_hrzi_gacha = {
                name = 'Gacha',
                text = {
                    'Whenever any {C:attention}Booster Pack{} is opened',
                    'gain a {C:attention}random{} amount of {C:money}money{}'
                }
            },

            j_hrzi_end_credits = {
                name = 'End Credits',
                text = {'Gain {X:mult,C:white}X#1#{} when final hand is played',
                        '{X:mult,C:white}X#2#{} Mult on final hand',
                        
                }
            },

            j_hrzi_quarry = {
                name = 'Quarry',
                text = {
                    '{C:attention}Stone Cards{} give',
                    '{C:money}$#1#{} when scored'
                }
            },

            j_hrzi_event_horizon = {
                name = 'Planetary Collapse',
                text = {
                    'Destroy {C:planet}Planet{} Cards at end of shop',
                    'For every 2 {C:planet}Planet{} Cards destroyed',
                    'Create 1 {C:spectral}Black Hole'
                }
            },

            j_hrzi_to_apotheosis = {
                name = 'Apotheosis',
                text = {
                    'When a {C:attention}Secret Hand{} is played',
                    'gain {X:mult,C:white}X#1#{}',
                    '{C:inactive}Currently {X:mult,C:white}X#2#{}',
                }
            },

            j_hrzi_geologist = {
                name = 'Geologist',
                text = {
                    'This gains {C:mult}+#1#{} Mult',
                    'for each {C:attention}Stone Card{} in your deck',
                    '{C:inactive}Currently{} {C:mult}+#2#{} {C:inactive}Mult{}',
                }
            },

            j_hrzi_stonehenge = {
                name = 'Stonehenge',
                text = {
                    'When a {C:attention}Stone Card{} is scored, {X:chips,C:white}X#1#{} chips',
                    'Gains {X:chips,C:white}X0.5{} for each {C:attention}Stone Card{} scored',
                    '{C:inactive}Resets after every hand{}',
                }
            },

            j_hrzi_brainwashing = {
                name = 'Brainwashing',
                text = {
                    '{X:dark_edition,C:white}^#1#{}',
                    '{C:red,E:1}Destroys itself{} if {C:attention}3{} hands are played',
                    'without a {C:attention}Wild Card{}',
                    '{C:inactive}Self destruction in #2#',
                }
            },

            j_hrzi_monopoly_man = {
                name = 'Monopoly Man',
                text = {
                    'When a {C:attention}Gold Card{} is discarded',
                    'Half the {C:attention}blind requirement{}', 
                    'for every {C:money}$40{} you have'
                }
            },

            j_hrzi_sinful_deal = {
                name = 'Sinful Deal',
                text = {
                    '{C:attention}Arcana Packs{} will', 
                    'always have a {C:tarot}Devil{}'
                }
            },
            
            j_hrzi_cremedlc = {
                name = 'Creme de la Crop',
                text = {
                    'Once {C:attention}10{} other jokers are sold',
                    'Sell this card to turn the leftmost Joker {C:dark_edition}Negative{}',
                    '{C:inactive, s:0.8}Currently #1#/10{}'
                }
            },

            j_hrzi_headshot = {
                name = 'Headshot',
                text = {
                    'When a Joker is sold',
                    'lower current blind requirement by {C:attention}%35{}'
                }
            },

            j_hrzi_thechosen = {
                name = 'The Chosen',
                text = {
                    '{X:mult,C:white}X#1#{} Mult',
                    'if played hand is only {C:attention}1{} card and',
                    'is an {C:attention}Ace{} of {V:1}#2#{}',
                    '{C:inactive}(Suit changes every round){}'
                }
            },

            j_hrzi_ecstatic = {
                name = 'Ecstatic Joker',
                text = {
                    '{C:red}+#1#{} Mult if',
                    'played hand contains',
                    'a {C:attention}Rampart{}'
                }
            },

            j_hrzi_frenzy = {
                name = 'Frenzy Joker',
                text = {
                    '{C:red}+#1#{} Mult if',
                    'played hand contains',
                    'a {C:attention}Monarchal{}'
                }
            },

            j_hrzi_manic = {
                name = 'Maniacal Joker',
                text = {
                    '{C:blue}+#1#{} Chips if',
                    'played hand contains',
                    'a {C:attention}Rampart{}'
                }
            },

            j_hrzi_hysterical = {
                name = 'Hysterical Joker',
                text = {
                    '{C:blue}+#1#{} Chips if',
                    'played hand contains',
                    'a {C:attention}Monarchal{}'
                }
            },

            j_hrzi_conjure = {
                name = 'Chess Conjurer',
                text = {
                    'When ending shop, if there is an {C:tarot}Emperor{} and {C:tarot}Empress{}',
                    'in the consumeable slots, create a {C:attention}King{} or a {C:attention}Queen{}',
                    '{C:inactive, s:0.8}Must have room',
                    '{C:inactive, s:0.8}Triggers left: #1#'
                }
            },

            j_hrzi_orthogonal = {
                name = 'Orthogonal',
                text = {
                    '{C:attention}Retrigger{} the',
                    'left joker {C:attention}#1#{} times',
        
                }
            },

            j_hrzi_dawn = {
                name = 'Dawn',
                text = {
                    'When first hand is played',
                    'get {C:money}$#1#{} whenever a',
                    'Joker gets {C:attention}triggered'
                }
            },

            j_hrzi_endure = {
                name = 'Endurance',
                text = {
                    'After #1# rounds',
                    'Sell this card to gain a random {C:legendary}Legendary{}',
                    '{C:red, E:1}+1 Ante and +2 Winning Ante',
                    '{C:inactive,s:0.8}Currently #2#/#1#'
                }
            },

            j_hrzi_products = {
                name = 'Sexy Products',
                text = {
                    'When a card is bought',
                    'Gain {C:blue}+#1#{} Chips and {C:red}+#2#{} Mult',
                    '{C:inactive,s:0.8}Currently {C:blue,s:0.8}+#3# Chips{} {C:inactive,s:0.8}and{} {C:red,s:0.8}+#4# Mult{}'
                }
            },

            j_hrzi_map = {
                name = 'Pinpoint Location',
                text = {
                    '{X:mult,C:white}X#1#{} Mult if this is in the',
                    '{C:attention}#2#{} Joker position',
                    '{C:inactive,s:0.8}Changes after every hand'
                }
            },

            j_hrzi_cogreed = {
                name = 'Curse of Greed',
                text = {
                    'All shop items are {C:attention}free{}',
                    'Whenever something is bought, {C:green}#1# in #2#{} chance',
                    'to {C:red}destroy itself{} and {C:red}increase blind scaling{}',
                    'If sold, {C:red}add 40 debuffed stone cards into the deck',
                }
            },

            j_hrzi_cupid = {
                name = 'Cupid',
                text = {
                    '{C:green}#1# in #2#{} chance for',
                    'highlighted [C:attention]Wild{} card to',
                    'turn cards next to it {C:attention}Wild'
                }
            },

            j_hrzi_streetart = {
                name = 'Street Art',
                text = {
                    'When a {C:attention}Flush{} is played with a {C:attention}Wild Card{}',
                    'The {C:attention}Wild Card{} gains {C:red}+#1# Mult{}'
                }
            },

            j_hrzi_emergency = {
                name = 'Emergency Resources',
                text = {
                    '{C:green}#1#{} in {C:green}#2#{} chance to gain a',
                    '{C:attention}Soup, Water{}, or a{C:attention} Medkit{}',
                    'whenever shop is rerolled'
                }
            },

            j_hrzi_blazingsun = {
                name = 'Light of the Blazing Sun',
                text = {
                    'Decrease the rank of played {C:hearts}Hearts{}',
                    'This joker gains {C:blue}+#1#{} Chips',
                    'for every rank decreased this way',
                    '{C:inactive,s:0.8}Currently{} {C:blue,s:0.8}+#2# Chips{}',
                    '{C:inactive, s:0.8}Will not decrease 2 any further'
                }
            },

            j_hrzi_envelope = {
                name = 'Envelope',
                text = {
                    'If played hand is a {C:attention}Full House{}',
                    'A card in hand gains a random seal'
                }
            }
        },

        Other={
            p_hrzi_chess_normal_1 = {
                name = 'Chess Pack',
                text = {
                    'Choose {C:attention}1{} of {C:attention}2{}', 
                    '{C:hrzi_chess}Chess Card{} to take',
                    
                },
   
            },

            p_hrzi_chess_normal_2 = {
                name = 'Chess Pack',
                text = {
                    'Choose {C:attention}1{} of {C:attention}2{}', 
                    '{C:hrzi_chess}Chess Card{} to take'
                },
      
            },

            p_hrzi_chess_jumbo_1 = {
                name = 'Jumbo Chess Pack',
                text = {
                    'Choose {C:attention}1{} of {C:attention}4{}', 
                    '{C:hrzi_chess}Chess Card{} to take'
                },
        
            }
        },

        Planet={
            c_hrzi_asteroid = {
                name = 'Asteroid',
                text = {
                    "(lvl #1#) Level up",
                    "{C:attention}Rampart{}",
                    "{C:red}+#2#{} Mult and",
                    "{C:blue}+#3#{} chips",
                },
            },

            c_hrzi_ganymede = {
                name = "Ganymede",
                text = {
                    "(lvl #1#) Level up",
                    "{C:attention}Suited Monarchs{}",
                    "{C:red}+#2#{} Mult and",
                    "{C:blue}+#3#{} chips",
                },
            },

            c_hrzi_titan = {
                name = "Titan",
                text = {
                    "(lvl #1#) Level up",
                    "{C:attention}Monarchal{}",
                    "{C:red}+#2#{} Mult and",
                    "{C:blue}+#3#{} chips",
                },
            }
        },
        --[[]
        Spectral={},
        Stake={},
        ]]

        Tag={
            tag_hrzi_soup = {
                name = 'Soup',
                text = {
                    'Gain {C:money}$3{} to {C:money}$7{}',
                    'when entering next shop'
                }
            },

            tag_hrzi_water = {
                name = 'Water',
                text = {
                    '{C:green}#1#{} in {C:green}#2#{} to gain',
                    '{C:red}1 discard{} for the next round'
                }
            },

            tag_hrzi_medkit = {
                name = 'Medkit',
                text = {
                    'Gain {C:attention}2{} to {C:attention}4{} extra {C:attention}handsize{}',
                    'for the next round'
                }
            }

        },
--[[
        Tarot={},
        Voucher={},
        ]]
    },

    misc = {
        --achievement_descriptions={},
        --achievement_names={},
        --blind_states={},
        --challenge_names={},
        --collabs={},
        dictionary={
            k_hrzi_chess_pack = 'Chess Pack'
        },
        --high_scores={},
        --labels={},

        poker_hand_descriptions={
            ['hrzi_Rampart'] = {
                '5 Stone Cards'
            },

            ['hrzi_Monarchal'] = {
                '5 Face Cards'
            },

            ['hrzi_Suited_Monarchs']={
                '5 Face Cards of the same suit'
            }
        },

        poker_hands={
            ['hrzi_Rampart'] = "Rampart",
            ['hrzi_Monarchal'] = 'Monarchal',
            ["hrzi_Suited_Monarchs"] = 'Suited Monarchs'
        },

        --quips={},
        --ranks={},
        --suits_plural={},
        --suits_singular={},
        --tutorial={},
        --v_dictionary={},
        --v_text={},
    }
}
