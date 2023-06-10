// Line 72:
// Line 73:    }
// Line 74:
// Line 75:    }
// Line 76:
// Line 77:    nft character<body_rom, body_ram> {

// ********* getName Property ***********
@entry_getName: // 0
POP r1 // get nft tokenID from stack // 1
// reading nft data
LOAD r0 "ROM" // 3
PUSH r0 // fields // 10
PUSH r1 // tokenID // 12
LOAD r0 "SANDY" // 14
PUSH r0 // symbol // 23
LOAD r0 "Runtime.ReadToken" // 25
EXTCALL r0 // 46
POP r2 // 48
UNPACK r2 r2 // 50
ALIAS r3 $_ROM // 53
LOAD r0 "ROM" // 53
GET r2 $_ROM r0 // 60
UNPACK $_ROM $_ROM // 64
// Line 78:
// Line 79:        property name: string{
// Line 80:            return _ROM.name;
	COPY $_ROM r1 // 67
	LOAD r2 "name" // 70
	GET r1 r1 r2 // 78
	PUSH r1 // 82
	JMP @exit_getName // 84
@exit_getName: // 87
RET // 88
// Line 81:        }

// ********* getDescription Property ***********
@entry_getDescription: // 89
POP r1 // get nft tokenID from stack // 90
// reading nft data
LOAD r0 "ROM" // 92
PUSH r0 // fields // 99
PUSH r1 // tokenID // 101
LOAD r0 "SANDY" // 103
PUSH r0 // symbol // 112
LOAD r0 "Runtime.ReadToken" // 114
EXTCALL r0 // 135
POP r2 // 137
UNPACK r2 r2 // 139
ALIAS r3 $_ROM // 142
LOAD r0 "ROM" // 142
GET r2 $_ROM r0 // 149
UNPACK $_ROM $_ROM // 153
// Line 82:
// Line 83:        property description: string{
// Line 84:            return _ROM.description;
	COPY $_ROM r1 // 156
	LOAD r2 "description" // 159
	GET r1 r1 r2 // 174
	PUSH r1 // 178
	JMP @exit_getDescription // 180
@exit_getDescription: // 183
RET // 184
// Line 85:
// Line 86:        }

// ********* getInfoURL Property ***********
@entry_getInfoURL: // 185
POP r1 // get nft tokenID from stack // 186
// reading nft data
LOAD r0 "ROM" // 188
PUSH r0 // fields // 195
PUSH r1 // tokenID // 197
LOAD r0 "SANDY" // 199
PUSH r0 // symbol // 208
LOAD r0 "Runtime.ReadToken" // 210
EXTCALL r0 // 231
POP r2 // 233
UNPACK r2 r2 // 235
ALIAS r3 $_ROM // 238
LOAD r0 "ROM" // 238
GET r2 $_ROM r0 // 245
UNPACK $_ROM $_ROM // 249
// Line 87:        property infoURL: string{
// Line 88:            return _ROM.infoURL;
	COPY $_ROM r1 // 252
	LOAD r2 "infoURL" // 255
	GET r1 r1 r2 // 266
	PUSH r1 // 270
	JMP @exit_getInfoURL // 272
@exit_getInfoURL: // 275
RET // 276
// Line 89:
// Line 90:        }

// ********* getImageURL Property ***********
@entry_getImageURL: // 277
POP r1 // get nft tokenID from stack // 278
// reading nft data
LOAD r0 "ROM" // 280
PUSH r0 // fields // 287
PUSH r1 // tokenID // 289
LOAD r0 "SANDY" // 291
PUSH r0 // symbol // 300
LOAD r0 "Runtime.ReadToken" // 302
EXTCALL r0 // 323
POP r2 // 325
UNPACK r2 r2 // 327
ALIAS r3 $_ROM // 330
LOAD r0 "ROM" // 330
GET r2 $_ROM r0 // 337
UNPACK $_ROM $_ROM // 341
// Line 91:        property imageURL: string{
// Line 92:           return  _ROM.imageURL;
	COPY $_ROM r1 // 344
	LOAD r2 "imageURL" // 347
	GET r1 r1 r2 // 359
	PUSH r1 // 363
	JMP @exit_getImageURL // 365
@exit_getImageURL: // 368
RET // 369
// Line 93:
// Line 94:        }

// ********* getCreated Property ***********
@entry_getCreated: // 370
POP r1 // get nft tokenID from stack // 371
// reading nft data
LOAD r0 "ROM" // 373
PUSH r0 // fields // 380
PUSH r1 // tokenID // 382
LOAD r0 "SANDY" // 384
PUSH r0 // symbol // 393
LOAD r0 "Runtime.ReadToken" // 395
EXTCALL r0 // 416
POP r2 // 418
UNPACK r2 r2 // 420
ALIAS r3 $_ROM // 423
LOAD r0 "ROM" // 423
GET r2 $_ROM r0 // 430
UNPACK $_ROM $_ROM // 434
// Line 95:
// Line 96:        property created: timestamp{
// Line 97:            return _ROM.created;
	COPY $_ROM r1 // 437
	LOAD r2 "created" // 440
	GET r1 r1 r2 // 451
	PUSH r1 // 455
	JMP @exit_getCreated // 457
@exit_getCreated: // 460
RET // 461
// Line 98:
// Line 99:        }

// ********* getSandType Property ***********
@entry_getSandType: // 462
POP r1 // get nft tokenID from stack // 463
// reading nft data
LOAD r0 "ROM" // 465
PUSH r0 // fields // 472
PUSH r1 // tokenID // 474
LOAD r0 "SANDY" // 476
PUSH r0 // symbol // 485
LOAD r0 "Runtime.ReadToken" // 487
EXTCALL r0 // 508
POP r2 // 510
UNPACK r2 r2 // 512
ALIAS r3 $_ROM // 515
LOAD r0 "ROM" // 515
GET r2 $_ROM r0 // 522
UNPACK $_ROM $_ROM // 526
// Line 100:
// Line 101:         property sandType: string{
// Line 102:            return _ROM.sandType;
	COPY $_ROM r1 // 529
	LOAD r2 "sandType" // 532
	GET r1 r1 r2 // 544
	PUSH r1 // 548
	JMP @exit_getSandType // 550
@exit_getSandType: // 553
RET // 554
// Line 103:        }

// ********* getSkinType Property ***********
@entry_getSkinType: // 555
POP r1 // get nft tokenID from stack // 556
// reading nft data
LOAD r0 "ROM" // 558
PUSH r0 // fields // 565
PUSH r1 // tokenID // 567
LOAD r0 "SANDY" // 569
PUSH r0 // symbol // 578
LOAD r0 "Runtime.ReadToken" // 580
EXTCALL r0 // 601
POP r2 // 603
UNPACK r2 r2 // 605
ALIAS r3 $_ROM // 608
LOAD r0 "ROM" // 608
GET r2 $_ROM r0 // 615
UNPACK $_ROM $_ROM // 619
// Line 104:
// Line 105:        property skinType: string{
// Line 106:            return _ROM.skinType;
	COPY $_ROM r1 // 622
	LOAD r2 "skinType" // 625
	GET r1 r1 r2 // 637
	PUSH r1 // 641
	JMP @exit_getSkinType // 643
@exit_getSkinType: // 646
RET // 647
