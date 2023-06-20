
// ********* getName Property ***********
@entry_getName: // 0
	ALIAS r1 $literalexpression175 // 1
	LOAD $literalexpression175 "Test Sandy" // 1
	PUSH $literalexpression175 // 15
	JMP @exit_getName // 17
@exit_getName: // 20
RET // 21

// ********* getSymbol Property ***********
@entry_getSymbol: // 22
	ALIAS r1 $literalexpression179 // 23
	LOAD $literalexpression179 "STST" // 23
	PUSH $literalexpression179 // 31
	JMP @exit_getSymbol // 33
@exit_getSymbol: // 36
RET // 37

// ********* isFungible Property ***********
@entry_isFungible: // 38
	ALIAS r1 $literalexpression183 // 39
	LOAD $literalexpression183 false // 39
	PUSH $literalexpression183 // 44
	JMP @exit_isFungible // 46
@exit_isFungible: // 49
RET // 50

// ********* isFinite Property ***********
@entry_isFinite: // 51
	ALIAS r1 $literalexpression187 // 52
	LOAD $literalexpression187 true // 52
	PUSH $literalexpression187 // 57
	JMP @exit_isFinite // 59
@exit_isFinite: // 62
RET // 63

// ********* isBurnable Property ***********
@entry_isBurnable: // 64
	ALIAS r1 $literalexpression191 // 65
	LOAD $literalexpression191 true // 65
	PUSH $literalexpression191 // 70
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
	ALIAS r1 $literalexpression199 // 92
	LOAD $literalexpression199 true // 92
	PUSH $literalexpression199 // 97
	JMP @exit_isTransferable // 99
@exit_isTransferable: // 102
RET // 103

// ********* isCapped Property ***********
@entry_isCapped: // 104
	ALIAS r1 $literalexpression203 // 105
	LOAD $literalexpression203 false // 105
	PUSH $literalexpression203 // 110
	JMP @exit_isCapped // 112
@exit_isCapped: // 115
RET // 116

// ********* getDecimals Property ***********
@entry_getDecimals: // 117
	ALIAS r1 $literalexpression207 // 118
	LOAD $literalexpression207 8 // 118
	PUSH $literalexpression207 // 123
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
// Line 111:        }
// Line 112:    }

// ********* Initialize Constructor ***********
@entry_constructor: // 204
ALIAS r1 $nexus_protocol_version // 205
// validate protocol version
LOAD r0 "Runtime.Version" // 205
EXTCALL r0 // 224
POP r0 // 226
LOAD $nexus_protocol_version 14 // 228
LT r0 $nexus_protocol_version r0 // 233
JMPNOT r0 @protocol_version_validated // 237
LOAD r0 "Current nexus protocol version should be 14 or more" // 241
THROW r0 // 296
@protocol_version_validated: NOP // 299
ALIAS r1 $owner // 299
// clearing owns_sandy storage
LOAD r0 "owns_sandy" // 299
PUSH r0 // 313
LOAD r0 "Map.Clear" // 315
EXTCALL r0 // 328
ALIAS r2 $_infusionAmt // 330
// clearing _limbs storage
LOAD r0 "_limbs" // 330
PUSH r0 // 340
LOAD r0 "Map.Clear" // 342
EXTCALL r0 // 355
// clearing _categories storage
LOAD r0 "_categories" // 357
PUSH r0 // 372
LOAD r0 "Map.Clear" // 374
EXTCALL r0 // 387
ALIAS r3 $_infusionTkn // 389
// Line 113:
// Line 114:    constructor(con_creator: address) {
ALIAS r4 $con_creator // 389
POP $con_creator // 389
PUSH $con_creator // 391
EXTCALL "Address()" // 393
POP $con_creator // 408
// Line 115:        owner = con_creator;
	COPY $con_creator r5 // 410
	COPY r5 $owner // 413
// Line 116:        _infusionTkn = "SOUL";
	ALIAS r5 $literalexpression387 // 416
	LOAD $literalexpression387 "SOUL" // 416
	COPY $literalexpression387 $_infusionTkn // 424
// Line 117:        local assetDecimals : number = 10 ^ Token.getDecimals(_infusionTkn);    
	ALIAS r5 $assetDecimals // 427
	ALIAS r6 $literalexpression388 // 427
	LOAD $literalexpression388 10 // 427
	ALIAS r7 $methodcallexpression389 // 432
	COPY $_infusionTkn r8 // 432
	PUSH r8 // 435
	LOAD $methodcallexpression389 "Runtime.GetTokenDecimals" // 437
	EXTCALL $methodcallexpression389 // 465
	POP $methodcallexpression389 // 467
	POW $literalexpression388 $methodcallexpression389 r8 // 469
	COPY r8 $assetDecimals // 473
// Line 118:        _infusionAmt = 50 * assetDecimals;
	ALIAS r6 $literalexpression396 // 476
	LOAD $literalexpression396 50 // 476
	COPY $assetDecimals r7 // 481
	MUL $literalexpression396 r7 r8 // 484
	COPY r8 $_infusionAmt // 488
// Line 119:
// Line 120:        NFT.createSeries(owner, $THIS_SYMBOL,SANDY_SERIESID,DOLL_SUPPLY,TokenSeries.Unique,character);
	ALIAS r6 $methodcallexpression400 // 491
	LOAD r7 0x08076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030A676574496E666F55524C04B70000000107746F6B656E4944030B676574496D61676555524C04120100000107746F6B656E4944030A67657443726561746564056E010000000B67657453616E645479706504C9010000000B676574536B696E547970650425020000000B676574426F64795479706503810200000000 // abi // 491
	PUSH r7 // 674
	LOAD r7 0x0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B600000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081101000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301086D01000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204076372656174656430010102030108C801000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040873616E6454797065300101020301082402000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408736B696E54797065300101020301088002000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408626F64795479706530010102030108DC02000B // script // 676
	PUSH r7 // 1415
	ALIAS r7 $literalexpression412 // 1417
	LOAD $literalexpression412 0 Enum // 1417
	PUSH $literalexpression412 // 1425
	ALIAS r7 $DOLL_SUPPLY // 1427
	LOAD $DOLL_SUPPLY 500 // 1427
	PUSH $DOLL_SUPPLY // 1433
	ALIAS r7 $SANDY_SERIESID // 1435
	LOAD $SANDY_SERIESID 1 // 1435
	PUSH $SANDY_SERIESID // 1440
	ALIAS r7 $literalexpression409 // 1442
	LOAD $literalexpression409 "STST" // 1442
	PUSH $literalexpression409 // 1450
	COPY $owner r7 // 1452
	PUSH r7 // 1455
	LOAD $methodcallexpression400 "Nexus.CreateTokenSeries" // 1457
	EXTCALL $methodcallexpression400 // 1484
// Line 121:        Random.seed(16676869);
	ALIAS r6 $methodcallexpression415 // 1486
	ALIAS r7 $literalexpression417 // 1486
	LOAD $literalexpression417 16676869 // 1486
	PUSH $literalexpression417 // 1494
	CALL @entry_tomb_random_seed // 1496
@exit_constructor: // 1500
LOAD r4 "Data.Set" // 1501
// writing global: owner
PUSH $owner // 1513
LOAD r0 "owner" // 1515
PUSH r0 // 1524
EXTCALL r4 // 1526
// writing global: _infusionAmt
PUSH $_infusionAmt // 1528
LOAD r0 "_infusionAmt" // 1530
PUSH r0 // 1546
EXTCALL r4 // 1548
// writing global: _infusionTkn
PUSH $_infusionTkn // 1550
LOAD r0 "_infusionTkn" // 1552
PUSH r0 // 1568
EXTCALL r4 // 1570
RET // 1572
// Line 122:    }

// ********* transerNFT Method ***********
@entry_transerNFT: // 1573
// Line 123:   
// Line 124:    public transerNFT(from:address,to:address,id:number) {
ALIAS r1 $from // 1574
POP $from // 1574
PUSH $from // 1576
EXTCALL "Address()" // 1578
POP $from // 1593
ALIAS r2 $to // 1595
POP $to // 1595
PUSH $to // 1597
EXTCALL "Address()" // 1599
POP $to // 1614
ALIAS r3 $id // 1616
POP $id // 1616
CAST $id $id #Number // 1618
// Line 125:        Runtime.expect(Runtime.isWitness(from),"Must be owner of NFT to Transfer");
	ALIAS r4 $methodcallexpression430 // 1622
	COPY $from r5 // 1622
	PUSH r5 // 1625
	LOAD $methodcallexpression430 "Runtime.IsWitness" // 1627
	EXTCALL $methodcallexpression430 // 1648
	POP $methodcallexpression430 // 1650
	JMPIF $methodcallexpression430 @expect_methodcallexpression427 // 1652
	ALIAS r5 $literalexpression433 // 1656
	LOAD $literalexpression433 "Must be owner of NFT to Transfer" // 1656
	THROW $literalexpression433 // 1692
	@expect_methodcallexpression427: NOP // 1695
// Line 126:        NFT.transfer(from,to,$THIS_SYMBOL,id);
	ALIAS r4 $methodcallexpression435 // 1695
	COPY $id r5 // 1695
	PUSH r5 // 1698
	ALIAS r5 $literalexpression443 // 1700
	LOAD $literalexpression443 "STST" // 1700
	PUSH $literalexpression443 // 1708
	COPY $to r5 // 1710
	PUSH r5 // 1713
	COPY $from r5 // 1715
	PUSH r5 // 1718
	LOAD $methodcallexpression435 "Runtime.TransferToken" // 1720
	EXTCALL $methodcallexpression435 // 1745
@exit_transerNFT: // 1747
RET // 1748
// Line 127:    }

// ********* upgradeOwner Method ***********
@entry_upgradeOwner: // 1749
ALIAS r1 $dataGet // 1750
LOAD $dataGet "Data.Get" // 1750
ALIAS r2 $contractName // 1762
LOAD $contractName "STST" // 1762
ALIAS r3 $owner // 1770
// reading global: owner
LOAD r0 8 // 1770
PUSH r0 // 1775
LOAD r0 "owner" // 1777
PUSH r0 // 1786
PUSH $contractName // 1788
EXTCALL $dataGet // 1790
POP $owner // 1792
PUSH $owner // 1794
EXTCALL "Address()" // 1796
POP $owner // 1811
// Line 128:
// Line 129:    public upgradeOwner(newOwner: address) {
ALIAS r1 $newOwner // 1813
POP $newOwner // 1813
PUSH $newOwner // 1815
EXTCALL "Address()" // 1817
POP $newOwner // 1832
// Line 130:        Runtime.expect(Runtime.isWitness(owner), "Must be owner of this contract");
	ALIAS r2 $methodcallexpression453 // 1834
	COPY $owner r4 // 1834
	PUSH r4 // 1837
	LOAD $methodcallexpression453 "Runtime.IsWitness" // 1839
	EXTCALL $methodcallexpression453 // 1860
	POP $methodcallexpression453 // 1862
	JMPIF $methodcallexpression453 @expect_methodcallexpression450 // 1864
	ALIAS r4 $literalexpression456 // 1868
	LOAD $literalexpression456 "Must be owner of this contract" // 1868
	THROW $literalexpression456 // 1902
	@expect_methodcallexpression450: NOP // 1905
// Line 131:        owner = newOwner;
	COPY $newOwner r2 // 1905
	COPY r2 $owner // 1908
@exit_upgradeOwner: // 1911
LOAD r1 "Data.Set" // 1912
// writing global: owner
PUSH $owner // 1924
LOAD r0 "owner" // 1926
PUSH r0 // 1935
EXTCALL r1 // 1937
RET // 1939
// Line 132:    }

// ********* mintBody Method ***********
@entry_mintBody: // 1940
// Line 133:
// Line 134:    public mintBody( 
// Line 135:                to: address, 
// Line 136:                created: timestamp, 
// Line 137:                name: string, 
// Line 138:                description: string, 
// Line 139:                infoURL: string,
// Line 140:                imageURL: string,
// Line 141:                sandType: string, 
// Line 142:                skinType: string) : number {
ALIAS r1 $to // 1941
POP $to // 1941
PUSH $to // 1943
EXTCALL "Address()" // 1945
POP $to // 1960
ALIAS r2 $created // 1962
POP $created // 1962
PUSH $created // 1964
EXTCALL "Timestamp()" // 1966
POP $created // 1983
ALIAS r3 $name // 1985
POP $name // 1985
ALIAS r4 $description // 1987
POP $description // 1987
ALIAS r5 $infoURL // 1989
POP $infoURL // 1989
ALIAS r6 $imageURL // 1991
POP $imageURL // 1991
ALIAS r7 $sandType // 1993
POP $sandType // 1993
ALIAS r8 $skinType // 1995
POP $skinType // 1995
// Line 143:
// Line 144:        Runtime.expect(owns_sandy.has(to) == false, "Not able to mint new sandy because you already have one."); 
	LOAD r9 6 // field type // 1997
	PUSH r9 // 2002
	COPY $to r10 // 2004
	PUSH r10 // 2007
	ALIAS r10 $literalexpression497 // 2009
	LOAD $literalexpression497 "owns_sandy" // 2009
	PUSH $literalexpression497 // 2023
	LOAD $literalexpression497 "STST" // contract name // 2025
	PUSH $literalexpression497 // 2033
	LOAD r9 "Map.Has" // 2035
	EXTCALL r9 // 2046
	POP r9 // 2048
	ALIAS r10 $literalexpression499 // 2050
	LOAD $literalexpression499 false // 2050
	EQUAL r9 $literalexpression499 r11 // 2055
	JMPIF r11 @expect_methodcallexpression478 // 2059
	ALIAS r9 $literalexpression501 // 2063
	LOAD $literalexpression501 "Not able to mint new sandy because you already have one." // 2063
	THROW $literalexpression501 // 2123
	@expect_methodcallexpression478: NOP // 2126
// Line 145:        Runtime.expect(Runtime.isWitness(to),"Must be witness");
	ALIAS r9 $methodcallexpression506 // 2126
	COPY $to r10 // 2126
	PUSH r10 // 2129
	LOAD $methodcallexpression506 "Runtime.IsWitness" // 2131
	EXTCALL $methodcallexpression506 // 2152
	POP $methodcallexpression506 // 2154
	JMPIF $methodcallexpression506 @expect_methodcallexpression503 // 2156
	ALIAS r10 $literalexpression509 // 2160
	LOAD $literalexpression509 "Must be witness" // 2160
	THROW $literalexpression509 // 2179
	@expect_methodcallexpression503: NOP // 2182
// Line 146:
// Line 147:        local _bodyType: number = Random.generate() % 10; // This could be changeable due to the skinType (Organic and Metal has different type of sandy)
	ALIAS r9 $_bodyType // 2182
	ALIAS r10 $methodcallexpression510 // 2182
	CALL @entry_tomb_random_generate // 2182
	POP $methodcallexpression510 // 2186
	ALIAS r11 $literalexpression511 // 2188
	LOAD $literalexpression511 10 // 2188
	MOD $methodcallexpression510 $literalexpression511 r12 // 2193
	COPY r12 $_bodyType // 2197
// Line 148:		local rom: body_rom = Struct.body_rom(Time.now(), name, description, infoURL, imageURL, sandType, skinType, _bodyType);
	ALIAS r10 $rom // 2200
	CLEAR r11 // 2200
	ALIAS r13 $methodcallexpression524 // 2202
	LOAD $methodcallexpression524 "Runtime.Time" // 2202
	EXTCALL $methodcallexpression524 // 2218
	POP $methodcallexpression524 // 2220
	LOAD r12 "created" // 2222
	PUT $methodcallexpression524 r11 r12 // 2233
	COPY $name r13 // 2237
	LOAD r12 "name" // 2240
	PUT r13 r11 r12 // 2248
	COPY $description r13 // 2252
	LOAD r12 "description" // 2255
	PUT r13 r11 r12 // 2270
	COPY $infoURL r13 // 2274
	LOAD r12 "infoURL" // 2277
	PUT r13 r11 r12 // 2288
	COPY $imageURL r13 // 2292
	LOAD r12 "imageURL" // 2295
	PUT r13 r11 r12 // 2307
	COPY $sandType r13 // 2311
	LOAD r12 "sandType" // 2314
	PUT r13 r11 r12 // 2326
	COPY $skinType r13 // 2330
	LOAD r12 "skinType" // 2333
	PUT r13 r11 r12 // 2345
	COPY $_bodyType r13 // 2349
	LOAD r12 "bodyType" // 2352
	PUT r13 r11 r12 // 2364
	COPY r11 $rom // 2368
// Line 149:          
// Line 150:        local id = NFT.mint(to, to, $THIS_SYMBOL, rom, "", SANDY_SERIESID);
	ALIAS r11 $id // 2371
	ALIAS r12 $methodcallexpression534 // 2371
	ALIAS r13 $SANDY_SERIESID // 2371
	LOAD $SANDY_SERIESID 1 // 2371
	PUSH $SANDY_SERIESID // 2376
	ALIAS r13 $literalexpression546 // 2378
	LOAD $literalexpression546 "" // 2378
	CAST $literalexpression546 $literalexpression546 #Bytes // 2382
	PUSH $literalexpression546 // 2386
	COPY $rom r13 // 2388
	CAST r13 r13 #Bytes // 2391
	PUSH r13 // 2395
	ALIAS r13 $literalexpression544 // 2397
	LOAD $literalexpression544 "STST" // 2397
	PUSH $literalexpression544 // 2405
	COPY $to r13 // 2407
	PUSH r13 // 2410
	COPY $to r13 // 2412
	PUSH r13 // 2415
	LOAD $methodcallexpression534 "Runtime.MintToken" // 2417
	EXTCALL $methodcallexpression534 // 2438
	POP $methodcallexpression534 // 2440
	COPY $methodcallexpression534 $id // 2442
// Line 151:        // NFT.infuse(to, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
// Line 152:        // NFT.transfer(owner, to, $THIS_SYMBOL, id);
// Line 153:        // this.transerNFT(owner,to,id);
// Line 154:        // owns_sandy.set(to,true);
// Line 155:
// Line 156:        Runtime.log("New created Sandy Token " + id);
	ALIAS r12 $methodcallexpression551 // 2445
	ALIAS r13 $literalexpression553 // 2445
	LOAD $literalexpression553 "New created Sandy Token " // 2445
	COPY $id r14 // 2473
	CAST r14 r14 #String // 2476
	ADD $literalexpression553 r14 r15 // 2480
	PUSH r15 // 2484
	LOAD $methodcallexpression551 "Runtime.Log" // 2486
	EXTCALL $methodcallexpression551 // 2501
// Line 157:
// Line 158:        return id;
	COPY $id r12 // 2503
	PUSH r12 // 2506
	JMP @exit_mintBody // 2508
@exit_mintBody: // 2511
RET // 2512
// Line 159:    } 

// ********* createLimb Method ***********
@entry_createLimb: // 2513
ALIAS r1 $dataGet // 2514
LOAD $dataGet "Data.Get" // 2514
ALIAS r2 $contractName // 2526
LOAD $contractName "STST" // 2526
ALIAS r3 $owner // 2534
// reading global: owner
LOAD r0 8 // 2534
PUSH r0 // 2539
LOAD r0 "owner" // 2541
PUSH r0 // 2550
PUSH $contractName // 2552
EXTCALL $dataGet // 2554
POP $owner // 2556
PUSH $owner // 2558
EXTCALL "Address()" // 2560
POP $owner // 2575
// Line 160:    
// Line 161:    // private initMint(seriesID:number,name: string,description: string,infoURL: string,imageURL: string){
// Line 162:    //     local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
// Line 163:    //     local id: number = NFT.mint(owner,owner, $THIS_SYMBOL, rom,"",seriesID);
// Line 164:    // }
// Line 165:  
// Line 166:	//@Param seriesId - Must be a unique number, could use UID.generate()
// Line 167:    public createLimb(seriesID:number,limbSupply:number,name: string,description: string,infoURL: string,imageURL: string){
ALIAS r1 $seriesID // 2577
POP $seriesID // 2577
CAST $seriesID $seriesID #Number // 2579
ALIAS r2 $limbSupply // 2583
POP $limbSupply // 2583
CAST $limbSupply $limbSupply #Number // 2585
ALIAS r4 $name // 2589
POP $name // 2589
ALIAS r5 $description // 2591
POP $description // 2591
ALIAS r6 $infoURL // 2593
POP $infoURL // 2593
ALIAS r7 $imageURL // 2595
POP $imageURL // 2595
// Line 168:        Runtime.expect(Runtime.isWitness(owner),"Must be owner of contract");
	ALIAS r8 $methodcallexpression577 // 2597
	COPY $owner r9 // 2597
	PUSH r9 // 2600
	LOAD $methodcallexpression577 "Runtime.IsWitness" // 2602
	EXTCALL $methodcallexpression577 // 2623
	POP $methodcallexpression577 // 2625
	JMPIF $methodcallexpression577 @expect_methodcallexpression574 // 2627
	ALIAS r9 $literalexpression580 // 2631
	LOAD $literalexpression580 "Must be owner of contract" // 2631
	THROW $literalexpression580 // 2660
	@expect_methodcallexpression574: NOP // 2663
// Line 169:        NFT.createSeries(owner, $THIS_SYMBOL,seriesID,limbSupply,TokenSeries.Duplicated,limb);
	ALIAS r8 $methodcallexpression582 // 2663
	LOAD r9 0x04076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030A676574496E666F55524C04B70000000107746F6B656E4944030B676574496D61676555524C04120100000107746F6B656E49440300 // abi // 2663
	PUSH r9 // 2775
	LOAD r9 0x0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B600000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081101000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301086D01000B // script // 2777
	PUSH r9 // 3149
	ALIAS r9 $literalexpression594 // 3151
	LOAD $literalexpression594 1 Enum // 3151
	PUSH $literalexpression594 // 3159
	COPY $limbSupply r9 // 3161
	PUSH r9 // 3164
	COPY $seriesID r9 // 3166
	PUSH r9 // 3169
	ALIAS r9 $literalexpression591 // 3171
	LOAD $literalexpression591 "STST" // 3171
	PUSH $literalexpression591 // 3179
	COPY $owner r9 // 3181
	PUSH r9 // 3184
	LOAD $methodcallexpression582 "Nexus.CreateTokenSeries" // 3186
	EXTCALL $methodcallexpression582 // 3213
// Line 170:        local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
	ALIAS r8 $rom // 3215
	CLEAR r9 // 3215
	COPY $name r11 // 3217
	LOAD r10 "name" // 3220
	PUT r11 r9 r10 // 3228
	COPY $description r11 // 3232
	LOAD r10 "description" // 3235
	PUT r11 r9 r10 // 3250
	COPY $infoURL r11 // 3254
	LOAD r10 "infoURL" // 3257
	PUT r11 r9 r10 // 3268
	COPY $imageURL r11 // 3272
	LOAD r10 "imageURL" // 3275
	PUT r11 r9 r10 // 3287
	COPY r9 $rom // 3291
@exit_createLimb: // 3294
RET // 3295
// Line 171:        // this.initMint(seriesID,name,description,infoURL,imageURL);
// Line 172:    }

// ********* mintLimb Method ***********
@entry_mintLimb: // 3296
// Line 173:
// Line 174:   
// Line 175:    //should give you a random limb back
// Line 176:    public mintLimb(from:address,to:address,seriesID:number)
ALIAS r1 $from // 3297
POP $from // 3297
PUSH $from // 3299
EXTCALL "Address()" // 3301
POP $from // 3316
ALIAS r2 $to // 3318
POP $to // 3318
PUSH $to // 3320
EXTCALL "Address()" // 3322
POP $to // 3337
ALIAS r3 $seriesID // 3339
POP $seriesID // 3339
CAST $seriesID $seriesID #Number // 3341
// Line 177:    {   
// Line 178:        Runtime.expect(Runtime.isWitness(from),"Must be a witness");
	ALIAS r4 $methodcallexpression619 // 3345
	COPY $from r5 // 3345
	PUSH r5 // 3348
	LOAD $methodcallexpression619 "Runtime.IsWitness" // 3350
	EXTCALL $methodcallexpression619 // 3371
	POP $methodcallexpression619 // 3373
	JMPIF $methodcallexpression619 @expect_methodcallexpression616 // 3375
	ALIAS r5 $literalexpression622 // 3379
	LOAD $literalexpression622 "Must be a witness" // 3379
	THROW $literalexpression622 // 3400
	@expect_methodcallexpression616: NOP // 3403
// Line 179:        //need to randomize seriesId -> this is assuming all I need is a seriesID.
// Line 180:        //do randomization for SeriesID;
// Line 181:        local id: number = NFT.mint(from,to, $THIS_SYMBOL,"","",seriesID);
	ALIAS r4 $id // 3403
	ALIAS r5 $methodcallexpression623 // 3403
	COPY $seriesID r6 // 3403
	PUSH r6 // 3406
	ALIAS r6 $literalexpression635 // 3408
	LOAD $literalexpression635 "" // 3408
	CAST $literalexpression635 $literalexpression635 #Bytes // 3412
	PUSH $literalexpression635 // 3416
	ALIAS r6 $literalexpression634 // 3418
	LOAD $literalexpression634 "" // 3418
	CAST $literalexpression634 $literalexpression634 #Bytes // 3422
	PUSH $literalexpression634 // 3426
	ALIAS r6 $literalexpression633 // 3428
	LOAD $literalexpression633 "STST" // 3428
	PUSH $literalexpression633 // 3436
	COPY $to r6 // 3438
	PUSH r6 // 3441
	COPY $from r6 // 3443
	PUSH r6 // 3446
	LOAD $methodcallexpression623 "Runtime.MintToken" // 3448
	EXTCALL $methodcallexpression623 // 3469
	POP $methodcallexpression623 // 3471
	COPY $methodcallexpression623 $id // 3473
@exit_mintLimb: // 3476
RET // 3477
// Line 182:    }

// ********* editSANDY Method ***********
@entry_editSANDY: // 3478
// Line 183:
// Line 184:    //Will deprecated and used for somthing else
// Line 185:	//will have to make sure that the owner is the only one who can edit the sandy name
// Line 186:    public editSANDY(nftOwner:address,tokenID:number,name:string) {
ALIAS r1 $nftOwner // 3479
POP $nftOwner // 3479
PUSH $nftOwner // 3481
EXTCALL "Address()" // 3483
POP $nftOwner // 3498
ALIAS r2 $tokenID // 3500
POP $tokenID // 3500
CAST $tokenID $tokenID #Number // 3502
ALIAS r3 $name // 3506
POP $name // 3506
// Line 187:        Runtime.expect(Runtime.isWitness(nftOwner),"Must be owner of NFT");//have to find a way to get current nft owner
	ALIAS r4 $methodcallexpression651 // 3508
	COPY $nftOwner r5 // 3508
	PUSH r5 // 3511
	LOAD $methodcallexpression651 "Runtime.IsWitness" // 3513
	EXTCALL $methodcallexpression651 // 3534
	POP $methodcallexpression651 // 3536
	JMPIF $methodcallexpression651 @expect_methodcallexpression648 // 3538
	ALIAS r5 $literalexpression654 // 3542
	LOAD $literalexpression654 "Must be owner of NFT" // 3542
	THROW $literalexpression654 // 3566
	@expect_methodcallexpression648: NOP // 3569
// Line 188:		local editRam:body_ram = Struct.body_ram();
	ALIAS r4 $editRam // 3569
	CLEAR r5 // 3569
	COPY r5 $editRam // 3571
// Line 189:		//my assumption that write must follow the order of the struct 
// Line 190:        NFT.write(nftOwner,$THIS_SYMBOL,tokenID,editRam);//changeable data
	ALIAS r5 $methodcallexpression659 // 3574
	COPY $editRam r6 // 3574
	CAST r6 r6 #Bytes // 3577
	PUSH r6 // 3581
	COPY $tokenID r6 // 3583
	PUSH r6 // 3586
	ALIAS r6 $literalexpression666 // 3588
	LOAD $literalexpression666 "STST" // 3588
	PUSH $literalexpression666 // 3596
	COPY $nftOwner r6 // 3598
	PUSH r6 // 3601
	LOAD $methodcallexpression659 "Runtime.WriteToken" // 3603
	EXTCALL $methodcallexpression659 // 3625
@exit_editSANDY: // 3627
RET // 3628
// Line 191:    }

// ********* getRom Method ***********
@entry_getRom: // 3629
// Line 192:    //need to get readable rom 
// Line 193:    
// Line 194:    //- How do I make return type a struct initiialized to the rom size
// Line 195:    public getRom(symbol:string, id:number):body_rom {
ALIAS r1 $symbol // 3630
POP $symbol // 3630
ALIAS r2 $id // 3632
POP $id // 3632
CAST $id $id #Number // 3634
// Line 196:         local nftROM:body_rom = NFT.readROM<body_rom>($THIS_SYMBOL, id);
	ALIAS r3 $nftROM // 3638
	ALIAS r4 $methodcallexpression675 // 3638
	COPY $id r5 // 3638
	PUSH r5 // 3641
	ALIAS r5 $literalexpression679 // 3643
	LOAD $literalexpression679 "STST" // 3643
	PUSH $literalexpression679 // 3651
	LOAD $methodcallexpression675 "Runtime.ReadTokenROM" // 3653
	EXTCALL $methodcallexpression675 // 3677
	POP $methodcallexpression675 // 3679
	UNPACK $methodcallexpression675 $methodcallexpression675 // 3681
	COPY $methodcallexpression675 $nftROM // 3684
// Line 197:         return nftROM;
	COPY $nftROM r4 // 3687
	PUSH r4 // 3690
	JMP @exit_getRom // 3692
@exit_getRom: // 3695
RET // 3696
// Line 198:    }

// ********* getRam Method ***********
@entry_getRam: // 3697
// Line 199:
// Line 200:    public getRam(symbol:string, id:number): body_ram {
ALIAS r1 $symbol // 3698
POP $symbol // 3698
ALIAS r2 $id // 3700
POP $id // 3700
CAST $id $id #Number // 3702
// Line 201:        local nftRAM:body_ram = NFT.readRAM<body_ram>($THIS_SYMBOL, id);
	ALIAS r3 $nftRAM // 3706
	ALIAS r4 $methodcallexpression691 // 3706
	COPY $id r5 // 3706
	PUSH r5 // 3709
	ALIAS r5 $literalexpression695 // 3711
	LOAD $literalexpression695 "STST" // 3711
	PUSH $literalexpression695 // 3719
	LOAD $methodcallexpression691 "Runtime.ReadTokenRAM" // 3721
	EXTCALL $methodcallexpression691 // 3745
	POP $methodcallexpression691 // 3747
	UNPACK $methodcallexpression691 $methodcallexpression691 // 3749
	COPY $methodcallexpression691 $nftRAM // 3752
// Line 202:        return nftRAM;
	COPY $nftRAM r4 // 3755
	PUSH r4 // 3758
	JMP @exit_getRam // 3760
@exit_getRam: // 3763
RET // 3764
// Line 203:    }

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 3765
ALIAS r1 $dataGet // 3766
LOAD $dataGet "Data.Get" // 3766
ALIAS r2 $contractName // 3778
LOAD $contractName "STST" // 3778
ALIAS r3 $owner // 3786
// reading global: owner
LOAD r0 8 // 3786
PUSH r0 // 3791
LOAD r0 "owner" // 3793
PUSH r0 // 3802
PUSH $contractName // 3804
EXTCALL $dataGet // 3806
POP $owner // 3808
PUSH $owner // 3810
EXTCALL "Address()" // 3812
POP $owner // 3827
// Line 204:
// Line 205:    trigger onUpgrade(from:address) {
ALIAS r1 $from // 3829
POP $from // 3829
PUSH $from // 3831
EXTCALL "Address()" // 3833
POP $from // 3848
// Line 206:        // check is witness and is current owner
// Line 207:		Runtime.expect(Runtime.isWitness(owner), "invalid witness");
	ALIAS r2 $methodcallexpression709 // 3850
	COPY $owner r4 // 3850
	PUSH r4 // 3853
	LOAD $methodcallexpression709 "Runtime.IsWitness" // 3855
	EXTCALL $methodcallexpression709 // 3876
	POP $methodcallexpression709 // 3878
	JMPIF $methodcallexpression709 @expect_methodcallexpression706 // 3880
	ALIAS r4 $literalexpression712 // 3884
	LOAD $literalexpression712 "invalid witness" // 3884
	THROW $literalexpression712 // 3903
	@expect_methodcallexpression706: NOP // 3906
@exit_onUpgrade: // 3906
RET // 3907
// Line 208:    }

// ********* onMint Trigger ***********
@entry_onMint: // 3908
// Line 209:    //Mint function
// Line 210:    trigger onMint(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 3909
POP $from // 3909
PUSH $from // 3911
EXTCALL "Address()" // 3913
POP $from // 3928
ALIAS r2 $to // 3930
POP $to // 3930
PUSH $to // 3932
EXTCALL "Address()" // 3934
POP $to // 3949
ALIAS r3 $symbol // 3951
POP $symbol // 3951
ALIAS r4 $tokenID // 3953
POP $tokenID // 3953
CAST $tokenID $tokenID #Number // 3955
// Line 211:		Runtime.expect(symbol == $THIS_SYMBOL, "symbol mismatch");
	COPY $symbol r5 // 3959
	ALIAS r6 $literalexpression729 // 3962
	LOAD $literalexpression729 "STST" // 3962
	EQUAL r5 $literalexpression729 r7 // 3970
	JMPIF r7 @expect_methodcallexpression724 // 3974
	ALIAS r5 $literalexpression731 // 3978
	LOAD $literalexpression731 "symbol mismatch" // 3978
	THROW $literalexpression731 // 3997
	@expect_methodcallexpression724: NOP // 4000
@exit_onMint: // 4000
RET // 4001
// Line 212:        //might need to add NFT owns to right here 
// Line 213:    }

// ********* onInfuse Trigger ***********
@entry_onInfuse: // 4002
// Line 214:    trigger onInfuse(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 4003
POP $from // 4003
PUSH $from // 4005
EXTCALL "Address()" // 4007
POP $from // 4022
ALIAS r2 $to // 4024
POP $to // 4024
PUSH $to // 4026
EXTCALL "Address()" // 4028
POP $to // 4043
ALIAS r3 $symbol // 4045
POP $symbol // 4045
ALIAS r4 $tokenID // 4047
POP $tokenID // 4047
CAST $tokenID $tokenID #Number // 4049
// Line 215:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression746 // 4053
	COPY $from r6 // 4053
	PUSH r6 // 4056
	LOAD $methodcallexpression746 "Runtime.IsWitness" // 4058
	EXTCALL $methodcallexpression746 // 4079
	POP $methodcallexpression746 // 4081
	JMPIF $methodcallexpression746 @expect_methodcallexpression743 // 4083
	ALIAS r6 $literalexpression749 // 4087
	LOAD $literalexpression749 "witness failed" // 4087
	THROW $literalexpression749 // 4105
	@expect_methodcallexpression743: NOP // 4108
@exit_onInfuse: // 4108
RET // 4109
// Line 216:    }

// ********* onSeries Trigger ***********
@entry_onSeries: // 4110
// Line 217:
// Line 218:    trigger onSeries(from: address) {
ALIAS r1 $from // 4111
POP $from // 4111
PUSH $from // 4113
EXTCALL "Address()" // 4115
POP $from // 4130
// Line 219:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression758 // 4132
	COPY $from r3 // 4132
	PUSH r3 // 4135
	LOAD $methodcallexpression758 "Runtime.IsWitness" // 4137
	EXTCALL $methodcallexpression758 // 4158
	POP $methodcallexpression758 // 4160
	JMPIF $methodcallexpression758 @expect_methodcallexpression755 // 4162
	ALIAS r3 $literalexpression761 // 4166
	LOAD $literalexpression761 "witness failed" // 4166
	THROW $literalexpression761 // 4184
	@expect_methodcallexpression755: NOP // 4187
@exit_onSeries: // 4187
RET // 4188
// Line 220:    }

// ********* onWrite Trigger ***********
@entry_onWrite: // 4189
// Line 221:
// Line 222:    trigger onWrite(from: address,data:number) {
ALIAS r1 $from // 4190
POP $from // 4190
PUSH $from // 4192
EXTCALL "Address()" // 4194
POP $from // 4209
ALIAS r2 $data // 4211
POP $data // 4211
CAST $data $data #Number // 4213
// Line 223:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression772 // 4217
	COPY $from r4 // 4217
	PUSH r4 // 4220
	LOAD $methodcallexpression772 "Runtime.IsWitness" // 4222
	EXTCALL $methodcallexpression772 // 4243
	POP $methodcallexpression772 // 4245
	JMPIF $methodcallexpression772 @expect_methodcallexpression769 // 4247
	ALIAS r4 $literalexpression775 // 4251
	LOAD $literalexpression775 "witness failed" // 4251
	THROW $literalexpression775 // 4269
	@expect_methodcallexpression769: NOP // 4272
@exit_onWrite: // 4272
RET // 4273
// Line 224:    }

// ********* onSend Trigger ***********
@entry_onSend: // 4274
// Line 225:
// Line 226:    trigger onSend(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 4275
POP $from // 4275
PUSH $from // 4277
EXTCALL "Address()" // 4279
POP $from // 4294
ALIAS r2 $to // 4296
POP $to // 4296
PUSH $to // 4298
EXTCALL "Address()" // 4300
POP $to // 4315
ALIAS r3 $symbol // 4317
POP $symbol // 4317
ALIAS r4 $tokenID // 4319
POP $tokenID // 4319
CAST $tokenID $tokenID #Number // 4321
// Line 227:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression790 // 4325
	COPY $from r6 // 4325
	PUSH r6 // 4328
	LOAD $methodcallexpression790 "Runtime.IsWitness" // 4330
	EXTCALL $methodcallexpression790 // 4351
	POP $methodcallexpression790 // 4353
	JMPIF $methodcallexpression790 @expect_methodcallexpression787 // 4355
	ALIAS r6 $literalexpression793 // 4359
	LOAD $literalexpression793 "witness failed" // 4359
	THROW $literalexpression793 // 4377
	@expect_methodcallexpression787: NOP // 4380
@exit_onSend: // 4380
RET // 4381
// Line 228:    }

// ********* onBurn Trigger ***********
@entry_onBurn: // 4382
// Line 229:  
// Line 230:    trigger onBurn(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 4383
POP $from // 4383
PUSH $from // 4385
EXTCALL "Address()" // 4387
POP $from // 4402
ALIAS r2 $to // 4404
POP $to // 4404
PUSH $to // 4406
EXTCALL "Address()" // 4408
POP $to // 4423
ALIAS r3 $symbol // 4425
POP $symbol // 4425
ALIAS r4 $tokenID // 4427
POP $tokenID // 4427
CAST $tokenID $tokenID #Number // 4429
// Line 231:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression808 // 4433
	COPY $from r6 // 4433
	PUSH r6 // 4436
	LOAD $methodcallexpression808 "Runtime.IsWitness" // 4438
	EXTCALL $methodcallexpression808 // 4459
	POP $methodcallexpression808 // 4461
	JMPIF $methodcallexpression808 @expect_methodcallexpression805 // 4463
	ALIAS r6 $literalexpression811 // 4467
	LOAD $literalexpression811 "witness failed" // 4467
	THROW $literalexpression811 // 4485
	@expect_methodcallexpression805: NOP // 4488
@exit_onBurn: // 4488
RET // 4489

// =======> BUILTINS SECTION
@entry_tomb_random_seed: // 505 // 4490
// Line 98:				
// Line 99:	private tomb_random_seed(seed:number) 
ALIAS r1 $seed // 506 // 4491
POP $seed // 506 // 4491
CAST $seed $seed #Number // 508 // 4493
// Line 100:	{
// Line 101:		Storage.write(RND_SEED_KEY, seed);
	ALIAS r2 $methodcallexpression268 // 512 // 4497
	COPY $seed r3 // 512 // 4497
	PUSH r3 // 515 // 4500
	ALIAS r3 $RND_SEED_KEY // 517 // 4502
	LOAD $RND_SEED_KEY "tomb_rnd_seed" // 517 // 4502
	PUSH $RND_SEED_KEY // 534 // 4519
	LOAD $methodcallexpression268 "Data.Set" // 536 // 4521
	EXTCALL $methodcallexpression268 // 548 // 4533
@exit_tomb_random_seed: // 550 // 4535
RET // 551 // 4536
// Line 102:	}

@entry_tomb_random_generate: // 552 // 4537
// Line 103:
// Line 104:	private tomb_random_generate(): number
// Line 105:	{
// Line 106:		local seed: number;
// Line 107:		local context:string = Runtime.context();
	ALIAS r1 $context // 553 // 4538
	ALIAS r2 $methodcallexpression276 // 553 // 4538
	LOAD $methodcallexpression276 "Runtime.Context" // 553 // 4538
	EXTCALL $methodcallexpression276 // 572 // 4557
	POP $methodcallexpression276 // 574 // 4559
	COPY $methodcallexpression276 $context // 576 // 4561
	ALIAS r2 $seed // 579 // 4564
// Line 108:		seed = Storage.read<number>(context, RND_SEED_KEY);
	LOAD r3 3 // field type // 579 // 4564
	PUSH r3 // 584 // 4569
	ALIAS r4 $RND_SEED_KEY // 586 // 4571
	LOAD $RND_SEED_KEY "tomb_rnd_seed" // 586 // 4571
	PUSH $RND_SEED_KEY // 603 // 4588
	COPY $context r4 // 605 // 4590
	PUSH r4 // 608 // 4593
	LOAD r3 "Data.Get" // 610 // 4595
	EXTCALL r3 // 622 // 4607
	POP r3 // 624 // 4609
	COPY r3 $seed // 626 // 4611
// Line 109:		seed = (RND_A * seed) % RND_M;
	ALIAS r3 $RND_A // 629 // 4614
	LOAD $RND_A 16807 // 629 // 4614
	COPY $seed r4 // 635 // 4620
	MUL $RND_A r4 r5 // 638 // 4623
	ALIAS r3 $RND_M // 642 // 4627
	LOAD $RND_M 2147483647 // 642 // 4627
	MOD r5 $RND_M r4 // 650 // 4635
	COPY r4 $seed // 654 // 4639
// Line 110:		Storage.write(RND_SEED_KEY, seed);
	ALIAS r3 $methodcallexpression292 // 657 // 4642
	COPY $seed r4 // 657 // 4642
	PUSH r4 // 660 // 4645
	ALIAS r4 $RND_SEED_KEY // 662 // 4647
	LOAD $RND_SEED_KEY "tomb_rnd_seed" // 662 // 4647
	PUSH $RND_SEED_KEY // 679 // 4664
	LOAD $methodcallexpression292 "Data.Set" // 681 // 4666
	EXTCALL $methodcallexpression292 // 693 // 4678
// Line 111:		return seed;
	COPY $seed r3 // 695 // 4680
	PUSH r3 // 698 // 4683
	JMP @exit_tomb_random_generate // 700 // 4685
@exit_tomb_random_generate: // 703 // 4688
RET // 704 // 4689

