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


child
fd=0
start evo_tkn.exe
"{}"
asm:
p514 ⊢ p518 @ spt : r513 ⊢ r516 r515
p517 ⊢ p522 @ spt : r515 ⊢ r520 r519
p518 ⊢ p517 @ rm : r516 ⊢
p521 ⊢ p526 @ spt : r519 ⊢ r524 r523
p522 ⊢ p521 @ rm : r520 ⊢
p525 ⊢ p527 @ rpc : r511 ⊢ r529 r528
p526 ⊢ p525 @ rm : r523 ⊢
p527 ⊢ p531 @ id : r530 ⊢ r529
p531 ⊢ p535 @ spt : r530 ⊢ r533 r532
p534 ⊢ p537 @ ini_tkn {} :  ⊢ r536
p535 ⊢ p534 @ rm : r532 ⊢
p537 ⊢ p538 @ cns : r533 r536 ⊢ r539
p538 ⊢ p540 @ cns : r524 r539 ⊢ r541
p540 ⊢ p542 @ cns : r509 r541 ⊢ r543
p542 ⊢ p544 @ call : r467 r543 ⊢ r545
p544 ⊢ p546 @ rpc : r462 ⊢ r548 r547
p546 ⊢ p549 @ rpc : r548 ⊢ r551 r550
p549 ⊢ p553 @ ini_tkn →[p68,r69] :  ⊢ r552
p553 ⊢ p554 @ rpc : r550 ⊢ r556 r555
p554 ⊢ p557 @ rpc : r556 ⊢ r559 r558
p557 ⊢ p561 @ ini_tkn + :  ⊢ r560
p49 ⊢ p50 @ rpc : r48 ⊢ r52 r51
p561 ⊢ p562 @ rpc : r558 ⊢ r564 r563
p50 ⊢ p53 @ rpc : r52 ⊢ r55 r54
p562 ⊢ p566 @ id : r565 ⊢ r564
p53 ⊢ p57 @ ini_tkn →[p58,r59] :  ⊢ r56
p566 ⊢ p570 @ spt : r565 ⊢ r568 r567
p57 ⊢ p763 @ ini_tkn {} :  ⊢ r762
p569 ⊢ p574 @ spt : r567 ⊢ r572 r571
p58 ⊢ p60 @ rpc : r59 ⊢ r62 r61
p570 ⊢ p569 @ rm : r568 ⊢
p60 ⊢ p63 @ rpc : r62 ⊢ r65 r64
p573 ⊢ p578 @ spt : r571 ⊢ r576 r575
p574 ⊢ p573 @ rm : r572 ⊢
p63 ⊢ p67 @ ini_tkn →[p68,r69] :  ⊢ r66
p577 ⊢ p579 @ rpc : r563 ⊢ r581 r580
p578 ⊢ p577 @ rm : r575 ⊢
p67 ⊢ p663 @ rpc : r64 ⊢ r665 r664
p579 ⊢ p582 @ rpc : r581 ⊢ r584 r583
p68 ⊢ p70 @ rpc : r69 ⊢ r72 r71
p70 ⊢ p73 @ rpc : r72 ⊢ r75 r74
p582 ⊢ p586 @ ini_tkn - :  ⊢ r585
p73 ⊢ p77 @ ini_tkn →[p78,r79] :  ⊢ r76
p586 ⊢ p588 @ ini_tkn 1 :  ⊢ r587
p588 ⊢ p589 @ call : r585 r587 ⊢ r590
p77 ⊢ p316 @ rpc : r74 ⊢ r318 r317
p589 ⊢ p592 @ ini_tkn {} :  ⊢ r591
p78 ⊢ p80 @ rpc : r79 ⊢ r82 r81
p80 ⊢ p84 @ ini_tkn →[p85,r86] :  ⊢ r83
p592 ⊢ p593 @ cns : r590 r591 ⊢ r594
p593 ⊢ p595 @ cns : r576 r594 ⊢ r596
p595 ⊢ p597 @ call : r560 r596 ⊢ r598
p84 ⊢ p272 @ rpc : r81 ⊢ r274 r273
p85 ⊢ p87 @ rpc : r86 ⊢ r89 r88
p597 ⊢ p599 @ rpc : r555 ⊢ r601 r600
p87 ⊢ p91 @ ini_tkn →[p92,r93] :  ⊢ r90
p599 ⊢ p603 @ id : r602 ⊢ r601
p91 ⊢ p247 @ rpc : r88 ⊢ r249 r248
p603 ⊢ p607 @ spt : r602 ⊢ r605 r604
p92 ⊢ p94 @ rpc : r93 ⊢ r96 r95
p94 ⊢ p98 @ id : r97 ⊢ r96
p606 ⊢ p608 @ rpc : r600 ⊢ r610 r609
p607 ⊢ p606 @ rm : r604 ⊢
p608 ⊢ p612 @ id : r611 ⊢ r610
p98 ⊢ p102 @ spt : r97 ⊢ r100 r99
p612 ⊢ p616 @ spt : r611 ⊢ r614 r613
p101 ⊢ p103 @ rpc : r95 ⊢ r105 r104
p102 ⊢ p101 @ rm : r99 ⊢
p103 ⊢ p107 @ id : r106 ⊢ r105
p615 ⊢ p620 @ spt : r613 ⊢ r618 r617
p616 ⊢ p615 @ rm : r614 ⊢
p107 ⊢ p109 @ ini_tkn {} :  ⊢ r108
p619 ⊢ p622 @ ini_tkn {} :  ⊢ r621
p620 ⊢ p619 @ rm : r617 ⊢
p109 ⊢ p110 @ cns : r106 r108 ⊢ r111
p110 ⊢ p112 @ cns : r100 r111 ⊢ r113
p622 ⊢ p623 @ cns : r618 r621 ⊢ r624
p623 ⊢ p625 @ cns : r605 r624 ⊢ r626
p112 ⊢ p117 @ ∠ r100 [ p114 p115] :  ⊢ r116
p625 ⊢ p627 @ cns : r598 r626 ⊢ r628
p114 ⊢ p119 @ ini_tkn 1 :  ⊢ r118
p115 ⊢ p121 @ id : r120 ⊢ r113
p627 ⊢ p629 @ call : r552 r628 ⊢ r630
p117 @ ret : r116
p629 ⊢ p632 @ ini_tkn {} :  ⊢ r631
p119 @ ret : r118
p632 ⊢ p633 @ cns : r630 r631 ⊢ r634
p121 ⊢ p125 @ spt : r120 ⊢ r123 r122
p633 ⊢ p635 @ cns : r545 r634 ⊢ r636
p635 ⊢ p637 @ cns : r460 r636 ⊢ r638
p124 ⊢ p129 @ spt : r122 ⊢ r127 r126
p125 ⊢ p124 @ rm : r123 ⊢
p637 ⊢ p639 @ call : r374 r638 ⊢ r640
p639 @ ret : r640
p128 ⊢ p130 @ rpc : r127 ⊢ r132 r131
p129 ⊢ p128 @ rm : r126 ⊢
p130 ⊢ p134 @ id : r133 ⊢ r132
p642 ⊢ p646 @ spt : r641 ⊢ r644 r643
p645 ⊢ p650 @ spt : r643 ⊢ r648 r647
p134 ⊢ p138 @ spt : r133 ⊢ r136 r135
p646 ⊢ p645 @ rm : r644 ⊢
p137 ⊢ p142 @ spt : r135 ⊢ r140 r139
p649 ⊢ p654 @ spt : r648 ⊢ r652 r651
p138 ⊢ p137 @ rm : r136 ⊢
p650 ⊢ p649 @ rm : r647 ⊢
p141 ⊢ p143 @ rpc : r131 ⊢ r145 r144
p653 ⊢ p658 @ spt : r651 ⊢ r656 r655
p142 ⊢ p141 @ rm : r139 ⊢
p654 ⊢ p653 @ rm : r652 ⊢
p143 ⊢ p147 @ id : r146 ⊢ r145
p657 ⊢ p662 @ spt : r655 ⊢ r660 r659
p658 ⊢ p657 @ rm : r656 ⊢
p147 ⊢ p149 @ ini_tkn {} :  ⊢ r148
p149 ⊢ p150 @ cns : r146 r148 ⊢ r151
p661 @ ret : r660
p150 ⊢ p152 @ cns : r140 r151 ⊢ r153
p662 ⊢ p661 @ rm : r659 ⊢
p663 ⊢ p667 @ ini_tkn 14 :  ⊢ r666
p152 ⊢ p157 @ ∠ r140 [ p154 p155] :  ⊢ r156
p154 ⊢ p159 @ ini_tkn 0 :  ⊢ r158
p155 ⊢ p161 @ id : r160 ⊢ r153
p667 ⊢ p668 @ rpc : r664 ⊢ r670 r669
p668 ⊢ p672 @ ini_tkn 7 :  ⊢ r671
p157 @ ret : r156
p159 @ ret : r158
p672 ⊢ p673 @ rpc : r669 ⊢ r675 r674
p161 ⊢ p165 @ spt : r160 ⊢ r163 r162
p673 ⊢ p677 @ ini_tkn 0 :  ⊢ r676
p164 ⊢ p169 @ spt : r162 ⊢ r167 r166
p165 ⊢ p164 @ rm : r163 ⊢
p677 ⊢ p679 @ ini_tkn {} :  ⊢ r678
p679 ⊢ p680 @ cns : r676 r678 ⊢ r681
p168 ⊢ p170 @ rpc : r167 ⊢ r172 r171
p680 ⊢ p682 @ cns : r671 r681 ⊢ r683
p169 ⊢ p168 @ rm : r166 ⊢
p170 ⊢ p174 @ ini_tkn →[p92,r93] :  ⊢ r173
p682 ⊢ p684 @ cns : r666 r683 ⊢ r685
p684 ⊢ p686 @ call : r66 r685 ⊢ r687
p174 ⊢ p175 @ rpc : r171 ⊢ r177 r176
p686 ⊢ p688 @ rpc : r61 ⊢ r690 r689
p175 ⊢ p178 @ rpc : r177 ⊢ r180 r179
p688 ⊢ p691 @ rpc : r690 ⊢ r693 r692
p178 ⊢ p182 @ ini_tkn + :  ⊢ r181
p691 ⊢ p695 @ ini_tkn →[p68,r69] :  ⊢ r694
p182 ⊢ p183 @ rpc : r179 ⊢ r185 r184
p183 ⊢ p187 @ id : r186 ⊢ r185
p695 ⊢ p696 @ rpc : r692 ⊢ r698 r697
p696 ⊢ p700 @ ini_tkn 14 :  ⊢ r699
p187 ⊢ p191 @ spt : r186 ⊢ r189 r188
p700 ⊢ p701 @ rpc : r697 ⊢ r703 r702
p701 ⊢ p705 @ ini_tkn 7 :  ⊢ r704
p190 ⊢ p192 @ rpc : r184 ⊢ r194 r193
p191 ⊢ p190 @ rm : r188 ⊢
p192 ⊢ p196 @ ini_tkn 1 :  ⊢ r195
p705 ⊢ p706 @ rpc : r702 ⊢ r708 r707
p706 ⊢ p710 @ ini_tkn 0 :  ⊢ r709
p196 ⊢ p198 @ ini_tkn {} :  ⊢ r197
p198 ⊢ p199 @ cns : r195 r197 ⊢ r200
p710 ⊢ p712 @ ini_tkn {} :  ⊢ r711
p199 ⊢ p201 @ cns : r189 r200 ⊢ r202
p712 ⊢ p713 @ cns : r709 r711 ⊢ r714
p201 ⊢ p203 @ call : r181 r202 ⊢ r204
p713 ⊢ p715 @ cns : r704 r714 ⊢ r716
p203 ⊢ p205 @ rpc : r176 ⊢ r207 r206
p715 ⊢ p717 @ cns : r699 r716 ⊢ r718
p205 ⊢ p208 @ rpc : r207 ⊢ r210 r209
p717 ⊢ p719 @ call : r694 r718 ⊢ r720
p719 ⊢ p721 @ rpc : r689 ⊢ r723 r722
p208 ⊢ p212 @ ini_tkn + :  ⊢ r211
p721 ⊢ p724 @ rpc : r723 ⊢ r726 r725
p212 ⊢ p213 @ rpc : r209 ⊢ r215 r214
p724 ⊢ p728 @ ini_tkn →[p68,r69] :  ⊢ r727
p213 ⊢ p217 @ id : r216 ⊢ r215
p728 ⊢ p729 @ rpc : r725 ⊢ r731 r730
p217 ⊢ p221 @ spt : r216 ⊢ r219 r218
p729 ⊢ p733 @ ini_tkn 14 :  ⊢ r732
p220 ⊢ p225 @ spt : r218 ⊢ r223 r222
p221 ⊢ p220 @ rm : r219 ⊢
p733 ⊢ p734 @ rpc : r730 ⊢ r736 r735
p734 ⊢ p738 @ ini_tkn 7 :  ⊢ r737
p224 ⊢ p226 @ rpc : r214 ⊢ r228 r227
p225 ⊢ p224 @ rm : r222 ⊢
p226 ⊢ p230 @ ini_tkn 1 :  ⊢ r229
p738 ⊢ p739 @ rpc : r735 ⊢ r741 r740
p739 ⊢ p743 @ ini_tkn 0 :  ⊢ r742
p230 ⊢ p232 @ ini_tkn {} :  ⊢ r231
p743 ⊢ p745 @ ini_tkn {} :  ⊢ r744
p232 ⊢ p233 @ cns : r229 r231 ⊢ r234
p233 ⊢ p235 @ cns : r223 r234 ⊢ r236
p745 ⊢ p746 @ cns : r742 r744 ⊢ r747
p746 ⊢ p748 @ cns : r737 r747 ⊢ r749
p235 ⊢ p237 @ call : r211 r236 ⊢ r238
p748 ⊢ p750 @ cns : r732 r749 ⊢ r751
p237 ⊢ p240 @ ini_tkn {} :  ⊢ r239
p750 ⊢ p752 @ call : r727 r751 ⊢ r753
p240 ⊢ p241 @ cns : r238 r239 ⊢ r242
p752 ⊢ p755 @ ini_tkn {} :  ⊢ r754
p241 ⊢ p243 @ cns : r204 r242 ⊢ r244
p243 ⊢ p245 @ call : r173 r244 ⊢ r246
p755 ⊢ p756 @ cns : r753 r754 ⊢ r757
p756 ⊢ p758 @ cns : r720 r757 ⊢ r759
p245 @ ret : r246
p758 ⊢ p760 @ cns : r687 r759 ⊢ r761
p247 ⊢ p251 @ id : r250 ⊢ r249
p760 @ ret : r761
p251 ⊢ p252 @ rpc : r248 ⊢ r254 r253
p763 ⊢ p764 @ call : r56 r762 ⊢ r765
p252 ⊢ p255 @ rpc : r254 ⊢ r257 r256
p764 ⊢ p767 @ ini_tkn {} :  ⊢ r766
p255 ⊢ p259 @ ini_tkn - :  ⊢ r258
p767 ⊢ p768 @ cns : r765 r766 ⊢ r769
p768 @ ret : r769
p259 ⊢ p261 @ id : r260 ⊢ r256
p261 ⊢ p262 @ call : r258 r260 ⊢ r263
p262 ⊢ p265 @ ini_tkn {} :  ⊢ r264
p265 ⊢ p266 @ cns : r263 r264 ⊢ r267
p266 ⊢ p268 @ cns : r250 r267 ⊢ r269
p268 ⊢ p270 @ call : r90 r269 ⊢ r271
p270 @ ret : r271
p272 ⊢ p276 @ ini_tkn + :  ⊢ r275
p276 ⊢ p277 @ rpc : r273 ⊢ r279 r278
p277 ⊢ p281 @ id : r280 ⊢ r279
p281 ⊢ p285 @ spt : r280 ⊢ r283 r282
p284 ⊢ p286 @ rpc : r278 ⊢ r288 r287
p285 ⊢ p284 @ rm : r282 ⊢
p286 ⊢ p289 @ rpc : r288 ⊢ r291 r290
p289 ⊢ p293 @ ini_tkn - :  ⊢ r292
p293 ⊢ p295 @ id : r294 ⊢ r290
p295 ⊢ p299 @ spt : r294 ⊢ r297 r296
p298 ⊢ p303 @ spt : r296 ⊢ r301 r300
p299 ⊢ p298 @ rm : r297 ⊢
p302 ⊢ p304 @ call : r292 r301 ⊢ r305
p303 ⊢ p302 @ rm : r300 ⊢
p304 ⊢ p307 @ ini_tkn {} :  ⊢ r306
p307 ⊢ p308 @ cns : r305 r306 ⊢ r309
p308 ⊢ p310 @ cns : r283 r309 ⊢ r311
p310 ⊢ p312 @ call : r275 r311 ⊢ r313
p312 ⊢ p314 @ call : r83 r313 ⊢ r315
p314 @ ret : r315
p316 ⊢ p320 @ id : r319 ⊢ r318
p320 ⊢ p324 @ spt : r319 ⊢ r322 r321
p323 ⊢ p325 @ rpc : r317 ⊢ r327 r326
p324 ⊢ p323 @ rm : r321 ⊢
p325 ⊢ p329 @ id : r328 ⊢ r327
p329 ⊢ p333 @ spt : r328 ⊢ r331 r330
p332 ⊢ p337 @ spt : r330 ⊢ r335 r334
p333 ⊢ p332 @ rm : r331 ⊢
p336 ⊢ p339 @ ini_tkn {} :  ⊢ r338
p337 ⊢ p336 @ rm : r334 ⊢
p339 ⊢ p340 @ cns : r335 r338 ⊢ r341
p340 ⊢ p342 @ cns : r322 r341 ⊢ r343
p342 ⊢ p344 @ call : r76 r343 ⊢ r345
p344 ⊢ p346 @ rpc : r71 ⊢ r348 r347
p346 ⊢ p350 @ id : r349 ⊢ r348
p350 ⊢ p352 @ ini_tkn {} :  ⊢ r351
p352 ⊢ p353 @ cns : r349 r351 ⊢ r354
p353 ⊢ p355 @ cns : r345 r354 ⊢ r356
p355 ⊢ p360 @ ∠ r345 [ p357 p358] :  ⊢ r359
p357 ⊢ p362 @ id : r361 ⊢ r356
p358 ⊢ p642 @ id : r641 ⊢ r356
p360 @ ret : r359
p362 ⊢ p366 @ spt : r361 ⊢ r364 r363
p365 ⊢ p370 @ spt : r363 ⊢ r368 r367
p366 ⊢ p365 @ rm : r364 ⊢
p369 ⊢ p371 @ rpc : r368 ⊢ r373 r372
p370 ⊢ p369 @ rm : r367 ⊢
p371 ⊢ p375 @ ini_tkn →[p68,r69] :  ⊢ r374
p375 ⊢ p376 @ rpc : r372 ⊢ r378 r377
p376 ⊢ p379 @ rpc : r378 ⊢ r381 r380
p379 ⊢ p383 @ ini_tkn →[p68,r69] :  ⊢ r382
p383 ⊢ p384 @ rpc : r380 ⊢ r386 r385
p384 ⊢ p387 @ rpc : r386 ⊢ r389 r388
p387 ⊢ p391 @ ini_tkn + :  ⊢ r390
p391 ⊢ p392 @ rpc : r388 ⊢ r394 r393
p392 ⊢ p396 @ id : r395 ⊢ r394
p396 ⊢ p400 @ spt : r395 ⊢ r398 r397
p399 ⊢ p401 @ rpc : r393 ⊢ r403 r402
p400 ⊢ p399 @ rm : r397 ⊢
p401 ⊢ p404 @ rpc : r403 ⊢ r406 r405
p404 ⊢ p408 @ ini_tkn - :  ⊢ r407
p408 ⊢ p410 @ ini_tkn 1 :  ⊢ r409
p410 ⊢ p411 @ call : r407 r409 ⊢ r412
p411 ⊢ p414 @ ini_tkn {} :  ⊢ r413
p414 ⊢ p415 @ cns : r412 r413 ⊢ r416
p415 ⊢ p417 @ cns : r398 r416 ⊢ r418
p417 ⊢ p419 @ call : r390 r418 ⊢ r420
p419 ⊢ p421 @ rpc : r385 ⊢ r423 r422
p421 ⊢ p425 @ id : r424 ⊢ r423
p425 ⊢ p429 @ spt : r424 ⊢ r427 r426
p428 ⊢ p433 @ spt : r426 ⊢ r431 r430
p429 ⊢ p428 @ rm : r427 ⊢
p432 ⊢ p434 @ rpc : r422 ⊢ r436 r435
p433 ⊢ p432 @ rm : r430 ⊢
p434 ⊢ p438 @ id : r437 ⊢ r436
p438 ⊢ p442 @ spt : r437 ⊢ r440 r439
p441 ⊢ p446 @ spt : r439 ⊢ r444 r443
p442 ⊢ p441 @ rm : r440 ⊢
p445 ⊢ p450 @ spt : r443 ⊢ r448 r447
p446 ⊢ p445 @ rm : r444 ⊢
p449 ⊢ p452 @ ini_tkn {} :  ⊢ r451
p450 ⊢ p449 @ rm : r447 ⊢
p452 ⊢ p453 @ cns : r448 r451 ⊢ r454
p453 ⊢ p455 @ cns : r431 r454 ⊢ r456
p455 ⊢ p457 @ cns : r420 r456 ⊢ r458
p457 ⊢ p459 @ call : r382 r458 ⊢ r460
p459 ⊢ p461 @ rpc : r377 ⊢ r463 r462
p461 ⊢ p464 @ rpc : r463 ⊢ r466 r465
p464 ⊢ p468 @ ini_tkn →[p68,r69] :  ⊢ r467
p468 ⊢ p469 @ rpc : r465 ⊢ r471 r470
p469 ⊢ p472 @ rpc : r471 ⊢ r474 r473
p472 ⊢ p476 @ ini_tkn + :  ⊢ r475
p476 ⊢ p477 @ rpc : r473 ⊢ r479 r478
p477 ⊢ p481 @ id : r480 ⊢ r479
p481 ⊢ p485 @ spt : r480 ⊢ r483 r482
p484 ⊢ p489 @ spt : r482 ⊢ r487 r486
p485 ⊢ p484 @ rm : r483 ⊢
p488 ⊢ p490 @ rpc : r478 ⊢ r492 r491
p489 ⊢ p488 @ rm : r486 ⊢
p490 ⊢ p493 @ rpc : r492 ⊢ r495 r494
p493 ⊢ p497 @ ini_tkn - :  ⊢ r496
p497 ⊢ p499 @ ini_tkn 1 :  ⊢ r498
p499 ⊢ p500 @ call : r496 r498 ⊢ r501
p500 ⊢ p503 @ ini_tkn {} :  ⊢ r502
p503 ⊢ p504 @ cns : r501 r502 ⊢ r505
p504 ⊢ p506 @ cns : r487 r505 ⊢ r507
p506 ⊢ p508 @ call : r475 r507 ⊢ r509
p508 ⊢ p510 @ rpc : r470 ⊢ r512 r511
p510 ⊢ p514 @ id : r513 ⊢ r512
