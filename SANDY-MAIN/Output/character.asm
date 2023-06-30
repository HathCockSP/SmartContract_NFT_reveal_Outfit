// Line 106:        }
// Line 107:    }
// Line 108:
// Line 109:    nft character<body_rom, body_ram> {

// ********* getName Property ***********
@entry_getName: // 0
POP r1 // get nft tokenID from stack // 1
// reading nft data
LOAD r0 "ROM" // 3
PUSH r0 // fields // 10
PUSH r1 // tokenID // 12
LOAD r0 "STST" // 14
PUSH r0 // symbol // 22
LOAD r0 "Runtime.ReadToken" // 24
EXTCALL r0 // 45
POP r2 // 47
UNPACK r2 r2 // 49
ALIAS r3 $_ROM // 52
LOAD r0 "ROM" // 52
GET r2 $_ROM r0 // 59
UNPACK $_ROM $_ROM // 63
// Line 110:        property name: string{
// Line 111:            return _ROM.name;
	COPY $_ROM r1 // 66
	LOAD r2 "name" // 69
	GET r1 r1 r2 // 77
	PUSH r1 // 81
	JMP @exit_getName // 83
@exit_getName: // 86
RET // 87
// Line 112:        }

// ********* getDescription Property ***********
@entry_getDescription: // 88
POP r1 // get nft tokenID from stack // 89
// reading nft data
LOAD r0 "ROM" // 91
PUSH r0 // fields // 98
PUSH r1 // tokenID // 100
LOAD r0 "STST" // 102
PUSH r0 // symbol // 110
LOAD r0 "Runtime.ReadToken" // 112
EXTCALL r0 // 133
POP r2 // 135
UNPACK r2 r2 // 137
ALIAS r3 $_ROM // 140
LOAD r0 "ROM" // 140
GET r2 $_ROM r0 // 147
UNPACK $_ROM $_ROM // 151
// Line 113:
// Line 114:        property description: string {
// Line 115:            return _ROM.description;
	COPY $_ROM r1 // 154
	LOAD r2 "description" // 157
	GET r1 r1 r2 // 172
	PUSH r1 // 176
	JMP @exit_getDescription // 178
@exit_getDescription: // 181
RET // 182
// Line 116:        }

// ********* getInfoURL Property ***********
@entry_getInfoURL: // 183
POP r1 // get nft tokenID from stack // 184
// reading nft data
LOAD r0 "ROM" // 186
PUSH r0 // fields // 193
PUSH r1 // tokenID // 195
LOAD r0 "STST" // 197
PUSH r0 // symbol // 205
LOAD r0 "Runtime.ReadToken" // 207
EXTCALL r0 // 228
POP r2 // 230
UNPACK r2 r2 // 232
ALIAS r3 $_ROM // 235
LOAD r0 "ROM" // 235
GET r2 $_ROM r0 // 242
UNPACK $_ROM $_ROM // 246
// Line 117:
// Line 118:        property infoURL: string {
// Line 119:            return _ROM.infoURL;
	COPY $_ROM r1 // 249
	LOAD r2 "infoURL" // 252
	GET r1 r1 r2 // 263
	PUSH r1 // 267
	JMP @exit_getInfoURL // 269
@exit_getInfoURL: // 272
RET // 273
// Line 120:        }

// ********* getImageURL Property ***********
@entry_getImageURL: // 274
POP r1 // get nft tokenID from stack // 275
// reading nft data
LOAD r0 "ROM" // 277
PUSH r0 // fields // 284
PUSH r1 // tokenID // 286
LOAD r0 "STST" // 288
PUSH r0 // symbol // 296
LOAD r0 "Runtime.ReadToken" // 298
EXTCALL r0 // 319
POP r2 // 321
UNPACK r2 r2 // 323
ALIAS r3 $_ROM // 326
LOAD r0 "ROM" // 326
GET r2 $_ROM r0 // 333
UNPACK $_ROM $_ROM // 337
// Line 121:        property imageURL: string {
// Line 122:           return  _ROM.imageURL;
	COPY $_ROM r1 // 340
	LOAD r2 "imageURL" // 343
	GET r1 r1 r2 // 355
	PUSH r1 // 359
	JMP @exit_getImageURL // 361
@exit_getImageURL: // 364
RET // 365
// Line 123:        }

// ********* getCreated Property ***********
@entry_getCreated: // 366
POP r1 // get nft tokenID from stack // 367
// reading nft data
LOAD r0 "ROM" // 369
PUSH r0 // fields // 376
PUSH r1 // tokenID // 378
LOAD r0 "STST" // 380
PUSH r0 // symbol // 388
LOAD r0 "Runtime.ReadToken" // 390
EXTCALL r0 // 411
POP r2 // 413
UNPACK r2 r2 // 415
ALIAS r3 $_ROM // 418
LOAD r0 "ROM" // 418
GET r2 $_ROM r0 // 425
UNPACK $_ROM $_ROM // 429
// Line 124:
// Line 125:        property created: timestamp { 
// Line 126:            return _ROM.created;
	COPY $_ROM r1 // 432
	LOAD r2 "created" // 435
	GET r1 r1 r2 // 446
	PUSH r1 // 450
	JMP @exit_getCreated // 452
@exit_getCreated: // 455
RET // 456
// Line 127:        }

// ********* getSandType Property ***********
@entry_getSandType: // 457
POP r1 // get nft tokenID from stack // 458
// reading nft data
LOAD r0 "ROM" // 460
PUSH r0 // fields // 467
PUSH r1 // tokenID // 469
LOAD r0 "STST" // 471
PUSH r0 // symbol // 479
LOAD r0 "Runtime.ReadToken" // 481
EXTCALL r0 // 502
POP r2 // 504
UNPACK r2 r2 // 506
ALIAS r3 $_ROM // 509
LOAD r0 "ROM" // 509
GET r2 $_ROM r0 // 516
UNPACK $_ROM $_ROM // 520
// Line 128:
// Line 129:        property sandType: string {
// Line 130:            return _ROM.sandType;
	COPY $_ROM r1 // 523
	LOAD r2 "sandType" // 526
	GET r1 r1 r2 // 538
	PUSH r1 // 542
	JMP @exit_getSandType // 544
@exit_getSandType: // 547
RET // 548
// Line 131:        }

// ********* getSkinType Property ***********
@entry_getSkinType: // 549
POP r1 // get nft tokenID from stack // 550
// reading nft data
LOAD r0 "ROM" // 552
PUSH r0 // fields // 559
PUSH r1 // tokenID // 561
LOAD r0 "STST" // 563
PUSH r0 // symbol // 571
LOAD r0 "Runtime.ReadToken" // 573
EXTCALL r0 // 594
POP r2 // 596
UNPACK r2 r2 // 598
ALIAS r3 $_ROM // 601
LOAD r0 "ROM" // 601
GET r2 $_ROM r0 // 608
UNPACK $_ROM $_ROM // 612
// Line 132:
// Line 133:        property skinType: string {
// Line 134:            return _ROM.skinType;
	COPY $_ROM r1 // 615
	LOAD r2 "skinType" // 618
	GET r1 r1 r2 // 630
	PUSH r1 // 634
	JMP @exit_getSkinType // 636
@exit_getSkinType: // 639
RET // 640
// Line 135:        }

// ********* getBodyType Property ***********
@entry_getBodyType: // 641
POP r1 // get nft tokenID from stack // 642
// reading nft data
LOAD r0 "ROM" // 644
PUSH r0 // fields // 651
PUSH r1 // tokenID // 653
LOAD r0 "STST" // 655
PUSH r0 // symbol // 663
LOAD r0 "Runtime.ReadToken" // 665
EXTCALL r0 // 686
POP r2 // 688
UNPACK r2 r2 // 690
ALIAS r3 $_ROM // 693
LOAD r0 "ROM" // 693
GET r2 $_ROM r0 // 700
UNPACK $_ROM $_ROM // 704
// Line 136:
// Line 137:        property bodyType: number {
// Line 138:            return _ROM.bodyType;
	COPY $_ROM r1 // 707
	LOAD r2 "bodyType" // 710
	GET r1 r1 r2 // 722
	PUSH r1 // 726
	JMP @exit_getBodyType // 728
@exit_getBodyType: // 731
RET // 732
// Line 139:        }

// ********* getCategoryName Property ***********
@entry_getCategoryName: // 733
POP r1 // get nft tokenID from stack // 734
// reading nft data
LOAD r0 "ROM" // 736
PUSH r0 // fields // 743
PUSH r1 // tokenID // 745
LOAD r0 "STST" // 747
PUSH r0 // symbol // 755
LOAD r0 "Runtime.ReadToken" // 757
EXTCALL r0 // 778
POP r2 // 780
UNPACK r2 r2 // 782
ALIAS r3 $_ROM // 785
LOAD r0 "ROM" // 785
GET r2 $_ROM r0 // 792
UNPACK $_ROM $_ROM // 796
// Line 140:
// Line 141:        property categoryName: string {
// Line 142:            local index: number = _ROM.bodyType;
	ALIAS r1 $index // 799
	COPY $_ROM r2 // 799
	LOAD r4 "bodyType" // 802
	GET r2 r2 r4 // 814
	COPY r2 $index // 818
// Line 143:
// Line 144:            if (_ROM.skinType == "Energy") {
	COPY $_ROM r2 // 821
	LOAD r4 "skinType" // 824
	GET r2 r2 r4 // 836
	ALIAS r4 $literalexpression423 // 840
	LOAD $literalexpression423 "Energy" // 840
	EQUAL r2 $literalexpression423 r5 // 850
		JMPNOT r5 @else_ifstatement421 // 854
// Line 145:                local energyArray: array<string> = {"Glass", "Ice", "Lightning", "Reborn", "Sand Storm", "Smoke", "Soul Glass", "Volcano Ash", "Volcano Rock", "White Sand Storm"};
		ALIAS r2 $energyArray // 858
		ALIAS r4 $arrayexpression426 // 858
		CLEAR $arrayexpression426 // 858
		ALIAS r6 $_array_init_idx // 860
		ALIAS r7 $literalexpression427 // 860
		LOAD $literalexpression427 "Glass" // 860
		LOAD $_array_init_idx 0 // 869
		PUT $literalexpression427 $arrayexpression426 $_array_init_idx // 874
		ALIAS r7 $literalexpression428 // 878
		LOAD $literalexpression428 "Ice" // 878
		LOAD $_array_init_idx 1 // 885
		PUT $literalexpression428 $arrayexpression426 $_array_init_idx // 890
		ALIAS r7 $literalexpression429 // 894
		LOAD $literalexpression429 "Lightning" // 894
		LOAD $_array_init_idx 2 // 907
		PUT $literalexpression429 $arrayexpression426 $_array_init_idx // 912
		ALIAS r7 $literalexpression430 // 916
		LOAD $literalexpression430 "Reborn" // 916
		LOAD $_array_init_idx 3 // 926
		PUT $literalexpression430 $arrayexpression426 $_array_init_idx // 931
		ALIAS r7 $literalexpression431 // 935
		LOAD $literalexpression431 "Sand Storm" // 935
		LOAD $_array_init_idx 4 // 949
		PUT $literalexpression431 $arrayexpression426 $_array_init_idx // 954
		ALIAS r7 $literalexpression432 // 958
		LOAD $literalexpression432 "Smoke" // 958
		LOAD $_array_init_idx 5 // 967
		PUT $literalexpression432 $arrayexpression426 $_array_init_idx // 972
		ALIAS r7 $literalexpression433 // 976
		LOAD $literalexpression433 "Soul Glass" // 976
		LOAD $_array_init_idx 6 // 990
		PUT $literalexpression433 $arrayexpression426 $_array_init_idx // 995
		ALIAS r7 $literalexpression434 // 999
		LOAD $literalexpression434 "Volcano Ash" // 999
		LOAD $_array_init_idx 7 // 1014
		PUT $literalexpression434 $arrayexpression426 $_array_init_idx // 1019
		ALIAS r7 $literalexpression435 // 1023
		LOAD $literalexpression435 "Volcano Rock" // 1023
		LOAD $_array_init_idx 8 // 1039
		PUT $literalexpression435 $arrayexpression426 $_array_init_idx // 1044
		ALIAS r7 $literalexpression436 // 1048
		LOAD $literalexpression436 "White Sand Storm" // 1048
		LOAD $_array_init_idx 9 // 1068
		PUT $literalexpression436 $arrayexpression426 $_array_init_idx // 1073
		COPY $arrayexpression426 $energyArray // 1077
// Line 146:                
// Line 147:                return energyArray[index];
		COPY $index r6 // 1080
		GET $energyArray r4 r6 // 1083
		PUSH r4 // 1087
		JMP @exit_getCategoryName // 1089
		JMP @then_ifstatement421 // 1092
		@else_ifstatement421: NOP // 1096
// Line 148:            } else if (_ROM.skinType == "Organic") {
		COPY $_ROM r4 // 1096
		LOAD r6 "skinType" // 1099
		GET r4 r4 r6 // 1111
		ALIAS r6 $literalexpression445 // 1115
		LOAD $literalexpression445 "Organic" // 1115
		EQUAL r4 $literalexpression445 r7 // 1126
			JMPNOT r7 @else_ifstatement443 // 1130
// Line 149:                local organicArray: array<string> = {"Burlap Blue","Burlap Brown","Burlap DarkGrey","Burlap Green","Burlap Grey&Brown","Burlap Grey&Red","Burlap Red","Burlap White","Burlap White&Blue","Burlap White&Brown","Burlap White&Red"};
			ALIAS r4 $organicArray // 1134
			ALIAS r6 $arrayexpression448 // 1134
			CLEAR $arrayexpression448 // 1134
			ALIAS r8 $_array_init_idx // 1136
			ALIAS r9 $literalexpression449 // 1136
			LOAD $literalexpression449 "Burlap Blue" // 1136
			LOAD $_array_init_idx 0 // 1151
			PUT $literalexpression449 $arrayexpression448 $_array_init_idx // 1156
			ALIAS r9 $literalexpression450 // 1160
			LOAD $literalexpression450 "Burlap Brown" // 1160
			LOAD $_array_init_idx 1 // 1176
			PUT $literalexpression450 $arrayexpression448 $_array_init_idx // 1181
			ALIAS r9 $literalexpression451 // 1185
			LOAD $literalexpression451 "Burlap DarkGrey" // 1185
			LOAD $_array_init_idx 2 // 1204
			PUT $literalexpression451 $arrayexpression448 $_array_init_idx // 1209
			ALIAS r9 $literalexpression452 // 1213
			LOAD $literalexpression452 "Burlap Green" // 1213
			LOAD $_array_init_idx 3 // 1229
			PUT $literalexpression452 $arrayexpression448 $_array_init_idx // 1234
			ALIAS r9 $literalexpression453 // 1238
			LOAD $literalexpression453 "Burlap Grey&Brown" // 1238
			LOAD $_array_init_idx 4 // 1259
			PUT $literalexpression453 $arrayexpression448 $_array_init_idx // 1264
			ALIAS r9 $literalexpression454 // 1268
			LOAD $literalexpression454 "Burlap Grey&Red" // 1268
			LOAD $_array_init_idx 5 // 1287
			PUT $literalexpression454 $arrayexpression448 $_array_init_idx // 1292
			ALIAS r9 $literalexpression455 // 1296
			LOAD $literalexpression455 "Burlap Red" // 1296
			LOAD $_array_init_idx 6 // 1310
			PUT $literalexpression455 $arrayexpression448 $_array_init_idx // 1315
			ALIAS r9 $literalexpression456 // 1319
			LOAD $literalexpression456 "Burlap White" // 1319
			LOAD $_array_init_idx 7 // 1335
			PUT $literalexpression456 $arrayexpression448 $_array_init_idx // 1340
			ALIAS r9 $literalexpression457 // 1344
			LOAD $literalexpression457 "Burlap White&Blue" // 1344
			LOAD $_array_init_idx 8 // 1365
			PUT $literalexpression457 $arrayexpression448 $_array_init_idx // 1370
			ALIAS r9 $literalexpression458 // 1374
			LOAD $literalexpression458 "Burlap White&Brown" // 1374
			LOAD $_array_init_idx 9 // 1396
			PUT $literalexpression458 $arrayexpression448 $_array_init_idx // 1401
			ALIAS r9 $literalexpression459 // 1405
			LOAD $literalexpression459 "Burlap White&Red" // 1405
			LOAD $_array_init_idx 10 // 1425
			PUT $literalexpression459 $arrayexpression448 $_array_init_idx // 1430
			COPY $arrayexpression448 $organicArray // 1434
// Line 150:                
// Line 151:                return organicArray[index];
			COPY $index r8 // 1437
			GET $organicArray r6 r8 // 1440
			PUSH r6 // 1444
			JMP @exit_getCategoryName // 1446
			JMP @then_ifstatement443 // 1449
			@else_ifstatement443: NOP // 1453
// Line 152:            } else if (_ROM.skinType == "Precious") {
			COPY $_ROM r6 // 1453
			LOAD r8 "skinType" // 1456
			GET r6 r6 r8 // 1468
			ALIAS r8 $literalexpression468 // 1472
			LOAD $literalexpression468 "Precious" // 1472
			EQUAL r6 $literalexpression468 r9 // 1484
				JMPNOT r9 @then_ifstatement466 // 1488
// Line 153:                local preciousArray: array<string> = {"Bronze", "Circuit", "Diamond", "Gold", "Iron", "Lizard", "Pink Diamond", "Pink Stone", "Rose Diamond", "Rose Stone", "Silver", "White Fur"};
				ALIAS r6 $preciousArray // 1492
				ALIAS r8 $arrayexpression471 // 1492
				CLEAR $arrayexpression471 // 1492
				ALIAS r10 $_array_init_idx // 1494
				ALIAS r11 $literalexpression472 // 1494
				LOAD $literalexpression472 "Bronze" // 1494
				LOAD $_array_init_idx 0 // 1504
				PUT $literalexpression472 $arrayexpression471 $_array_init_idx // 1509
				ALIAS r11 $literalexpression473 // 1513
				LOAD $literalexpression473 "Circuit" // 1513
				LOAD $_array_init_idx 1 // 1524
				PUT $literalexpression473 $arrayexpression471 $_array_init_idx // 1529
				ALIAS r11 $literalexpression474 // 1533
				LOAD $literalexpression474 "Diamond" // 1533
				LOAD $_array_init_idx 2 // 1544
				PUT $literalexpression474 $arrayexpression471 $_array_init_idx // 1549
				ALIAS r11 $literalexpression475 // 1553
				LOAD $literalexpression475 "Gold" // 1553
				LOAD $_array_init_idx 3 // 1561
				PUT $literalexpression475 $arrayexpression471 $_array_init_idx // 1566
				ALIAS r11 $literalexpression476 // 1570
				LOAD $literalexpression476 "Iron" // 1570
				LOAD $_array_init_idx 4 // 1578
				PUT $literalexpression476 $arrayexpression471 $_array_init_idx // 1583
				ALIAS r11 $literalexpression477 // 1587
				LOAD $literalexpression477 "Lizard" // 1587
				LOAD $_array_init_idx 5 // 1597
				PUT $literalexpression477 $arrayexpression471 $_array_init_idx // 1602
				ALIAS r11 $literalexpression478 // 1606
				LOAD $literalexpression478 "Pink Diamond" // 1606
				LOAD $_array_init_idx 6 // 1622
				PUT $literalexpression478 $arrayexpression471 $_array_init_idx // 1627
				ALIAS r11 $literalexpression479 // 1631
				LOAD $literalexpression479 "Pink Stone" // 1631
				LOAD $_array_init_idx 7 // 1645
				PUT $literalexpression479 $arrayexpression471 $_array_init_idx // 1650
				ALIAS r11 $literalexpression480 // 1654
				LOAD $literalexpression480 "Rose Diamond" // 1654
				LOAD $_array_init_idx 8 // 1670
				PUT $literalexpression480 $arrayexpression471 $_array_init_idx // 1675
				ALIAS r11 $literalexpression481 // 1679
				LOAD $literalexpression481 "Rose Stone" // 1679
				LOAD $_array_init_idx 9 // 1693
				PUT $literalexpression481 $arrayexpression471 $_array_init_idx // 1698
				ALIAS r11 $literalexpression482 // 1702
				LOAD $literalexpression482 "Silver" // 1702
				LOAD $_array_init_idx 10 // 1712
				PUT $literalexpression482 $arrayexpression471 $_array_init_idx // 1717
				ALIAS r11 $literalexpression483 // 1721
				LOAD $literalexpression483 "White Fur" // 1721
				LOAD $_array_init_idx 11 // 1734
				PUT $literalexpression483 $arrayexpression471 $_array_init_idx // 1739
				COPY $arrayexpression471 $preciousArray // 1743
// Line 154:                
// Line 155:                return preciousArray[index];
				COPY $index r10 // 1746
				GET $preciousArray r8 r10 // 1749
				PUSH r8 // 1753
				JMP @exit_getCategoryName // 1755
				@then_ifstatement466: NOP // 1759
			@then_ifstatement443: NOP // 1760
		@then_ifstatement421: NOP // 1761
@exit_getCategoryName: // 1761
RET // 1762
