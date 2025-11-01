return{
    descriptions = {
        --Back={},
        --Blind={},
        chess = {
            c_hrzi_pawn = {
                name = '兵',
                text = {
                    '为你的{C:attention}最常用的牌型{}增加',
                    '({C:attention}#1#{}{C:dark_edition}^#2#{}+20)个等级',
                    '{C:inactive}（每次使用后效果都会增强）'
                }
            },

            c_hrzi_king = {
                name = '王',
                text = {
                    '{C:attention}+#1#{}小丑牌槽位',
                    '{C:attention}+#1#{}消耗品槽位',
                    '{C:attention}+#1#{}手牌上限',
                }
            },

            c_hrzi_rook = {
                name = '防御塔',
                text = {
                    '生成{C:chess}正交{}',
                    '每次使用会增强{C:chess}正交{}的效果'
                }
            },

            c_hrzi_board = {
                name = '棋盘',
                text = {
                    '抽出整幅牌',
                    '所有卡牌获得{C:attention}1{}次{C:attention}额外触发',
                    '{C:inactive}（还能用#1#次）'
                }
            },

            c_hrzi_knight = {
                name = '战马',
                text = {
                    '如果在{C:attention}Boss盲注{}时使用',
                    '使Boss盲注的{C:attention}限制条件{}失效并且盲注要求除以{C:attention}#1#',
                    '如果不是Boss盲注，则{C:attention}直接赢下此盲注{}',
                    '{C:inactive}（使用后有{}{C:green}#2#/#3#{}{C:inactive}的几率不保留此牌）'
                }
            },

            c_hrzi_queen = {
                name = '后',
                text = {
                    '给予{C:attention}5{}个小丑一个{C:attention}版本',
                    '如果所有小丑都有版本的话',
                    "随机选择一张拥有的{C:attention}小丑牌",
                    "生成一张其{C:dark_edition}负片{}复制",
                }
            },

            c_hrzi_bishop = {
                name = '主教',
                text = {
                    '{C:money}资金{}翻七倍',
                    '{C:inactive}（最少获得{C:money}$#1#{}{C:inactive})',
                    '{C:inactive}（最多获得{C:money}$#2#{}{C:inactive})'
                }
            }
        },
        --Edition={},
        --Enhanced={},
        Joker = {
            j_hrzi_supreme_justice = {
                name = '最高正义',
                text = {
                    '每回合最后一次{C:attention}出牌{}时',
                    '一张牌会变成{C:attention}玻璃牌{}和获得一枚{C:attention}红色蜡封',
                    '迫使那一张牌总是被选中'
                    }
            },

            j_hrzi_skygazer = {
                name = '观天者',
                text = {
                    '在回合开始时',
                    '生成三张与你最多花色相对应的',
                    '{C:tarot}塔罗牌{}的{C:dark_edition}负片{}',
                    '{C:inactive}（黑桃对应世界，红心对应太阳，方块对应星星，梅花对应月亮）',
                    '{C:inactive}（如果出现平局则随机选择）'
                }
            },

            j_hrzi_gacha = {
                name = '原神模拟器',
                text = {
                    '打开{C:attention}补充包{}时，',
                    '有概率获得{C:attention}随机{}数额的{C:money}钱{}'
                }
            },

            j_hrzi_end_credits = {
                name = '片尾字幕',
                text = {
                    '每回合{C:attention}最后一次时{}，增加{X:mult,C:white}X#1#{}倍率',
                    '每回合{C:attention}最后一次时{}，{X:mult,C:white}X#2#{}倍率',
                }
            },

            j_hrzi_quarry = {
                name = '采石场',
                text = {
                    '打出的{C:attention}石头牌{}',
                    '会给{C:money}$#1#{}'
                }
            },

            j_hrzi_event_horizon = {
                name = '行星崩溃',
                text = {
                    '离开商店时，摧毁消耗品槽位里的{C:planet}星球牌{}',
                    '每两个被摧毁的{C:planet}星球牌{}会生成',
                    '一张{C:spectral}黑洞{}'
                }
            },

            j_hrzi_to_apotheosis = {
                name = '百炼成神',
                text = {
                    '打出{C:attention}隐藏手型{}时，',
                    '增加{X:mult,C:white}X#1#{}倍率',
                    '{C:inactive}当前为{X:mult,C:white}X#2#{}{C:inactive}倍率{}'
                }
            },

            j_hrzi_geologist = {
                name = '石头学家',
                text = {
                    "{C:attention}完整牌组{}内每有一张",
                    "{C:attention}石头牌",
                    "{C:mult}+3{}倍率",
                    "{C:inactive}当前为{C:mult}+#1#{C:inactive}倍率{}",
                }
            },

            j_hrzi_stonehenge = {
                name = '巨石阵',
                text = {
                    '打出的{C:attention}石头牌{}{X:chips,C:white}X#1#{}筹码',
                    '每一个计分的{C:attention}石头牌{}会增加{X:chips,C:white}X0.5{}筹码',
                    '{C:inactive}出牌后会重置{}'
                }
            },

            j_hrzi_brainwashing = {
                name = '洗脑术',
                text = {
                    '{X:dark_edition,C:white}^#1#{}倍率',
                    '如果打出的牌没有万能牌的次数达到三次，',
                    '{C:red,E:1}自毁自己',
                    '{C:inactive}#2#次后自毁自己'
                }
            },

            j_hrzi_monopoly_man = {
                name = '大富翁',
                text = {
                    '每丢弃一张{C:attention}金牌{}时',
                    '每拥有{C:money}$40{}，盲注要求{C:attention}减半{}'
                }
            },

            j_hrzi_sinful_deal = {
                name = '罪恶交易',
                text = {
                    '{C:attention}秘术包{}里始终有',
                    '一张{C:tarot}恶魔{}牌'
                }
            },

            j_hrzi_cremedlc = {
                name = '百里挑一',
                text = {
                    '售出{C:attention}15{}个小丑牌之后',
                    '售出此{C:attention}小丑牌{}，为最左侧的小丑',
                    '添加{C:dark_edition}负片{}版本',
                    '{C:inactive}(当前#1#/10)'
                }
            },

            j_hrzi_headshot = {
                name = '血鹰',
                text = {
                    '{C:attention}卖掉{}小丑时',
                    '将当前盲注要求降低{C:attention}35%{}'
                }
            },

            j_hrzi_thechosen = {
                name = '天选之子',
                text = {
                    '如果打出的牌是',
                    '{V:1}#2#{C:attention}A{}',
                    '{X:mult,C:white}X#1#{}倍率',
                    '{s:0.8,C:inactive}回合结束时改变需求花色',
                }
            },

            j_hrzi_ecstatic = {
                name = '若狂小丑',
                text = {
                    '如果打出的牌中',
                    '包含{C:attention}堡垒{}',
                    '{C:red}+#1#{}倍率'
                }
            },

            j_hrzi_frenzy = {
                name = '狂妄小丑',
                text = {
                    '如果打出的牌中',
                    '包含{C:attention}君主{}',
                    '{C:red}+#1#{}倍率'
                }
            },

            j_hrzi_manic = {
                name = '躁狂小丑',
                text = {
                    '如果打出的牌中',
                    '包含{C:attention}堡垒{}',
                    '{C:blue}+#1#{}筹码'
                }
            },

            j_hrzi_hysterical = {
                name = '狂乱小丑',
                text = {
                    '如果打出的牌中',
                    '包含{C:attention}君主{}',
                    '{C:blue}+#1#{}筹码'
                }
            },

            j_hrzi_conjure = {
                name = '召唤师',
                text = {
                    '再离开{C:attention}商店{}时',
                    '如果消耗牌槽位拥有一张{C:tarot}皇帝{}和{C:tarot}皇后{}',
                    '生成一张{C:chess}王{}或者一张{C:chess}后',
                    '{C:inactive,s:0.8}必须有空位',
                    '{C:inactive,s:0.8}使用次数:#1#'
                }
            },

            j_hrzi_orthogonal = {
                name = '正交',
                text = {
                    '额外触发左侧',
                    '相邻的{C:attention}小丑牌{}#1#次',
                    '{C:inactive}（不能被复制）'
                }
            },

            j_hrzi_dawn = {
                name = '黎明',
                text = {
                    '每回合{C:attention}第一次出牌{}时',
                    '每当一个{C:attention}小丑牌{}被触发',
                    '获得{C:money}$#1#{}'
                }
            },

            j_hrzi_endure = {
                name = '从耐力而扬升',
                text = {
                    '经过#1#个回合后',
                    '售出此牌时',
                    '随机获得一张{C:legendary}传奇{}{C:attention}小丑牌',
                    '{C:red, E:1}+2底注和+1获胜底注',
                    '{C:inactive,s:0.8}已经经过#2#个回合'
                }
            },

            j_hrzi_products = {
                name = '性感产品',
                text = {
                    '在{C:attention}商店{}里买东西时',
                    '{C:blue}+#1#{}筹码和{C:red}+#2#{}倍率',
                    '{C:inactive}（当前为{C:blue}+#3#{C:inactive}筹码和{C:mult}+#4#{C:inactive}倍率）'
                }
            },

            j_hrzi_map = {
                name = '精准定位',
                text = {
                    '如果这个{C:attention}小丑牌{}',
                    '在第{C:attention}#3#{}个小丑槽位',
                    '{C:white,X:mult}X#1#{}倍率'
                }
            },

            j_hrzi_cogreed = {
                name = '贪婪诅咒',
                text = {
                    '所有{C:attention}商店{}用品是{C:green}免费{}',
                    '买东西时，{C:green}#1#/#2#{}几率摧{C:red}毁此牌并且提升盲注所需分数增长速度{}',
                    '售出此牌时，{C:red}增加40张被虚弱的石头牌{}'
                }
            },

            j_hrzi_cupid = {
                name = '丘比特',
                text = {
                    '选择{C:attention}万能牌{}时',
                    '有{C:green}#1#/#2#{}几率把周围的牌',
                    '变成{C:attention}万能牌'
                }
            },

            j_hrzi_streetart = {
                name = '喷漆艺术',
                text = {
                    '如果打出的牌中包含',
                    '{C:attention}同花{}{C:attention}万能牌{}时',
                    '打出的{C:attention}万能牌{}会获得{C:mult}+#1#{}额外倍率'
                }
            },

            j_hrzi_emergency = {
                name = '紧急资源',
                text = {
                    '重掷{C:attention}商店{}时',
                    '有{C:green}#1#/#2#{}几率获得',
                    '一个{C:attention}汤，水{}或者{C:attention}医疗包{}'
                }
            },

            j_hrzi_blazingsun = {
                name = '恭听太阳的轰鸣',
                text = {
                    '使打出的{C:hearts}红桃{}的点数降低{C:attention}1',
                    '每降低一次点数，这张{C:attention}小丑牌{}获得{C:blue}+#1#{}筹码',
                    '{C:inactive}（当前为{C:blue}+#2#{C:inactive}筹码）',
                    '{C:inactive}不会在降低{}{C:attention}2{}{C:inactive}的点数',
                }
            },

            j_hrzi_envelope = {
                name = '邮件',
                text = {
                    '如果打出的牌包含{C:attention}葫芦{}',
                    '留在手中的一张牌会获得一枚{C:attention}蜡封{}'
                }
            }
        },

        Other={
            p_hrzi_chess_normal_1 = {
                name = '象棋包',
                text = {
                    '从{C:attention}2{}张{C:chess}象棋牌{}中',
                    '选择{C:attention}1{}张来保存'
                    
                },
   
            },

            p_hrzi_chess_normal_2 = {
                name = '象棋包',
                text = {
                    '从{C:attention}2{}张{C:chess}象棋牌{}中',
                    '选择{C:attention}1{}张来保存'
                    
                },
   
            },

            p_hrzi_chess_jumbo_1 = {
                name = '巨型象棋包',
                text = {
                    '从{C:attention}4{}张{C:chess}象棋牌{}中',
                    '选择{C:attention}1{}张来保存'
                    
                },
   
            },
        },

        Planet={
            c_hrzi_asteroid = {
                name = '小行星',
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）{}",
                    "升级{C:attention}壁垒",
                    "{C:mult}+#2#{}倍率并且",
                    "{C:chips}+#3#{}筹码",
                }
            },

            c_hrzi_ganymede = {
                name = '伽尼米德',
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）{}",
                    "升级{C:attention}同花君主",
                    "{C:mult}+#2#{}倍率并且",
                    "{C:chips}+#3#{}筹码",
                }
            },

            c_hrzi_titan = {
                name = '泰坦',
                text = {
                    "{S:0.8}（{S:0.8,V:1}等级#1#{S:0.8}）{}",
                    "升级{C:attention}君主",
                    "{C:mult}+#2#{}倍率并且",
                    "{C:chips}+#3#{}筹码",
                }
            }
        },
        --[[]
        Spectral={},
        Stake={},
]]

        Tag={
            tag_hrzi_soup = {
                name = '汤',
                text = {
                    '进入{C:attention}商店{}时',
                    '获得{C:money}$3{}到{C:money}$7'
                }
            },

            tag_hrzi_water = {
                name = '水',
                text = {
                    '下一回合有{C:green}#1#/#2#{}几率',
                    '获得一个额外{C:red}弃牌{}次数'
                }
            },

            tag_hrzi_medkit = {
                name = '医疗包',
                text = {
                    '下一回合获得',
                    '{C:attention}2{}到{C:attention}4{}额外手牌上限'
                }
            }
        },
--[[]
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
            k_hrzi_chess_pack = '象棋包'
        },
        --high_scores={},
        --labels={},

        poker_hand_descriptions={
            ['hrzi_Rampart'] = {
                '五张石头牌'
            },
        
            ['hrzi_Monarchal'] = {
                '五张人头牌'
            },

            ['hrzi_Suited_Monarchs'] = {
                '五张同色人头牌'
            },
        },

        poker_hands={
            ['hrzi_Rampart'] = "壁垒",
            ['hrzi_Monarchal'] = '君主',
            ["hrzi_Suited_Monarchs"] = '同花君主'
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
