
// ********* getName Property ***********
@entry_getName: // 0
	ALIAS r1 $literalexpression172 // 1
	LOAD $literalexpression172 "Test" // 1
	PUSH $literalexpression172 // 9
	JMP @exit_getName // 11
@exit_getName: // 14
RET // 15

// ********* getSymbol Property ***********
@entry_getSymbol: // 16
	ALIAS r1 $literalexpression176 // 17
	LOAD $literalexpression176 "TST" // 17
	PUSH $literalexpression176 // 24
	JMP @exit_getSymbol // 26
@exit_getSymbol: // 29
RET // 30

// ********* isFungible Property ***********
@entry_isFungible: // 31
	ALIAS r1 $literalexpression180 // 32
	LOAD $literalexpression180 false // 32
	PUSH $literalexpression180 // 37
	JMP @exit_isFungible // 39
@exit_isFungible: // 42
RET // 43

// ********* isFinite Property ***********
@entry_isFinite: // 44
	ALIAS r1 $literalexpression184 // 45
	LOAD $literalexpression184 true // 45
	PUSH $literalexpression184 // 50
	JMP @exit_isFinite // 52
@exit_isFinite: // 55
RET // 56

// ********* isBurnable Property ***********
@entry_isBurnable: // 57
	ALIAS r1 $literalexpression188 // 58
	LOAD $literalexpression188 true // 58
	PUSH $literalexpression188 // 63
	JMP @exit_isBurnable // 65
@exit_isBurnable: // 68
RET // 69

// ********* getMaxSupply Property ***********
@entry_getMaxSupply: // 70
	ALIAS r1 $DOLL_SUPPLY // 71
	LOAD $DOLL_SUPPLY 500 // 71
	PUSH $DOLL_SUPPLY // 77
	JMP @exit_getMaxSupply // 79
@exit_getMaxSupply: // 82
RET // 83

// ********* getOwner Property ***********
@entry_getOwner: // 84
ALIAS r1 $dataGet // 85
LOAD $dataGet "Data.Get" // 85
ALIAS r2 $contractName // 97
LOAD $contractName "SANDY" // 97
ALIAS r3 $owner // 106
// reading global: owner
LOAD r0 8 // 106
PUSH r0 // 111
LOAD r0 "owner" // 113
PUSH r0 // 122
PUSH $contractName // 124
EXTCALL $dataGet // 126
POP $owner // 128
PUSH $owner // 130
EXTCALL "Address()" // 132
POP $owner // 147
	COPY $owner r1 // 149
	PUSH r1 // 152
	JMP @exit_getOwner // 154
@exit_getOwner: // 157
RET // 158
// Line 107:        }
// Line 108:
// Line 109:    }

// ********* Initialize Constructor ***********
@entry_constructor: // 159
ALIAS r1 $nexus_protocol_version // 160
// validate protocol version
LOAD r0 "Runtime.Version" // 160
EXTCALL r0 // 179
POP r0 // 181
LOAD $nexus_protocol_version 8 // 183
LT r0 $nexus_protocol_version r0 // 188
JMPNOT r0 @protocol_version_validated // 192
LOAD r0 "Current nexus protocol version should be 8 or more" // 196
THROW r0 // 250
@protocol_version_validated: NOP // 253
ALIAS r1 $owner // 253
// clearing owns_sandy storage
LOAD r0 "owns_sandy" // 253
PUSH r0 // 267
LOAD r0 "Map.Clear" // 269
EXTCALL r0 // 282
ALIAS r2 $_infusionAmt // 284
// clearing _limbs storage
LOAD r0 "_limbs" // 284
PUSH r0 // 294
LOAD r0 "Map.Clear" // 296
EXTCALL r0 // 309
// clearing _categories storage
LOAD r0 "_categories" // 311
PUSH r0 // 326
LOAD r0 "Map.Clear" // 328
EXTCALL r0 // 341
ALIAS r3 $_infusionTkn // 343
// Line 110:      constructor(con_creator:address)
ALIAS r4 $con_creator // 343
POP $con_creator // 343
PUSH $con_creator // 345
EXTCALL "Address()" // 347
POP $con_creator // 362
// Line 111:    {
// Line 112:        owner = con_creator;
	COPY $con_creator r5 // 364
	COPY r5 $owner // 367
// Line 113:        _infusionTkn = "SOUL";
	ALIAS r5 $literalexpression366 // 370
	LOAD $literalexpression366 "SOUL" // 370
	COPY $literalexpression366 $_infusionTkn // 378
// Line 114:        local assetDecimals:number = 10^Token.getDecimals(_infusionTkn);    
	ALIAS r5 $assetDecimals // 381
	ALIAS r6 $literalexpression367 // 381
	LOAD $literalexpression367 10 // 381
	ALIAS r7 $methodcallexpression368 // 386
	COPY $_infusionTkn r8 // 386
	PUSH r8 // 389
	LOAD $methodcallexpression368 "Runtime.GetTokenDecimals" // 391
	EXTCALL $methodcallexpression368 // 419
	POP $methodcallexpression368 // 421
	POW $literalexpression367 $methodcallexpression368 r8 // 423
	COPY r8 $assetDecimals // 427
// Line 115:        _infusionAmt = 50*assetDecimals;
	ALIAS r6 $literalexpression375 // 430
	LOAD $literalexpression375 50 // 430
	COPY $assetDecimals r7 // 435
	MUL $literalexpression375 r7 r8 // 438
	COPY r8 $_infusionAmt // 442
// Line 116:
// Line 117:        NFT.createSeries(owner, $THIS_SYMBOL,SANDY_SERIESID,DOLL_SUPPLY,TokenSeries.Unique,character);
	ALIAS r6 $methodcallexpression379 // 445
	LOAD r7 0x07076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04590000000107746F6B656E4944030A676574496E666F55524C04B90000000107746F6B656E4944030B676574496D61676555524C04150100000107746F6B656E4944030A676574437265617465640572010000000B67657453616E645479706504CE010000000B676574536B696E54797065042B0200000000 // abi // 445
	PUSH r7 // 610
	LOAD r7 0x0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085800000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B800000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081401000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301087101000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204076372656174656430010102030108CD01000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040873616E6454797065300101020301082A02000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408736B696E54797065300101020301088702000B // script // 612
	PUSH r7 // 1266
	ALIAS r7 $literalexpression391 // 1268
	LOAD $literalexpression391 0 Enum // 1268
	PUSH $literalexpression391 // 1276
	ALIAS r7 $DOLL_SUPPLY // 1278
	LOAD $DOLL_SUPPLY 500 // 1278
	PUSH $DOLL_SUPPLY // 1284
	ALIAS r7 $SANDY_SERIESID // 1286
	LOAD $SANDY_SERIESID 1 // 1286
	PUSH $SANDY_SERIESID // 1291
	ALIAS r7 $literalexpression388 // 1293
	LOAD $literalexpression388 "SANDY" // 1293
	PUSH $literalexpression388 // 1302
	COPY $owner r7 // 1304
	PUSH r7 // 1307
	LOAD $methodcallexpression379 "Nexus.CreateTokenSeries" // 1309
	EXTCALL $methodcallexpression379 // 1336
@exit_constructor: // 1338
LOAD r4 "Data.Set" // 1339
// writing global: owner
PUSH $owner // 1351
LOAD r0 "owner" // 1353
PUSH r0 // 1362
EXTCALL r4 // 1364
// writing global: _infusionAmt
PUSH $_infusionAmt // 1366
LOAD r0 "_infusionAmt" // 1368
PUSH r0 // 1384
EXTCALL r4 // 1386
// writing global: _infusionTkn
PUSH $_infusionTkn // 1388
LOAD r0 "_infusionTkn" // 1390
PUSH r0 // 1406
EXTCALL r4 // 1408
RET // 1410
// Line 118:    }

// ********* transerNFT Method ***********
@entry_transerNFT: // 1411
// Line 119:   
// Line 120:     public transerNFT(from:address,to:address,id:number){
ALIAS r1 $from // 1412
POP $from // 1412
PUSH $from // 1414
EXTCALL "Address()" // 1416
POP $from // 1431
ALIAS r2 $to // 1433
POP $to // 1433
PUSH $to // 1435
EXTCALL "Address()" // 1437
POP $to // 1452
ALIAS r3 $id // 1454
POP $id // 1454
CAST $id $id #Number // 1456
// Line 121:        Runtime.expect(Runtime.isWitness(from),"Must be owner of NFT to Transfer");
	ALIAS r4 $methodcallexpression405 // 1460
	COPY $from r5 // 1460
	PUSH r5 // 1463
	LOAD $methodcallexpression405 "Runtime.IsWitness" // 1465
	EXTCALL $methodcallexpression405 // 1486
	POP $methodcallexpression405 // 1488
	JMPIF $methodcallexpression405 @expect_methodcallexpression402 // 1490
	ALIAS r5 $literalexpression408 // 1494
	LOAD $literalexpression408 "Must be owner of NFT to Transfer" // 1494
	THROW $literalexpression408 // 1530
	@expect_methodcallexpression402: NOP // 1533
// Line 122:        NFT.transfer(from,to,$THIS_SYMBOL,id);
	ALIAS r4 $methodcallexpression410 // 1533
	COPY $id r5 // 1533
	PUSH r5 // 1536
	ALIAS r5 $literalexpression418 // 1538
	LOAD $literalexpression418 "SANDY" // 1538
	PUSH $literalexpression418 // 1547
	COPY $to r5 // 1549
	PUSH r5 // 1552
	COPY $from r5 // 1554
	PUSH r5 // 1557
	LOAD $methodcallexpression410 "Runtime.TransferToken" // 1559
	EXTCALL $methodcallexpression410 // 1584
@exit_transerNFT: // 1586
RET // 1587
// Line 123:    }

// ********* mintBody Method ***********
@entry_mintBody: // 1588
ALIAS r1 $dataGet // 1589
LOAD $dataGet "Data.Get" // 1589
ALIAS r2 $contractName // 1601
LOAD $contractName "SANDY" // 1601
ALIAS r3 $owner // 1610
// reading global: owner
LOAD r0 8 // 1610
PUSH r0 // 1615
LOAD r0 "owner" // 1617
PUSH r0 // 1626
PUSH $contractName // 1628
EXTCALL $dataGet // 1630
POP $owner // 1632
PUSH $owner // 1634
EXTCALL "Address()" // 1636
POP $owner // 1651
ALIAS r4 $_infusionAmt // 1653
// reading global: _infusionAmt
LOAD r0 3 // 1653
PUSH r0 // 1658
LOAD r0 "_infusionAmt" // 1660
PUSH r0 // 1676
PUSH $contractName // 1678
EXTCALL $dataGet // 1680
POP $_infusionAmt // 1682
ALIAS r5 $_infusionTkn // 1684
// reading global: _infusionTkn
LOAD r0 4 // 1684
PUSH r0 // 1689
LOAD r0 "_infusionTkn" // 1691
PUSH r0 // 1707
PUSH $contractName // 1709
EXTCALL $dataGet // 1711
POP $_infusionTkn // 1713
// Line 124:
// Line 125:    public mintBody(to:address,created:timestamp,name:string,description: string,infoURL: string,imageURL: string,sandType: string, skinType: string) 
ALIAS r1 $to // 1715
POP $to // 1715
PUSH $to // 1717
EXTCALL "Address()" // 1719
POP $to // 1734
ALIAS r2 $created // 1736
POP $created // 1736
PUSH $created // 1738
EXTCALL "Timestamp()" // 1740
POP $created // 1757
ALIAS r6 $name // 1759
POP $name // 1759
ALIAS r7 $description // 1761
POP $description // 1761
ALIAS r8 $infoURL // 1763
POP $infoURL // 1763
ALIAS r9 $imageURL // 1765
POP $imageURL // 1765
ALIAS r10 $sandType // 1767
POP $sandType // 1767
ALIAS r11 $skinType // 1769
POP $skinType // 1769
// Line 126:    {
// Line 127:        Runtime.expect(owns_sandy.has(to) == false,"Cannot purchase due to you already owning a SANDY"); 
	LOAD r12 6 // field type // 1771
	PUSH r12 // 1776
	COPY $to r13 // 1778
	PUSH r13 // 1781
	ALIAS r13 $literalexpression458 // 1783
	LOAD $literalexpression458 "owns_sandy" // 1783
	PUSH $literalexpression458 // 1797
	LOAD $literalexpression458 "SANDY" // contract name // 1799
	PUSH $literalexpression458 // 1808
	LOAD r12 "Map.Has" // 1810
	EXTCALL r12 // 1821
	POP r12 // 1823
	ALIAS r13 $literalexpression460 // 1825
	LOAD $literalexpression460 false // 1825
	EQUAL r12 $literalexpression460 r14 // 1830
	JMPIF r14 @expect_methodcallexpression439 // 1834
	ALIAS r12 $literalexpression462 // 1838
	LOAD $literalexpression462 "Cannot purchase due to you already owning a SANDY" // 1838
	THROW $literalexpression462 // 1891
	@expect_methodcallexpression439: NOP // 1894
// Line 128:        Runtime.expect(Runtime.isWitness(to),"Must be witness");
	ALIAS r12 $methodcallexpression467 // 1894
	COPY $to r13 // 1894
	PUSH r13 // 1897
	LOAD $methodcallexpression467 "Runtime.IsWitness" // 1899
	EXTCALL $methodcallexpression467 // 1920
	POP $methodcallexpression467 // 1922
	JMPIF $methodcallexpression467 @expect_methodcallexpression464 // 1924
	ALIAS r13 $literalexpression470 // 1928
	LOAD $literalexpression470 "Must be witness" // 1928
	THROW $literalexpression470 // 1947
	@expect_methodcallexpression464: NOP // 1950
// Line 129:		local rom:body_rom = Struct.body_rom(Time.now(),name,description,infoURL,imageURL,sandType,skinType);
	ALIAS r12 $rom // 1950
	CLEAR r13 // 1950
	ALIAS r15 $methodcallexpression479 // 1952
	LOAD $methodcallexpression479 "Runtime.Time" // 1952
	EXTCALL $methodcallexpression479 // 1968
	POP $methodcallexpression479 // 1970
	LOAD r14 "created" // 1972
	PUT $methodcallexpression479 r13 r14 // 1983
	COPY $name r15 // 1987
	LOAD r14 "name" // 1990
	PUT r15 r13 r14 // 1998
	COPY $description r15 // 2002
	LOAD r14 "description" // 2005
	PUT r15 r13 r14 // 2020
	COPY $infoURL r15 // 2024
	LOAD r14 "infoURL" // 2027
	PUT r15 r13 r14 // 2038
	COPY $imageURL r15 // 2042
	LOAD r14 "imageURL" // 2045
	PUT r15 r13 r14 // 2057
	COPY $sandType r15 // 2061
	LOAD r14 "sandType" // 2064
	PUT r15 r13 r14 // 2076
	COPY $skinType r15 // 2080
	LOAD r14 "skinType" // 2083
	PUT r15 r13 r14 // 2095
	COPY r13 $rom // 2099
// Line 130:        //local ram:body_ram = Struct.body_ram("SANDY");//template name for now
// Line 131:          
// Line 132:            /* Test Can I infust once i Mint to another Address?? Needs to be Tested*/
// Line 133:        local id = NFT.mint(owner,owner, $THIS_SYMBOL, rom,"", SANDY_SERIESID);
	ALIAS r13 $id // 2102
	ALIAS r14 $methodcallexpression488 // 2102
	ALIAS r15 $SANDY_SERIESID // 2102
	LOAD $SANDY_SERIESID 1 // 2102
	PUSH $SANDY_SERIESID // 2107
	ALIAS r15 $literalexpression500 // 2109
	LOAD $literalexpression500 "" // 2109
	CAST $literalexpression500 $literalexpression500 #Bytes // 2113
	PUSH $literalexpression500 // 2117
	COPY $rom r15 // 2119
	CAST r15 r15 #Bytes // 2122
	PUSH r15 // 2126
	ALIAS r15 $literalexpression498 // 2128
	LOAD $literalexpression498 "SANDY" // 2128
	PUSH $literalexpression498 // 2137
	COPY $owner r15 // 2139
	PUSH r15 // 2142
	COPY $owner r15 // 2144
	PUSH r15 // 2147
	LOAD $methodcallexpression488 "Runtime.MintToken" // 2149
	EXTCALL $methodcallexpression488 // 2170
	POP $methodcallexpression488 // 2172
	COPY $methodcallexpression488 $id // 2174
// Line 134:        NFT.infuse(owner, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
	ALIAS r14 $methodcallexpression505 // 2177
	COPY $_infusionAmt r15 // 2177
	PUSH r15 // 2180
	COPY $_infusionTkn r15 // 2182
	PUSH r15 // 2185
	COPY $id r15 // 2187
	PUSH r15 // 2190
	ALIAS r15 $literalexpression513 // 2192
	LOAD $literalexpression513 "SANDY" // 2192
	PUSH $literalexpression513 // 2201
	COPY $owner r15 // 2203
	PUSH r15 // 2206
	LOAD $methodcallexpression505 "Runtime.InfuseToken" // 2208
	EXTCALL $methodcallexpression505 // 2231
// Line 135:        this.transerNFT(owner,to,id);
	ALIAS r14 $methodcallexpression518 // 2233
	COPY $id r15 // 2233
	PUSH r15 // 2236
	COPY $to r15 // 2238
	PUSH r15 // 2241
	COPY $owner r15 // 2243
	PUSH r15 // 2246
	CALL @entry_transerNFT // 2248
// Line 136:        owns_sandy.set(to,true);
	ALIAS r14 $methodcallexpression526 // 2252
	ALIAS r15 $literalexpression534 // 2252
	LOAD $literalexpression534 true // 2252
	PUSH $literalexpression534 // 2257
	COPY $to r15 // 2259
	PUSH r15 // 2262
	ALIAS r15 $literalexpression532 // 2264
	LOAD $literalexpression532 "owns_sandy" // 2264
	PUSH $literalexpression532 // 2278
	LOAD $methodcallexpression526 "Map.Set" // 2280
	EXTCALL $methodcallexpression526 // 2291
@exit_mintBody: // 2293
RET // 2294
// Line 137:    } 

// ********* initMint Method ***********
@entry_initMint: // 2295
ALIAS r1 $dataGet // 2296
LOAD $dataGet "Data.Get" // 2296
ALIAS r2 $contractName // 2308
LOAD $contractName "SANDY" // 2308
ALIAS r3 $owner // 2317
// reading global: owner
LOAD r0 8 // 2317
PUSH r0 // 2322
LOAD r0 "owner" // 2324
PUSH r0 // 2333
PUSH $contractName // 2335
EXTCALL $dataGet // 2337
POP $owner // 2339
PUSH $owner // 2341
EXTCALL "Address()" // 2343
POP $owner // 2358
// Line 138:    
// Line 139:     private initMint(seriesID:number,name: string,description: string,infoURL: string,imageURL: string){
ALIAS r1 $seriesID // 2360
POP $seriesID // 2360
CAST $seriesID $seriesID #Number // 2362
ALIAS r2 $name // 2366
POP $name // 2366
ALIAS r4 $description // 2368
POP $description // 2368
ALIAS r5 $infoURL // 2370
POP $infoURL // 2370
ALIAS r6 $imageURL // 2372
POP $imageURL // 2372
// Line 140:        local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
	ALIAS r7 $rom // 2374
	CLEAR r8 // 2374
	COPY $name r10 // 2376
	LOAD r9 "name" // 2379
	PUT r10 r8 r9 // 2387
	COPY $description r10 // 2391
	LOAD r9 "description" // 2394
	PUT r10 r8 r9 // 2409
	COPY $infoURL r10 // 2413
	LOAD r9 "infoURL" // 2416
	PUT r10 r8 r9 // 2427
	COPY $imageURL r10 // 2431
	LOAD r9 "imageURL" // 2434
	PUT r10 r8 r9 // 2446
	COPY r8 $rom // 2450
// Line 141:        local id: number = NFT.mint(owner,owner, $THIS_SYMBOL, rom,"",seriesID);
	ALIAS r8 $id // 2453
	ALIAS r9 $methodcallexpression558 // 2453
	COPY $seriesID r10 // 2453
	PUSH r10 // 2456
	ALIAS r10 $literalexpression570 // 2458
	LOAD $literalexpression570 "" // 2458
	CAST $literalexpression570 $literalexpression570 #Bytes // 2462
	PUSH $literalexpression570 // 2466
	COPY $rom r10 // 2468
	CAST r10 r10 #Bytes // 2471
	PUSH r10 // 2475
	ALIAS r10 $literalexpression568 // 2477
	LOAD $literalexpression568 "SANDY" // 2477
	PUSH $literalexpression568 // 2486
	COPY $owner r10 // 2488
	PUSH r10 // 2491
	COPY $owner r10 // 2493
	PUSH r10 // 2496
	LOAD $methodcallexpression558 "Runtime.MintToken" // 2498
	EXTCALL $methodcallexpression558 // 2519
	POP $methodcallexpression558 // 2521
	COPY $methodcallexpression558 $id // 2523
@exit_initMint: // 2526
RET // 2527
// Line 142:    }

// ********* createLimb Method ***********
@entry_createLimb: // 2528
ALIAS r1 $dataGet // 2529
LOAD $dataGet "Data.Get" // 2529
ALIAS r2 $contractName // 2541
LOAD $contractName "SANDY" // 2541
ALIAS r3 $owner // 2550
// reading global: owner
LOAD r0 8 // 2550
PUSH r0 // 2555
LOAD r0 "owner" // 2557
PUSH r0 // 2566
PUSH $contractName // 2568
EXTCALL $dataGet // 2570
POP $owner // 2572
PUSH $owner // 2574
EXTCALL "Address()" // 2576
POP $owner // 2591
// Line 143:  
// Line 144:	//@Param seriesId - Must be a unique number, could use UID.generate()
// Line 145:    public createLimb(seriesID:number,limbSupply:number,name: string,description: string,infoURL: string,imageURL: string){
ALIAS r1 $seriesID // 2593
POP $seriesID // 2593
CAST $seriesID $seriesID #Number // 2595
ALIAS r2 $limbSupply // 2599
POP $limbSupply // 2599
CAST $limbSupply $limbSupply #Number // 2601
ALIAS r4 $name // 2605
POP $name // 2605
ALIAS r5 $description // 2607
POP $description // 2607
ALIAS r6 $infoURL // 2609
POP $infoURL // 2609
ALIAS r7 $imageURL // 2611
POP $imageURL // 2611
// Line 146:        Runtime.expect(Runtime.isWitness(owner),"Must be owner of contract");
	ALIAS r8 $methodcallexpression592 // 2613
	COPY $owner r9 // 2613
	PUSH r9 // 2616
	LOAD $methodcallexpression592 "Runtime.IsWitness" // 2618
	EXTCALL $methodcallexpression592 // 2639
	POP $methodcallexpression592 // 2641
	JMPIF $methodcallexpression592 @expect_methodcallexpression589 // 2643
	ALIAS r9 $literalexpression595 // 2647
	LOAD $literalexpression595 "Must be owner of contract" // 2647
	THROW $literalexpression595 // 2676
	@expect_methodcallexpression589: NOP // 2679
// Line 147:        NFT.createSeries(owner, $THIS_SYMBOL,seriesID,limbSupply,TokenSeries.Duplicated,limb);
	ALIAS r8 $methodcallexpression597 // 2679
	LOAD r9 0x04076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04590000000107746F6B656E4944030A676574496E666F55524C04B90000000107746F6B656E4944030B676574496D61676555524C04150100000107746F6B656E49440300 // abi // 2679
	PUSH r9 // 2791
	LOAD r9 0x0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085800000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B800000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081401000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301087101000B // script // 2793
	PUSH r9 // 3169
	ALIAS r9 $literalexpression609 // 3171
	LOAD $literalexpression609 1 Enum // 3171
	PUSH $literalexpression609 // 3179
	COPY $limbSupply r9 // 3181
	PUSH r9 // 3184
	COPY $seriesID r9 // 3186
	PUSH r9 // 3189
	ALIAS r9 $literalexpression606 // 3191
	LOAD $literalexpression606 "SANDY" // 3191
	PUSH $literalexpression606 // 3200
	COPY $owner r9 // 3202
	PUSH r9 // 3205
	LOAD $methodcallexpression597 "Nexus.CreateTokenSeries" // 3207
	EXTCALL $methodcallexpression597 // 3234
// Line 148:        local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
	ALIAS r8 $rom // 3236
	CLEAR r9 // 3236
	COPY $name r11 // 3238
	LOAD r10 "name" // 3241
	PUT r11 r9 r10 // 3249
	COPY $description r11 // 3253
	LOAD r10 "description" // 3256
	PUT r11 r9 r10 // 3271
	COPY $infoURL r11 // 3275
	LOAD r10 "infoURL" // 3278
	PUT r11 r9 r10 // 3289
	COPY $imageURL r11 // 3293
	LOAD r10 "imageURL" // 3296
	PUT r11 r9 r10 // 3308
	COPY r9 $rom // 3312
// Line 149:        this.initMint(seriesID,name,description,infoURL,imageURL);
	ALIAS r9 $methodcallexpression623 // 3315
	COPY $imageURL r10 // 3315
	PUSH r10 // 3318
	COPY $infoURL r10 // 3320
	PUSH r10 // 3323
	COPY $description r10 // 3325
	PUSH r10 // 3328
	COPY $name r10 // 3330
	PUSH r10 // 3333
	COPY $seriesID r10 // 3335
	PUSH r10 // 3338
	CALL @entry_initMint // 3340
@exit_createLimb: // 3344
RET // 3345
// Line 150:    }

// ********* mintLimb Method ***********
@entry_mintLimb: // 3346
// Line 151:
// Line 152:   
// Line 153:    //should give you a random limb back
// Line 154:    public mintLimb(from:address,to:address,seriesID:number)
ALIAS r1 $from // 3347
POP $from // 3347
PUSH $from // 3349
EXTCALL "Address()" // 3351
POP $from // 3366
ALIAS r2 $to // 3368
POP $to // 3368
PUSH $to // 3370
EXTCALL "Address()" // 3372
POP $to // 3387
ALIAS r3 $seriesID // 3389
POP $seriesID // 3389
CAST $seriesID $seriesID #Number // 3391
// Line 155:    {   
// Line 156:        Runtime.expect(Runtime.isWitness(from),"Must be a witness");
	ALIAS r4 $methodcallexpression646 // 3395
	COPY $from r5 // 3395
	PUSH r5 // 3398
	LOAD $methodcallexpression646 "Runtime.IsWitness" // 3400
	EXTCALL $methodcallexpression646 // 3421
	POP $methodcallexpression646 // 3423
	JMPIF $methodcallexpression646 @expect_methodcallexpression643 // 3425
	ALIAS r5 $literalexpression649 // 3429
	LOAD $literalexpression649 "Must be a witness" // 3429
	THROW $literalexpression649 // 3450
	@expect_methodcallexpression643: NOP // 3453
// Line 157:        //need to randomize seriesId -> this is assuming all I need is a seriesID.
// Line 158:        //do randomization for SeriesID;
// Line 159:        local id: number = NFT.mint(from,to, $THIS_SYMBOL,"","",seriesID);
	ALIAS r4 $id // 3453
	ALIAS r5 $methodcallexpression650 // 3453
	COPY $seriesID r6 // 3453
	PUSH r6 // 3456
	ALIAS r6 $literalexpression662 // 3458
	LOAD $literalexpression662 "" // 3458
	CAST $literalexpression662 $literalexpression662 #Bytes // 3462
	PUSH $literalexpression662 // 3466
	ALIAS r6 $literalexpression661 // 3468
	LOAD $literalexpression661 "" // 3468
	CAST $literalexpression661 $literalexpression661 #Bytes // 3472
	PUSH $literalexpression661 // 3476
	ALIAS r6 $literalexpression660 // 3478
	LOAD $literalexpression660 "SANDY" // 3478
	PUSH $literalexpression660 // 3487
	COPY $to r6 // 3489
	PUSH r6 // 3492
	COPY $from r6 // 3494
	PUSH r6 // 3497
	LOAD $methodcallexpression650 "Runtime.MintToken" // 3499
	EXTCALL $methodcallexpression650 // 3520
	POP $methodcallexpression650 // 3522
	COPY $methodcallexpression650 $id // 3524
@exit_mintLimb: // 3527
RET // 3528
// Line 160:    }

// ********* editSANDY Method ***********
@entry_editSANDY: // 3529
// Line 161:
// Line 162:    
// Line 163:
// Line 164:    //Will deprecated and used for somthing else
// Line 165:	//will have to make sure that the owner is the only one who can edit the sandy name
// Line 166:    public editSANDY(nftOwner:address,tokenID:number,name:string){
ALIAS r1 $nftOwner // 3530
POP $nftOwner // 3530
PUSH $nftOwner // 3532
EXTCALL "Address()" // 3534
POP $nftOwner // 3549
ALIAS r2 $tokenID // 3551
POP $tokenID // 3551
CAST $tokenID $tokenID #Number // 3553
ALIAS r3 $name // 3557
POP $name // 3557
// Line 167:        Runtime.expect(Runtime.isWitness(nftOwner),"Must be owner of NFT");//have to find a way to get current nft owner
	ALIAS r4 $methodcallexpression678 // 3559
	COPY $nftOwner r5 // 3559
	PUSH r5 // 3562
	LOAD $methodcallexpression678 "Runtime.IsWitness" // 3564
	EXTCALL $methodcallexpression678 // 3585
	POP $methodcallexpression678 // 3587
	JMPIF $methodcallexpression678 @expect_methodcallexpression675 // 3589
	ALIAS r5 $literalexpression681 // 3593
	LOAD $literalexpression681 "Must be owner of NFT" // 3593
	THROW $literalexpression681 // 3617
	@expect_methodcallexpression675: NOP // 3620
// Line 168:		local editRam:body_ram = Struct.body_ram();
	ALIAS r4 $editRam // 3620
	CLEAR r5 // 3620
	COPY r5 $editRam // 3622
// Line 169:		//my assumption that write must follow the order of the struct 
// Line 170:        NFT.write(nftOwner,$THIS_SYMBOL,tokenID,editRam);//changeable data
	ALIAS r5 $methodcallexpression686 // 3625
	COPY $editRam r6 // 3625
	CAST r6 r6 #Bytes // 3628
	PUSH r6 // 3632
	COPY $tokenID r6 // 3634
	PUSH r6 // 3637
	ALIAS r6 $literalexpression693 // 3639
	LOAD $literalexpression693 "SANDY" // 3639
	PUSH $literalexpression693 // 3648
	COPY $nftOwner r6 // 3650
	PUSH r6 // 3653
	LOAD $methodcallexpression686 "Runtime.WriteToken" // 3655
	EXTCALL $methodcallexpression686 // 3677
@exit_editSANDY: // 3679
RET // 3680
// Line 171:
// Line 172:
// Line 173:    }

// ********* getRom Method ***********
@entry_getRom: // 3681
// Line 174:    //need to get readable rom 
// Line 175:    
// Line 176:    //- How do I make return type a struct initiialized to the rom size
// Line 177:    public getRom(symbol:string, id:number):body_rom {
ALIAS r1 $symbol // 3682
POP $symbol // 3682
ALIAS r2 $id // 3684
POP $id // 3684
CAST $id $id #Number // 3686
// Line 178:         local nftROM:body_rom = NFT.readROM<body_rom>($THIS_SYMBOL, id);
	ALIAS r3 $nftROM // 3690
	ALIAS r4 $methodcallexpression702 // 3690
	COPY $id r5 // 3690
	PUSH r5 // 3693
	ALIAS r5 $literalexpression706 // 3695
	LOAD $literalexpression706 "SANDY" // 3695
	PUSH $literalexpression706 // 3704
	LOAD $methodcallexpression702 "Runtime.ReadTokenROM" // 3706
	EXTCALL $methodcallexpression702 // 3730
	POP $methodcallexpression702 // 3732
	UNPACK $methodcallexpression702 $methodcallexpression702 // 3734
	COPY $methodcallexpression702 $nftROM // 3737
// Line 179:         return nftROM;
	COPY $nftROM r4 // 3740
	PUSH r4 // 3743
	JMP @exit_getRom // 3745
@exit_getRom: // 3748
RET // 3749
// Line 180:    }

// ********* getRam Method ***********
@entry_getRam: // 3750
// Line 181:
// Line 182:    public getRam(symbol:string, id:number): body_ram
ALIAS r1 $symbol // 3751
POP $symbol // 3751
ALIAS r2 $id // 3753
POP $id // 3753
CAST $id $id #Number // 3755
// Line 183:    {
// Line 184:        local nftRAM:body_ram = NFT.readRAM<body_ram>($THIS_SYMBOL, id);
	ALIAS r3 $nftRAM // 3759
	ALIAS r4 $methodcallexpression718 // 3759
	COPY $id r5 // 3759
	PUSH r5 // 3762
	ALIAS r5 $literalexpression722 // 3764
	LOAD $literalexpression722 "SANDY" // 3764
	PUSH $literalexpression722 // 3773
	LOAD $methodcallexpression718 "Runtime.ReadTokenRAM" // 3775
	EXTCALL $methodcallexpression718 // 3799
	POP $methodcallexpression718 // 3801
	UNPACK $methodcallexpression718 $methodcallexpression718 // 3803
	COPY $methodcallexpression718 $nftRAM // 3806
// Line 185:        return nftRAM;
	COPY $nftRAM r4 // 3809
	PUSH r4 // 3812
	JMP @exit_getRam // 3814
@exit_getRam: // 3817
RET // 3818
// Line 186:    }

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 3819
ALIAS r1 $dataGet // 3820
LOAD $dataGet "Data.Get" // 3820
ALIAS r2 $contractName // 3832
LOAD $contractName "SANDY" // 3832
ALIAS r3 $owner // 3841
// reading global: owner
LOAD r0 8 // 3841
PUSH r0 // 3846
LOAD r0 "owner" // 3848
PUSH r0 // 3857
PUSH $contractName // 3859
EXTCALL $dataGet // 3861
POP $owner // 3863
PUSH $owner // 3865
EXTCALL "Address()" // 3867
POP $owner // 3882
// Line 187:
// Line 188:    trigger onUpgrade(from:address)
ALIAS r1 $from // 3884
POP $from // 3884
PUSH $from // 3886
EXTCALL "Address()" // 3888
POP $from // 3903
// Line 189:    {
// Line 190:        // check is witness and is current owner
// Line 191:		Runtime.expect(Runtime.isWitness(owner), "invalid witness");
	ALIAS r2 $methodcallexpression736 // 3905
	COPY $owner r4 // 3905
	PUSH r4 // 3908
	LOAD $methodcallexpression736 "Runtime.IsWitness" // 3910
	EXTCALL $methodcallexpression736 // 3931
	POP $methodcallexpression736 // 3933
	JMPIF $methodcallexpression736 @expect_methodcallexpression733 // 3935
	ALIAS r4 $literalexpression739 // 3939
	LOAD $literalexpression739 "invalid witness" // 3939
	THROW $literalexpression739 // 3958
	@expect_methodcallexpression733: NOP // 3961
@exit_onUpgrade: // 3961
RET // 3962
// Line 192:    }

// ********* onMint Trigger ***********
@entry_onMint: // 3963
// Line 193:    //Mint function
// Line 194:    trigger onMint(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 3964
POP $from // 3964
PUSH $from // 3966
EXTCALL "Address()" // 3968
POP $from // 3983
ALIAS r2 $to // 3985
POP $to // 3985
PUSH $to // 3987
EXTCALL "Address()" // 3989
POP $to // 4004
ALIAS r3 $symbol // 4006
POP $symbol // 4006
ALIAS r4 $tokenID // 4008
POP $tokenID // 4008
CAST $tokenID $tokenID #Number // 4010
// Line 195:		Runtime.expect(symbol == $THIS_SYMBOL, "symbol mismatch");
	COPY $symbol r5 // 4014
	ALIAS r6 $literalexpression756 // 4017
	LOAD $literalexpression756 "SANDY" // 4017
	EQUAL r5 $literalexpression756 r7 // 4026
	JMPIF r7 @expect_methodcallexpression751 // 4030
	ALIAS r5 $literalexpression758 // 4034
	LOAD $literalexpression758 "symbol mismatch" // 4034
	THROW $literalexpression758 // 4053
	@expect_methodcallexpression751: NOP // 4056
@exit_onMint: // 4056
RET // 4057
// Line 196:        //might need to add NFT owns to right here 
// Line 197:    }

// ********* onInfuse Trigger ***********
@entry_onInfuse: // 4058
// Line 198:    trigger onInfuse(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 4059
POP $from // 4059
PUSH $from // 4061
EXTCALL "Address()" // 4063
POP $from // 4078
ALIAS r2 $to // 4080
POP $to // 4080
PUSH $to // 4082
EXTCALL "Address()" // 4084
POP $to // 4099
ALIAS r3 $symbol // 4101
POP $symbol // 4101
ALIAS r4 $tokenID // 4103
POP $tokenID // 4103
CAST $tokenID $tokenID #Number // 4105
// Line 199:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression773 // 4109
	COPY $from r6 // 4109
	PUSH r6 // 4112
	LOAD $methodcallexpression773 "Runtime.IsWitness" // 4114
	EXTCALL $methodcallexpression773 // 4135
	POP $methodcallexpression773 // 4137
	JMPIF $methodcallexpression773 @expect_methodcallexpression770 // 4139
	ALIAS r6 $literalexpression776 // 4143
	LOAD $literalexpression776 "witness failed" // 4143
	THROW $literalexpression776 // 4161
	@expect_methodcallexpression770: NOP // 4164
@exit_onInfuse: // 4164
RET // 4165
// Line 200:    }

// ********* onSeries Trigger ***********
@entry_onSeries: // 4166
// Line 201:
// Line 202:    trigger onSeries(from: address){
ALIAS r1 $from // 4167
POP $from // 4167
PUSH $from // 4169
EXTCALL "Address()" // 4171
POP $from // 4186
// Line 203:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression785 // 4188
	COPY $from r3 // 4188
	PUSH r3 // 4191
	LOAD $methodcallexpression785 "Runtime.IsWitness" // 4193
	EXTCALL $methodcallexpression785 // 4214
	POP $methodcallexpression785 // 4216
	JMPIF $methodcallexpression785 @expect_methodcallexpression782 // 4218
	ALIAS r3 $literalexpression788 // 4222
	LOAD $literalexpression788 "witness failed" // 4222
	THROW $literalexpression788 // 4240
	@expect_methodcallexpression782: NOP // 4243
@exit_onSeries: // 4243
RET // 4244
// Line 204:    }

// ********* onWrite Trigger ***********
@entry_onWrite: // 4245
// Line 205:    trigger onWrite(from: address,data:number){
ALIAS r1 $from // 4246
POP $from // 4246
PUSH $from // 4248
EXTCALL "Address()" // 4250
POP $from // 4265
ALIAS r2 $data // 4267
POP $data // 4267
CAST $data $data #Number // 4269
// Line 206:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression799 // 4273
	COPY $from r4 // 4273
	PUSH r4 // 4276
	LOAD $methodcallexpression799 "Runtime.IsWitness" // 4278
	EXTCALL $methodcallexpression799 // 4299
	POP $methodcallexpression799 // 4301
	JMPIF $methodcallexpression799 @expect_methodcallexpression796 // 4303
	ALIAS r4 $literalexpression802 // 4307
	LOAD $literalexpression802 "witness failed" // 4307
	THROW $literalexpression802 // 4325
	@expect_methodcallexpression796: NOP // 4328
@exit_onWrite: // 4328
RET // 4329
// Line 207:    }

// ********* onSend Trigger ***********
@entry_onSend: // 4330
// Line 208:    trigger onSend(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 4331
POP $from // 4331
PUSH $from // 4333
EXTCALL "Address()" // 4335
POP $from // 4350
ALIAS r2 $to // 4352
POP $to // 4352
PUSH $to // 4354
EXTCALL "Address()" // 4356
POP $to // 4371
ALIAS r3 $symbol // 4373
POP $symbol // 4373
ALIAS r4 $tokenID // 4375
POP $tokenID // 4375
CAST $tokenID $tokenID #Number // 4377
// Line 209:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression817 // 4381
	COPY $from r6 // 4381
	PUSH r6 // 4384
	LOAD $methodcallexpression817 "Runtime.IsWitness" // 4386
	EXTCALL $methodcallexpression817 // 4407
	POP $methodcallexpression817 // 4409
	JMPIF $methodcallexpression817 @expect_methodcallexpression814 // 4411
	ALIAS r6 $literalexpression820 // 4415
	LOAD $literalexpression820 "witness failed" // 4415
	THROW $literalexpression820 // 4433
	@expect_methodcallexpression814: NOP // 4436
@exit_onSend: // 4436
RET // 4437
// Line 210:    }

// ********* onBurn Trigger ***********
@entry_onBurn: // 4438
// Line 211:  
// Line 212:    trigger onBurn(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 4439
POP $from // 4439
PUSH $from // 4441
EXTCALL "Address()" // 4443
POP $from // 4458
ALIAS r2 $to // 4460
POP $to // 4460
PUSH $to // 4462
EXTCALL "Address()" // 4464
POP $to // 4479
ALIAS r3 $symbol // 4481
POP $symbol // 4481
ALIAS r4 $tokenID // 4483
POP $tokenID // 4483
CAST $tokenID $tokenID #Number // 4485
// Line 213:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression835 // 4489
	COPY $from r6 // 4489
	PUSH r6 // 4492
	LOAD $methodcallexpression835 "Runtime.IsWitness" // 4494
	EXTCALL $methodcallexpression835 // 4515
	POP $methodcallexpression835 // 4517
	JMPIF $methodcallexpression835 @expect_methodcallexpression832 // 4519
	ALIAS r6 $literalexpression838 // 4523
	LOAD $literalexpression838 "witness failed" // 4523
	THROW $literalexpression838 // 4541
	@expect_methodcallexpression832: NOP // 4544
@exit_onBurn: // 4544
RET // 4545
