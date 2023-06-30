
// ********* getName Property ***********
@entry_getName: // 0
	ALIAS r1 $literalexpression211 // 1
	LOAD $literalexpression211 "Test Sandy" // 1
	PUSH $literalexpression211 // 15
	JMP @exit_getName // 17
@exit_getName: // 20
RET // 21

// ********* getSymbol Property ***********
@entry_getSymbol: // 22
	ALIAS r1 $literalexpression215 // 23
	LOAD $literalexpression215 "STST" // 23
	PUSH $literalexpression215 // 31
	JMP @exit_getSymbol // 33
@exit_getSymbol: // 36
RET // 37

// ********* isFungible Property ***********
@entry_isFungible: // 38
	ALIAS r1 $literalexpression219 // 39
	LOAD $literalexpression219 false // 39
	PUSH $literalexpression219 // 44
	JMP @exit_isFungible // 46
@exit_isFungible: // 49
RET // 50

// ********* isFinite Property ***********
@entry_isFinite: // 51
	ALIAS r1 $literalexpression223 // 52
	LOAD $literalexpression223 true // 52
	PUSH $literalexpression223 // 57
	JMP @exit_isFinite // 59
@exit_isFinite: // 62
RET // 63

// ********* isBurnable Property ***********
@entry_isBurnable: // 64
	ALIAS r1 $literalexpression227 // 65
	LOAD $literalexpression227 true // 65
	PUSH $literalexpression227 // 70
	JMP @exit_isBurnable // 72
@exit_isBurnable: // 75
RET // 76

// ********* getMaxSupply Property ***********
@entry_getMaxSupply: // 77
	ALIAS r1 $DOLL_SUPPLY // 78
	LOAD $DOLL_SUPPLY 500 // 78
	PUSH $DOLL_SUPPLY // 84
	JMP @exit_getMaxSupply // 86
@exit_getMaxSupply: // 89
RET // 90

// ********* isTransferable Property ***********
@entry_isTransferable: // 91
	ALIAS r1 $literalexpression235 // 92
	LOAD $literalexpression235 true // 92
	PUSH $literalexpression235 // 97
	JMP @exit_isTransferable // 99
@exit_isTransferable: // 102
RET // 103

// ********* isCapped Property ***********
@entry_isCapped: // 104
	ALIAS r1 $literalexpression239 // 105
	LOAD $literalexpression239 false // 105
	PUSH $literalexpression239 // 110
	JMP @exit_isCapped // 112
@exit_isCapped: // 115
RET // 116

// ********* getDecimals Property ***********
@entry_getDecimals: // 117
	ALIAS r1 $literalexpression243 // 118
	LOAD $literalexpression243 8 // 118
	PUSH $literalexpression243 // 123
	JMP @exit_getDecimals // 125
@exit_getDecimals: // 128
RET // 129

// ********* getOwner Property ***********
@entry_getOwner: // 130
ALIAS r1 $dataGet // 131
LOAD $dataGet "Data.Get" // 131
ALIAS r2 $contractName // 143
LOAD $contractName "STST" // 143
ALIAS r3 $owner // 151
// reading global: owner
LOAD r0 8 // 151
PUSH r0 // 156
LOAD r0 "owner" // 158
PUSH r0 // 167
PUSH $contractName // 169
EXTCALL $dataGet // 171
POP $owner // 173
PUSH $owner // 175
EXTCALL "Address()" // 177
POP $owner // 192
	COPY $owner r1 // 194
	PUSH r1 // 197
	JMP @exit_getOwner // 199
@exit_getOwner: // 202
RET // 203
// Line 156:            }
// Line 157:        }
// Line 158:    }

// ********* Initialize Constructor ***********
@entry_constructor: // 204
ALIAS r1 $nexus_protocol_version // 205
// validate protocol version
LOAD r0 "Runtime.Version" // 205
EXTCALL r0 // 224
POP r0 // 226
LOAD $nexus_protocol_version 8 // 228
LT r0 $nexus_protocol_version r0 // 233
JMPNOT r0 @protocol_version_validated // 237
LOAD r0 "Current nexus protocol version should be 8 or more" // 241
THROW r0 // 295
@protocol_version_validated: NOP // 298
ALIAS r1 $owner // 298
// clearing owns_sandy storage
LOAD r0 "owns_sandy" // 298
PUSH r0 // 312
LOAD r0 "Map.Clear" // 314
EXTCALL r0 // 327
// clearing balances storage
LOAD r0 "balances" // 329
PUSH r0 // 341
LOAD r0 "Map.Clear" // 343
EXTCALL r0 // 356
ALIAS r2 $_infusionAmt // 358
ALIAS r3 $mintBodyInited // 358
ALIAS r4 $bodyBaseURI // 358
// clearing _limbs storage
LOAD r0 "_limbs" // 358
PUSH r0 // 368
LOAD r0 "Map.Clear" // 370
EXTCALL r0 // 383
// clearing _categories storage
LOAD r0 "_categories" // 385
PUSH r0 // 400
LOAD r0 "Map.Clear" // 402
EXTCALL r0 // 415
ALIAS r5 $_infusionTkn // 417
ALIAS r6 $organicCount // 417
ALIAS r7 $preciousCount // 417
ALIAS r8 $energyCount // 417
// Line 159:
// Line 160:    constructor(con_creator: address) {
ALIAS r9 $con_creator // 417
POP $con_creator // 417
PUSH $con_creator // 419
EXTCALL "Address()" // 421
POP $con_creator // 436
// Line 161:        owner = con_creator;
	COPY $con_creator r10 // 438
	COPY r10 $owner // 441
// Line 162:        _infusionTkn = "SOUL";
	ALIAS r10 $literalexpression496 // 444
	LOAD $literalexpression496 "SOUL" // 444
	COPY $literalexpression496 $_infusionTkn // 452
// Line 163:        local assetDecimals : number = 10 ^ Token.getDecimals(_infusionTkn);    
	ALIAS r10 $assetDecimals // 455
	ALIAS r11 $literalexpression497 // 455
	LOAD $literalexpression497 10 // 455
	ALIAS r12 $methodcallexpression498 // 460
	COPY $_infusionTkn r13 // 460
	PUSH r13 // 463
	LOAD $methodcallexpression498 "Runtime.GetTokenDecimals" // 465
	EXTCALL $methodcallexpression498 // 493
	POP $methodcallexpression498 // 495
	POW $literalexpression497 $methodcallexpression498 r13 // 497
	COPY r13 $assetDecimals // 501
// Line 164:        _infusionAmt = 50 * assetDecimals;
	ALIAS r11 $literalexpression505 // 504
	LOAD $literalexpression505 50 // 504
	COPY $assetDecimals r12 // 509
	MUL $literalexpression505 r12 r13 // 512
	COPY r13 $_infusionAmt // 516
// Line 165:        mintBodyInited = false;
	ALIAS r11 $literalexpression509 // 519
	LOAD $literalexpression509 false // 519
	COPY $literalexpression509 $mintBodyInited // 524
// Line 166:        bodyBaseURI = "";
	ALIAS r11 $literalexpression511 // 527
	LOAD $literalexpression511 "" // 527
	COPY $literalexpression511 $bodyBaseURI // 531
// Line 167:        organicCount = 0;
	ALIAS r11 $literalexpression513 // 534
	LOAD $literalexpression513 0 // 534
	COPY $literalexpression513 $organicCount // 539
// Line 168:        energyCount = 0;
	ALIAS r11 $literalexpression515 // 542
	LOAD $literalexpression515 0 // 542
	COPY $literalexpression515 $energyCount // 547
// Line 169:        preciousCount = 0;
	ALIAS r11 $literalexpression517 // 550
	LOAD $literalexpression517 0 // 550
	COPY $literalexpression517 $preciousCount // 555
// Line 170:
// Line 171:        NFT.createSeries(owner, $THIS_SYMBOL, SERIES_BODY, DOLL_SUPPLY, TokenSeries.Unique, character);
	ALIAS r11 $methodcallexpression519 // 558
	LOAD r12 0x09076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030A676574496E666F55524C04B70000000107746F6B656E4944030B676574496D61676555524C04120100000107746F6B656E4944030A67657443726561746564056E010000000B67657453616E645479706504C9010000000B676574536B696E547970650425020000000B676574426F6479547970650381020000000F67657443617465676F72794E616D6504DD0200000000 // abi // 558
	PUSH r12 // 763
	LOAD r12 0x0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B600000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081101000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301086D01000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204076372656174656430010102030108C801000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040873616E6454797065300101020301082402000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408736B696E54797065300101020301088002000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408626F64795479706530010102030108DC02000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203020D040408626F647954797065300202040202010203020D040408736B696E54797065300202040D040406456E65726779190204050A05480431040D070405476C6173730D060301002F0704060D0704034963650D060301012F0704060D0704094C696768746E696E670D060301022F0704060D0704065265626F726E0D060301032F0704060D07040A53616E642053746F726D0D060301042F0704060D070405536D6F6B650D060301052F0704060D07040A536F756C20476C6173730D060301062F0704060D07040B566F6C63616E6F204173680D060301072F0704060D07040C566F6C63616E6F20526F636B0D060301082F0704060D07041057686974652053616E642053746F726D0D060301092F07040602040202010630020406030408E20608E106000203040D060408736B696E54797065300404060D0604074F7267616E6963190406070A07AD0531060D09040B4275726C617020426C75650D080301002F0906080D09040C4275726C61702042726F776E0D080301012F0906080D09040F4275726C6170204461726B477265790D080301022F0906080D09040C4275726C617020477265656E0D080301032F0906080D0904114275726C617020477265792642726F776E0D080301042F0906080D09040F4275726C61702047726579265265640D080301052F0906080D09040A4275726C6170205265640D080301062F0906080D09040C4275726C61702057686974650D080301072F0906080D0904114275726C617020576869746526426C75650D080301082F0906080D0904124275726C61702057686974652642726F776E0D080301092F0906080D0904104275726C6170205768697465265265640D0803010A2F09060802060402010830040608030608E20608E006000203060D080408736B696E54797065300606080D08040850726563696F7573190608090A09DF0631080D0B040642726F6E7A650D0A0301002F0B080A0D0B0407436972637569740D0A0301012F0B080A0D0B04074469616D6F6E640D0A0301022F0B080A0D0B0404476F6C640D0A0301032F0B080A0D0B040449726F6E0D0A0301042F0B080A0D0B04064C697A6172640D0A0301052F0B080A0D0B040C50696E6B204469616D6F6E640D0A0301062F0B080A0D0B040A50696E6B2053746F6E650D0A0301072F0B080A0D0B040C526F7365204469616D6F6E640D0A0301082F0B080A0D0B040A526F73652053746F6E650D0A0301092F0B080A0D0B040653696C7665720D0A03010A2F0B080A0D0B04095768697465204675720D0A03010B2F0B080A02080602010A3006080A030808E206000000000B // script // 765
	PUSH r12 // 2534
	ALIAS r12 $literalexpression531 // 2536
	LOAD $literalexpression531 0 Enum // 2536
	PUSH $literalexpression531 // 2544
	ALIAS r12 $DOLL_SUPPLY // 2546
	LOAD $DOLL_SUPPLY 500 // 2546
	PUSH $DOLL_SUPPLY // 2552
	ALIAS r12 $SERIES_BODY // 2554
	LOAD $SERIES_BODY 1 // 2554
	PUSH $SERIES_BODY // 2559
	ALIAS r12 $literalexpression528 // 2561
	LOAD $literalexpression528 "STST" // 2561
	PUSH $literalexpression528 // 2569
	COPY $owner r12 // 2571
	PUSH r12 // 2574
	LOAD $methodcallexpression519 "Nexus.CreateTokenSeries" // 2576
	EXTCALL $methodcallexpression519 // 2603
// Line 172:        Random.seed(16676869);
	ALIAS r11 $methodcallexpression534 // 2605
	ALIAS r12 $literalexpression536 // 2605
	LOAD $literalexpression536 16676869 // 2605
	PUSH $literalexpression536 // 2613
	CALL @entry_tomb_random_seed // 2615
@exit_constructor: // 2619
LOAD r9 "Data.Set" // 2620
// writing global: owner
PUSH $owner // 2632
LOAD r0 "owner" // 2634
PUSH r0 // 2643
EXTCALL r9 // 2645
// writing global: _infusionAmt
PUSH $_infusionAmt // 2647
LOAD r0 "_infusionAmt" // 2649
PUSH r0 // 2665
EXTCALL r9 // 2667
// writing global: mintBodyInited
PUSH $mintBodyInited // 2669
LOAD r0 "mintBodyInited" // 2671
PUSH r0 // 2689
EXTCALL r9 // 2691
// writing global: bodyBaseURI
PUSH $bodyBaseURI // 2693
LOAD r0 "bodyBaseURI" // 2695
PUSH r0 // 2710
EXTCALL r9 // 2712
// writing global: _infusionTkn
PUSH $_infusionTkn // 2714
LOAD r0 "_infusionTkn" // 2716
PUSH r0 // 2732
EXTCALL r9 // 2734
// writing global: organicCount
PUSH $organicCount // 2736
LOAD r0 "organicCount" // 2738
PUSH r0 // 2754
EXTCALL r9 // 2756
// writing global: preciousCount
PUSH $preciousCount // 2758
LOAD r0 "preciousCount" // 2760
PUSH r0 // 2777
EXTCALL r9 // 2779
// writing global: energyCount
PUSH $energyCount // 2781
LOAD r0 "energyCount" // 2783
PUSH r0 // 2798
EXTCALL r9 // 2800
RET // 2802
// Line 173:    }

// ********* transerNFT Method ***********
@entry_transerNFT: // 2803
// Line 174:   
// Line 175:    public transerNFT(from:address,to:address,id:number) {
ALIAS r1 $from // 2804
POP $from // 2804
PUSH $from // 2806
EXTCALL "Address()" // 2808
POP $from // 2823
ALIAS r2 $to // 2825
POP $to // 2825
PUSH $to // 2827
EXTCALL "Address()" // 2829
POP $to // 2844
ALIAS r3 $id // 2846
POP $id // 2846
CAST $id $id #Number // 2848
// Line 176:        Runtime.expect(Runtime.isWitness(from),"Must be owner of NFT to Transfer");
	ALIAS r4 $methodcallexpression549 // 2852
	COPY $from r5 // 2852
	PUSH r5 // 2855
	LOAD $methodcallexpression549 "Runtime.IsWitness" // 2857
	EXTCALL $methodcallexpression549 // 2878
	POP $methodcallexpression549 // 2880
	JMPIF $methodcallexpression549 @expect_methodcallexpression546 // 2882
	ALIAS r5 $literalexpression552 // 2886
	LOAD $literalexpression552 "Must be owner of NFT to Transfer" // 2886
	THROW $literalexpression552 // 2922
	@expect_methodcallexpression546: NOP // 2925
// Line 177:        NFT.transfer(from, to, $THIS_SYMBOL, id);
	ALIAS r4 $methodcallexpression554 // 2925
	COPY $id r5 // 2925
	PUSH r5 // 2928
	ALIAS r5 $literalexpression562 // 2930
	LOAD $literalexpression562 "STST" // 2930
	PUSH $literalexpression562 // 2938
	COPY $to r5 // 2940
	PUSH r5 // 2943
	COPY $from r5 // 2945
	PUSH r5 // 2948
	LOAD $methodcallexpression554 "Runtime.TransferToken" // 2950
	EXTCALL $methodcallexpression554 // 2975
@exit_transerNFT: // 2977
RET // 2978
// Line 178:    }

// ********* upgradeOwner Method ***********
@entry_upgradeOwner: // 2979
ALIAS r1 $dataGet // 2980
LOAD $dataGet "Data.Get" // 2980
ALIAS r2 $contractName // 2992
LOAD $contractName "STST" // 2992
ALIAS r3 $owner // 3000
// reading global: owner
LOAD r0 8 // 3000
PUSH r0 // 3005
LOAD r0 "owner" // 3007
PUSH r0 // 3016
PUSH $contractName // 3018
EXTCALL $dataGet // 3020
POP $owner // 3022
PUSH $owner // 3024
EXTCALL "Address()" // 3026
POP $owner // 3041
// Line 179:
// Line 180:    public upgradeOwner(newOwner: address) {
ALIAS r1 $newOwner // 3043
POP $newOwner // 3043
PUSH $newOwner // 3045
EXTCALL "Address()" // 3047
POP $newOwner // 3062
// Line 181:        Runtime.expect(Runtime.isWitness(owner), "Must be owner of this contract");
	ALIAS r2 $methodcallexpression572 // 3064
	COPY $owner r4 // 3064
	PUSH r4 // 3067
	LOAD $methodcallexpression572 "Runtime.IsWitness" // 3069
	EXTCALL $methodcallexpression572 // 3090
	POP $methodcallexpression572 // 3092
	JMPIF $methodcallexpression572 @expect_methodcallexpression569 // 3094
	ALIAS r4 $literalexpression575 // 3098
	LOAD $literalexpression575 "Must be owner of this contract" // 3098
	THROW $literalexpression575 // 3132
	@expect_methodcallexpression569: NOP // 3135
// Line 182:        owner = newOwner;
	COPY $newOwner r2 // 3135
	COPY r2 $owner // 3138
@exit_upgradeOwner: // 3141
LOAD r1 "Data.Set" // 3142
// writing global: owner
PUSH $owner // 3154
LOAD r0 "owner" // 3156
PUSH r0 // 3165
EXTCALL r1 // 3167
RET // 3169
// Line 183:    }

// ********* initBodyMinting Method ***********
@entry_initBodyMinting: // 3170
ALIAS r1 $dataGet // 3171
LOAD $dataGet "Data.Get" // 3171
ALIAS r2 $contractName // 3183
LOAD $contractName "STST" // 3183
ALIAS r3 $owner // 3191
// reading global: owner
LOAD r0 8 // 3191
PUSH r0 // 3196
LOAD r0 "owner" // 3198
PUSH r0 // 3207
PUSH $contractName // 3209
EXTCALL $dataGet // 3211
POP $owner // 3213
PUSH $owner // 3215
EXTCALL "Address()" // 3217
POP $owner // 3232
ALIAS r4 $mintBodyInited // 3234
// reading global: mintBodyInited
LOAD r0 6 // 3234
PUSH r0 // 3239
LOAD r0 "mintBodyInited" // 3241
PUSH r0 // 3259
PUSH $contractName // 3261
EXTCALL $dataGet // 3263
POP $mintBodyInited // 3265
ALIAS r5 $organicCount // 3267
// reading global: organicCount
LOAD r0 3 // 3267
PUSH r0 // 3272
LOAD r0 "organicCount" // 3274
PUSH r0 // 3290
PUSH $contractName // 3292
EXTCALL $dataGet // 3294
POP $organicCount // 3296
ALIAS r6 $preciousCount // 3298
// reading global: preciousCount
LOAD r0 3 // 3298
PUSH r0 // 3303
LOAD r0 "preciousCount" // 3305
PUSH r0 // 3322
PUSH $contractName // 3324
EXTCALL $dataGet // 3326
POP $preciousCount // 3328
ALIAS r7 $energyCount // 3330
// reading global: energyCount
LOAD r0 3 // 3330
PUSH r0 // 3335
LOAD r0 "energyCount" // 3337
PUSH r0 // 3352
PUSH $contractName // 3354
EXTCALL $dataGet // 3356
POP $energyCount // 3358
// Line 184:
// Line 185:    public initBodyMinting(from: address) {
ALIAS r1 $from // 3360
POP $from // 3360
PUSH $from // 3362
EXTCALL "Address()" // 3364
POP $from // 3379
// Line 186:        Runtime.expect(Runtime.isWitness(from), "From address is not signer of this transaction");
	ALIAS r2 $methodcallexpression586 // 3381
	COPY $from r8 // 3381
	PUSH r8 // 3384
	LOAD $methodcallexpression586 "Runtime.IsWitness" // 3386
	EXTCALL $methodcallexpression586 // 3407
	POP $methodcallexpression586 // 3409
	JMPIF $methodcallexpression586 @expect_methodcallexpression583 // 3411
	ALIAS r8 $literalexpression589 // 3415
	LOAD $literalexpression589 "From address is not signer of this transaction" // 3415
	THROW $literalexpression589 // 3465
	@expect_methodcallexpression583: NOP // 3468
// Line 187:        Runtime.expect(owner == from, "Has no permission to init minting");
	COPY $owner r2 // 3468
	COPY $from r8 // 3471
	EQUAL r2 r8 r9 // 3474
	JMPIF r9 @expect_methodcallexpression591 // 3478
	ALIAS r2 $literalexpression597 // 3482
	LOAD $literalexpression597 "Has no permission to init minting" // 3482
	THROW $literalexpression597 // 3519
	@expect_methodcallexpression591: NOP // 3522
// Line 188:        Runtime.expect(mintBodyInited == false, "Body minting has already been initiated");
	COPY $mintBodyInited r2 // 3522
	ALIAS r8 $literalexpression603 // 3525
	LOAD $literalexpression603 false // 3525
	EQUAL r2 $literalexpression603 r9 // 3530
	JMPIF r9 @expect_methodcallexpression599 // 3534
	ALIAS r2 $literalexpression605 // 3538
	LOAD $literalexpression605 "Body minting has already been initiated" // 3538
	THROW $literalexpression605 // 3581
	@expect_methodcallexpression599: NOP // 3584
// Line 189:
// Line 190:        NFT.createSeries(owner, $THIS_SYMBOL, SERIES_BODY, DOLL_SUPPLY, TokenSeries.Unique, character);
	ALIAS r2 $methodcallexpression607 // 3584
	LOAD r8 0x09076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030A676574496E666F55524C04B70000000107746F6B656E4944030B676574496D61676555524C04120100000107746F6B656E4944030A67657443726561746564056E010000000B67657453616E645479706504C9010000000B676574536B696E547970650425020000000B676574426F6479547970650381020000000F67657443617465676F72794E616D6504DD0200000000 // abi // 3584
	PUSH r8 // 3789
	LOAD r8 0x0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B600000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081101000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301086D01000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204076372656174656430010102030108C801000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040873616E6454797065300101020301082402000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408736B696E54797065300101020301088002000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408626F64795479706530010102030108DC02000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203020D040408626F647954797065300202040202010203020D040408736B696E54797065300202040D040406456E65726779190204050A05480431040D070405476C6173730D060301002F0704060D0704034963650D060301012F0704060D0704094C696768746E696E670D060301022F0704060D0704065265626F726E0D060301032F0704060D07040A53616E642053746F726D0D060301042F0704060D070405536D6F6B650D060301052F0704060D07040A536F756C20476C6173730D060301062F0704060D07040B566F6C63616E6F204173680D060301072F0704060D07040C566F6C63616E6F20526F636B0D060301082F0704060D07041057686974652053616E642053746F726D0D060301092F07040602040202010630020406030408E20608E106000203040D060408736B696E54797065300404060D0604074F7267616E6963190406070A07AD0531060D09040B4275726C617020426C75650D080301002F0906080D09040C4275726C61702042726F776E0D080301012F0906080D09040F4275726C6170204461726B477265790D080301022F0906080D09040C4275726C617020477265656E0D080301032F0906080D0904114275726C617020477265792642726F776E0D080301042F0906080D09040F4275726C61702047726579265265640D080301052F0906080D09040A4275726C6170205265640D080301062F0906080D09040C4275726C61702057686974650D080301072F0906080D0904114275726C617020576869746526426C75650D080301082F0906080D0904124275726C61702057686974652642726F776E0D080301092F0906080D0904104275726C6170205768697465265265640D0803010A2F09060802060402010830040608030608E20608E006000203060D080408736B696E54797065300606080D08040850726563696F7573190608090A09DF0631080D0B040642726F6E7A650D0A0301002F0B080A0D0B0407436972637569740D0A0301012F0B080A0D0B04074469616D6F6E640D0A0301022F0B080A0D0B0404476F6C640D0A0301032F0B080A0D0B040449726F6E0D0A0301042F0B080A0D0B04064C697A6172640D0A0301052F0B080A0D0B040C50696E6B204469616D6F6E640D0A0301062F0B080A0D0B040A50696E6B2053746F6E650D0A0301072F0B080A0D0B040C526F7365204469616D6F6E640D0A0301082F0B080A0D0B040A526F73652053746F6E650D0A0301092F0B080A0D0B040653696C7665720D0A03010A2F0B080A0D0B04095768697465204675720D0A03010B2F0B080A02080602010A3006080A030808E206000000000B // script // 3791
	PUSH r8 // 5560
	ALIAS r8 $literalexpression619 // 5562
	LOAD $literalexpression619 0 Enum // 5562
	PUSH $literalexpression619 // 5570
	ALIAS r8 $DOLL_SUPPLY // 5572
	LOAD $DOLL_SUPPLY 500 // 5572
	PUSH $DOLL_SUPPLY // 5578
	ALIAS r8 $SERIES_BODY // 5580
	LOAD $SERIES_BODY 1 // 5580
	PUSH $SERIES_BODY // 5585
	ALIAS r8 $literalexpression616 // 5587
	LOAD $literalexpression616 "STST" // 5587
	PUSH $literalexpression616 // 5595
	COPY $owner r8 // 5597
	PUSH r8 // 5600
	LOAD $methodcallexpression607 "Nexus.CreateTokenSeries" // 5602
	EXTCALL $methodcallexpression607 // 5629
// Line 191:        
// Line 192:        organicCount = 0;
	ALIAS r2 $literalexpression622 // 5631
	LOAD $literalexpression622 0 // 5631
	COPY $literalexpression622 $organicCount // 5636
// Line 193:        preciousCount = 0;
	ALIAS r2 $literalexpression624 // 5639
	LOAD $literalexpression624 0 // 5639
	COPY $literalexpression624 $preciousCount // 5644
// Line 194:        energyCount = 0;
	ALIAS r2 $literalexpression626 // 5647
	LOAD $literalexpression626 0 // 5647
	COPY $literalexpression626 $energyCount // 5652
@exit_initBodyMinting: // 5655
LOAD r1 "Data.Set" // 5656
// writing global: organicCount
PUSH $organicCount // 5668
LOAD r0 "organicCount" // 5670
PUSH r0 // 5686
EXTCALL r1 // 5688
// writing global: preciousCount
PUSH $preciousCount // 5690
LOAD r0 "preciousCount" // 5692
PUSH r0 // 5709
EXTCALL r1 // 5711
// writing global: energyCount
PUSH $energyCount // 5713
LOAD r0 "energyCount" // 5715
PUSH r0 // 5730
EXTCALL r1 // 5732
RET // 5734
// Line 195:    }

// ********* setSkinMaterialBaseURI Method ***********
@entry_setSkinMaterialBaseURI: // 5735
ALIAS r1 $dataGet // 5736
LOAD $dataGet "Data.Get" // 5736
ALIAS r2 $contractName // 5748
LOAD $contractName "STST" // 5748
ALIAS r3 $owner // 5756
// reading global: owner
LOAD r0 8 // 5756
PUSH r0 // 5761
LOAD r0 "owner" // 5763
PUSH r0 // 5772
PUSH $contractName // 5774
EXTCALL $dataGet // 5776
POP $owner // 5778
PUSH $owner // 5780
EXTCALL "Address()" // 5782
POP $owner // 5797
ALIAS r4 $bodyBaseURI // 5799
// reading global: bodyBaseURI
LOAD r0 4 // 5799
PUSH r0 // 5804
LOAD r0 "bodyBaseURI" // 5806
PUSH r0 // 5821
PUSH $contractName // 5823
EXTCALL $dataGet // 5825
POP $bodyBaseURI // 5827
// Line 196:
// Line 197:    public setSkinMaterialBaseURI(from:address, uri: string) {
ALIAS r1 $from // 5829
POP $from // 5829
PUSH $from // 5831
EXTCALL "Address()" // 5833
POP $from // 5848
ALIAS r2 $uri // 5850
POP $uri // 5850
// Line 198:        Runtime.expect(uri.length() > 0, "URI should be valid string");
	COPY $uri r5 // 5852
	SIZE r5 r5 // 5855
	ALIAS r6 $literalexpression640 // 5858
	LOAD $literalexpression640 0 // 5858
	GT r5 $literalexpression640 r7 // 5863
	JMPIF r7 @expect_methodcallexpression634 // 5867
	ALIAS r5 $literalexpression642 // 5871
	LOAD $literalexpression642 "URI should be valid string" // 5871
	THROW $literalexpression642 // 5901
	@expect_methodcallexpression634: NOP // 5904
// Line 199:        Runtime.expect(Runtime.isWitness(from), "From address is not signer of this transaction");
	ALIAS r5 $methodcallexpression647 // 5904
	COPY $from r6 // 5904
	PUSH r6 // 5907
	LOAD $methodcallexpression647 "Runtime.IsWitness" // 5909
	EXTCALL $methodcallexpression647 // 5930
	POP $methodcallexpression647 // 5932
	JMPIF $methodcallexpression647 @expect_methodcallexpression644 // 5934
	ALIAS r6 $literalexpression650 // 5938
	LOAD $literalexpression650 "From address is not signer of this transaction" // 5938
	THROW $literalexpression650 // 5988
	@expect_methodcallexpression644: NOP // 5991
// Line 200:        Runtime.expect(owner == from, "Has no permission to init minting");
	COPY $owner r5 // 5991
	COPY $from r6 // 5994
	EQUAL r5 r6 r7 // 5997
	JMPIF r7 @expect_methodcallexpression652 // 6001
	ALIAS r5 $literalexpression658 // 6005
	LOAD $literalexpression658 "Has no permission to init minting" // 6005
	THROW $literalexpression658 // 6042
	@expect_methodcallexpression652: NOP // 6045
// Line 201:
// Line 202:        bodyBaseURI = uri;
	COPY $uri r5 // 6045
	COPY r5 $bodyBaseURI // 6048
@exit_setSkinMaterialBaseURI: // 6051
LOAD r1 "Data.Set" // 6052
// writing global: bodyBaseURI
PUSH $bodyBaseURI // 6064
LOAD r0 "bodyBaseURI" // 6066
PUSH r0 // 6081
EXTCALL r1 // 6083
RET // 6085
// Line 203:    }

// ********* mintBody Method ***********
@entry_mintBody: // 6086
ALIAS r1 $dataGet // 6087
LOAD $dataGet "Data.Get" // 6087
ALIAS r2 $contractName // 6099
LOAD $contractName "STST" // 6099
ALIAS r3 $owner // 6107
// reading global: owner
LOAD r0 8 // 6107
PUSH r0 // 6112
LOAD r0 "owner" // 6114
PUSH r0 // 6123
PUSH $contractName // 6125
EXTCALL $dataGet // 6127
POP $owner // 6129
PUSH $owner // 6131
EXTCALL "Address()" // 6133
POP $owner // 6148
ALIAS r4 $_infusionAmt // 6150
// reading global: _infusionAmt
LOAD r0 3 // 6150
PUSH r0 // 6155
LOAD r0 "_infusionAmt" // 6157
PUSH r0 // 6173
PUSH $contractName // 6175
EXTCALL $dataGet // 6177
POP $_infusionAmt // 6179
ALIAS r5 $bodyBaseURI // 6181
// reading global: bodyBaseURI
LOAD r0 4 // 6181
PUSH r0 // 6186
LOAD r0 "bodyBaseURI" // 6188
PUSH r0 // 6203
PUSH $contractName // 6205
EXTCALL $dataGet // 6207
POP $bodyBaseURI // 6209
ALIAS r6 $_infusionTkn // 6211
// reading global: _infusionTkn
LOAD r0 4 // 6211
PUSH r0 // 6216
LOAD r0 "_infusionTkn" // 6218
PUSH r0 // 6234
PUSH $contractName // 6236
EXTCALL $dataGet // 6238
POP $_infusionTkn // 6240
ALIAS r7 $organicCount // 6242
// reading global: organicCount
LOAD r0 3 // 6242
PUSH r0 // 6247
LOAD r0 "organicCount" // 6249
PUSH r0 // 6265
PUSH $contractName // 6267
EXTCALL $dataGet // 6269
POP $organicCount // 6271
ALIAS r8 $preciousCount // 6273
// reading global: preciousCount
LOAD r0 3 // 6273
PUSH r0 // 6278
LOAD r0 "preciousCount" // 6280
PUSH r0 // 6297
PUSH $contractName // 6299
EXTCALL $dataGet // 6301
POP $preciousCount // 6303
ALIAS r9 $energyCount // 6305
// reading global: energyCount
LOAD r0 3 // 6305
PUSH r0 // 6310
LOAD r0 "energyCount" // 6312
PUSH r0 // 6327
PUSH $contractName // 6329
EXTCALL $dataGet // 6331
POP $energyCount // 6333
// Line 204:
// Line 205:    public mintBody( 
// Line 206:                to: address, 
// Line 207:                name: string, 
// Line 208:                description: string, 
// Line 209:                sandType: string, 
// Line 210:                skinType: string) : number {
ALIAS r1 $to // 6335
POP $to // 6335
PUSH $to // 6337
EXTCALL "Address()" // 6339
POP $to // 6354
ALIAS r2 $name // 6356
POP $name // 6356
ALIAS r10 $description // 6358
POP $description // 6358
ALIAS r11 $sandType // 6360
POP $sandType // 6360
ALIAS r12 $skinType // 6362
POP $skinType // 6362
// Line 211:        Runtime.expect(skinType == "Organic" || skinType == "Preciuos" || skinType == "Energy", "Skin Type is invalid!");
	COPY $skinType r13 // 6364
	ALIAS r14 $literalexpression678 // 6367
	LOAD $literalexpression678 "Organic" // 6367
	EQUAL r13 $literalexpression678 r15 // 6378
	COPY $skinType r13 // 6382
	ALIAS r14 $literalexpression681 // 6385
	LOAD $literalexpression681 "Preciuos" // 6385
	EQUAL r13 $literalexpression681 r16 // 6397
	COPY $skinType r13 // 6401
	ALIAS r14 $literalexpression684 // 6404
	LOAD $literalexpression684 "Energy" // 6404
	EQUAL r13 $literalexpression684 r17 // 6414
	OR r16 r17 r13 // 6418
	OR r15 r13 r14 // 6422
	JMPIF r14 @expect_methodcallexpression674 // 6426
	ALIAS r13 $literalexpression688 // 6430
	LOAD $literalexpression688 "Skin Type is invalid!" // 6430
	THROW $literalexpression688 // 6455
	@expect_methodcallexpression674: NOP // 6458
// Line 212:        Runtime.expect(sandType == "Moon" || sandType == "Sun" || sandType == "Pearl", "Sand Type is invalid!");
	COPY $sandType r13 // 6458
	ALIAS r14 $literalexpression694 // 6461
	LOAD $literalexpression694 "Moon" // 6461
	EQUAL r13 $literalexpression694 r15 // 6469
	COPY $sandType r13 // 6473
	ALIAS r14 $literalexpression697 // 6476
	LOAD $literalexpression697 "Sun" // 6476
	EQUAL r13 $literalexpression697 r16 // 6483
	COPY $sandType r13 // 6487
	ALIAS r14 $literalexpression700 // 6490
	LOAD $literalexpression700 "Pearl" // 6490
	EQUAL r13 $literalexpression700 r17 // 6499
	OR r16 r17 r13 // 6503
	OR r15 r13 r14 // 6507
	JMPIF r14 @expect_methodcallexpression690 // 6511
	ALIAS r13 $literalexpression704 // 6515
	LOAD $literalexpression704 "Sand Type is invalid!" // 6515
	THROW $literalexpression704 // 6540
	@expect_methodcallexpression690: NOP // 6543
// Line 213:
// Line 214:        // Runtime.expect(owns_sandy.has(to) == false, "You are not allow to have multiple sandy in one address");
// Line 215:
// Line 216:        local _bodyType: number;
// Line 217:
// Line 218:        /* Randomizing the skin material based on skinType */
// Line 219:        
// Line 220:        if (skinType == "Organic") {
	COPY $skinType r13 // 6543
	ALIAS r14 $literalexpression708 // 6546
	LOAD $literalexpression708 "Organic" // 6546
	EQUAL r13 $literalexpression708 r15 // 6557
		JMPNOT r15 @else_ifstatement706 // 6561
// Line 221:            local maxOrganicCount: number = SkinCount.Organic;
		ALIAS r13 $maxOrganicCount // 6565
		ALIAS r14 $literalexpression711 // 6565
		LOAD $literalexpression711 175 Enum // 6565
		COPY $literalexpression711 $maxOrganicCount // 6573
// Line 222:            Runtime.expect(organicCount <= maxOrganicCount, "Maximum number of organic skin has been exceed");
		COPY $organicCount r14 // 6576
		COPY $maxOrganicCount r16 // 6579
		LTE r14 r16 r17 // 6582
		JMPIF r17 @expect_methodcallexpression715 // 6586
		ALIAS r14 $literalexpression721 // 6590
		LOAD $literalexpression721 "Maximum number of organic skin has been exceed" // 6590
		THROW $literalexpression721 // 6640
		@expect_methodcallexpression715: NOP // 6643
		ALIAS r14 $_bodyType // 6643
// Line 223:
// Line 224:            _bodyType = Random.generate() % ORGANIC_CATEGORIES;
		ALIAS r16 $methodcallexpression723 // 6643
		CALL @entry_tomb_random_generate // 6643
		POP $methodcallexpression723 // 6647
		ALIAS r17 $ORGANIC_CATEGORIES // 6649
		LOAD $ORGANIC_CATEGORIES 12 // 6649
		MOD $methodcallexpression723 $ORGANIC_CATEGORIES r18 // 6654
		COPY r18 $_bodyType // 6658
		JMP @then_ifstatement706 // 6661
		@else_ifstatement706: NOP // 6665
// Line 225:        } else if (skinType == "Precious") {
		COPY $skinType r16 // 6665
		ALIAS r17 $literalexpression729 // 6668
		LOAD $literalexpression729 "Precious" // 6668
		EQUAL r16 $literalexpression729 r18 // 6680
			JMPNOT r18 @else_ifstatement727 // 6684
// Line 226:            local maxPreciousCount: number = SkinCount.Precious;
			ALIAS r16 $maxPreciousCount // 6688
			ALIAS r17 $literalexpression732 // 6688
			LOAD $literalexpression732 175 Enum // 6688
			COPY $literalexpression732 $maxPreciousCount // 6696
// Line 227:            Runtime.expect(preciousCount <= maxPreciousCount, "Maximum number of precious skin has been exceed");
			COPY $preciousCount r17 // 6699
			COPY $maxPreciousCount r19 // 6702
			LTE r17 r19 r20 // 6705
			JMPIF r20 @expect_methodcallexpression736 // 6709
			ALIAS r17 $literalexpression742 // 6713
			LOAD $literalexpression742 "Maximum number of precious skin has been exceed" // 6713
			THROW $literalexpression742 // 6764
			@expect_methodcallexpression736: NOP // 6767
// Line 228:
// Line 229:            _bodyType = Random.generate() % PRECIOUS_CATEGORIES;
			ALIAS r17 $methodcallexpression744 // 6767
			CALL @entry_tomb_random_generate // 6767
			POP $methodcallexpression744 // 6771
			ALIAS r19 $PRECIOUS_CATEGORIES // 6773
			LOAD $PRECIOUS_CATEGORIES 12 // 6773
			MOD $methodcallexpression744 $PRECIOUS_CATEGORIES r20 // 6778
			COPY r20 $_bodyType // 6782
			JMP @then_ifstatement727 // 6785
			@else_ifstatement727: NOP // 6789
// Line 230:        } else if (skinType == "Energy") {
			COPY $skinType r17 // 6789
			ALIAS r19 $literalexpression750 // 6792
			LOAD $literalexpression750 "Energy" // 6792
			EQUAL r17 $literalexpression750 r20 // 6802
				JMPNOT r20 @then_ifstatement748 // 6806
// Line 231:            local maxEnergyCount: number = SkinCount.Energy;
				ALIAS r17 $maxEnergyCount // 6810
				ALIAS r19 $literalexpression753 // 6810
				LOAD $literalexpression753 150 Enum // 6810
				COPY $literalexpression753 $maxEnergyCount // 6818
// Line 232:            Runtime.expect(energyCount <= maxEnergyCount, "Maximum number of energy skin has been exceed");
				COPY $energyCount r19 // 6821
				COPY $maxEnergyCount r21 // 6824
				LTE r19 r21 r22 // 6827
				JMPIF r22 @expect_methodcallexpression757 // 6831
				ALIAS r19 $literalexpression763 // 6835
				LOAD $literalexpression763 "Maximum number of energy skin has been exceed" // 6835
				THROW $literalexpression763 // 6884
				@expect_methodcallexpression757: NOP // 6887
// Line 233:
// Line 234:            _bodyType = Random.generate() % ENERGY_CATEGORIES;
				ALIAS r19 $methodcallexpression765 // 6887
				CALL @entry_tomb_random_generate // 6887
				POP $methodcallexpression765 // 6891
				ALIAS r21 $ENERGY_CATEGORIES // 6893
				LOAD $ENERGY_CATEGORIES 10 // 6893
				MOD $methodcallexpression765 $ENERGY_CATEGORIES r22 // 6898
				COPY r22 $_bodyType // 6902
				@then_ifstatement748: NOP // 6906
// Line 235:        }
// Line 236:
// Line 237:        local _imageURL: string = "";
			ALIAS r17 $_imageURL // 6906
			ALIAS r19 $literalexpression768 // 6906
			LOAD $literalexpression768 "" // 6906
			COPY $literalexpression768 $_imageURL // 6910
// Line 238:
// Line 239:        _imageURL = bodyBaseURI + "/" + skinType + _bodyType;
			COPY $bodyBaseURI r19 // 6913
			ALIAS r20 $literalexpression773 // 6916
			LOAD $literalexpression773 "/" // 6916
			ADD r19 $literalexpression773 r21 // 6921
			COPY $skinType r19 // 6925
			COPY $_bodyType r20 // 6928
			CAST r20 r20 #String // 6931
			ADD r19 r20 r22 // 6935
			ADD r21 r22 r19 // 6939
			COPY r19 $_imageURL // 6943
// Line 240:
// Line 241:		local rom: body_rom = Struct.body_rom(Time.now(), name, description, "", _imageURL, sandType, skinType, _bodyType);
			ALIAS r19 $rom // 6946
			CLEAR r20 // 6946
			ALIAS r22 $methodcallexpression789 // 6948
			LOAD $methodcallexpression789 "Runtime.Time" // 6948
			EXTCALL $methodcallexpression789 // 6964
			POP $methodcallexpression789 // 6966
			LOAD r21 "created" // 6968
			PUT $methodcallexpression789 r20 r21 // 6979
			COPY $name r22 // 6983
			LOAD r21 "name" // 6986
			PUT r22 r20 r21 // 6994
			COPY $description r22 // 6998
			LOAD r21 "description" // 7001
			PUT r22 r20 r21 // 7016
			ALIAS r22 $literalexpression792 // 7020
			LOAD $literalexpression792 "" // 7020
			LOAD r21 "infoURL" // 7024
			PUT $literalexpression792 r20 r21 // 7035
			COPY $_imageURL r22 // 7039
			LOAD r21 "imageURL" // 7042
			PUT r22 r20 r21 // 7054
			COPY $sandType r22 // 7058
			LOAD r21 "sandType" // 7061
			PUT r22 r20 r21 // 7073
			COPY $skinType r22 // 7077
			LOAD r21 "skinType" // 7080
			PUT r22 r20 r21 // 7092
			COPY $_bodyType r22 // 7096
			LOAD r21 "bodyType" // 7099
			PUT r22 r20 r21 // 7111
			COPY r20 $rom // 7115
// Line 242:          
// Line 243:        local id = NFT.mint(owner, to, $THIS_SYMBOL, rom, "", SERIES_BODY);
			ALIAS r20 $id // 7118
			ALIAS r21 $methodcallexpression799 // 7118
			ALIAS r22 $SERIES_BODY // 7118
			LOAD $SERIES_BODY 1 // 7118
			PUSH $SERIES_BODY // 7123
			ALIAS r22 $literalexpression811 // 7125
			LOAD $literalexpression811 "" // 7125
			CAST $literalexpression811 $literalexpression811 #Bytes // 7129
			PUSH $literalexpression811 // 7133
			COPY $rom r22 // 7135
			CAST r22 r22 #Bytes // 7138
			PUSH r22 // 7142
			ALIAS r22 $literalexpression809 // 7144
			LOAD $literalexpression809 "STST" // 7144
			PUSH $literalexpression809 // 7152
			COPY $to r22 // 7154
			PUSH r22 // 7157
			COPY $owner r22 // 7159
			PUSH r22 // 7162
			LOAD $methodcallexpression799 "Runtime.MintToken" // 7164
			EXTCALL $methodcallexpression799 // 7185
			POP $methodcallexpression799 // 7187
			COPY $methodcallexpression799 $id // 7189
// Line 244:        NFT.infuse(to, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
			ALIAS r21 $methodcallexpression816 // 7192
			COPY $_infusionAmt r22 // 7192
			PUSH r22 // 7195
			COPY $_infusionTkn r22 // 7197
			PUSH r22 // 7200
			COPY $id r22 // 7202
			PUSH r22 // 7205
			ALIAS r22 $literalexpression824 // 7207
			LOAD $literalexpression824 "STST" // 7207
			PUSH $literalexpression824 // 7215
			COPY $to r22 // 7217
			PUSH r22 // 7220
			LOAD $methodcallexpression816 "Runtime.InfuseToken" // 7222
			EXTCALL $methodcallexpression816 // 7245
// Line 245:
// Line 246:        // owns_sandy.set(to, true);
// Line 247:
// Line 248:        Runtime.log("New created Sandy Token " + id);
			ALIAS r21 $methodcallexpression829 // 7247
			ALIAS r22 $literalexpression831 // 7247
			LOAD $literalexpression831 "New created Sandy Token " // 7247
			COPY $id r23 // 7275
			CAST r23 r23 #String // 7278
			ADD $literalexpression831 r23 r24 // 7282
			PUSH r24 // 7286
			LOAD $methodcallexpression829 "Runtime.Log" // 7288
			EXTCALL $methodcallexpression829 // 7303
// Line 249:
// Line 250:        return id;
			COPY $id r21 // 7305
			PUSH r21 // 7308
			JMP @exit_mintBody // 7310
			@then_ifstatement727: NOP // 7314
		@then_ifstatement706: NOP // 7315
@exit_mintBody: // 7315
RET // 7316
// Line 251:    }

// ********* stakeSoul Method ***********
@entry_stakeSoul: // 7317
// Line 252:
// Line 253:    public stakeSoul(from: address, amount: number) {
ALIAS r1 $from // 7318
POP $from // 7318
PUSH $from // 7320
EXTCALL "Address()" // 7322
POP $from // 7337
ALIAS r2 $amount // 7339
POP $amount // 7339
CAST $amount $amount #Number // 7341
// Line 254:        Runtime.expect(Runtime.isWitness(from), "Must be owner to stake");
	ALIAS r3 $methodcallexpression847 // 7345
	COPY $from r4 // 7345
	PUSH r4 // 7348
	LOAD $methodcallexpression847 "Runtime.IsWitness" // 7350
	EXTCALL $methodcallexpression847 // 7371
	POP $methodcallexpression847 // 7373
	JMPIF $methodcallexpression847 @expect_methodcallexpression844 // 7375
	ALIAS r4 $literalexpression850 // 7379
	LOAD $literalexpression850 "Must be owner to stake" // 7379
	THROW $literalexpression850 // 7405
	@expect_methodcallexpression844: NOP // 7408
// Line 255:
// Line 256:        local assetNumber: number = amount * (10 ^ Token.getDecimals("SOUL"));
	ALIAS r3 $assetNumber // 7408
	COPY $amount r4 // 7408
	ALIAS r5 $literalexpression852 // 7411
	LOAD $literalexpression852 10 // 7411
	ALIAS r6 $methodcallexpression853 // 7416
	ALIAS r7 $literalexpression855 // 7416
	LOAD $literalexpression855 "SOUL" // 7416
	PUSH $literalexpression855 // 7424
	LOAD $methodcallexpression853 "Runtime.GetTokenDecimals" // 7426
	EXTCALL $methodcallexpression853 // 7454
	POP $methodcallexpression853 // 7456
	POW $literalexpression852 $methodcallexpression853 r7 // 7458
	MUL r4 r7 r5 // 7462
	COPY r5 $assetNumber // 7466
// Line 257:
// Line 258:        Token.transfer(from, $THIS_ADDRESS, "SOUL", assetNumber);
	ALIAS r4 $methodcallexpression861 // 7469
	COPY $assetNumber r5 // 7469
	PUSH r5 // 7472
	ALIAS r5 $literalexpression869 // 7474
	LOAD $literalexpression869 "SOUL" // 7474
	PUSH $literalexpression869 // 7482
	ALIAS r5 $literalexpression868 // 7484
	LOAD $literalexpression868 0x020067D2CCF1BC50EBDE2B11B95A6C9D5E589C7A7FD35DBE5C6DFA99FC1C0BF590E9 // 7484
	PUSH $literalexpression868 // 7522
	EXTCALL "Address()" // 7524
	POP $literalexpression868 // 7539
	PUSH $literalexpression868 // 7541
	COPY $from r5 // 7543
	PUSH r5 // 7546
	LOAD $methodcallexpression861 "Runtime.TransferTokens" // 7548
	EXTCALL $methodcallexpression861 // 7574
// Line 259:        Stake.stake($THIS_ADDRESS, assetNumber);
	ALIAS r4 $methodcallexpression872 // 7576
	COPY $assetNumber r5 // 7576
	PUSH r5 // 7579
	ALIAS r5 $literalexpression876 // 7581
	LOAD $literalexpression876 0x020067D2CCF1BC50EBDE2B11B95A6C9D5E589C7A7FD35DBE5C6DFA99FC1C0BF590E9 // 7581
	PUSH $literalexpression876 // 7619
	EXTCALL "Address()" // 7621
	POP $literalexpression876 // 7636
	PUSH $literalexpression876 // 7638
	LOAD $methodcallexpression872 "Stake" // 7640
	PUSH $methodcallexpression872 // 7649
	LOAD $methodcallexpression872 "stake" // 7651
	CTX $methodcallexpression872 $methodcallexpression872 // 7660
	SWITCH $methodcallexpression872 // 7663
@exit_stakeSoul: // 7665
RET // 7666
// Line 260:    }

// ********* getStake Method ***********
@entry_getStake: // 7667
// Line 261:
// Line 262:    public getStake(from: address): number {
ALIAS r1 $from // 7668
POP $from // 7668
PUSH $from // 7670
EXTCALL "Address()" // 7672
POP $from // 7687
// Line 263:        return Stake.getStake(from);
	ALIAS r2 $methodcallexpression882 // 7689
	COPY $from r3 // 7689
	PUSH r3 // 7692
	LOAD $methodcallexpression882 "GetStake" // 7694
	PUSH $methodcallexpression882 // 7706
	LOAD $methodcallexpression882 "stake" // 7708
	CTX $methodcallexpression882 $methodcallexpression882 // 7717
	SWITCH $methodcallexpression882 // 7720
	POP $methodcallexpression882 // 7722
	PUSH $methodcallexpression882 // 7724
	JMP @exit_getStake // 7726
@exit_getStake: // 7729
RET // 7730
// Line 264:    }

// ********* getStorageStake Method ***********
@entry_getStorageStake: // 7731
// Line 265:
// Line 266:    public getStorageStake(from: address): number {
ALIAS r1 $from // 7732
POP $from // 7732
PUSH $from // 7734
EXTCALL "Address()" // 7736
POP $from // 7751
// Line 267:        return Stake.getStorageStake(from);
	ALIAS r2 $methodcallexpression890 // 7753
	COPY $from r3 // 7753
	PUSH r3 // 7756
	LOAD $methodcallexpression890 "GetStorageStake" // 7758
	PUSH $methodcallexpression890 // 7777
	LOAD $methodcallexpression890 "stake" // 7779
	CTX $methodcallexpression890 $methodcallexpression890 // 7788
	SWITCH $methodcallexpression890 // 7791
	POP $methodcallexpression890 // 7793
	PUSH $methodcallexpression890 // 7795
	JMP @exit_getStorageStake // 7797
@exit_getStorageStake: // 7800
RET // 7801
// Line 268:    }

// ********* getThisAddress Method ***********
@entry_getThisAddress: // 7802
// Line 269:
// Line 270:    public getThisAddress(): address {
// Line 271:        return $THIS_ADDRESS;
	ALIAS r1 $literalexpression897 // 7803
	LOAD $literalexpression897 0x020067D2CCF1BC50EBDE2B11B95A6C9D5E589C7A7FD35DBE5C6DFA99FC1C0BF590E9 // 7803
	PUSH $literalexpression897 // 7841
	EXTCALL "Address()" // 7843
	POP $literalexpression897 // 7858
	PUSH $literalexpression897 // 7860
	JMP @exit_getThisAddress // 7862
@exit_getThisAddress: // 7865
RET // 7866
// Line 272:    }   

// ********* getSoulAmount Method ***********
@entry_getSoulAmount: // 7867
// Line 273:
// Line 274:    public getSoulAmount(amount: number): number {
ALIAS r1 $amount // 7868
POP $amount // 7868
CAST $amount $amount #Number // 7870
// Line 275:        return amount * (10 ^ Token.getDecimals("SOUL"));
	COPY $amount r2 // 7874
	ALIAS r3 $literalexpression904 // 7877
	LOAD $literalexpression904 10 // 7877
	ALIAS r4 $methodcallexpression905 // 7882
	ALIAS r5 $literalexpression907 // 7882
	LOAD $literalexpression907 "SOUL" // 7882
	PUSH $literalexpression907 // 7890
	LOAD $methodcallexpression905 "Runtime.GetTokenDecimals" // 7892
	EXTCALL $methodcallexpression905 // 7920
	POP $methodcallexpression905 // 7922
	POW $literalexpression904 $methodcallexpression905 r5 // 7924
	MUL r2 r5 r3 // 7928
	PUSH r3 // 7932
	JMP @exit_getSoulAmount // 7934
@exit_getSoulAmount: // 7937
RET // 7938
// Line 276:    } 

// ********* createLimb Method ***********
@entry_createLimb: // 7939
ALIAS r1 $dataGet // 7940
LOAD $dataGet "Data.Get" // 7940
ALIAS r2 $contractName // 7952
LOAD $contractName "STST" // 7952
ALIAS r3 $owner // 7960
// reading global: owner
LOAD r0 8 // 7960
PUSH r0 // 7965
LOAD r0 "owner" // 7967
PUSH r0 // 7976
PUSH $contractName // 7978
EXTCALL $dataGet // 7980
POP $owner // 7982
PUSH $owner // 7984
EXTCALL "Address()" // 7986
POP $owner // 8001
// Line 277:
// Line 278:    // private initMint(seriesID:number,name: string,description: string,infoURL: string,imageURL: string){
// Line 279:    //     local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
// Line 280:    //     local id: number = NFT.mint(owner,owner, $THIS_SYMBOL, rom,"",seriesID);
// Line 281:    // }
// Line 282:  
// Line 283:	//@Param seriesId - Must be a unique number, could use UID.generate()
// Line 284:    public createLimb(seriesID:number,limbSupply:number,name: string,description: string,infoURL: string,imageURL: string){
ALIAS r1 $seriesID // 8003
POP $seriesID // 8003
CAST $seriesID $seriesID #Number // 8005
ALIAS r2 $limbSupply // 8009
POP $limbSupply // 8009
CAST $limbSupply $limbSupply #Number // 8011
ALIAS r4 $name // 8015
POP $name // 8015
ALIAS r5 $description // 8017
POP $description // 8017
ALIAS r6 $infoURL // 8019
POP $infoURL // 8019
ALIAS r7 $imageURL // 8021
POP $imageURL // 8021
// Line 285:        Runtime.expect(Runtime.isWitness(owner),"Must be owner of contract");
	ALIAS r8 $methodcallexpression929 // 8023
	COPY $owner r9 // 8023
	PUSH r9 // 8026
	LOAD $methodcallexpression929 "Runtime.IsWitness" // 8028
	EXTCALL $methodcallexpression929 // 8049
	POP $methodcallexpression929 // 8051
	JMPIF $methodcallexpression929 @expect_methodcallexpression926 // 8053
	ALIAS r9 $literalexpression932 // 8057
	LOAD $literalexpression932 "Must be owner of contract" // 8057
	THROW $literalexpression932 // 8086
	@expect_methodcallexpression926: NOP // 8089
// Line 286:        NFT.createSeries(owner, $THIS_SYMBOL,seriesID,limbSupply,TokenSeries.Duplicated,limb);
	ALIAS r8 $methodcallexpression934 // 8089
	LOAD r9 0x04076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030A676574496E666F55524C04B70000000107746F6B656E4944030B676574496D61676555524C04120100000107746F6B656E49440300 // abi // 8089
	PUSH r9 // 8201
	LOAD r9 0x0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B600000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081101000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301086D01000B // script // 8203
	PUSH r9 // 8575
	ALIAS r9 $literalexpression946 // 8577
	LOAD $literalexpression946 1 Enum // 8577
	PUSH $literalexpression946 // 8585
	COPY $limbSupply r9 // 8587
	PUSH r9 // 8590
	COPY $seriesID r9 // 8592
	PUSH r9 // 8595
	ALIAS r9 $literalexpression943 // 8597
	LOAD $literalexpression943 "STST" // 8597
	PUSH $literalexpression943 // 8605
	COPY $owner r9 // 8607
	PUSH r9 // 8610
	LOAD $methodcallexpression934 "Nexus.CreateTokenSeries" // 8612
	EXTCALL $methodcallexpression934 // 8639
// Line 287:        local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
	ALIAS r8 $rom // 8641
	CLEAR r9 // 8641
	COPY $name r11 // 8643
	LOAD r10 "name" // 8646
	PUT r11 r9 r10 // 8654
	COPY $description r11 // 8658
	LOAD r10 "description" // 8661
	PUT r11 r9 r10 // 8676
	COPY $infoURL r11 // 8680
	LOAD r10 "infoURL" // 8683
	PUT r11 r9 r10 // 8694
	COPY $imageURL r11 // 8698
	LOAD r10 "imageURL" // 8701
	PUT r11 r9 r10 // 8713
	COPY r9 $rom // 8717
@exit_createLimb: // 8720
RET // 8721
// Line 288:        // this.initMint(seriesID,name,description,infoURL,imageURL);
// Line 289:    }

// ********* mintLimb Method ***********
@entry_mintLimb: // 8722
// Line 290:
// Line 291:   
// Line 292:    //should give you a random limb back
// Line 293:    public mintLimb(from:address,to:address,seriesID:number)
ALIAS r1 $from // 8723
POP $from // 8723
PUSH $from // 8725
EXTCALL "Address()" // 8727
POP $from // 8742
ALIAS r2 $to // 8744
POP $to // 8744
PUSH $to // 8746
EXTCALL "Address()" // 8748
POP $to // 8763
ALIAS r3 $seriesID // 8765
POP $seriesID // 8765
CAST $seriesID $seriesID #Number // 8767
// Line 294:    {   
// Line 295:        Runtime.expect(Runtime.isWitness(from),"Must be a witness");
	ALIAS r4 $methodcallexpression971 // 8771
	COPY $from r5 // 8771
	PUSH r5 // 8774
	LOAD $methodcallexpression971 "Runtime.IsWitness" // 8776
	EXTCALL $methodcallexpression971 // 8797
	POP $methodcallexpression971 // 8799
	JMPIF $methodcallexpression971 @expect_methodcallexpression968 // 8801
	ALIAS r5 $literalexpression974 // 8805
	LOAD $literalexpression974 "Must be a witness" // 8805
	THROW $literalexpression974 // 8826
	@expect_methodcallexpression968: NOP // 8829
// Line 296:        //need to randomize seriesId -> this is assuming all I need is a seriesID.
// Line 297:        //do randomization for SeriesID;
// Line 298:        local id: number = NFT.mint(from,to, $THIS_SYMBOL,"","",seriesID);
	ALIAS r4 $id // 8829
	ALIAS r5 $methodcallexpression975 // 8829
	COPY $seriesID r6 // 8829
	PUSH r6 // 8832
	ALIAS r6 $literalexpression987 // 8834
	LOAD $literalexpression987 "" // 8834
	CAST $literalexpression987 $literalexpression987 #Bytes // 8838
	PUSH $literalexpression987 // 8842
	ALIAS r6 $literalexpression986 // 8844
	LOAD $literalexpression986 "" // 8844
	CAST $literalexpression986 $literalexpression986 #Bytes // 8848
	PUSH $literalexpression986 // 8852
	ALIAS r6 $literalexpression985 // 8854
	LOAD $literalexpression985 "STST" // 8854
	PUSH $literalexpression985 // 8862
	COPY $to r6 // 8864
	PUSH r6 // 8867
	COPY $from r6 // 8869
	PUSH r6 // 8872
	LOAD $methodcallexpression975 "Runtime.MintToken" // 8874
	EXTCALL $methodcallexpression975 // 8895
	POP $methodcallexpression975 // 8897
	COPY $methodcallexpression975 $id // 8899
@exit_mintLimb: // 8902
RET // 8903
// Line 299:    }

// ********* editSANDY Method ***********
@entry_editSANDY: // 8904
// Line 300:
// Line 301:    //Will deprecated and used for somthing else
// Line 302:	//will have to make sure that the owner is the only one who can edit the sandy name
// Line 303:    public editSANDY(nftOwner:address,tokenID:number,name:string) {
ALIAS r1 $nftOwner // 8905
POP $nftOwner // 8905
PUSH $nftOwner // 8907
EXTCALL "Address()" // 8909
POP $nftOwner // 8924
ALIAS r2 $tokenID // 8926
POP $tokenID // 8926
CAST $tokenID $tokenID #Number // 8928
ALIAS r3 $name // 8932
POP $name // 8932
// Line 304:        Runtime.expect(Runtime.isWitness(nftOwner),"Must be owner of NFT");//have to find a way to get current nft owner
	ALIAS r4 $methodcallexpression1003 // 8934
	COPY $nftOwner r5 // 8934
	PUSH r5 // 8937
	LOAD $methodcallexpression1003 "Runtime.IsWitness" // 8939
	EXTCALL $methodcallexpression1003 // 8960
	POP $methodcallexpression1003 // 8962
	JMPIF $methodcallexpression1003 @expect_methodcallexpression1000 // 8964
	ALIAS r5 $literalexpression1006 // 8968
	LOAD $literalexpression1006 "Must be owner of NFT" // 8968
	THROW $literalexpression1006 // 8992
	@expect_methodcallexpression1000: NOP // 8995
// Line 305:		local editRam:body_ram = Struct.body_ram();
	ALIAS r4 $editRam // 8995
	CLEAR r5 // 8995
	COPY r5 $editRam // 8997
// Line 306:		//my assumption that write must follow the order of the struct 
// Line 307:        NFT.write(nftOwner,$THIS_SYMBOL,tokenID,editRam);//changeable data
	ALIAS r5 $methodcallexpression1011 // 9000
	COPY $editRam r6 // 9000
	CAST r6 r6 #Bytes // 9003
	PUSH r6 // 9007
	COPY $tokenID r6 // 9009
	PUSH r6 // 9012
	ALIAS r6 $literalexpression1018 // 9014
	LOAD $literalexpression1018 "STST" // 9014
	PUSH $literalexpression1018 // 9022
	COPY $nftOwner r6 // 9024
	PUSH r6 // 9027
	LOAD $methodcallexpression1011 "Runtime.WriteToken" // 9029
	EXTCALL $methodcallexpression1011 // 9051
@exit_editSANDY: // 9053
RET // 9054
// Line 308:    }

// ********* getRom Method ***********
@entry_getRom: // 9055
// Line 309:    //need to get readable rom 
// Line 310:    
// Line 311:    //- How do I make return type a struct initiialized to the rom size
// Line 312:    public getRom(symbol:string, id:number):body_rom {
ALIAS r1 $symbol // 9056
POP $symbol // 9056
ALIAS r2 $id // 9058
POP $id // 9058
CAST $id $id #Number // 9060
// Line 313:         local nftROM:body_rom = NFT.readROM<body_rom>($THIS_SYMBOL, id);
	ALIAS r3 $nftROM // 9064
	ALIAS r4 $methodcallexpression1027 // 9064
	COPY $id r5 // 9064
	PUSH r5 // 9067
	ALIAS r5 $literalexpression1031 // 9069
	LOAD $literalexpression1031 "STST" // 9069
	PUSH $literalexpression1031 // 9077
	LOAD $methodcallexpression1027 "Runtime.ReadTokenROM" // 9079
	EXTCALL $methodcallexpression1027 // 9103
	POP $methodcallexpression1027 // 9105
	UNPACK $methodcallexpression1027 $methodcallexpression1027 // 9107
	COPY $methodcallexpression1027 $nftROM // 9110
// Line 314:         return nftROM;
	COPY $nftROM r4 // 9113
	PUSH r4 // 9116
	JMP @exit_getRom // 9118
@exit_getRom: // 9121
RET // 9122
// Line 315:    }

// ********* getRam Method ***********
@entry_getRam: // 9123
// Line 316:
// Line 317:    public getRam(symbol:string, id:number): body_ram {
ALIAS r1 $symbol // 9124
POP $symbol // 9124
ALIAS r2 $id // 9126
POP $id // 9126
CAST $id $id #Number // 9128
// Line 318:        local nftRAM:body_ram = NFT.readRAM<body_ram>($THIS_SYMBOL, id);
	ALIAS r3 $nftRAM // 9132
	ALIAS r4 $methodcallexpression1043 // 9132
	COPY $id r5 // 9132
	PUSH r5 // 9135
	ALIAS r5 $literalexpression1047 // 9137
	LOAD $literalexpression1047 "STST" // 9137
	PUSH $literalexpression1047 // 9145
	LOAD $methodcallexpression1043 "Runtime.ReadTokenRAM" // 9147
	EXTCALL $methodcallexpression1043 // 9171
	POP $methodcallexpression1043 // 9173
	UNPACK $methodcallexpression1043 $methodcallexpression1043 // 9175
	COPY $methodcallexpression1043 $nftRAM // 9178
// Line 319:        return nftRAM;
	COPY $nftRAM r4 // 9181
	PUSH r4 // 9184
	JMP @exit_getRam // 9186
@exit_getRam: // 9189
RET // 9190
// Line 320:    }

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 9191
ALIAS r1 $dataGet // 9192
LOAD $dataGet "Data.Get" // 9192
ALIAS r2 $contractName // 9204
LOAD $contractName "STST" // 9204
ALIAS r3 $owner // 9212
// reading global: owner
LOAD r0 8 // 9212
PUSH r0 // 9217
LOAD r0 "owner" // 9219
PUSH r0 // 9228
PUSH $contractName // 9230
EXTCALL $dataGet // 9232
POP $owner // 9234
PUSH $owner // 9236
EXTCALL "Address()" // 9238
POP $owner // 9253
// Line 321:
// Line 322:    trigger onUpgrade(from:address) {
ALIAS r1 $from // 9255
POP $from // 9255
PUSH $from // 9257
EXTCALL "Address()" // 9259
POP $from // 9274
// Line 323:        // check is witness and is current owner
// Line 324:		Runtime.expect(Runtime.isWitness(owner), "invalid witness");
	ALIAS r2 $methodcallexpression1061 // 9276
	COPY $owner r4 // 9276
	PUSH r4 // 9279
	LOAD $methodcallexpression1061 "Runtime.IsWitness" // 9281
	EXTCALL $methodcallexpression1061 // 9302
	POP $methodcallexpression1061 // 9304
	JMPIF $methodcallexpression1061 @expect_methodcallexpression1058 // 9306
	ALIAS r4 $literalexpression1064 // 9310
	LOAD $literalexpression1064 "invalid witness" // 9310
	THROW $literalexpression1064 // 9329
	@expect_methodcallexpression1058: NOP // 9332
@exit_onUpgrade: // 9332
RET // 9333
// Line 325:    }

// ********* onMint Trigger ***********
@entry_onMint: // 9334
// Line 326:    //Mint function
// Line 327:    trigger onMint(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 9335
POP $from // 9335
PUSH $from // 9337
EXTCALL "Address()" // 9339
POP $from // 9354
ALIAS r2 $to // 9356
POP $to // 9356
PUSH $to // 9358
EXTCALL "Address()" // 9360
POP $to // 9375
ALIAS r3 $symbol // 9377
POP $symbol // 9377
ALIAS r4 $tokenID // 9379
POP $tokenID // 9379
CAST $tokenID $tokenID #Number // 9381
// Line 328:		Runtime.expect(symbol == $THIS_SYMBOL, "symbol mismatch");
	COPY $symbol r5 // 9385
	ALIAS r6 $literalexpression1081 // 9388
	LOAD $literalexpression1081 "STST" // 9388
	EQUAL r5 $literalexpression1081 r7 // 9396
	JMPIF r7 @expect_methodcallexpression1076 // 9400
	ALIAS r5 $literalexpression1083 // 9404
	LOAD $literalexpression1083 "symbol mismatch" // 9404
	THROW $literalexpression1083 // 9423
	@expect_methodcallexpression1076: NOP // 9426
@exit_onMint: // 9426
RET // 9427
// Line 329:        //might need to add NFT owns to right here 
// Line 330:    }

// ********* onInfuse Trigger ***********
@entry_onInfuse: // 9428
// Line 331:    trigger onInfuse(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 9429
POP $from // 9429
PUSH $from // 9431
EXTCALL "Address()" // 9433
POP $from // 9448
ALIAS r2 $to // 9450
POP $to // 9450
PUSH $to // 9452
EXTCALL "Address()" // 9454
POP $to // 9469
ALIAS r3 $symbol // 9471
POP $symbol // 9471
ALIAS r4 $tokenID // 9473
POP $tokenID // 9473
CAST $tokenID $tokenID #Number // 9475
// Line 332:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression1098 // 9479
	COPY $from r6 // 9479
	PUSH r6 // 9482
	LOAD $methodcallexpression1098 "Runtime.IsWitness" // 9484
	EXTCALL $methodcallexpression1098 // 9505
	POP $methodcallexpression1098 // 9507
	JMPIF $methodcallexpression1098 @expect_methodcallexpression1095 // 9509
	ALIAS r6 $literalexpression1101 // 9513
	LOAD $literalexpression1101 "witness failed" // 9513
	THROW $literalexpression1101 // 9531
	@expect_methodcallexpression1095: NOP // 9534
@exit_onInfuse: // 9534
RET // 9535
// Line 333:    }

// ********* onSeries Trigger ***********
@entry_onSeries: // 9536
// Line 334:
// Line 335:    trigger onSeries(from: address) {
ALIAS r1 $from // 9537
POP $from // 9537
PUSH $from // 9539
EXTCALL "Address()" // 9541
POP $from // 9556
// Line 336:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression1110 // 9558
	COPY $from r3 // 9558
	PUSH r3 // 9561
	LOAD $methodcallexpression1110 "Runtime.IsWitness" // 9563
	EXTCALL $methodcallexpression1110 // 9584
	POP $methodcallexpression1110 // 9586
	JMPIF $methodcallexpression1110 @expect_methodcallexpression1107 // 9588
	ALIAS r3 $literalexpression1113 // 9592
	LOAD $literalexpression1113 "witness failed" // 9592
	THROW $literalexpression1113 // 9610
	@expect_methodcallexpression1107: NOP // 9613
@exit_onSeries: // 9613
RET // 9614
// Line 337:    }

// ********* onWrite Trigger ***********
@entry_onWrite: // 9615
// Line 338:
// Line 339:    trigger onWrite(from: address,data:number) {
ALIAS r1 $from // 9616
POP $from // 9616
PUSH $from // 9618
EXTCALL "Address()" // 9620
POP $from // 9635
ALIAS r2 $data // 9637
POP $data // 9637
CAST $data $data #Number // 9639
// Line 340:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression1124 // 9643
	COPY $from r4 // 9643
	PUSH r4 // 9646
	LOAD $methodcallexpression1124 "Runtime.IsWitness" // 9648
	EXTCALL $methodcallexpression1124 // 9669
	POP $methodcallexpression1124 // 9671
	JMPIF $methodcallexpression1124 @expect_methodcallexpression1121 // 9673
	ALIAS r4 $literalexpression1127 // 9677
	LOAD $literalexpression1127 "witness failed" // 9677
	THROW $literalexpression1127 // 9695
	@expect_methodcallexpression1121: NOP // 9698
@exit_onWrite: // 9698
RET // 9699
// Line 341:    }

// ********* onSend Trigger ***********
@entry_onSend: // 9700
// Line 342:
// Line 343:    trigger onSend(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 9701
POP $from // 9701
PUSH $from // 9703
EXTCALL "Address()" // 9705
POP $from // 9720
ALIAS r2 $to // 9722
POP $to // 9722
PUSH $to // 9724
EXTCALL "Address()" // 9726
POP $to // 9741
ALIAS r3 $symbol // 9743
POP $symbol // 9743
ALIAS r4 $tokenID // 9745
POP $tokenID // 9745
CAST $tokenID $tokenID #Number // 9747
// Line 344:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression1142 // 9751
	COPY $from r6 // 9751
	PUSH r6 // 9754
	LOAD $methodcallexpression1142 "Runtime.IsWitness" // 9756
	EXTCALL $methodcallexpression1142 // 9777
	POP $methodcallexpression1142 // 9779
	JMPIF $methodcallexpression1142 @expect_methodcallexpression1139 // 9781
	ALIAS r6 $literalexpression1145 // 9785
	LOAD $literalexpression1145 "witness failed" // 9785
	THROW $literalexpression1145 // 9803
	@expect_methodcallexpression1139: NOP // 9806
@exit_onSend: // 9806
RET // 9807
// Line 345:    }

// ********* onBurn Trigger ***********
@entry_onBurn: // 9808
// Line 346:  
// Line 347:    trigger onBurn(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 9809
POP $from // 9809
PUSH $from // 9811
EXTCALL "Address()" // 9813
POP $from // 9828
ALIAS r2 $to // 9830
POP $to // 9830
PUSH $to // 9832
EXTCALL "Address()" // 9834
POP $to // 9849
ALIAS r3 $symbol // 9851
POP $symbol // 9851
ALIAS r4 $tokenID // 9853
POP $tokenID // 9853
CAST $tokenID $tokenID #Number // 9855
// Line 348:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression1160 // 9859
	COPY $from r6 // 9859
	PUSH r6 // 9862
	LOAD $methodcallexpression1160 "Runtime.IsWitness" // 9864
	EXTCALL $methodcallexpression1160 // 9885
	POP $methodcallexpression1160 // 9887
	JMPIF $methodcallexpression1160 @expect_methodcallexpression1157 // 9889
	ALIAS r6 $literalexpression1163 // 9893
	LOAD $literalexpression1163 "witness failed" // 9893
	THROW $literalexpression1163 // 9911
	@expect_methodcallexpression1157: NOP // 9914
@exit_onBurn: // 9914
RET // 9915

// =======> BUILTINS SECTION
@entry_tomb_random_seed: // 505 // 9916
// Line 98:				
// Line 99:	private tomb_random_seed(seed:number) 
ALIAS r1 $seed // 506 // 9917
POP $seed // 506 // 9917
CAST $seed $seed #Number // 508 // 9919
// Line 100:	{
// Line 101:		Storage.write(RND_SEED_KEY, seed);
	ALIAS r2 $methodcallexpression268 // 512 // 9923
	COPY $seed r3 // 512 // 9923
	PUSH r3 // 515 // 9926
	ALIAS r3 $RND_SEED_KEY // 517 // 9928
	LOAD $RND_SEED_KEY "tomb_rnd_seed" // 517 // 9928
	PUSH $RND_SEED_KEY // 534 // 9945
	LOAD $methodcallexpression268 "Data.Set" // 536 // 9947
	EXTCALL $methodcallexpression268 // 548 // 9959
@exit_tomb_random_seed: // 550 // 9961
RET // 551 // 9962
// Line 102:	}

@entry_tomb_random_generate: // 552 // 9963
// Line 103:
// Line 104:	private tomb_random_generate(): number
// Line 105:	{
// Line 106:		local seed: number;
// Line 107:		local context:string = Runtime.context();
	ALIAS r1 $context // 553 // 9964
	ALIAS r2 $methodcallexpression276 // 553 // 9964
	LOAD $methodcallexpression276 "Runtime.Context" // 553 // 9964
	EXTCALL $methodcallexpression276 // 572 // 9983
	POP $methodcallexpression276 // 574 // 9985
	COPY $methodcallexpression276 $context // 576 // 9987
	ALIAS r2 $seed // 579 // 9990
// Line 108:		seed = Storage.read<number>(context, RND_SEED_KEY);
	LOAD r3 3 // field type // 579 // 9990
	PUSH r3 // 584 // 9995
	ALIAS r4 $RND_SEED_KEY // 586 // 9997
	LOAD $RND_SEED_KEY "tomb_rnd_seed" // 586 // 9997
	PUSH $RND_SEED_KEY // 603 // 10014
	COPY $context r4 // 605 // 10016
	PUSH r4 // 608 // 10019
	LOAD r3 "Data.Get" // 610 // 10021
	EXTCALL r3 // 622 // 10033
	POP r3 // 624 // 10035
	COPY r3 $seed // 626 // 10037
// Line 109:		seed = (RND_A * seed) % RND_M;
	ALIAS r3 $RND_A // 629 // 10040
	LOAD $RND_A 16807 // 629 // 10040
	COPY $seed r4 // 635 // 10046
	MUL $RND_A r4 r5 // 638 // 10049
	ALIAS r3 $RND_M // 642 // 10053
	LOAD $RND_M 2147483647 // 642 // 10053
	MOD r5 $RND_M r4 // 650 // 10061
	COPY r4 $seed // 654 // 10065
// Line 110:		Storage.write(RND_SEED_KEY, seed);
	ALIAS r3 $methodcallexpression292 // 657 // 10068
	COPY $seed r4 // 657 // 10068
	PUSH r4 // 660 // 10071
	ALIAS r4 $RND_SEED_KEY // 662 // 10073
	LOAD $RND_SEED_KEY "tomb_rnd_seed" // 662 // 10073
	PUSH $RND_SEED_KEY // 679 // 10090
	LOAD $methodcallexpression292 "Data.Set" // 681 // 10092
	EXTCALL $methodcallexpression292 // 693 // 10104
// Line 111:		return seed;
	COPY $seed r3 // 695 // 10106
	PUSH r3 // 698 // 10109
	JMP @exit_tomb_random_generate // 700 // 10111
@exit_tomb_random_generate: // 703 // 10114
RET // 704 // 10115

