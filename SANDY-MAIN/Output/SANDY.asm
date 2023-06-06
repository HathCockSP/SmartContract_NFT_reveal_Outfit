
// ********* getName Property ***********
@entry_getName: // 0
	ALIAS r1 $literalexpression123 // 1
	LOAD $literalexpression123 "Test" // 1
	PUSH $literalexpression123 // 9
	JMP @exit_getName // 11
@exit_getName: // 14
RET // 15

// ********* getSymbol Property ***********
@entry_getSymbol: // 16
	ALIAS r1 $literalexpression127 // 17
	LOAD $literalexpression127 "TST" // 17
	PUSH $literalexpression127 // 24
	JMP @exit_getSymbol // 26
@exit_getSymbol: // 29
RET // 30

// ********* isFungible Property ***********
@entry_isFungible: // 31
	ALIAS r1 $literalexpression131 // 32
	LOAD $literalexpression131 false // 32
	PUSH $literalexpression131 // 37
	JMP @exit_isFungible // 39
@exit_isFungible: // 42
RET // 43

// ********* isBurnable Property ***********
@entry_isBurnable: // 44
	ALIAS r1 $literalexpression135 // 45
	LOAD $literalexpression135 true // 45
	PUSH $literalexpression135 // 50
	JMP @exit_isBurnable // 52
@exit_isBurnable: // 55
RET // 56

// ********* getMaxSupply Property ***********
@entry_getMaxSupply: // 57
	ALIAS r1 $SANDY_SUPPLY // 58
	LOAD $SANDY_SUPPLY 500 // 58
	PUSH $SANDY_SUPPLY // 64
	JMP @exit_getMaxSupply // 66
@exit_getMaxSupply: // 69
RET // 70

// ********* getOwner Property ***********
@entry_getOwner: // 71
ALIAS r1 $dataGet // 72
LOAD $dataGet "Data.Get" // 72
ALIAS r2 $contractName // 84
LOAD $contractName "SANDY" // 84
ALIAS r3 $owner // 93
// reading global: owner
LOAD r0 8 // 93
PUSH r0 // 98
LOAD r0 "owner" // 100
PUSH r0 // 109
PUSH $contractName // 111
EXTCALL $dataGet // 113
POP $owner // 115
PUSH $owner // 117
EXTCALL "Address()" // 119
POP $owner // 134
	COPY $owner r1 // 136
	PUSH r1 // 139
	JMP @exit_getOwner // 141
@exit_getOwner: // 144
RET // 145
// Line 64:
// Line 65:        }
// Line 66:
// Line 67:    }

// ********* Initialize Constructor ***********
@entry_constructor: // 146
ALIAS r1 $nexus_protocol_version // 147
// validate protocol version
LOAD r0 "Runtime.Version" // 147
EXTCALL r0 // 166
POP r0 // 168
LOAD $nexus_protocol_version 8 // 170
LT r0 $nexus_protocol_version r0 // 175
JMPNOT r0 @protocol_version_validated // 179
LOAD r0 "Current nexus protocol version should be 8 or more" // 183
THROW r0 // 237
@protocol_version_validated: NOP // 240
ALIAS r1 $owner // 240
// clearing owns_sandy storage
LOAD r0 "owns_sandy" // 240
PUSH r0 // 254
LOAD r0 "Map.Clear" // 256
EXTCALL r0 // 269
ALIAS r2 $_timeGate // 271
ALIAS r3 $_infusionAmt // 271
ALIAS r4 $_infusionTkn // 271
// Line 68:      constructor(con_creator:address)
ALIAS r5 $con_creator // 271
POP $con_creator // 271
PUSH $con_creator // 273
EXTCALL "Address()" // 275
POP $con_creator // 290
// Line 69:    {
// Line 70:        owner = con_creator;
	COPY $con_creator r6 // 292
	COPY r6 $owner // 295
// Line 71:        _timeGate = true;
	ALIAS r6 $literalexpression230 // 298
	LOAD $literalexpression230 true // 298
	COPY $literalexpression230 $_timeGate // 303
// Line 72:        _infusionAmt = 25;
	ALIAS r6 $literalexpression232 // 306
	LOAD $literalexpression232 25 // 306
	COPY $literalexpression232 $_infusionAmt // 311
// Line 73:        _infusionTkn = "SOUL";
	ALIAS r6 $literalexpression234 // 314
	LOAD $literalexpression234 "SOUL" // 314
	COPY $literalexpression234 $_infusionTkn // 322
// Line 74:        NFT.createSeries($THIS_ADDRESS, $THIS_SYMBOL,SANDY_SERIESID,SANDY_SUPPLY,TokenSeries.Unique,character);
	ALIAS r6 $methodcallexpression236 // 325
	LOAD r7 0x06076765744E616D6504000000000107746F6B656E4944030E6765744465736372697074696F6E04590000000107746F6B656E4944030A676574496E666F55524C04B90000000107746F6B656E4944030B676574496D61676555524C04150100000107746F6B656E4944030A6765744372656174656405720100000006676574446E6102CE0100000000 // abi // 325
	PUSH r7 // 467
	LOAD r7 0x0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204046E616D65300101020301085800000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D02040B6465736372697074696F6E30010102030108B800000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020407696E666F55524C300101020301081401000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020408696D61676555524C300101020301087101000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D0204076372656174656430010102030108CD01000B0004010D000403524F4D030003010D00040553414E445903000D00041152756E74696D652E52656164546F6B656E070004023202020D000403524F4D300203003203030203010D020403646E61300101020301082502000B // script // 469
	PUSH r7 // 1025
	ALIAS r7 $literalexpression249 // 1027
	LOAD $literalexpression249 0 Enum // 1027
	PUSH $literalexpression249 // 1035
	ALIAS r7 $SANDY_SUPPLY // 1037
	LOAD $SANDY_SUPPLY 500 // 1037
	PUSH $SANDY_SUPPLY // 1043
	ALIAS r7 $SANDY_SERIESID // 1045
	LOAD $SANDY_SERIESID 1 // 1045
	PUSH $SANDY_SERIESID // 1050
	ALIAS r7 $literalexpression246 // 1052
	LOAD $literalexpression246 "SANDY" // 1052
	PUSH $literalexpression246 // 1061
	ALIAS r7 $literalexpression244 // 1063
	LOAD $literalexpression244 0x0200DE439474EC46783F21573EFC03A9A014884D4499CC92D0DF1960CBD40DDAA503 // 1063
	PUSH $literalexpression244 // 1101
	EXTCALL "Address()" // 1103
	POP $literalexpression244 // 1118
	PUSH $literalexpression244 // 1120
	LOAD $methodcallexpression236 "Nexus.CreateTokenSeries" // 1122
	EXTCALL $methodcallexpression236 // 1149
@exit_constructor: // 1151
LOAD r5 "Data.Set" // 1152
// writing global: owner
PUSH $owner // 1164
LOAD r0 "owner" // 1166
PUSH r0 // 1175
EXTCALL r5 // 1177
// writing global: _timeGate
PUSH $_timeGate // 1179
LOAD r0 "_timeGate" // 1181
PUSH r0 // 1194
EXTCALL r5 // 1196
// writing global: _infusionAmt
PUSH $_infusionAmt // 1198
LOAD r0 "_infusionAmt" // 1200
PUSH r0 // 1216
EXTCALL r5 // 1218
// writing global: _infusionTkn
PUSH $_infusionTkn // 1220
LOAD r0 "_infusionTkn" // 1222
PUSH r0 // 1238
EXTCALL r5 // 1240
RET // 1242
// Line 75:    }

// ********* insertDNA Method ***********
@entry_insertDNA: // 1243
// Line 76:    //logic to ensure mint stays withing specified bounds
// Line 77:   
// Line 78:   //a little something special Do LATER!!
// Line 79:	private insertDNA(dna:bytes):bytes {
ALIAS r1 $dna // 1244
POP $dna // 1244
// Line 80:        //encode bytes for an image.
// Line 81:        //manipulate some dna
// Line 82:        return 0x04;
	ALIAS r2 $literalexpression255 // 1246
	LOAD $literalexpression255 0x04 // 1246
	PUSH $literalexpression255 // 1251
	JMP @exit_insertDNA // 1253
@exit_insertDNA: // 1256
RET // 1257
// Line 83:	}

// ********* checkTimeGate Method ***********
@entry_checkTimeGate: // 1258
ALIAS r1 $dataGet // 1259
LOAD $dataGet "Data.Get" // 1259
ALIAS r2 $contractName // 1271
LOAD $contractName "SANDY" // 1271
ALIAS r3 $_timeGate // 1280
// reading global: _timeGate
LOAD r0 6 // 1280
PUSH r0 // 1285
LOAD r0 "_timeGate" // 1287
PUSH r0 // 1300
PUSH $contractName // 1302
EXTCALL $dataGet // 1304
POP $_timeGate // 1306
// Line 84:
// Line 85:    private checkTimeGate():bool
// Line 86:    {
// Line 87:        // check if valie to limit 1 mint per address is valid
// Line 88:        if (_timeGate)
	COPY $_timeGate r1 // 1308
		JMPNOT r1 @then_ifstatement259 // 1311
// Line 89:        {
// Line 90:            return true;
		ALIAS r2 $literalexpression262 // 1315
		LOAD $literalexpression262 true // 1315
		PUSH $literalexpression262 // 1320
		JMP @exit_checkTimeGate // 1322
		@then_ifstatement259: NOP // 1326
// Line 91:        }
// Line 92:        return false;
	ALIAS r1 $literalexpression264 // 1326
	LOAD $literalexpression264 false // 1326
	PUSH $literalexpression264 // 1331
	JMP @exit_checkTimeGate // 1333
@exit_checkTimeGate: // 1336
RET // 1337
// Line 93:    }

// ********* mint Method ***********
@entry_mint: // 1338
// Line 94:	//Mint nft from contract address and transfer to 
// Line 95:    private mint(creator:address,to:address,created:timestamp,dna: bytes,name: string,description: string,infoURL: string,imageURL: string) 
ALIAS r1 $creator // 1339
POP $creator // 1339
PUSH $creator // 1341
EXTCALL "Address()" // 1343
POP $creator // 1358
ALIAS r2 $to // 1360
POP $to // 1360
PUSH $to // 1362
EXTCALL "Address()" // 1364
POP $to // 1379
ALIAS r3 $created // 1381
POP $created // 1381
PUSH $created // 1383
EXTCALL "Timestamp()" // 1385
POP $created // 1402
ALIAS r4 $dna // 1404
POP $dna // 1404
ALIAS r5 $name // 1406
POP $name // 1406
ALIAS r6 $description // 1408
POP $description // 1408
ALIAS r7 $infoURL // 1410
POP $infoURL // 1410
ALIAS r8 $imageURL // 1412
POP $imageURL // 1412
// Line 96:    {
// Line 97:         /*
// Line 98:        Possible Issue: What if transaction fails and buyer address is still added to storage_map?
// Line 99:        Answer?: only add user to storage_map once mint is confirmed.
// Line 100:        what does 
// Line 101:        */
// Line 102:        
// Line 103:        //Time.now() should ensure all NFTS are created Unique.
// Line 104:		local rom:body_rom = Struct.body_rom(Time.now(),this.insertDNA(dna),name,description,infoURL,imageURL);
	ALIAS r9 $rom // 1414
	CLEAR r10 // 1414
	ALIAS r12 $methodcallexpression291 // 1416
	LOAD $methodcallexpression291 "Runtime.Time" // 1416
	EXTCALL $methodcallexpression291 // 1432
	POP $methodcallexpression291 // 1434
	LOAD r11 "created" // 1436
	PUT $methodcallexpression291 r10 r11 // 1447
	ALIAS r12 $methodcallexpression292 // 1451
	COPY $dna r13 // 1451
	PUSH r13 // 1454
	CALL @entry_insertDNA // 1456
	POP $methodcallexpression292 // 1460
	LOAD r11 "dna" // 1462
	PUT $methodcallexpression292 r10 r11 // 1469
	COPY $name r12 // 1473
	LOAD r11 "name" // 1476
	PUT r12 r10 r11 // 1484
	COPY $description r12 // 1488
	LOAD r11 "description" // 1491
	PUT r12 r10 r11 // 1506
	COPY $infoURL r12 // 1510
	LOAD r11 "infoURL" // 1513
	PUT r12 r10 r11 // 1524
	COPY $imageURL r12 // 1528
	LOAD r11 "imageURL" // 1531
	PUT r12 r10 r11 // 1543
	COPY r10 $rom // 1547
// Line 105:        local ram:body_ram = Struct.body_ram("SANDY");//template name for now
	ALIAS r10 $ram // 1550
	CLEAR r11 // 1550
	ALIAS r13 $literalexpression303 // 1552
	LOAD $literalexpression303 "SANDY" // 1552
	LOAD r12 "name" // 1561
	PUT $literalexpression303 r11 r12 // 1569
	COPY r11 $ram // 1573
// Line 106:        if(this.checkTimeGate()){
	ALIAS r11 $methodcallexpression307 // 1576
	CALL @entry_checkTimeGate // 1576
	POP $methodcallexpression307 // 1580
		JMPNOT $methodcallexpression307 @else_ifstatement306 // 1582
// Line 107:
// Line 108:            Runtime.expect(owns_sandy.has(to) == false,"Cannot purchase due to you already owning a SANDY");
		LOAD r12 6 // field type // 1586
		PUSH r12 // 1591
		COPY $to r13 // 1593
		PUSH r13 // 1596
		ALIAS r13 $literalexpression329 // 1598
		LOAD $literalexpression329 "owns_sandy" // 1598
		PUSH $literalexpression329 // 1612
		LOAD $literalexpression329 "SANDY" // contract name // 1614
		PUSH $literalexpression329 // 1623
		LOAD r12 "Map.Has" // 1625
		EXTCALL r12 // 1636
		POP r12 // 1638
		ALIAS r13 $literalexpression331 // 1640
		LOAD $literalexpression331 false // 1640
		EQUAL r12 $literalexpression331 r14 // 1645
		JMPIF r14 @expect_methodcallexpression310 // 1649
		ALIAS r12 $literalexpression333 // 1653
		LOAD $literalexpression333 "Cannot purchase due to you already owning a SANDY" // 1653
		THROW $literalexpression333 // 1706
		@expect_methodcallexpression310: NOP // 1709
// Line 109:            //need to find out how to get NFTID 
// Line 110:            NFT.mint($THIS_ADDRESS, to, $THIS_SYMBOL, rom, ram, SANDY_SERIESID);//might change the series ID later
		ALIAS r12 $methodcallexpression335 // 1709
		ALIAS r13 $SANDY_SERIESID // 1709
		LOAD $SANDY_SERIESID 1 // 1709
		PUSH $SANDY_SERIESID // 1714
		COPY $ram r13 // 1716
		CAST r13 r13 #Bytes // 1719
		PUSH r13 // 1723
		COPY $rom r13 // 1725
		CAST r13 r13 #Bytes // 1728
		PUSH r13 // 1732
		ALIAS r13 $literalexpression346 // 1734
		LOAD $literalexpression346 "SANDY" // 1734
		PUSH $literalexpression346 // 1743
		COPY $to r13 // 1745
		PUSH r13 // 1748
		ALIAS r13 $literalexpression343 // 1750
		LOAD $literalexpression343 0x0200DE439474EC46783F21573EFC03A9A014884D4499CC92D0DF1960CBD40DDAA503 // 1750
		PUSH $literalexpression343 // 1788
		EXTCALL "Address()" // 1790
		POP $literalexpression343 // 1805
		PUSH $literalexpression343 // 1807
		LOAD $methodcallexpression335 "Runtime.MintToken" // 1809
		EXTCALL $methodcallexpression335 // 1830
		POP $methodcallexpression335 // 1832
// Line 111:
// Line 112:            //NFT.infuse(creator, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
// Line 113:            //assuming the minter is the to
// Line 114:            owns_sandy.set(to,true);
		ALIAS r12 $methodcallexpression351 // 1834
		ALIAS r13 $literalexpression359 // 1834
		LOAD $literalexpression359 true // 1834
		PUSH $literalexpression359 // 1839
		COPY $to r13 // 1841
		PUSH r13 // 1844
		ALIAS r13 $literalexpression357 // 1846
		LOAD $literalexpression357 "owns_sandy" // 1846
		PUSH $literalexpression357 // 1860
		LOAD $methodcallexpression351 "Map.Set" // 1862
		EXTCALL $methodcallexpression351 // 1873
		JMP @then_ifstatement306 // 1875
		@else_ifstatement306: NOP // 1879
// Line 115:        }
// Line 116:        else {
// Line 117:
// Line 118:        	NFT.mint($THIS_ADDRESS, to, $THIS_SYMBOL, rom, ram, SANDY_SERIESID);
		ALIAS r12 $methodcallexpression362 // 1879
		ALIAS r13 $SANDY_SERIESID // 1879
		LOAD $SANDY_SERIESID 1 // 1879
		PUSH $SANDY_SERIESID // 1884
		COPY $ram r13 // 1886
		CAST r13 r13 #Bytes // 1889
		PUSH r13 // 1893
		COPY $rom r13 // 1895
		CAST r13 r13 #Bytes // 1898
		PUSH r13 // 1902
		ALIAS r13 $literalexpression373 // 1904
		LOAD $literalexpression373 "SANDY" // 1904
		PUSH $literalexpression373 // 1913
		COPY $to r13 // 1915
		PUSH r13 // 1918
		ALIAS r13 $literalexpression370 // 1920
		LOAD $literalexpression370 0x0200DE439474EC46783F21573EFC03A9A014884D4499CC92D0DF1960CBD40DDAA503 // 1920
		PUSH $literalexpression370 // 1958
		EXTCALL "Address()" // 1960
		POP $literalexpression370 // 1975
		PUSH $literalexpression370 // 1977
		LOAD $methodcallexpression362 "Runtime.MintToken" // 1979
		EXTCALL $methodcallexpression362 // 2000
		POP $methodcallexpression362 // 2002
		@then_ifstatement306: NOP // 2005
@exit_mint: // 2005
RET // 2006
// Line 119:            //NFTID
// Line 120:   
// Line 121:           // NFT.infuse(creator, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
// Line 122:        }
// Line 123:    } 

// ********* timeGate_switch Method ***********
@entry_timeGate_switch: // 2007
ALIAS r1 $dataGet // 2008
LOAD $dataGet "Data.Get" // 2008
ALIAS r2 $contractName // 2020
LOAD $contractName "SANDY" // 2020
ALIAS r3 $owner // 2029
// reading global: owner
LOAD r0 8 // 2029
PUSH r0 // 2034
LOAD r0 "owner" // 2036
PUSH r0 // 2045
PUSH $contractName // 2047
EXTCALL $dataGet // 2049
POP $owner // 2051
PUSH $owner // 2053
EXTCALL "Address()" // 2055
POP $owner // 2070
ALIAS r4 $_timeGate // 2072
// reading global: _timeGate
LOAD r0 6 // 2072
PUSH r0 // 2077
LOAD r0 "_timeGate" // 2079
PUSH r0 // 2092
PUSH $contractName // 2094
EXTCALL $dataGet // 2096
POP $_timeGate // 2098
// Line 124:    
// Line 125:    
// Line 126:    public timeGate_switch(){
// Line 127:        Runtime.expect(Runtime.isWitness(owner),"witness failed");
	ALIAS r1 $methodcallexpression383 // 2100
	COPY $owner r2 // 2100
	PUSH r2 // 2103
	LOAD $methodcallexpression383 "Runtime.IsWitness" // 2105
	EXTCALL $methodcallexpression383 // 2126
	POP $methodcallexpression383 // 2128
	JMPIF $methodcallexpression383 @expect_methodcallexpression380 // 2130
	ALIAS r2 $literalexpression386 // 2134
	LOAD $literalexpression386 "witness failed" // 2134
	THROW $literalexpression386 // 2152
	@expect_methodcallexpression380: NOP // 2155
// Line 128:        _timeGate = !_timeGate; //assuming negation works in phantasma. This should just negate the value.
	COPY $_timeGate r1 // 2155
	NOT r1 r1 // 2158
	COPY r1 $_timeGate // 2161
@exit_timeGate_switch: // 2164
LOAD r1 "Data.Set" // 2165
// writing global: _timeGate
PUSH $_timeGate // 2177
LOAD r0 "_timeGate" // 2179
PUSH r0 // 2192
EXTCALL r1 // 2194
RET // 2196
// Line 129:    }

// ********* mintToken Method ***********
@entry_mintToken: // 2197
// Line 130:
// Line 131:
// Line 132:	//@Param MintNum - keeps track of how many current mints there are. May need to find a correct way to implement this
// Line 133:    public mintToken(creator:address,to:address,created:timestamp,dna: bytes,name: string,descritpion: string,infoURL: string,imageURL: string){
ALIAS r1 $creator // 2198
POP $creator // 2198
PUSH $creator // 2200
EXTCALL "Address()" // 2202
POP $creator // 2217
ALIAS r2 $to // 2219
POP $to // 2219
PUSH $to // 2221
EXTCALL "Address()" // 2223
POP $to // 2238
ALIAS r3 $created // 2240
POP $created // 2240
PUSH $created // 2242
EXTCALL "Timestamp()" // 2244
POP $created // 2261
ALIAS r4 $dna // 2263
POP $dna // 2263
ALIAS r5 $name // 2265
POP $name // 2265
ALIAS r6 $descritpion // 2267
POP $descritpion // 2267
ALIAS r7 $infoURL // 2269
POP $infoURL // 2269
ALIAS r8 $imageURL // 2271
POP $imageURL // 2271
// Line 134:        //Runtime.expect(Runtime.isWitness(creator),"Must own wallet you are minting from");
// Line 135:        this.mint(creator,to,created,this.insertDNA(dna),name,descritpion,infoURL,imageURL);
	ALIAS r9 $methodcallexpression409 // 2273
	COPY $imageURL r10 // 2273
	PUSH r10 // 2276
	COPY $infoURL r10 // 2278
	PUSH r10 // 2281
	COPY $descritpion r10 // 2283
	PUSH r10 // 2286
	COPY $name r10 // 2288
	PUSH r10 // 2291
	ALIAS r10 $methodcallexpression421 // 2293
	COPY $dna r11 // 2293
	PUSH r11 // 2296
	CALL @entry_insertDNA // 2298
	POP $methodcallexpression421 // 2302
	PUSH $methodcallexpression421 // 2304
	COPY $created r10 // 2306
	PUSH r10 // 2309
	COPY $to r10 // 2311
	PUSH r10 // 2314
	COPY $creator r10 // 2316
	PUSH r10 // 2319
	CALL @entry_mint // 2321
@exit_mintToken: // 2325
RET // 2326
// Line 136:    
// Line 137:    }

// ********* transerNFT Method ***********
@entry_transerNFT: // 2327
// Line 138:    public transerNFT(from:address,to:address,id:number){
ALIAS r1 $from // 2328
POP $from // 2328
PUSH $from // 2330
EXTCALL "Address()" // 2332
POP $from // 2347
ALIAS r2 $to // 2349
POP $to // 2349
PUSH $to // 2351
EXTCALL "Address()" // 2353
POP $to // 2368
ALIAS r3 $id // 2370
POP $id // 2370
CAST $id $id #Number // 2372
// Line 139:        Runtime.expect(Runtime.isWitness(from),"Must be owner of NFT to Transfer");
	ALIAS r4 $methodcallexpression440 // 2376
	COPY $from r5 // 2376
	PUSH r5 // 2379
	LOAD $methodcallexpression440 "Runtime.IsWitness" // 2381
	EXTCALL $methodcallexpression440 // 2402
	POP $methodcallexpression440 // 2404
	JMPIF $methodcallexpression440 @expect_methodcallexpression437 // 2406
	ALIAS r5 $literalexpression443 // 2410
	LOAD $literalexpression443 "Must be owner of NFT to Transfer" // 2410
	THROW $literalexpression443 // 2446
	@expect_methodcallexpression437: NOP // 2449
// Line 140:        NFT.transfer(from,to,$THIS_SYMBOL,id);
	ALIAS r4 $methodcallexpression445 // 2449
	COPY $id r5 // 2449
	PUSH r5 // 2452
	ALIAS r5 $literalexpression453 // 2454
	LOAD $literalexpression453 "SANDY" // 2454
	PUSH $literalexpression453 // 2463
	COPY $to r5 // 2465
	PUSH r5 // 2468
	COPY $from r5 // 2470
	PUSH r5 // 2473
	LOAD $methodcallexpression445 "Runtime.TransferToken" // 2475
	EXTCALL $methodcallexpression445 // 2500
@exit_transerNFT: // 2502
RET // 2503
// Line 141:
// Line 142:    }

// ********* editSANDY Method ***********
@entry_editSANDY: // 2504
// Line 143:
// Line 144:	//will have to make sure that the owner is the only one who can edit the sandy name
// Line 145:    public editSANDY(nftOwner:address,tokenID:number,name:string){
ALIAS r1 $nftOwner // 2505
POP $nftOwner // 2505
PUSH $nftOwner // 2507
EXTCALL "Address()" // 2509
POP $nftOwner // 2524
ALIAS r2 $tokenID // 2526
POP $tokenID // 2526
CAST $tokenID $tokenID #Number // 2528
ALIAS r3 $name // 2532
POP $name // 2532
// Line 146:        Runtime.expect(Runtime.isWitness(nftOwner),"Must be owner of NFT");//have to find a way to get current nft owner
	ALIAS r4 $methodcallexpression467 // 2534
	COPY $nftOwner r5 // 2534
	PUSH r5 // 2537
	LOAD $methodcallexpression467 "Runtime.IsWitness" // 2539
	EXTCALL $methodcallexpression467 // 2560
	POP $methodcallexpression467 // 2562
	JMPIF $methodcallexpression467 @expect_methodcallexpression464 // 2564
	ALIAS r5 $literalexpression470 // 2568
	LOAD $literalexpression470 "Must be owner of NFT" // 2568
	THROW $literalexpression470 // 2592
	@expect_methodcallexpression464: NOP // 2595
// Line 147:		local editRam:body_ram = Struct.body_ram(name);
	ALIAS r4 $editRam // 2595
	CLEAR r5 // 2595
	COPY $name r7 // 2597
	LOAD r6 "name" // 2600
	PUT r7 r5 r6 // 2608
	COPY r5 $editRam // 2612
// Line 148:		//my assumption that write must follow the order of the struct 
// Line 149:        NFT.write(nftOwner,$THIS_SYMBOL,tokenID,editRam);//changeable data
	ALIAS r5 $methodcallexpression477 // 2615
	COPY $editRam r6 // 2615
	CAST r6 r6 #Bytes // 2618
	PUSH r6 // 2622
	COPY $tokenID r6 // 2624
	PUSH r6 // 2627
	ALIAS r6 $literalexpression484 // 2629
	LOAD $literalexpression484 "SANDY" // 2629
	PUSH $literalexpression484 // 2638
	COPY $nftOwner r6 // 2640
	PUSH r6 // 2643
	LOAD $methodcallexpression477 "Runtime.WriteToken" // 2645
	EXTCALL $methodcallexpression477 // 2667
@exit_editSANDY: // 2669
RET // 2670
// Line 150:
// Line 151:
// Line 152:    }

// ********* getRom Method ***********
@entry_getRom: // 2671
// Line 153:    //need to get readable rom 
// Line 154:    
// Line 155:    //- How do I make return type a struct initiialized to the rom size
// Line 156:    public getRom(symbol:string, id:number):body_rom {
ALIAS r1 $symbol // 2672
POP $symbol // 2672
ALIAS r2 $id // 2674
POP $id // 2674
CAST $id $id #Number // 2676
// Line 157:         local nftROM:body_rom = NFT.readROM<body_rom>($THIS_SYMBOL, id);
	ALIAS r3 $nftROM // 2680
	ALIAS r4 $methodcallexpression493 // 2680
	COPY $id r5 // 2680
	PUSH r5 // 2683
	ALIAS r5 $literalexpression497 // 2685
	LOAD $literalexpression497 "SANDY" // 2685
	PUSH $literalexpression497 // 2694
	LOAD $methodcallexpression493 "Runtime.ReadTokenROM" // 2696
	EXTCALL $methodcallexpression493 // 2720
	POP $methodcallexpression493 // 2722
	UNPACK $methodcallexpression493 $methodcallexpression493 // 2724
	COPY $methodcallexpression493 $nftROM // 2727
// Line 158:         
// Line 159:         return nftROM;
	COPY $nftROM r4 // 2730
	PUSH r4 // 2733
	JMP @exit_getRom // 2735
@exit_getRom: // 2738
RET // 2739
// Line 160:    }

// ********* getRam Method ***********
@entry_getRam: // 2740
// Line 161:
// Line 162:    public getRam(symbol:string, id:number): body_ram
ALIAS r1 $symbol // 2741
POP $symbol // 2741
ALIAS r2 $id // 2743
POP $id // 2743
CAST $id $id #Number // 2745
// Line 163:    {
// Line 164:        local nftRAM:body_ram = NFT.readRAM<body_ram>($THIS_SYMBOL, id);
	ALIAS r3 $nftRAM // 2749
	ALIAS r4 $methodcallexpression509 // 2749
	COPY $id r5 // 2749
	PUSH r5 // 2752
	ALIAS r5 $literalexpression513 // 2754
	LOAD $literalexpression513 "SANDY" // 2754
	PUSH $literalexpression513 // 2763
	LOAD $methodcallexpression509 "Runtime.ReadTokenRAM" // 2765
	EXTCALL $methodcallexpression509 // 2789
	POP $methodcallexpression509 // 2791
	UNPACK $methodcallexpression509 $methodcallexpression509 // 2793
	COPY $methodcallexpression509 $nftRAM // 2796
// Line 165:        return nftRAM;
	COPY $nftRAM r4 // 2799
	PUSH r4 // 2802
	JMP @exit_getRam // 2804
@exit_getRam: // 2807
RET // 2808
// Line 166:    }

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 2809
ALIAS r1 $dataGet // 2810
LOAD $dataGet "Data.Get" // 2810
ALIAS r2 $contractName // 2822
LOAD $contractName "SANDY" // 2822
ALIAS r3 $owner // 2831
// reading global: owner
LOAD r0 8 // 2831
PUSH r0 // 2836
LOAD r0 "owner" // 2838
PUSH r0 // 2847
PUSH $contractName // 2849
EXTCALL $dataGet // 2851
POP $owner // 2853
PUSH $owner // 2855
EXTCALL "Address()" // 2857
POP $owner // 2872
// Line 167:
// Line 168:    trigger onUpgrade(from:address)
ALIAS r1 $from // 2874
POP $from // 2874
PUSH $from // 2876
EXTCALL "Address()" // 2878
POP $from // 2893
// Line 169:    {
// Line 170:        // check is witness and is current owner
// Line 171:		Runtime.expect(Runtime.isWitness(owner), "invalid witness");
	ALIAS r2 $methodcallexpression527 // 2895
	COPY $owner r4 // 2895
	PUSH r4 // 2898
	LOAD $methodcallexpression527 "Runtime.IsWitness" // 2900
	EXTCALL $methodcallexpression527 // 2921
	POP $methodcallexpression527 // 2923
	JMPIF $methodcallexpression527 @expect_methodcallexpression524 // 2925
	ALIAS r4 $literalexpression530 // 2929
	LOAD $literalexpression530 "invalid witness" // 2929
	THROW $literalexpression530 // 2948
	@expect_methodcallexpression524: NOP // 2951
@exit_onUpgrade: // 2951
RET // 2952
// Line 172:    }

// ********* onMint Trigger ***********
@entry_onMint: // 2953
// Line 173:    //Mint function
// Line 174:    trigger onMint(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 2954
POP $from // 2954
PUSH $from // 2956
EXTCALL "Address()" // 2958
POP $from // 2973
ALIAS r2 $to // 2975
POP $to // 2975
PUSH $to // 2977
EXTCALL "Address()" // 2979
POP $to // 2994
ALIAS r3 $symbol // 2996
POP $symbol // 2996
ALIAS r4 $tokenID // 2998
POP $tokenID // 2998
CAST $tokenID $tokenID #Number // 3000
// Line 175:		Runtime.expect(symbol == $THIS_SYMBOL, "symbol mismatch");
	COPY $symbol r5 // 3004
	ALIAS r6 $literalexpression547 // 3007
	LOAD $literalexpression547 "SANDY" // 3007
	EQUAL r5 $literalexpression547 r7 // 3016
	JMPIF r7 @expect_methodcallexpression542 // 3020
	ALIAS r5 $literalexpression549 // 3024
	LOAD $literalexpression549 "symbol mismatch" // 3024
	THROW $literalexpression549 // 3043
	@expect_methodcallexpression542: NOP // 3046
@exit_onMint: // 3046
RET // 3047
// Line 176:        //might need to add NFT owns to right here 
// Line 177:    }

// ********* onInfuse Trigger ***********
@entry_onInfuse: // 3048
// Line 178:    trigger onInfuse(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 3049
POP $from // 3049
PUSH $from // 3051
EXTCALL "Address()" // 3053
POP $from // 3068
ALIAS r2 $to // 3070
POP $to // 3070
PUSH $to // 3072
EXTCALL "Address()" // 3074
POP $to // 3089
ALIAS r3 $symbol // 3091
POP $symbol // 3091
ALIAS r4 $tokenID // 3093
POP $tokenID // 3093
CAST $tokenID $tokenID #Number // 3095
// Line 179:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression564 // 3099
	COPY $from r6 // 3099
	PUSH r6 // 3102
	LOAD $methodcallexpression564 "Runtime.IsWitness" // 3104
	EXTCALL $methodcallexpression564 // 3125
	POP $methodcallexpression564 // 3127
	JMPIF $methodcallexpression564 @expect_methodcallexpression561 // 3129
	ALIAS r6 $literalexpression567 // 3133
	LOAD $literalexpression567 "witness failed" // 3133
	THROW $literalexpression567 // 3151
	@expect_methodcallexpression561: NOP // 3154
@exit_onInfuse: // 3154
RET // 3155
// Line 180:    }

// ********* onSeries Trigger ***********
@entry_onSeries: // 3156
// Line 181:
// Line 182:    trigger onSeries(from: address){
ALIAS r1 $from // 3157
POP $from // 3157
PUSH $from // 3159
EXTCALL "Address()" // 3161
POP $from // 3176
// Line 183:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression576 // 3178
	COPY $from r3 // 3178
	PUSH r3 // 3181
	LOAD $methodcallexpression576 "Runtime.IsWitness" // 3183
	EXTCALL $methodcallexpression576 // 3204
	POP $methodcallexpression576 // 3206
	JMPIF $methodcallexpression576 @expect_methodcallexpression573 // 3208
	ALIAS r3 $literalexpression579 // 3212
	LOAD $literalexpression579 "witness failed" // 3212
	THROW $literalexpression579 // 3230
	@expect_methodcallexpression573: NOP // 3233
@exit_onSeries: // 3233
RET // 3234
// Line 184:    }

// ********* onWrite Trigger ***********
@entry_onWrite: // 3235
// Line 185:    trigger onWrite(from: address,data:number){
ALIAS r1 $from // 3236
POP $from // 3236
PUSH $from // 3238
EXTCALL "Address()" // 3240
POP $from // 3255
ALIAS r2 $data // 3257
POP $data // 3257
CAST $data $data #Number // 3259
// Line 186:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression590 // 3263
	COPY $from r4 // 3263
	PUSH r4 // 3266
	LOAD $methodcallexpression590 "Runtime.IsWitness" // 3268
	EXTCALL $methodcallexpression590 // 3289
	POP $methodcallexpression590 // 3291
	JMPIF $methodcallexpression590 @expect_methodcallexpression587 // 3293
	ALIAS r4 $literalexpression593 // 3297
	LOAD $literalexpression593 "witness failed" // 3297
	THROW $literalexpression593 // 3315
	@expect_methodcallexpression587: NOP // 3318
@exit_onWrite: // 3318
RET // 3319
// Line 187:    }

// ********* onSend Trigger ***********
@entry_onSend: // 3320
// Line 188:    trigger onSend(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 3321
POP $from // 3321
PUSH $from // 3323
EXTCALL "Address()" // 3325
POP $from // 3340
ALIAS r2 $to // 3342
POP $to // 3342
PUSH $to // 3344
EXTCALL "Address()" // 3346
POP $to // 3361
ALIAS r3 $symbol // 3363
POP $symbol // 3363
ALIAS r4 $tokenID // 3365
POP $tokenID // 3365
CAST $tokenID $tokenID #Number // 3367
// Line 189:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression608 // 3371
	COPY $from r6 // 3371
	PUSH r6 // 3374
	LOAD $methodcallexpression608 "Runtime.IsWitness" // 3376
	EXTCALL $methodcallexpression608 // 3397
	POP $methodcallexpression608 // 3399
	JMPIF $methodcallexpression608 @expect_methodcallexpression605 // 3401
	ALIAS r6 $literalexpression611 // 3405
	LOAD $literalexpression611 "witness failed" // 3405
	THROW $literalexpression611 // 3423
	@expect_methodcallexpression605: NOP // 3426
@exit_onSend: // 3426
RET // 3427
// Line 190:    }

// ********* onBurn Trigger ***********
@entry_onBurn: // 3428
// Line 191:  
// Line 192:    trigger onBurn(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 3429
POP $from // 3429
PUSH $from // 3431
EXTCALL "Address()" // 3433
POP $from // 3448
ALIAS r2 $to // 3450
POP $to // 3450
PUSH $to // 3452
EXTCALL "Address()" // 3454
POP $to // 3469
ALIAS r3 $symbol // 3471
POP $symbol // 3471
ALIAS r4 $tokenID // 3473
POP $tokenID // 3473
CAST $tokenID $tokenID #Number // 3475
// Line 193:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression626 // 3479
	COPY $from r6 // 3479
	PUSH r6 // 3482
	LOAD $methodcallexpression626 "Runtime.IsWitness" // 3484
	EXTCALL $methodcallexpression626 // 3505
	POP $methodcallexpression626 // 3507
	JMPIF $methodcallexpression626 @expect_methodcallexpression623 // 3509
	ALIAS r6 $literalexpression629 // 3513
	LOAD $literalexpression629 "witness failed" // 3513
	THROW $literalexpression629 // 3531
	@expect_methodcallexpression623: NOP // 3534
@exit_onBurn: // 3534
RET // 3535
