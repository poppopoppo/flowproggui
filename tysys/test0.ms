p129 ⊢ p133 @ ini_tkn - :  ⊢ r132
p133 ⊢ p135 @ ini_tkn 1 :  ⊢ r134
p135 ⊢ p136 @ call : r132 r134 ⊢ r137
p136 ⊢ p139 @ ini_tkn {} :  ⊢ r138
p139 ⊢ p140 @ cns : r137 r138 ⊢ r141
p140 ⊢ p142 @ cns : r123 r141 ⊢ r143
p142 ⊢ p144 @ call : r111 r143 ⊢ r145
p144 ⊢ p146 @ call : r106 r145 ⊢ r147
p146 ⊢ p149 @ ini_tkn {} :  ⊢ r148
p149 ⊢ p150 @ cns : r147 r148 ⊢ r151
p150 ⊢ p152 @ cns : r97 r151 ⊢ r153
p152 ⊢ p154 @ call : r85 r153 ⊢ r155
p154 @ ret : r155
p157 ⊢ p158 @ call : r56 r156 ⊢ r159
p158 ⊢ p161 @ ini_tkn {} :  ⊢ r160
p161 ⊢ p162 @ cns : r159 r160 ⊢ r163
p162 @ ret : r163
p49 ⊢ p50 @ rpc : r48 ⊢ r52 r51
p50 ⊢ p53 @ rpc : r52 ⊢ r55 r54
p53 ⊢ p57 @ ini_tkn →[p58,r59] :  ⊢ r56
p57 ⊢ p157 @ ini_tkn 1 :  ⊢ r156
p58 ⊢ p60 @ rpc : r59 ⊢ r62 r61
p60 ⊢ p64 @ id : r63 ⊢ r62
p64 ⊢ p65 @ rpc : r61 ⊢ r67 r66
p65 ⊢ p69 @ id : r68 ⊢ r67
p69 ⊢ p71 @ ini_tkn {} :  ⊢ r70
p71 ⊢ p72 @ cns : r68 r70 ⊢ r73
p72 ⊢ p74 @ cns : r63 r73 ⊢ r75
p74 ⊢ p79 @ ∠ r63 [ p76 p77] :  ⊢ r78
p76 ⊢ p81 @ ini_tkn 1 :  ⊢ r80
p77 ⊢ p82 @ rpc : r75 ⊢ r84 r83
p79 @ ret : r78
p81 @ ret : r80
p82 ⊢ p86 @ ini_tkn * :  ⊢ r85
p86 ⊢ p87 @ rpc : r83 ⊢ r89 r88
p87 ⊢ p91 @ id : r90 ⊢ r89
p91 ⊢ p95 @ spt : r90 ⊢ r93 r92
p95 ⊢ p94 @ rm : r93 ⊢
p99 ⊢ p98 @ rm : r96 ⊢
p100 ⊢ p103 @ rpc : r102 ⊢ r105 r104
p103 ⊢ p107 @ ini_tkn →[p58,r59] :  ⊢ r106
p107 ⊢ p108 @ rpc : r104 ⊢ r110 r109
p108 ⊢ p112 @ ini_tkn + :  ⊢ r111
p112 ⊢ p113 @ rpc : r109 ⊢ r115 r114
p113 ⊢ p117 @ id : r116 ⊢ r115
p117 ⊢ p121 @ spt : r116 ⊢ r119 r118
p121 ⊢ p120 @ rm : r119 ⊢
p125 ⊢ p124 @ rm : r122 ⊢
p126 ⊢ p129 @ rpc : r128 ⊢ r131 r130
enter vm2.run:p49
