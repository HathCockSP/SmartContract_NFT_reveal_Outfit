
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
	LOAD $literalexpression176 "STST" // 17
	PUSH $literalexpression176 // 25
	JMP @exit_getSymbol // 27
@exit_getSymbol: // 30
RET // 31

// ********* isFungible Property ***********
@entry_isFungible: // 32
	ALIAS r1 $literalexpression180 // 33
	LOAD $literalexpression180 false // 33
	PUSH $literalexpression180 // 38
	JMP @exit_isFungible // 40
@exit_isFungible: // 43
RET // 44

// ********* isFinite Property ***********
@entry_isFinite: // 45
	ALIAS r1 $literalexpression184 // 46
	LOAD $literalexpression184 true // 46
	PUSH $literalexpression184 // 51
	JMP @exit_isFinite // 53
@exit_isFinite: // 56
RET // 57

// ********* isBurnable Property ***********
@entry_isBurnable: // 58
	ALIAS r1 $literalexpression188 // 59
	LOAD $literalexpression188 true // 59
	PUSH $literalexpression188 // 64
	JMP @exit_isBurnable // 66
@exit_isBurnable: // 69
RET // 70

// ********* getMaxSupply Property ***********
@entry_getMaxSupply: // 71
	ALIAS r1 $literalexpression192 // 72
	LOAD $literalexpression192 70000 // 72
	PUSH $literalexpression192 // 79
	JMP @exit_getMaxSupply // 81
@exit_getMaxSupply: // 84
RET // 85

// ********* getOwner Property ***********
@entry_getOwner: // 86
ALIAS r1 $dataGet // 87
LOAD $dataGet "Data.Get" // 87
ALIAS r2 $contractName // 99
LOAD $contractName "STST" // 99
ALIAS r3 $owner // 107
// reading global: owner
LOAD r0 8 // 107
PUSH r0 // 112
LOAD r0 "owner" // 114
PUSH r0 // 123
PUSH $contractName // 125
EXTCALL $dataGet // 127
POP $owner // 129
PUSH $owner // 131
EXTCALL "Address()" // 133
POP $owner // 148
	COPY $owner r1 // 150
	PUSH r1 // 153
	JMP @exit_getOwner // 155
@exit_getOwner: // 158
RET // 159
// Line 108:        }
// Line 109:
// Line 110:    }

// ********* Initialize Constructor ***********
@entry_constructor: // 160
ALIAS r1 $nexus_protocol_version // 161
// validate protocol version
LOAD r0 "Runtime.Version" // 161
EXTCALL r0 // 180
POP r0 // 182
LOAD $nexus_protocol_version 8 // 184
LT r0 $nexus_protocol_version r0 // 189
JMPNOT r0 @protocol_version_validated // 193
LOAD r0 "Current nexus protocol version should be 8 or more" // 197
THROW r0 // 251
@protocol_version_validated: NOP // 254
ALIAS r1 $owner // 254
// clearing owns_sandy storage
LOAD r0 "owns_sandy" // 254
PUSH r0 // 268
LOAD r0 "Map.Clear" // 270
EXTCALL r0 // 283
ALIAS r2 $_infusionAmt // 285
// clearing _limbs storage
LOAD r0 "_limbs" // 285
PUSH r0 // 295
LOAD r0 "Map.Clear" // 297
EXTCALL r0 // 310
// clearing _categories storage
LOAD r0 "_categories" // 312
PUSH r0 // 327
LOAD r0 "Map.Clear" // 329
EXTCALL r0 // 342
ALIAS r3 $_infusionTkn // 344
// Line 111:      constructor(con_creator:address)
ALIAS r4 $con_creator // 344
POP $con_creator // 344
PUSH $con_creator // 346
EXTCALL "Address()" // 348
POP $con_creator // 363
// Line 112:    {
// Line 113:        owner = con_creator;
	COPY $con_creator r5 // 365
	COPY r5 $owner // 368
// Line 114:        _infusionTkn = "SOUL";
	ALIAS r5 $literalexpression366 // 371
	LOAD $literalexpression366 "SOUL" // 371
	COPY $literalexpression366 $_infusionTkn // 379
// Line 115:        local assetDecimals:number = 10^Token.getDecimals(_infusionTkn);    
	ALIAS r5 $assetDecimals // 382
	ALIAS r6 $literalexpression367 // 382
	LOAD $literalexpression367 10 // 382
	ALIAS r7 $methodcallexpression368 // 387
	COPY $_infusionTkn r8 // 387
	PUSH r8 // 390
	LOAD $methodcallexpression368 "Runtime.GetTokenDecimals" // 392
	EXTCALL $methodcallexpression368 // 420
	POP $methodcallexpression368 // 422
	POW $literalexpression367 $methodcallexpression368 r8 // 424
	COPY r8 $assetDecimals // 428
// Line 116:        _infusionAmt = 50*assetDecimals;
	ALIAS r6 $literalexpression375 // 431
	LOAD $literalexpression375 50 // 431
	COPY $assetDecimals r7 // 436
	MUL $literalexpression375 r7 r8 // 439
	COPY r8 $_infusionAmt // 443
// Line 117:
// Line 118:        NFT.createSeries(owner, $THIS_SYMBOL,SANDY_SERIESID,DOLL_SUPPLY,TokenSeries.Unique,character);
	ALIAS r6 $methodcallexpression379 // 446
	LOAD r7 0x07076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030A676574496E666F55524C04B70000000107746F6B656E4944030B676574496D61676555524C04120100000107746F6B656E4944030A67657443726561746564056E010000000B67657453616E645479706504C9010000000B676574536B696E5479706504250200000000 // abi // 446
	PUSH r7 // 611
	LOAD r7 0x0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B600000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081101000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301086D01000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204076372656174656430010102030108C801000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040873616E6454797065300101020301082402000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408736B696E54797065300101020301088002000B // script // 613
	PUSH r7 // 1260
	ALIAS r7 $literalexpression391 // 1262
	LOAD $literalexpression391 0 Enum // 1262
	PUSH $literalexpression391 // 1270
	ALIAS r7 $DOLL_SUPPLY // 1272
	LOAD $DOLL_SUPPLY 500 // 1272
	PUSH $DOLL_SUPPLY // 1278
	ALIAS r7 $SANDY_SERIESID // 1280
	LOAD $SANDY_SERIESID 1 // 1280
	PUSH $SANDY_SERIESID // 1285
	ALIAS r7 $literalexpression388 // 1287
	LOAD $literalexpression388 "STST" // 1287
	PUSH $literalexpression388 // 1295
	COPY $owner r7 // 1297
	PUSH r7 // 1300
	LOAD $methodcallexpression379 "Nexus.CreateTokenSeries" // 1302
	EXTCALL $methodcallexpression379 // 1329
@exit_constructor: // 1331
LOAD r4 "Data.Set" // 1332
// writing global: owner
PUSH $owner // 1344
LOAD r0 "owner" // 1346
PUSH r0 // 1355
EXTCALL r4 // 1357
// writing global: _infusionAmt
PUSH $_infusionAmt // 1359
LOAD r0 "_infusionAmt" // 1361
PUSH r0 // 1377
EXTCALL r4 // 1379
// writing global: _infusionTkn
PUSH $_infusionTkn // 1381
LOAD r0 "_infusionTkn" // 1383
PUSH r0 // 1399
EXTCALL r4 // 1401
RET // 1403
// Line 119:    }

// ********* transerNFT Method ***********
@entry_transerNFT: // 1404
// Line 120:   
// Line 121:     public transerNFT(from:address,to:address,id:number){
ALIAS r1 $from // 1405
POP $from // 1405
PUSH $from // 1407
EXTCALL "Address()" // 1409
POP $from // 1424
ALIAS r2 $to // 1426
POP $to // 1426
PUSH $to // 1428
EXTCALL "Address()" // 1430
POP $to // 1445
ALIAS r3 $id // 1447
POP $id // 1447
CAST $id $id #Number // 1449
// Line 122:        Runtime.expect(Runtime.isWitness(from),"Must be owner of NFT to Transfer");
	ALIAS r4 $methodcallexpression405 // 1453
	COPY $from r5 // 1453
	PUSH r5 // 1456
	LOAD $methodcallexpression405 "Runtime.IsWitness" // 1458
	EXTCALL $methodcallexpression405 // 1479
	POP $methodcallexpression405 // 1481
	JMPIF $methodcallexpression405 @expect_methodcallexpression402 // 1483
	ALIAS r5 $literalexpression408 // 1487
	LOAD $literalexpression408 "Must be owner of NFT to Transfer" // 1487
	THROW $literalexpression408 // 1523
	@expect_methodcallexpression402: NOP // 1526
// Line 123:        NFT.transfer(from,to,$THIS_SYMBOL,id);
	ALIAS r4 $methodcallexpression410 // 1526
	COPY $id r5 // 1526
	PUSH r5 // 1529
	ALIAS r5 $literalexpression418 // 1531
	LOAD $literalexpression418 "STST" // 1531
	PUSH $literalexpression418 // 1539
	COPY $to r5 // 1541
	PUSH r5 // 1544
	COPY $from r5 // 1546
	PUSH r5 // 1549
	LOAD $methodcallexpression410 "Runtime.TransferToken" // 1551
	EXTCALL $methodcallexpression410 // 1576
@exit_transerNFT: // 1578
RET // 1579
// Line 124:    }

// ********* mintBody Method ***********
@entry_mintBody: // 1580
ALIAS r1 $dataGet // 1581
LOAD $dataGet "Data.Get" // 1581
ALIAS r2 $contractName // 1593
LOAD $contractName "STST" // 1593
ALIAS r3 $owner // 1601
// reading global: owner
LOAD r0 8 // 1601
PUSH r0 // 1606
LOAD r0 "owner" // 1608
PUSH r0 // 1617
PUSH $contractName // 1619
EXTCALL $dataGet // 1621
POP $owner // 1623
PUSH $owner // 1625
EXTCALL "Address()" // 1627
POP $owner // 1642
ALIAS r4 $_infusionAmt // 1644
// reading global: _infusionAmt
LOAD r0 3 // 1644
PUSH r0 // 1649
LOAD r0 "_infusionAmt" // 1651
PUSH r0 // 1667
PUSH $contractName // 1669
EXTCALL $dataGet // 1671
POP $_infusionAmt // 1673
ALIAS r5 $_infusionTkn // 1675
// reading global: _infusionTkn
LOAD r0 4 // 1675
PUSH r0 // 1680
LOAD r0 "_infusionTkn" // 1682
PUSH r0 // 1698
PUSH $contractName // 1700
EXTCALL $dataGet // 1702
POP $_infusionTkn // 1704
// Line 125:
// Line 126:    public mintBody(to:address,created:timestamp,name:string,description: string,infoURL: string,imageURL: string,sandType: string, skinType: string) 
ALIAS r1 $to // 1706
POP $to // 1706
PUSH $to // 1708
EXTCALL "Address()" // 1710
POP $to // 1725
ALIAS r2 $created // 1727
POP $created // 1727
PUSH $created // 1729
EXTCALL "Timestamp()" // 1731
POP $created // 1748
ALIAS r6 $name // 1750
POP $name // 1750
ALIAS r7 $description // 1752
POP $description // 1752
ALIAS r8 $infoURL // 1754
POP $infoURL // 1754
ALIAS r9 $imageURL // 1756
POP $imageURL // 1756
ALIAS r10 $sandType // 1758
POP $sandType // 1758
ALIAS r11 $skinType // 1760
POP $skinType // 1760
// Line 127:    {
// Line 128:        Runtime.expect(owns_sandy.has(to) == false,"Cannot purchase due to you already owning a SANDY"); 
	LOAD r12 6 // field type // 1762
	PUSH r12 // 1767
	COPY $to r13 // 1769
	PUSH r13 // 1772
	ALIAS r13 $literalexpression458 // 1774
	LOAD $literalexpression458 "owns_sandy" // 1774
	PUSH $literalexpression458 // 1788
	LOAD $literalexpression458 "STST" // contract name // 1790
	PUSH $literalexpression458 // 1798
	LOAD r12 "Map.Has" // 1800
	EXTCALL r12 // 1811
	POP r12 // 1813
	ALIAS r13 $literalexpression460 // 1815
	LOAD $literalexpression460 false // 1815
	EQUAL r12 $literalexpression460 r14 // 1820
	JMPIF r14 @expect_methodcallexpression439 // 1824
	ALIAS r12 $literalexpression462 // 1828
	LOAD $literalexpression462 "Cannot purchase due to you already owning a SANDY" // 1828
	THROW $literalexpression462 // 1881
	@expect_methodcallexpression439: NOP // 1884
// Line 129:        Runtime.expect(Runtime.isWitness(to),"Must be witness");
	ALIAS r12 $methodcallexpression467 // 1884
	COPY $to r13 // 1884
	PUSH r13 // 1887
	LOAD $methodcallexpression467 "Runtime.IsWitness" // 1889
	EXTCALL $methodcallexpression467 // 1910
	POP $methodcallexpression467 // 1912
	JMPIF $methodcallexpression467 @expect_methodcallexpression464 // 1914
	ALIAS r13 $literalexpression470 // 1918
	LOAD $literalexpression470 "Must be witness" // 1918
	THROW $literalexpression470 // 1937
	@expect_methodcallexpression464: NOP // 1940
// Line 130:		local rom:body_rom = Struct.body_rom(Time.now(),name,description,infoURL,imageURL,sandType,skinType);
	ALIAS r12 $rom // 1940
	CLEAR r13 // 1940
	ALIAS r15 $methodcallexpression479 // 1942
	LOAD $methodcallexpression479 "Runtime.Time" // 1942
	EXTCALL $methodcallexpression479 // 1958
	POP $methodcallexpression479 // 1960
	LOAD r14 "created" // 1962
	PUT $methodcallexpression479 r13 r14 // 1973
	COPY $name r15 // 1977
	LOAD r14 "name" // 1980
	PUT r15 r13 r14 // 1988
	COPY $description r15 // 1992
	LOAD r14 "description" // 1995
	PUT r15 r13 r14 // 2010
	COPY $infoURL r15 // 2014
	LOAD r14 "infoURL" // 2017
	PUT r15 r13 r14 // 2028
	COPY $imageURL r15 // 2032
	LOAD r14 "imageURL" // 2035
	PUT r15 r13 r14 // 2047
	COPY $sandType r15 // 2051
	LOAD r14 "sandType" // 2054
	PUT r15 r13 r14 // 2066
	COPY $skinType r15 // 2070
	LOAD r14 "skinType" // 2073
	PUT r15 r13 r14 // 2085
	COPY r13 $rom // 2089
// Line 131:        //local ram:body_ram = Struct.body_ram("SANDY");//template name for now
// Line 132:          
// Line 133:            /* Test Can I infust once i Mint to another Address?? Needs to be Tested*/
// Line 134:        local id = NFT.mint(owner,owner, $THIS_SYMBOL, rom,"", SANDY_SERIESID);
	ALIAS r13 $id // 2092
	ALIAS r14 $methodcallexpression488 // 2092
	ALIAS r15 $SANDY_SERIESID // 2092
	LOAD $SANDY_SERIESID 1 // 2092
	PUSH $SANDY_SERIESID // 2097
	ALIAS r15 $literalexpression500 // 2099
	LOAD $literalexpression500 "" // 2099
	CAST $literalexpression500 $literalexpression500 #Bytes // 2103
	PUSH $literalexpression500 // 2107
	COPY $rom r15 // 2109
	CAST r15 r15 #Bytes // 2112
	PUSH r15 // 2116
	ALIAS r15 $literalexpression498 // 2118
	LOAD $literalexpression498 "STST" // 2118
	PUSH $literalexpression498 // 2126
	COPY $owner r15 // 2128
	PUSH r15 // 2131
	COPY $owner r15 // 2133
	PUSH r15 // 2136
	LOAD $methodcallexpression488 "Runtime.MintToken" // 2138
	EXTCALL $methodcallexpression488 // 2159
	POP $methodcallexpression488 // 2161
	COPY $methodcallexpression488 $id // 2163
// Line 135:        NFT.infuse(owner, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
	ALIAS r14 $methodcallexpression505 // 2166
	COPY $_infusionAmt r15 // 2166
	PUSH r15 // 2169
	COPY $_infusionTkn r15 // 2171
	PUSH r15 // 2174
	COPY $id r15 // 2176
	PUSH r15 // 2179
	ALIAS r15 $literalexpression513 // 2181
	LOAD $literalexpression513 "STST" // 2181
	PUSH $literalexpression513 // 2189
	COPY $owner r15 // 2191
	PUSH r15 // 2194
	LOAD $methodcallexpression505 "Runtime.InfuseToken" // 2196
	EXTCALL $methodcallexpression505 // 2219
// Line 136:        this.transerNFT(owner,to,id);
	ALIAS r14 $methodcallexpression518 // 2221
	COPY $id r15 // 2221
	PUSH r15 // 2224
	COPY $to r15 // 2226
	PUSH r15 // 2229
	COPY $owner r15 // 2231
	PUSH r15 // 2234
	CALL @entry_transerNFT // 2236
// Line 137:        owns_sandy.set(to,true);
	ALIAS r14 $methodcallexpression526 // 2240
	ALIAS r15 $literalexpression534 // 2240
	LOAD $literalexpression534 true // 2240
	PUSH $literalexpression534 // 2245
	COPY $to r15 // 2247
	PUSH r15 // 2250
	ALIAS r15 $literalexpression532 // 2252
	LOAD $literalexpression532 "owns_sandy" // 2252
	PUSH $literalexpression532 // 2266
	LOAD $methodcallexpression526 "Map.Set" // 2268
	EXTCALL $methodcallexpression526 // 2279
@exit_mintBody: // 2281
RET // 2282
// Line 138:    } 

// ********* initMint Method ***********
@entry_initMint: // 2283
ALIAS r1 $dataGet // 2284
LOAD $dataGet "Data.Get" // 2284
ALIAS r2 $contractName // 2296
LOAD $contractName "STST" // 2296
ALIAS r3 $owner // 2304
// reading global: owner
LOAD r0 8 // 2304
PUSH r0 // 2309
LOAD r0 "owner" // 2311
PUSH r0 // 2320
PUSH $contractName // 2322
EXTCALL $dataGet // 2324
POP $owner // 2326
PUSH $owner // 2328
EXTCALL "Address()" // 2330
POP $owner // 2345
// Line 139:    
// Line 140:     private initMint(seriesID:number,name: string,description: string,infoURL: string,imageURL: string){
ALIAS r1 $seriesID // 2347
POP $seriesID // 2347
CAST $seriesID $seriesID #Number // 2349
ALIAS r2 $name // 2353
POP $name // 2353
ALIAS r4 $description // 2355
POP $description // 2355
ALIAS r5 $infoURL // 2357
POP $infoURL // 2357
ALIAS r6 $imageURL // 2359
POP $imageURL // 2359
// Line 141:        local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
	ALIAS r7 $rom // 2361
	CLEAR r8 // 2361
	COPY $name r10 // 2363
	LOAD r9 "name" // 2366
	PUT r10 r8 r9 // 2374
	COPY $description r10 // 2378
	LOAD r9 "description" // 2381
	PUT r10 r8 r9 // 2396
	COPY $infoURL r10 // 2400
	LOAD r9 "infoURL" // 2403
	PUT r10 r8 r9 // 2414
	COPY $imageURL r10 // 2418
	LOAD r9 "imageURL" // 2421
	PUT r10 r8 r9 // 2433
	COPY r8 $rom // 2437
// Line 142:        local id: number = NFT.mint(owner,owner, $THIS_SYMBOL, rom,"",seriesID);
	ALIAS r8 $id // 2440
	ALIAS r9 $methodcallexpression558 // 2440
	COPY $seriesID r10 // 2440
	PUSH r10 // 2443
	ALIAS r10 $literalexpression570 // 2445
	LOAD $literalexpression570 "" // 2445
	CAST $literalexpression570 $literalexpression570 #Bytes // 2449
	PUSH $literalexpression570 // 2453
	COPY $rom r10 // 2455
	CAST r10 r10 #Bytes // 2458
	PUSH r10 // 2462
	ALIAS r10 $literalexpression568 // 2464
	LOAD $literalexpression568 "STST" // 2464
	PUSH $literalexpression568 // 2472
	COPY $owner r10 // 2474
	PUSH r10 // 2477
	COPY $owner r10 // 2479
	PUSH r10 // 2482
	LOAD $methodcallexpression558 "Runtime.MintToken" // 2484
	EXTCALL $methodcallexpression558 // 2505
	POP $methodcallexpression558 // 2507
	COPY $methodcallexpression558 $id // 2509
@exit_initMint: // 2512
RET // 2513
// Line 143:    }

// ********* createLimb Method ***********
@entry_createLimb: // 2514
ALIAS r1 $dataGet // 2515
LOAD $dataGet "Data.Get" // 2515
ALIAS r2 $contractName // 2527
LOAD $contractName "STST" // 2527
ALIAS r3 $owner // 2535
// reading global: owner
LOAD r0 8 // 2535
PUSH r0 // 2540
LOAD r0 "owner" // 2542
PUSH r0 // 2551
PUSH $contractName // 2553
EXTCALL $dataGet // 2555
POP $owner // 2557
PUSH $owner // 2559
EXTCALL "Address()" // 2561
POP $owner // 2576
// Line 144:  
// Line 145:	//@Param seriesId - Must be a unique number, could use UID.generate()
// Line 146:    public createLimb(seriesID:number,limbSupply:number,name: string,description: string,infoURL: string,imageURL: string){
ALIAS r1 $seriesID // 2578
POP $seriesID // 2578
CAST $seriesID $seriesID #Number // 2580
ALIAS r2 $limbSupply // 2584
POP $limbSupply // 2584
CAST $limbSupply $limbSupply #Number // 2586
ALIAS r4 $name // 2590
POP $name // 2590
ALIAS r5 $description // 2592
POP $description // 2592
ALIAS r6 $infoURL // 2594
POP $infoURL // 2594
ALIAS r7 $imageURL // 2596
POP $imageURL // 2596
// Line 147:        Runtime.expect(Runtime.isWitness(owner),"Must be owner of contract");
	ALIAS r8 $methodcallexpression592 // 2598
	COPY $owner r9 // 2598
	PUSH r9 // 2601
	LOAD $methodcallexpression592 "Runtime.IsWitness" // 2603
	EXTCALL $methodcallexpression592 // 2624
	POP $methodcallexpression592 // 2626
	JMPIF $methodcallexpression592 @expect_methodcallexpression589 // 2628
	ALIAS r9 $literalexpression595 // 2632
	LOAD $literalexpression595 "Must be owner of contract" // 2632
	THROW $literalexpression595 // 2661
	@expect_methodcallexpression589: NOP // 2664
// Line 148:        NFT.createSeries(owner, $THIS_SYMBOL,seriesID,limbSupply,TokenSeries.Duplicated,limb);
	ALIAS r8 $methodcallexpression597 // 2664
	LOAD r9 0x04076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04580000000107746F6B656E4944030A676574496E666F55524C04B70000000107746F6B656E4944030B676574496D61676555524C04120100000107746F6B656E49440300 // abi // 2664
	PUSH r9 // 2776
	LOAD r9 0x0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085700000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B600000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081101000B0004010D000403524F4D030003010D0004045354535403000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301086D01000B // script // 2778
	PUSH r9 // 3150
	ALIAS r9 $literalexpression609 // 3152
	LOAD $literalexpression609 1 Enum // 3152
	PUSH $literalexpression609 // 3160
	COPY $limbSupply r9 // 3162
	PUSH r9 // 3165
	COPY $seriesID r9 // 3167
	PUSH r9 // 3170
	ALIAS r9 $literalexpression606 // 3172
	LOAD $literalexpression606 "STST" // 3172
	PUSH $literalexpression606 // 3180
	COPY $owner r9 // 3182
	PUSH r9 // 3185
	LOAD $methodcallexpression597 "Nexus.CreateTokenSeries" // 3187
	EXTCALL $methodcallexpression597 // 3214
// Line 149:        local rom:limb_rom = Struct.limb_rom(name,description,infoURL,imageURL);
	ALIAS r8 $rom // 3216
	CLEAR r9 // 3216
	COPY $name r11 // 3218
	LOAD r10 "name" // 3221
	PUT r11 r9 r10 // 3229
	COPY $description r11 // 3233
	LOAD r10 "description" // 3236
	PUT r11 r9 r10 // 3251
	COPY $infoURL r11 // 3255
	LOAD r10 "infoURL" // 3258
	PUT r11 r9 r10 // 3269
	COPY $imageURL r11 // 3273
	LOAD r10 "imageURL" // 3276
	PUT r11 r9 r10 // 3288
	COPY r9 $rom // 3292
// Line 150:        this.initMint(seriesID,name,description,infoURL,imageURL);
	ALIAS r9 $methodcallexpression623 // 3295
	COPY $imageURL r10 // 3295
	PUSH r10 // 3298
	COPY $infoURL r10 // 3300
	PUSH r10 // 3303
	COPY $description r10 // 3305
	PUSH r10 // 3308
	COPY $name r10 // 3310
	PUSH r10 // 3313
	COPY $seriesID r10 // 3315
	PUSH r10 // 3318
	CALL @entry_initMint // 3320
@exit_createLimb: // 3324
RET // 3325
// Line 151:    }

// ********* mintLimb Method ***********
@entry_mintLimb: // 3326
// Line 152:
// Line 153:   
// Line 154:    //should give you a random limb back
// Line 155:    public mintLimb(from:address,to:address,seriesID:number)
ALIAS r1 $from // 3327
POP $from // 3327
PUSH $from // 3329
EXTCALL "Address()" // 3331
POP $from // 3346
ALIAS r2 $to // 3348
POP $to // 3348
PUSH $to // 3350
EXTCALL "Address()" // 3352
POP $to // 3367
ALIAS r3 $seriesID // 3369
POP $seriesID // 3369
CAST $seriesID $seriesID #Number // 3371
// Line 156:    {   
// Line 157:        Runtime.expect(Runtime.isWitness(from),"Must be a witness");
	ALIAS r4 $methodcallexpression646 // 3375
	COPY $from r5 // 3375
	PUSH r5 // 3378
	LOAD $methodcallexpression646 "Runtime.IsWitness" // 3380
	EXTCALL $methodcallexpression646 // 3401
	POP $methodcallexpression646 // 3403
	JMPIF $methodcallexpression646 @expect_methodcallexpression643 // 3405
	ALIAS r5 $literalexpression649 // 3409
	LOAD $literalexpression649 "Must be a witness" // 3409
	THROW $literalexpression649 // 3430
	@expect_methodcallexpression643: NOP // 3433
// Line 158:        //need to randomize seriesId -> this is assuming all I need is a seriesID.
// Line 159:        //do randomization for SeriesID;
// Line 160:        local id: number = NFT.mint(from,to, $THIS_SYMBOL,"","",seriesID);
	ALIAS r4 $id // 3433
	ALIAS r5 $methodcallexpression650 // 3433
	COPY $seriesID r6 // 3433
	PUSH r6 // 3436
	ALIAS r6 $literalexpression662 // 3438
	LOAD $literalexpression662 "" // 3438
	CAST $literalexpression662 $literalexpression662 #Bytes // 3442
	PUSH $literalexpression662 // 3446
	ALIAS r6 $literalexpression661 // 3448
	LOAD $literalexpression661 "" // 3448
	CAST $literalexpression661 $literalexpression661 #Bytes // 3452
	PUSH $literalexpression661 // 3456
	ALIAS r6 $literalexpression660 // 3458
	LOAD $literalexpression660 "STST" // 3458
	PUSH $literalexpression660 // 3466
	COPY $to r6 // 3468
	PUSH r6 // 3471
	COPY $from r6 // 3473
	PUSH r6 // 3476
	LOAD $methodcallexpression650 "Runtime.MintToken" // 3478
	EXTCALL $methodcallexpression650 // 3499
	POP $methodcallexpression650 // 3501
	COPY $methodcallexpression650 $id // 3503
@exit_mintLimb: // 3506
RET // 3507
// Line 161:    }

// ********* editSANDY Method ***********
@entry_editSANDY: // 3508
// Line 162:
// Line 163:    
// Line 164:
// Line 165:    //Will deprecated and used for somthing else
// Line 166:	//will have to make sure that the owner is the only one who can edit the sandy name
// Line 167:    public editSANDY(nftOwner:address,tokenID:number,name:string){
ALIAS r1 $nftOwner // 3509
POP $nftOwner // 3509
PUSH $nftOwner // 3511
EXTCALL "Address()" // 3513
POP $nftOwner // 3528
ALIAS r2 $tokenID // 3530
POP $tokenID // 3530
CAST $tokenID $tokenID #Number // 3532
ALIAS r3 $name // 3536
POP $name // 3536
// Line 168:        Runtime.expect(Runtime.isWitness(nftOwner),"Must be owner of NFT");//have to find a way to get current nft owner
	ALIAS r4 $methodcallexpression678 // 3538
	COPY $nftOwner r5 // 3538
	PUSH r5 // 3541
	LOAD $methodcallexpression678 "Runtime.IsWitness" // 3543
	EXTCALL $methodcallexpression678 // 3564
	POP $methodcallexpression678 // 3566
	JMPIF $methodcallexpression678 @expect_methodcallexpression675 // 3568
	ALIAS r5 $literalexpression681 // 3572
	LOAD $literalexpression681 "Must be owner of NFT" // 3572
	THROW $literalexpression681 // 3596
	@expect_methodcallexpression675: NOP // 3599
// Line 169:		local editRam:body_ram = Struct.body_ram();
	ALIAS r4 $editRam // 3599
	CLEAR r5 // 3599
	COPY r5 $editRam // 3601
// Line 170:		//my assumption that write must follow the order of the struct 
// Line 171:        NFT.write(nftOwner,$THIS_SYMBOL,tokenID,editRam);//changeable data
	ALIAS r5 $methodcallexpression686 // 3604
	COPY $editRam r6 // 3604
	CAST r6 r6 #Bytes // 3607
	PUSH r6 // 3611
	COPY $tokenID r6 // 3613
	PUSH r6 // 3616
	ALIAS r6 $literalexpression693 // 3618
	LOAD $literalexpression693 "STST" // 3618
	PUSH $literalexpression693 // 3626
	COPY $nftOwner r6 // 3628
	PUSH r6 // 3631
	LOAD $methodcallexpression686 "Runtime.WriteToken" // 3633
	EXTCALL $methodcallexpression686 // 3655
@exit_editSANDY: // 3657
RET // 3658
// Line 172:
// Line 173:
// Line 174:    }

// ********* getRom Method ***********
@entry_getRom: // 3659
// Line 175:    //need to get readable rom 
// Line 176:    
// Line 177:    //- How do I make return type a struct initiialized to the rom size
// Line 178:    public getRom(symbol:string, id:number):body_rom {
ALIAS r1 $symbol // 3660
POP $symbol // 3660
ALIAS r2 $id // 3662
POP $id // 3662
CAST $id $id #Number // 3664
// Line 179:         local nftROM:body_rom = NFT.readROM<body_rom>($THIS_SYMBOL, id);
	ALIAS r3 $nftROM // 3668
	ALIAS r4 $methodcallexpression702 // 3668
	COPY $id r5 // 3668
	PUSH r5 // 3671
	ALIAS r5 $literalexpression706 // 3673
	LOAD $literalexpression706 "STST" // 3673
	PUSH $literalexpression706 // 3681
	LOAD $methodcallexpression702 "Runtime.ReadTokenROM" // 3683
	EXTCALL $methodcallexpression702 // 3707
	POP $methodcallexpression702 // 3709
	UNPACK $methodcallexpression702 $methodcallexpression702 // 3711
	COPY $methodcallexpression702 $nftROM // 3714
// Line 180:         return nftROM;
	COPY $nftROM r4 // 3717
	PUSH r4 // 3720
	JMP @exit_getRom // 3722
@exit_getRom: // 3725
RET // 3726
// Line 181:    }

// ********* getRam Method ***********
@entry_getRam: // 3727
// Line 182:
// Line 183:    public getRam(symbol:string, id:number): body_ram
ALIAS r1 $symbol // 3728
POP $symbol // 3728
ALIAS r2 $id // 3730
POP $id // 3730
CAST $id $id #Number // 3732
// Line 184:    {
// Line 185:        local nftRAM:body_ram = NFT.readRAM<body_ram>($THIS_SYMBOL, id);
	ALIAS r3 $nftRAM // 3736
	ALIAS r4 $methodcallexpression718 // 3736
	COPY $id r5 // 3736
	PUSH r5 // 3739
	ALIAS r5 $literalexpression722 // 3741
	LOAD $literalexpression722 "STST" // 3741
	PUSH $literalexpression722 // 3749
	LOAD $methodcallexpression718 "Runtime.ReadTokenRAM" // 3751
	EXTCALL $methodcallexpression718 // 3775
	POP $methodcallexpression718 // 3777
	UNPACK $methodcallexpression718 $methodcallexpression718 // 3779
	COPY $methodcallexpression718 $nftRAM // 3782
// Line 186:        return nftRAM;
	COPY $nftRAM r4 // 3785
	PUSH r4 // 3788
	JMP @exit_getRam // 3790
@exit_getRam: // 3793
RET // 3794
// Line 187:    }

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 3795
ALIAS r1 $dataGet // 3796
LOAD $dataGet "Data.Get" // 3796
ALIAS r2 $contractName // 3808
LOAD $contractName "STST" // 3808
ALIAS r3 $owner // 3816
// reading global: owner
LOAD r0 8 // 3816
PUSH r0 // 3821
LOAD r0 "owner" // 3823
PUSH r0 // 3832
PUSH $contractName // 3834
EXTCALL $dataGet // 3836
POP $owner // 3838
PUSH $owner // 3840
EXTCALL "Address()" // 3842
POP $owner // 3857
// Line 188:
// Line 189:    trigger onUpgrade(from:address)
ALIAS r1 $from // 3859
POP $from // 3859
PUSH $from // 3861
EXTCALL "Address()" // 3863
POP $from // 3878
// Line 190:    {
// Line 191:        // check is witness and is current owner
// Line 192:		Runtime.expect(Runtime.isWitness(owner), "invalid witness");
	ALIAS r2 $methodcallexpression736 // 3880
	COPY $owner r4 // 3880
	PUSH r4 // 3883
	LOAD $methodcallexpression736 "Runtime.IsWitness" // 3885
	EXTCALL $methodcallexpression736 // 3906
	POP $methodcallexpression736 // 3908
	JMPIF $methodcallexpression736 @expect_methodcallexpression733 // 3910
	ALIAS r4 $literalexpression739 // 3914
	LOAD $literalexpression739 "invalid witness" // 3914
	THROW $literalexpression739 // 3933
	@expect_methodcallexpression733: NOP // 3936
@exit_onUpgrade: // 3936
RET // 3937
// Line 193:    }

// ********* onMint Trigger ***********
@entry_onMint: // 3938
// Line 194:    //Mint function
// Line 195:    trigger onMint(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 3939
POP $from // 3939
PUSH $from // 3941
EXTCALL "Address()" // 3943
POP $from // 3958
ALIAS r2 $to // 3960
POP $to // 3960
PUSH $to // 3962
EXTCALL "Address()" // 3964
POP $to // 3979
ALIAS r3 $symbol // 3981
POP $symbol // 3981
ALIAS r4 $tokenID // 3983
POP $tokenID // 3983
CAST $tokenID $tokenID #Number // 3985
// Line 196:		Runtime.expect(symbol == $THIS_SYMBOL, "symbol mismatch");
	COPY $symbol r5 // 3989
	ALIAS r6 $literalexpression756 // 3992
	LOAD $literalexpression756 "STST" // 3992
	EQUAL r5 $literalexpression756 r7 // 4000
	JMPIF r7 @expect_methodcallexpression751 // 4004
	ALIAS r5 $literalexpression758 // 4008
	LOAD $literalexpression758 "symbol mismatch" // 4008
	THROW $literalexpression758 // 4027
	@expect_methodcallexpression751: NOP // 4030
@exit_onMint: // 4030
RET // 4031
// Line 197:        //might need to add NFT owns to right here 
// Line 198:    }

// ********* onInfuse Trigger ***********
@entry_onInfuse: // 4032
// Line 199:    trigger onInfuse(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 4033
POP $from // 4033
PUSH $from // 4035
EXTCALL "Address()" // 4037
POP $from // 4052
ALIAS r2 $to // 4054
POP $to // 4054
PUSH $to // 4056
EXTCALL "Address()" // 4058
POP $to // 4073
ALIAS r3 $symbol // 4075
POP $symbol // 4075
ALIAS r4 $tokenID // 4077
POP $tokenID // 4077
CAST $tokenID $tokenID #Number // 4079
// Line 200:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression773 // 4083
	COPY $from r6 // 4083
	PUSH r6 // 4086
	LOAD $methodcallexpression773 "Runtime.IsWitness" // 4088
	EXTCALL $methodcallexpression773 // 4109
	POP $methodcallexpression773 // 4111
	JMPIF $methodcallexpression773 @expect_methodcallexpression770 // 4113
	ALIAS r6 $literalexpression776 // 4117
	LOAD $literalexpression776 "witness failed" // 4117
	THROW $literalexpression776 // 4135
	@expect_methodcallexpression770: NOP // 4138
@exit_onInfuse: // 4138
RET // 4139
// Line 201:    }

// ********* onSeries Trigger ***********
@entry_onSeries: // 4140
// Line 202:
// Line 203:    trigger onSeries(from: address){
ALIAS r1 $from // 4141
POP $from // 4141
PUSH $from // 4143
EXTCALL "Address()" // 4145
POP $from // 4160
// Line 204:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression785 // 4162
	COPY $from r3 // 4162
	PUSH r3 // 4165
	LOAD $methodcallexpression785 "Runtime.IsWitness" // 4167
	EXTCALL $methodcallexpression785 // 4188
	POP $methodcallexpression785 // 4190
	JMPIF $methodcallexpression785 @expect_methodcallexpression782 // 4192
	ALIAS r3 $literalexpression788 // 4196
	LOAD $literalexpression788 "witness failed" // 4196
	THROW $literalexpression788 // 4214
	@expect_methodcallexpression782: NOP // 4217
@exit_onSeries: // 4217
RET // 4218
// Line 205:    }

// ********* onWrite Trigger ***********
@entry_onWrite: // 4219
// Line 206:    trigger onWrite(from: address,data:number){
ALIAS r1 $from // 4220
POP $from // 4220
PUSH $from // 4222
EXTCALL "Address()" // 4224
POP $from // 4239
ALIAS r2 $data // 4241
POP $data // 4241
CAST $data $data #Number // 4243
// Line 207:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression799 // 4247
	COPY $from r4 // 4247
	PUSH r4 // 4250
	LOAD $methodcallexpression799 "Runtime.IsWitness" // 4252
	EXTCALL $methodcallexpression799 // 4273
	POP $methodcallexpression799 // 4275
	JMPIF $methodcallexpression799 @expect_methodcallexpression796 // 4277
	ALIAS r4 $literalexpression802 // 4281
	LOAD $literalexpression802 "witness failed" // 4281
	THROW $literalexpression802 // 4299
	@expect_methodcallexpression796: NOP // 4302
@exit_onWrite: // 4302
RET // 4303
// Line 208:    }

// ********* onSend Trigger ***********
@entry_onSend: // 4304
// Line 209:    trigger onSend(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 4305
POP $from // 4305
PUSH $from // 4307
EXTCALL "Address()" // 4309
POP $from // 4324
ALIAS r2 $to // 4326
POP $to // 4326
PUSH $to // 4328
EXTCALL "Address()" // 4330
POP $to // 4345
ALIAS r3 $symbol // 4347
POP $symbol // 4347
ALIAS r4 $tokenID // 4349
POP $tokenID // 4349
CAST $tokenID $tokenID #Number // 4351
// Line 210:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression817 // 4355
	COPY $from r6 // 4355
	PUSH r6 // 4358
	LOAD $methodcallexpression817 "Runtime.IsWitness" // 4360
	EXTCALL $methodcallexpression817 // 4381
	POP $methodcallexpression817 // 4383
	JMPIF $methodcallexpression817 @expect_methodcallexpression814 // 4385
	ALIAS r6 $literalexpression820 // 4389
	LOAD $literalexpression820 "witness failed" // 4389
	THROW $literalexpression820 // 4407
	@expect_methodcallexpression814: NOP // 4410
@exit_onSend: // 4410
RET // 4411
// Line 211:    }

// ********* onBurn Trigger ***********
@entry_onBurn: // 4412
// Line 212:  
// Line 213:    trigger onBurn(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 4413
POP $from // 4413
PUSH $from // 4415
EXTCALL "Address()" // 4417
POP $from // 4432
ALIAS r2 $to // 4434
POP $to // 4434
PUSH $to // 4436
EXTCALL "Address()" // 4438
POP $to // 4453
ALIAS r3 $symbol // 4455
POP $symbol // 4455
ALIAS r4 $tokenID // 4457
POP $tokenID // 4457
CAST $tokenID $tokenID #Number // 4459
// Line 214:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression835 // 4463
	COPY $from r6 // 4463
	PUSH r6 // 4466
	LOAD $methodcallexpression835 "Runtime.IsWitness" // 4468
	EXTCALL $methodcallexpression835 // 4489
	POP $methodcallexpression835 // 4491
	JMPIF $methodcallexpression835 @expect_methodcallexpression832 // 4493
	ALIAS r6 $literalexpression838 // 4497
	LOAD $literalexpression838 "witness failed" // 4497
	THROW $literalexpression838 // 4515
	@expect_methodcallexpression832: NOP // 4518
@exit_onBurn: // 4518
RET // 4519
