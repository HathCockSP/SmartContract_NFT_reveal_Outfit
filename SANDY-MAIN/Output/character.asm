// Line 78:        }
// Line 79:    }
// Line 80:
// Line 81:    nft character<body_rom, body_ram> {

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
// Line 82:        property name: string{
// Line 83:            return _ROM.name;
	COPY $_ROM r1 // 66
	LOAD r2 "name" // 69
	GET r1 r1 r2 // 77
	PUSH r1 // 81
	JMP @exit_getName // 83
@exit_getName: // 86
RET // 87
// Line 84:        }

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
// Line 85:
// Line 86:        property description: string {
// Line 87:            return _ROM.description;
	COPY $_ROM r1 // 154
	LOAD r2 "description" // 157
	GET r1 r1 r2 // 172
	PUSH r1 // 176
	JMP @exit_getDescription // 178
@exit_getDescription: // 181
RET // 182
// Line 88:        }

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
// Line 89:
// Line 90:        property infoURL: string {
// Line 91:            return _ROM.infoURL;
	COPY $_ROM r1 // 249
	LOAD r2 "infoURL" // 252
	GET r1 r1 r2 // 263
	PUSH r1 // 267
	JMP @exit_getInfoURL // 269
@exit_getInfoURL: // 272
RET // 273
// Line 92:        }

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
// Line 93:        property imageURL: string {
// Line 94:           return  _ROM.imageURL;
	COPY $_ROM r1 // 340
	LOAD r2 "imageURL" // 343
	GET r1 r1 r2 // 355
	PUSH r1 // 359
	JMP @exit_getImageURL // 361
@exit_getImageURL: // 364
RET // 365
// Line 95:        }

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
// Line 96:
// Line 97:        property created: timestamp { 
// Line 98:            return _ROM.created;
	COPY $_ROM r1 // 432
	LOAD r2 "created" // 435
	GET r1 r1 r2 // 446
	PUSH r1 // 450
	JMP @exit_getCreated // 452
@exit_getCreated: // 455
RET // 456
// Line 99:        }

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
// Line 100:
// Line 101:        property sandType: string {
// Line 102:            return _ROM.sandType;
	COPY $_ROM r1 // 523
	LOAD r2 "sandType" // 526
	GET r1 r1 r2 // 538
	PUSH r1 // 542
	JMP @exit_getSandType // 544
@exit_getSandType: // 547
RET // 548
// Line 103:        }

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
// Line 104:
// Line 105:        property skinType: string {
// Line 106:            return _ROM.skinType;
	COPY $_ROM r1 // 615
	LOAD r2 "skinType" // 618
	GET r1 r1 r2 // 630
	PUSH r1 // 634
	JMP @exit_getSkinType // 636
@exit_getSkinType: // 639
RET // 640
// Line 107:        }

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
// Line 108:
// Line 109:        property bodyType: number {
// Line 110:            return _ROM.bodyType;
	COPY $_ROM r1 // 707
	LOAD r2 "bodyType" // 710
	GET r1 r1 r2 // 722
	PUSH r1 // 726
	JMP @exit_getBodyType // 728
@exit_getBodyType: // 731
RET // 732
