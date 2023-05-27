
// ********* getName Property ***********
@entry_getName: // 0
	ALIAS r1 $literalexpression122 // 1
	LOAD $literalexpression122 "Test" // 1
	PUSH $literalexpression122 // 9
	JMP @exit_getName // 11
@exit_getName: // 14
RET // 15

// ********* getSymbol Property ***********
@entry_getSymbol: // 16
	ALIAS r1 $literalexpression126 // 17
	LOAD $literalexpression126 "TST" // 17
	PUSH $literalexpression126 // 24
	JMP @exit_getSymbol // 26
@exit_getSymbol: // 29
RET // 30

// ********* isBurnable Property ***********
@entry_isBurnable: // 31
	ALIAS r1 $literalexpression130 // 32
	LOAD $literalexpression130 true // 32
	PUSH $literalexpression130 // 37
	JMP @exit_isBurnable // 39
@exit_isBurnable: // 42
RET // 43

// ********* getMaxSupply Property ***********
@entry_getMaxSupply: // 44
	ALIAS r1 $literalexpression134 // 45
	LOAD $literalexpression134 0 // 45
	PUSH $literalexpression134 // 50
	JMP @exit_getMaxSupply // 52
@exit_getMaxSupply: // 55
RET // 56

// ********* getOwner Property ***********
@entry_getOwner: // 57
ALIAS r1 $dataGet // 58
LOAD $dataGet "Data.Get" // 58
ALIAS r2 $contractName // 70
LOAD $contractName "SANDY" // 70
ALIAS r3 $_owner // 79
// reading global: _owner
LOAD r0 8 // 79
PUSH r0 // 84
LOAD r0 "_owner" // 86
PUSH r0 // 96
PUSH $contractName // 98
EXTCALL $dataGet // 100
POP $_owner // 102
PUSH $_owner // 104
EXTCALL "Address()" // 106
POP $_owner // 121
	COPY $_owner r1 // 123
	PUSH r1 // 126
	JMP @exit_getOwner // 128
@exit_getOwner: // 131
RET // 132
// Line 62:
// Line 63:        }
// Line 64:
// Line 65:    }

// ********* Initialize Constructor ***********
@entry_constructor: // 133
ALIAS r1 $nexus_protocol_version // 134
// validate protocol version
LOAD r0 "Runtime.Version" // 134
EXTCALL r0 // 153
POP r0 // 155
LOAD $nexus_protocol_version 14 // 157
LT r0 $nexus_protocol_version r0 // 162
JMPNOT r0 @protocol_version_validated // 166
LOAD r0 "Current nexus protocol version should be 14 or more" // 170
THROW r0 // 225
@protocol_version_validated: NOP // 228
ALIAS r1 $_owner // 228
// clearing owns_sandy storage
LOAD r0 "owns_sandy" // 228
PUSH r0 // 242
LOAD r0 "Map.Clear" // 244
EXTCALL r0 // 257
ALIAS r2 $_timeGate // 259
ALIAS r3 $_infusionAmt // 259
ALIAS r4 $_infusionTkn // 259
// Line 66:      constructor(owner:address)
ALIAS r5 $owner // 259
POP $owner // 259
PUSH $owner // 261
EXTCALL "Address()" // 263
POP $owner // 278
// Line 67:    {
// Line 68:        _owner = owner;
	COPY $owner r6 // 280
	COPY r6 $_owner // 283
// Line 69:        _timeGate = true;
	ALIAS r6 $literalexpression225 // 286
	LOAD $literalexpression225 true // 286
	COPY $literalexpression225 $_timeGate // 291
// Line 70:        _infusionAmt = 25;
	ALIAS r6 $literalexpression227 // 294
	LOAD $literalexpression227 25 // 294
	COPY $literalexpression227 $_infusionAmt // 299
// Line 71:        _infusionTkn = "SOUL";
	ALIAS r6 $literalexpression229 // 302
	LOAD $literalexpression229 "SOUL" // 302
	COPY $literalexpression229 $_infusionTkn // 310
@exit_constructor: // 313
LOAD r5 "Data.Set" // 314
// writing global: _owner
PUSH $_owner // 326
LOAD r0 "_owner" // 328
PUSH r0 // 338
EXTCALL r5 // 340
// writing global: _timeGate
PUSH $_timeGate // 342
LOAD r0 "_timeGate" // 344
PUSH r0 // 357
EXTCALL r5 // 359
// writing global: _infusionAmt
PUSH $_infusionAmt // 361
LOAD r0 "_infusionAmt" // 363
PUSH r0 // 379
EXTCALL r5 // 381
// writing global: _infusionTkn
PUSH $_infusionTkn // 383
LOAD r0 "_infusionTkn" // 385
PUSH r0 // 401
EXTCALL r5 // 403
RET // 405
// Line 72:        //params: _owner,$THIS_SYMBOL,1?,SANDY_SUPPLY,TOKENSERIES.DUPLICATE,character
// Line 73:        //NFT.createSeries(from:, symbol:String, seriesID:Number, maxSupply:Number, mode:Enum, nft:Module);
// Line 74:    }

// ********* insertDNA Method ***********
@entry_insertDNA: // 406
// Line 75:    //logic to ensure mint stays withing specified bounds
// Line 76:   
// Line 77:   //a little something special Do LATER!!
// Line 78:	private insertDNA(dna:bytes):bytes {
ALIAS r1 $dna // 407
POP $dna // 407
// Line 79:        //encode bytes for an image.
// Line 80:        //manipulate some dna
// Line 81:        return 0x04;
	ALIAS r2 $literalexpression234 // 409
	LOAD $literalexpression234 0x04 // 409
	PUSH $literalexpression234 // 414
	JMP @exit_insertDNA // 416
@exit_insertDNA: // 419
RET // 420
// Line 82:	}

// ********* checkTimeGate Method ***********
@entry_checkTimeGate: // 421
ALIAS r1 $dataGet // 422
LOAD $dataGet "Data.Get" // 422
ALIAS r2 $contractName // 434
LOAD $contractName "SANDY" // 434
ALIAS r3 $_timeGate // 443
// reading global: _timeGate
LOAD r0 6 // 443
PUSH r0 // 448
LOAD r0 "_timeGate" // 450
PUSH r0 // 463
PUSH $contractName // 465
EXTCALL $dataGet // 467
POP $_timeGate // 469
// Line 83:
// Line 84:    private checkTimeGate():bool
// Line 85:    {
// Line 86:        // check if valie to limit 1 mint per address is valid
// Line 87:        if (_timeGate)
	COPY $_timeGate r1 // 471
		JMPNOT r1 @then_ifstatement238 // 474
// Line 88:        {
// Line 89:            return true;
		ALIAS r2 $literalexpression241 // 478
		LOAD $literalexpression241 true // 478
		PUSH $literalexpression241 // 483
		JMP @exit_checkTimeGate // 485
		@then_ifstatement238: NOP // 489
// Line 90:        }
// Line 91:        return false;
	ALIAS r1 $literalexpression243 // 489
	LOAD $literalexpression243 false // 489
	PUSH $literalexpression243 // 494
	JMP @exit_checkTimeGate // 496
@exit_checkTimeGate: // 499
RET // 500
// Line 92:    }

// ********* mint Method ***********
@entry_mint: // 501
ALIAS r1 $dataGet // 502
LOAD $dataGet "Data.Get" // 502
ALIAS r2 $contractName // 514
LOAD $contractName "SANDY" // 514
ALIAS r3 $_infusionAmt // 523
// reading global: _infusionAmt
LOAD r0 3 // 523
PUSH r0 // 528
LOAD r0 "_infusionAmt" // 530
PUSH r0 // 546
PUSH $contractName // 548
EXTCALL $dataGet // 550
POP $_infusionAmt // 552
ALIAS r4 $_infusionTkn // 554
// reading global: _infusionTkn
LOAD r0 4 // 554
PUSH r0 // 559
LOAD r0 "_infusionTkn" // 561
PUSH r0 // 577
PUSH $contractName // 579
EXTCALL $dataGet // 581
POP $_infusionTkn // 583
// Line 93:	//Mint nft from contract address and transfer to 
// Line 94:    private mint(creator:address,to:address,created:timestamp,dna: bytes,name: string,description: string,infoURL: string,imageURL: string,id:number) 
ALIAS r1 $creator // 585
POP $creator // 585
PUSH $creator // 587
EXTCALL "Address()" // 589
POP $creator // 604
ALIAS r2 $to // 606
POP $to // 606
PUSH $to // 608
EXTCALL "Address()" // 610
POP $to // 625
ALIAS r5 $created // 627
POP $created // 627
PUSH $created // 629
EXTCALL "Timestamp()" // 631
POP $created // 648
ALIAS r6 $dna // 650
POP $dna // 650
ALIAS r7 $name // 652
POP $name // 652
ALIAS r8 $description // 654
POP $description // 654
ALIAS r9 $infoURL // 656
POP $infoURL // 656
ALIAS r10 $imageURL // 658
POP $imageURL // 658
ALIAS r11 $id // 660
POP $id // 660
CAST $id $id #Number // 662
// Line 95:    {
// Line 96:         /*
// Line 97:        Possible Issue: What if transaction fails and buyer address is still added to storage_map?
// Line 98:        Answer?: only add user to storage_map once mint is confirmed.
// Line 99:        what does 
// Line 100:        */
// Line 101:        // so we're going to mint 500 nfts off rip
// Line 102:        // If they are clainming a SANDY then this will work differently 
// Line 103:        
// Line 104:
// Line 105:		local rom:body_rom = Struct.body_rom(Time.now(),this.insertDNA(dna),name,description,infoURL,imageURL);
	ALIAS r12 $rom // 666
	CLEAR r13 // 666
	ALIAS r15 $methodcallexpression272 // 668
	LOAD $methodcallexpression272 "Runtime.Time" // 668
	EXTCALL $methodcallexpression272 // 684
	POP $methodcallexpression272 // 686
	LOAD r14 "created" // 688
	PUT $methodcallexpression272 r13 r14 // 699
	ALIAS r15 $methodcallexpression273 // 703
	COPY $dna r16 // 703
	PUSH r16 // 706
	CALL @entry_insertDNA // 708
	POP $methodcallexpression273 // 712
	LOAD r14 "dna" // 714
	PUT $methodcallexpression273 r13 r14 // 721
	COPY $name r15 // 725
	LOAD r14 "name" // 728
	PUT r15 r13 r14 // 736
	COPY $description r15 // 740
	LOAD r14 "description" // 743
	PUT r15 r13 r14 // 758
	COPY $infoURL r15 // 762
	LOAD r14 "infoURL" // 765
	PUT r15 r13 r14 // 776
	COPY $imageURL r15 // 780
	LOAD r14 "imageURL" // 783
	PUT r15 r13 r14 // 795
	COPY r13 $rom // 799
// Line 106:        local ram:body_ram = Struct.body_ram("SANDY");//template name for now
	ALIAS r13 $ram // 802
	CLEAR r14 // 802
	ALIAS r16 $literalexpression284 // 804
	LOAD $literalexpression284 "SANDY" // 804
	LOAD r15 "name" // 813
	PUT $literalexpression284 r14 r15 // 821
	COPY r14 $ram // 825
// Line 107:        if(this.checkTimeGate()){
	ALIAS r14 $methodcallexpression288 // 828
	CALL @entry_checkTimeGate // 828
	POP $methodcallexpression288 // 832
		JMPNOT $methodcallexpression288 @else_ifstatement287 // 834
// Line 108:            //Runtime.expect(this.hasSANDY(creator) == false,'Cannot purchase due to you already owning a SANDY');
// Line 109:            Runtime.expect(owns_sandy.has(to) == false,"Cannot purchase due to you already owning a SANDY");
		LOAD r15 6 // field type // 838
		PUSH r15 // 843
		COPY $to r16 // 845
		PUSH r16 // 848
		ALIAS r16 $literalexpression310 // 850
		LOAD $literalexpression310 "owns_sandy" // 850
		PUSH $literalexpression310 // 864
		LOAD $literalexpression310 "SANDY" // contract name // 866
		PUSH $literalexpression310 // 875
		LOAD r15 "Map.Has" // 877
		EXTCALL r15 // 888
		POP r15 // 890
		ALIAS r16 $literalexpression312 // 892
		LOAD $literalexpression312 false // 892
		EQUAL r15 $literalexpression312 r17 // 897
		JMPIF r17 @expect_methodcallexpression291 // 901
		ALIAS r15 $literalexpression314 // 905
		LOAD $literalexpression314 "Cannot purchase due to you already owning a SANDY" // 905
		THROW $literalexpression314 // 958
		@expect_methodcallexpression291: NOP // 961
// Line 110:            //add logic to mint sandy and add creator to list of sandy owners
// Line 111:           
// Line 112:            //params:creator,to,$THIS_SYMBOL,body_rom,body_ram,id
// Line 113:            NFT.mint(creator, to, $THIS_SYMBOL, rom, ram, 1);//might change the series ID later
		ALIAS r15 $methodcallexpression316 // 961
		ALIAS r16 $literalexpression329 // 961
		LOAD $literalexpression329 1 // 961
		PUSH $literalexpression329 // 966
		COPY $ram r16 // 968
		CAST r16 r16 #Bytes // 971
		PUSH r16 // 975
		COPY $rom r16 // 977
		CAST r16 r16 #Bytes // 980
		PUSH r16 // 984
		ALIAS r16 $literalexpression326 // 986
		LOAD $literalexpression326 "SANDY" // 986
		PUSH $literalexpression326 // 995
		COPY $to r16 // 997
		PUSH r16 // 1000
		COPY $creator r16 // 1002
		PUSH r16 // 1005
		LOAD $methodcallexpression316 "Runtime.MintToken" // 1007
		EXTCALL $methodcallexpression316 // 1028
		POP $methodcallexpression316 // 1030
// Line 114:            //params: creator,$THIS_SYMBOL,id,_infusionTkn,_infuseAmt
// Line 115:            NFT.infuse(creator, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
		ALIAS r15 $methodcallexpression331 // 1032
		COPY $_infusionAmt r16 // 1032
		PUSH r16 // 1035
		COPY $_infusionTkn r16 // 1037
		PUSH r16 // 1040
		COPY $id r16 // 1042
		PUSH r16 // 1045
		ALIAS r16 $literalexpression339 // 1047
		LOAD $literalexpression339 "SANDY" // 1047
		PUSH $literalexpression339 // 1056
		COPY $creator r16 // 1058
		PUSH r16 // 1061
		LOAD $methodcallexpression331 "Runtime.InfuseToken" // 1063
		EXTCALL $methodcallexpression331 // 1086
// Line 116:            //assuming the minter is the to
// Line 117:            owns_sandy.set(to,true);
		ALIAS r15 $methodcallexpression344 // 1088
		ALIAS r16 $literalexpression352 // 1088
		LOAD $literalexpression352 true // 1088
		PUSH $literalexpression352 // 1093
		COPY $to r16 // 1095
		PUSH r16 // 1098
		ALIAS r16 $literalexpression350 // 1100
		LOAD $literalexpression350 "owns_sandy" // 1100
		PUSH $literalexpression350 // 1114
		LOAD $methodcallexpression344 "Map.Set" // 1116
		EXTCALL $methodcallexpression344 // 1127
		JMP @then_ifstatement287 // 1129
		@else_ifstatement287: NOP // 1133
// Line 118:        }
// Line 119:        else{
// Line 120:            //will still need to add creator to list of sandy owners
// Line 121:
// Line 122:             //params:creator,to,$THIS_SYMBOL,body_rom,body_ram,id
// Line 123:            NFT.mint(creator, to, $THIS_SYMBOL, rom, ram, 1);
		ALIAS r15 $methodcallexpression355 // 1133
		ALIAS r16 $literalexpression368 // 1133
		LOAD $literalexpression368 1 // 1133
		PUSH $literalexpression368 // 1138
		COPY $ram r16 // 1140
		CAST r16 r16 #Bytes // 1143
		PUSH r16 // 1147
		COPY $rom r16 // 1149
		CAST r16 r16 #Bytes // 1152
		PUSH r16 // 1156
		ALIAS r16 $literalexpression365 // 1158
		LOAD $literalexpression365 "SANDY" // 1158
		PUSH $literalexpression365 // 1167
		COPY $to r16 // 1169
		PUSH r16 // 1172
		COPY $creator r16 // 1174
		PUSH r16 // 1177
		LOAD $methodcallexpression355 "Runtime.MintToken" // 1179
		EXTCALL $methodcallexpression355 // 1200
		POP $methodcallexpression355 // 1202
// Line 124:            //params: creator,$THIS_SYMBOL,id,_infusionTkn,_infuseAmt
// Line 125:            NFT.infuse(creator, $THIS_SYMBOL, id, _infusionTkn, _infusionAmt);
		ALIAS r15 $methodcallexpression370 // 1204
		COPY $_infusionAmt r16 // 1204
		PUSH r16 // 1207
		COPY $_infusionTkn r16 // 1209
		PUSH r16 // 1212
		COPY $id r16 // 1214
		PUSH r16 // 1217
		ALIAS r16 $literalexpression378 // 1219
		LOAD $literalexpression378 "SANDY" // 1219
		PUSH $literalexpression378 // 1228
		COPY $creator r16 // 1230
		PUSH r16 // 1233
		LOAD $methodcallexpression370 "Runtime.InfuseToken" // 1235
		EXTCALL $methodcallexpression370 // 1258
		@then_ifstatement287: NOP // 1261
@exit_mint: // 1261
RET // 1262
// Line 126:        }
// Line 127:    } 

// ********* timeGate_switch Method ***********
@entry_timeGate_switch: // 1263
ALIAS r1 $dataGet // 1264
LOAD $dataGet "Data.Get" // 1264
ALIAS r2 $contractName // 1276
LOAD $contractName "SANDY" // 1276
ALIAS r3 $_owner // 1285
// reading global: _owner
LOAD r0 8 // 1285
PUSH r0 // 1290
LOAD r0 "_owner" // 1292
PUSH r0 // 1302
PUSH $contractName // 1304
EXTCALL $dataGet // 1306
POP $_owner // 1308
PUSH $_owner // 1310
EXTCALL "Address()" // 1312
POP $_owner // 1327
ALIAS r4 $_timeGate // 1329
// reading global: _timeGate
LOAD r0 6 // 1329
PUSH r0 // 1334
LOAD r0 "_timeGate" // 1336
PUSH r0 // 1349
PUSH $contractName // 1351
EXTCALL $dataGet // 1353
POP $_timeGate // 1355
// Line 128:    
// Line 129:    
// Line 130:    public timeGate_switch(){
// Line 131:        Runtime.expect(Runtime.isWitness(_owner),"witness failed");
	ALIAS r1 $methodcallexpression388 // 1357
	COPY $_owner r2 // 1357
	PUSH r2 // 1360
	LOAD $methodcallexpression388 "Runtime.IsWitness" // 1362
	EXTCALL $methodcallexpression388 // 1383
	POP $methodcallexpression388 // 1385
	JMPIF $methodcallexpression388 @expect_methodcallexpression385 // 1387
	ALIAS r2 $literalexpression391 // 1391
	LOAD $literalexpression391 "witness failed" // 1391
	THROW $literalexpression391 // 1409
	@expect_methodcallexpression385: NOP // 1412
// Line 132:        _timeGate = !_timeGate; //assuming negation works in phantasma. This should just negate the value.
	COPY $_timeGate r1 // 1412
	NOT r1 r1 // 1415
	COPY r1 $_timeGate // 1418
@exit_timeGate_switch: // 1421
LOAD r1 "Data.Set" // 1422
// writing global: _timeGate
PUSH $_timeGate // 1434
LOAD r0 "_timeGate" // 1436
PUSH r0 // 1449
EXTCALL r1 // 1451
RET // 1453
// Line 133:    }

// ********* validateMint Method ***********
@entry_validateMint: // 1454
// Line 134:
// Line 135:    //IF NFT.mint keeps track of MAX mint then there is no need for this function
// Line 136:	 private validateMint(creator:address)
ALIAS r1 $creator // 1455
POP $creator // 1455
PUSH $creator // 1457
EXTCALL "Address()" // 1459
POP $creator // 1474
@exit_validateMint: // 1476
RET // 1477
// Line 137:    {
// Line 138:        //not sure how to get a mint Number --> find out
// Line 139:        //Runtime.expect(Runtime.isWitness(creator),'witness failed');
// Line 140:		//Runtime.expect(mintNum > 0,"Mint must be greater than 0");
// Line 141:		//Runtime.expect(mintNum <= SANDY_SUPPLY,"Maximum number of SANDY has been minted");
// Line 142:
// Line 143:    }

// ********* mintToken Method ***********
@entry_mintToken: // 1478
// Line 144:
// Line 145:	//@Param MintNum - keeps track of how many current mints there are. May need to find a correct way to implement this
// Line 146:    public mintToken(creator:address,to:address,created:timestamp,dna: bytes,name: string,descritpion: string,infoURL: string,imageURL: string,id:number){
ALIAS r1 $creator // 1479
POP $creator // 1479
PUSH $creator // 1481
EXTCALL "Address()" // 1483
POP $creator // 1498
ALIAS r2 $to // 1500
POP $to // 1500
PUSH $to // 1502
EXTCALL "Address()" // 1504
POP $to // 1519
ALIAS r3 $created // 1521
POP $created // 1521
PUSH $created // 1523
EXTCALL "Timestamp()" // 1525
POP $created // 1542
ALIAS r4 $dna // 1544
POP $dna // 1544
ALIAS r5 $name // 1546
POP $name // 1546
ALIAS r6 $descritpion // 1548
POP $descritpion // 1548
ALIAS r7 $infoURL // 1550
POP $infoURL // 1550
ALIAS r8 $imageURL // 1552
POP $imageURL // 1552
ALIAS r9 $id // 1554
POP $id // 1554
CAST $id $id #Number // 1556
// Line 147:        Runtime.expect(Runtime.isWitness(creator),"Must own wallet you are minting from");
	ALIAS r10 $methodcallexpression423 // 1560
	COPY $creator r11 // 1560
	PUSH r11 // 1563
	LOAD $methodcallexpression423 "Runtime.IsWitness" // 1565
	EXTCALL $methodcallexpression423 // 1586
	POP $methodcallexpression423 // 1588
	JMPIF $methodcallexpression423 @expect_methodcallexpression420 // 1590
	ALIAS r11 $literalexpression426 // 1594
	LOAD $literalexpression426 "Must own wallet you are minting from" // 1594
	THROW $literalexpression426 // 1634
	@expect_methodcallexpression420: NOP // 1637
// Line 148:        this.mint(creator,to,created,this.insertDNA(dna),name,descritpion,infoURL,imageURL,id);
	ALIAS r10 $methodcallexpression428 // 1637
	COPY $id r11 // 1637
	PUSH r11 // 1640
	COPY $imageURL r11 // 1642
	PUSH r11 // 1645
	COPY $infoURL r11 // 1647
	PUSH r11 // 1650
	COPY $descritpion r11 // 1652
	PUSH r11 // 1655
	COPY $name r11 // 1657
	PUSH r11 // 1660
	ALIAS r11 $methodcallexpression441 // 1662
	COPY $dna r12 // 1662
	PUSH r12 // 1665
	CALL @entry_insertDNA // 1667
	POP $methodcallexpression441 // 1671
	PUSH $methodcallexpression441 // 1673
	COPY $created r11 // 1675
	PUSH r11 // 1678
	COPY $to r11 // 1680
	PUSH r11 // 1683
	COPY $creator r11 // 1685
	PUSH r11 // 1688
	CALL @entry_mint // 1690
@exit_mintToken: // 1694
RET // 1695
// Line 149:    
// Line 150:    }

// ********* transerNFT Method ***********
@entry_transerNFT: // 1696
// Line 151:    public transerNFT(from:address,to:address,id:number){
ALIAS r1 $from // 1697
POP $from // 1697
PUSH $from // 1699
EXTCALL "Address()" // 1701
POP $from // 1716
ALIAS r2 $to // 1718
POP $to // 1718
PUSH $to // 1720
EXTCALL "Address()" // 1722
POP $to // 1737
ALIAS r3 $id // 1739
POP $id // 1739
CAST $id $id #Number // 1741
// Line 152:        //Will only have this turned on once.
// Line 153:        Runtime.expect(Runtime.isWitness(from),"Must be owner of NFT to Transfer");
	ALIAS r4 $methodcallexpression461 // 1745
	COPY $from r5 // 1745
	PUSH r5 // 1748
	LOAD $methodcallexpression461 "Runtime.IsWitness" // 1750
	EXTCALL $methodcallexpression461 // 1771
	POP $methodcallexpression461 // 1773
	JMPIF $methodcallexpression461 @expect_methodcallexpression458 // 1775
	ALIAS r5 $literalexpression464 // 1779
	LOAD $literalexpression464 "Must be owner of NFT to Transfer" // 1779
	THROW $literalexpression464 // 1815
	@expect_methodcallexpression458: NOP // 1818
// Line 154:   
// Line 155:            NFT.transfer(from,to,$THIS_SYMBOL,id);
	ALIAS r4 $methodcallexpression466 // 1818
	COPY $id r5 // 1818
	PUSH r5 // 1821
	ALIAS r5 $literalexpression474 // 1823
	LOAD $literalexpression474 "SANDY" // 1823
	PUSH $literalexpression474 // 1832
	COPY $to r5 // 1834
	PUSH r5 // 1837
	COPY $from r5 // 1839
	PUSH r5 // 1842
	LOAD $methodcallexpression466 "Runtime.TransferToken" // 1844
	EXTCALL $methodcallexpression466 // 1869
@exit_transerNFT: // 1871
RET // 1872
// Line 156:
// Line 157:    }

// ********* editSANDY Method ***********
@entry_editSANDY: // 1873
// Line 158:
// Line 159:	//will have to make sure that the owner is the only one who can edit the sandy name
// Line 160:    public editSANDY(nftOwner:address,tokenID:number,name:string){
ALIAS r1 $nftOwner // 1874
POP $nftOwner // 1874
PUSH $nftOwner // 1876
EXTCALL "Address()" // 1878
POP $nftOwner // 1893
ALIAS r2 $tokenID // 1895
POP $tokenID // 1895
CAST $tokenID $tokenID #Number // 1897
ALIAS r3 $name // 1901
POP $name // 1901
// Line 161:        Runtime.expect(Runtime.isWitness(nftOwner),"Must be owner of NFT");//have to find a way to get current nft owner
	ALIAS r4 $methodcallexpression488 // 1903
	COPY $nftOwner r5 // 1903
	PUSH r5 // 1906
	LOAD $methodcallexpression488 "Runtime.IsWitness" // 1908
	EXTCALL $methodcallexpression488 // 1929
	POP $methodcallexpression488 // 1931
	JMPIF $methodcallexpression488 @expect_methodcallexpression485 // 1933
	ALIAS r5 $literalexpression491 // 1937
	LOAD $literalexpression491 "Must be owner of NFT" // 1937
	THROW $literalexpression491 // 1961
	@expect_methodcallexpression485: NOP // 1964
// Line 162:		local editRam:body_ram = Struct.body_ram(name);
	ALIAS r4 $editRam // 1964
	CLEAR r5 // 1964
	COPY $name r7 // 1966
	LOAD r6 "name" // 1969
	PUT r7 r5 r6 // 1977
	COPY r5 $editRam // 1981
// Line 163:		//my assumption that write must follow the order of the struct 
// Line 164:        NFT.write(nftOwner,$THIS_SYMBOL,tokenID,editRam);//changeable data
	ALIAS r5 $methodcallexpression498 // 1984
	COPY $editRam r6 // 1984
	CAST r6 r6 #Bytes // 1987
	PUSH r6 // 1991
	COPY $tokenID r6 // 1993
	PUSH r6 // 1996
	ALIAS r6 $literalexpression505 // 1998
	LOAD $literalexpression505 "SANDY" // 1998
	PUSH $literalexpression505 // 2007
	COPY $nftOwner r6 // 2009
	PUSH r6 // 2012
	LOAD $methodcallexpression498 "Runtime.WriteToken" // 2014
	EXTCALL $methodcallexpression498 // 2036
@exit_editSANDY: // 2038
RET // 2039
// Line 165:
// Line 166:
// Line 167:    }

// ********* getRom Method ***********
@entry_getRom: // 2040
// Line 168:    //need to get readable rom 
// Line 169:    
// Line 170:    //- How do I make return type a struct initiialized to the rom size
// Line 171:    public getRom(symbol:string, id:number):body_rom {
ALIAS r1 $symbol // 2041
POP $symbol // 2041
ALIAS r2 $id // 2043
POP $id // 2043
CAST $id $id #Number // 2045
// Line 172:         local nftROM:body_rom = NFT.readROM<body_rom>($THIS_SYMBOL, id);
	ALIAS r3 $nftROM // 2049
	ALIAS r4 $methodcallexpression514 // 2049
	COPY $id r5 // 2049
	PUSH r5 // 2052
	ALIAS r5 $literalexpression518 // 2054
	LOAD $literalexpression518 "SANDY" // 2054
	PUSH $literalexpression518 // 2063
	LOAD $methodcallexpression514 "Runtime.ReadTokenROM" // 2065
	EXTCALL $methodcallexpression514 // 2089
	POP $methodcallexpression514 // 2091
	UNPACK $methodcallexpression514 $methodcallexpression514 // 2093
	COPY $methodcallexpression514 $nftROM // 2096
// Line 173:         
// Line 174:         return nftROM;
	COPY $nftROM r4 // 2099
	PUSH r4 // 2102
	JMP @exit_getRom // 2104
@exit_getRom: // 2107
RET // 2108
// Line 175:    }

// ********* getRam Method ***********
@entry_getRam: // 2109
// Line 176:
// Line 177:    public getRam(symbol:string, id:number): body_ram
ALIAS r1 $symbol // 2110
POP $symbol // 2110
ALIAS r2 $id // 2112
POP $id // 2112
CAST $id $id #Number // 2114
// Line 178:    {
// Line 179:        local nftRAM:body_ram = NFT.readRAM<body_ram>($THIS_SYMBOL, id);
	ALIAS r3 $nftRAM // 2118
	ALIAS r4 $methodcallexpression530 // 2118
	COPY $id r5 // 2118
	PUSH r5 // 2121
	ALIAS r5 $literalexpression534 // 2123
	LOAD $literalexpression534 "SANDY" // 2123
	PUSH $literalexpression534 // 2132
	LOAD $methodcallexpression530 "Runtime.ReadTokenRAM" // 2134
	EXTCALL $methodcallexpression530 // 2158
	POP $methodcallexpression530 // 2160
	UNPACK $methodcallexpression530 $methodcallexpression530 // 2162
	COPY $methodcallexpression530 $nftRAM // 2165
// Line 180:        return nftRAM;
	COPY $nftRAM r4 // 2168
	PUSH r4 // 2171
	JMP @exit_getRam // 2173
@exit_getRam: // 2176
RET // 2177
// Line 181:    }

// ********* onUpgrade Trigger ***********
@entry_onUpgrade: // 2178
ALIAS r1 $dataGet // 2179
LOAD $dataGet "Data.Get" // 2179
ALIAS r2 $contractName // 2191
LOAD $contractName "SANDY" // 2191
ALIAS r3 $_owner // 2200
// reading global: _owner
LOAD r0 8 // 2200
PUSH r0 // 2205
LOAD r0 "_owner" // 2207
PUSH r0 // 2217
PUSH $contractName // 2219
EXTCALL $dataGet // 2221
POP $_owner // 2223
PUSH $_owner // 2225
EXTCALL "Address()" // 2227
POP $_owner // 2242
// Line 182:
// Line 183:    trigger onUpgrade(from:address)
ALIAS r1 $from // 2244
POP $from // 2244
PUSH $from // 2246
EXTCALL "Address()" // 2248
POP $from // 2263
// Line 184:    {
// Line 185:        // check is witness and is current owner
// Line 186:		Runtime.expect(Runtime.isWitness(_owner), "invalid witness");
	ALIAS r2 $methodcallexpression548 // 2265
	COPY $_owner r4 // 2265
	PUSH r4 // 2268
	LOAD $methodcallexpression548 "Runtime.IsWitness" // 2270
	EXTCALL $methodcallexpression548 // 2291
	POP $methodcallexpression548 // 2293
	JMPIF $methodcallexpression548 @expect_methodcallexpression545 // 2295
	ALIAS r4 $literalexpression551 // 2299
	LOAD $literalexpression551 "invalid witness" // 2299
	THROW $literalexpression551 // 2318
	@expect_methodcallexpression545: NOP // 2321
@exit_onUpgrade: // 2321
RET // 2322
// Line 187:    }

// ********* onMint Trigger ***********
@entry_onMint: // 2323
ALIAS r1 $dataGet // 2324
LOAD $dataGet "Data.Get" // 2324
ALIAS r2 $contractName // 2336
LOAD $contractName "SANDY" // 2336
ALIAS r3 $_owner // 2345
// reading global: _owner
LOAD r0 8 // 2345
PUSH r0 // 2350
LOAD r0 "_owner" // 2352
PUSH r0 // 2362
PUSH $contractName // 2364
EXTCALL $dataGet // 2366
POP $_owner // 2368
PUSH $_owner // 2370
EXTCALL "Address()" // 2372
POP $_owner // 2387
// Line 188:    //Mint function
// Line 189:    trigger onMint(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 2389
POP $from // 2389
PUSH $from // 2391
EXTCALL "Address()" // 2393
POP $from // 2408
ALIAS r2 $to // 2410
POP $to // 2410
PUSH $to // 2412
EXTCALL "Address()" // 2414
POP $to // 2429
ALIAS r4 $symbol // 2431
POP $symbol // 2431
ALIAS r5 $tokenID // 2433
POP $tokenID // 2433
CAST $tokenID $tokenID #Number // 2435
// Line 190:		Runtime.expect(Runtime.isWitness(_owner), "witness failed"); 
	ALIAS r6 $methodcallexpression566 // 2439
	COPY $_owner r7 // 2439
	PUSH r7 // 2442
	LOAD $methodcallexpression566 "Runtime.IsWitness" // 2444
	EXTCALL $methodcallexpression566 // 2465
	POP $methodcallexpression566 // 2467
	JMPIF $methodcallexpression566 @expect_methodcallexpression563 // 2469
	ALIAS r7 $literalexpression569 // 2473
	LOAD $literalexpression569 "witness failed" // 2473
	THROW $literalexpression569 // 2491
	@expect_methodcallexpression563: NOP // 2494
// Line 191:		Runtime.expect(symbol == $THIS_SYMBOL, "symbol mismatch");
	COPY $symbol r6 // 2494
	ALIAS r7 $literalexpression576 // 2497
	LOAD $literalexpression576 "SANDY" // 2497
	EQUAL r6 $literalexpression576 r8 // 2506
	JMPIF r8 @expect_methodcallexpression571 // 2510
	ALIAS r6 $literalexpression578 // 2514
	LOAD $literalexpression578 "symbol mismatch" // 2514
	THROW $literalexpression578 // 2533
	@expect_methodcallexpression571: NOP // 2536
@exit_onMint: // 2536
RET // 2537
// Line 192:        //might need to add NFT owns to right here 
// Line 193:    }

// ********* onInfuse Trigger ***********
@entry_onInfuse: // 2538
// Line 194:    trigger onInfuse(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 2539
POP $from // 2539
PUSH $from // 2541
EXTCALL "Address()" // 2543
POP $from // 2558
ALIAS r2 $to // 2560
POP $to // 2560
PUSH $to // 2562
EXTCALL "Address()" // 2564
POP $to // 2579
ALIAS r3 $symbol // 2581
POP $symbol // 2581
ALIAS r4 $tokenID // 2583
POP $tokenID // 2583
CAST $tokenID $tokenID #Number // 2585
// Line 195:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression593 // 2589
	COPY $from r6 // 2589
	PUSH r6 // 2592
	LOAD $methodcallexpression593 "Runtime.IsWitness" // 2594
	EXTCALL $methodcallexpression593 // 2615
	POP $methodcallexpression593 // 2617
	JMPIF $methodcallexpression593 @expect_methodcallexpression590 // 2619
	ALIAS r6 $literalexpression596 // 2623
	LOAD $literalexpression596 "witness failed" // 2623
	THROW $literalexpression596 // 2641
	@expect_methodcallexpression590: NOP // 2644
@exit_onInfuse: // 2644
RET // 2645
// Line 196:    }

// ********* onSeries Trigger ***********
@entry_onSeries: // 2646
// Line 197:
// Line 198:    trigger onSeries(from: address){
ALIAS r1 $from // 2647
POP $from // 2647
PUSH $from // 2649
EXTCALL "Address()" // 2651
POP $from // 2666
// Line 199:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r2 $methodcallexpression605 // 2668
	COPY $from r3 // 2668
	PUSH r3 // 2671
	LOAD $methodcallexpression605 "Runtime.IsWitness" // 2673
	EXTCALL $methodcallexpression605 // 2694
	POP $methodcallexpression605 // 2696
	JMPIF $methodcallexpression605 @expect_methodcallexpression602 // 2698
	ALIAS r3 $literalexpression608 // 2702
	LOAD $literalexpression608 "witness failed" // 2702
	THROW $literalexpression608 // 2720
	@expect_methodcallexpression602: NOP // 2723
@exit_onSeries: // 2723
RET // 2724
// Line 200:    }

// ********* onWrite Trigger ***********
@entry_onWrite: // 2725
// Line 201:    trigger onWrite(from: address,data:number){
ALIAS r1 $from // 2726
POP $from // 2726
PUSH $from // 2728
EXTCALL "Address()" // 2730
POP $from // 2745
ALIAS r2 $data // 2747
POP $data // 2747
CAST $data $data #Number // 2749
// Line 202:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r3 $methodcallexpression619 // 2753
	COPY $from r4 // 2753
	PUSH r4 // 2756
	LOAD $methodcallexpression619 "Runtime.IsWitness" // 2758
	EXTCALL $methodcallexpression619 // 2779
	POP $methodcallexpression619 // 2781
	JMPIF $methodcallexpression619 @expect_methodcallexpression616 // 2783
	ALIAS r4 $literalexpression622 // 2787
	LOAD $literalexpression622 "witness failed" // 2787
	THROW $literalexpression622 // 2805
	@expect_methodcallexpression616: NOP // 2808
@exit_onWrite: // 2808
RET // 2809
// Line 203:    }

// ********* onSend Trigger ***********
@entry_onSend: // 2810
// Line 204:    trigger onSend(from: address, to: address, symbol: string, tokenID: number){
ALIAS r1 $from // 2811
POP $from // 2811
PUSH $from // 2813
EXTCALL "Address()" // 2815
POP $from // 2830
ALIAS r2 $to // 2832
POP $to // 2832
PUSH $to // 2834
EXTCALL "Address()" // 2836
POP $to // 2851
ALIAS r3 $symbol // 2853
POP $symbol // 2853
ALIAS r4 $tokenID // 2855
POP $tokenID // 2855
CAST $tokenID $tokenID #Number // 2857
// Line 205:        Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression637 // 2861
	COPY $from r6 // 2861
	PUSH r6 // 2864
	LOAD $methodcallexpression637 "Runtime.IsWitness" // 2866
	EXTCALL $methodcallexpression637 // 2887
	POP $methodcallexpression637 // 2889
	JMPIF $methodcallexpression637 @expect_methodcallexpression634 // 2891
	ALIAS r6 $literalexpression640 // 2895
	LOAD $literalexpression640 "witness failed" // 2895
	THROW $literalexpression640 // 2913
	@expect_methodcallexpression634: NOP // 2916
@exit_onSend: // 2916
RET // 2917
// Line 206:    }

// ********* onBurn Trigger ***********
@entry_onBurn: // 2918
// Line 207:  
// Line 208:    trigger onBurn(from: address, to: address, symbol: string, tokenID: number) {
ALIAS r1 $from // 2919
POP $from // 2919
PUSH $from // 2921
EXTCALL "Address()" // 2923
POP $from // 2938
ALIAS r2 $to // 2940
POP $to // 2940
PUSH $to // 2942
EXTCALL "Address()" // 2944
POP $to // 2959
ALIAS r3 $symbol // 2961
POP $symbol // 2961
ALIAS r4 $tokenID // 2963
POP $tokenID // 2963
CAST $tokenID $tokenID #Number // 2965
// Line 209:		Runtime.expect(Runtime.isWitness(from), "witness failed");
	ALIAS r5 $methodcallexpression655 // 2969
	COPY $from r6 // 2969
	PUSH r6 // 2972
	LOAD $methodcallexpression655 "Runtime.IsWitness" // 2974
	EXTCALL $methodcallexpression655 // 2995
	POP $methodcallexpression655 // 2997
	JMPIF $methodcallexpression655 @expect_methodcallexpression652 // 2999
	ALIAS r6 $literalexpression658 // 3003
	LOAD $literalexpression658 "witness failed" // 3003
	THROW $literalexpression658 // 3021
	@expect_methodcallexpression652: NOP // 3024
@exit_onBurn: // 3024
RET // 3025
