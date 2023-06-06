// Line 1:struct body_ram{ 
// Line 2:    name : string; //users could name their Sandy to whatever they want,
// Line 3:}
// Line 4:
// Line 5:struct body_rom{
// Line 6:    created: timestamp;
// Line 7:    dna : bytes; //could do some cool math with bytes that lead to a bigger picture
// Line 8:    name: string;
// Line 9:    description: string;
// Line 10:    infoURL: string;
// Line 11:    imageURL: string;
// Line 12:}
// Line 13:token SANDY {
// Line 14:
// Line 15:    import NFT;
// Line 16:    import Runtime;
// Line 17:    import UID; 
// Line 18:    import Time;
// Line 19:    import Map;
// Line 20:
// Line 21:    global owner: address;
// Line 22:    global owns_sandy: storage_map<address,bool>; 
// Line 23:    global _timeGate: bool; //will be used to limit address buying Sandys.
// Line 24:    global _infusionAmt: number;
// Line 25:    global _infusionTkn: string;
// Line 26:
// Line 27:
// Line 28:	const SANDY_SUPPLY: number = 500;
// Line 29:    const SANDY_SERIESID: number = 1;
// Line 30:    property name: string = "Test";//Will change to SANDY once thoroughly tested
// Line 31:    property symbol: string = "TST";// Will change once properly tested
// Line 32:    property isFungible: bool = false;
// Line 33:    property isBurnable: bool = true;
// Line 34:	property maxSupply: number = SANDY_SUPPLY;
// Line 35:    property owner: address = owner;
// Line 36:
// Line 37:
// Line 38:    nft character<body_rom, body_ram> {

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
// Line 39:
// Line 40:        property name: string{
// Line 41:            return _ROM.name;
	COPY $_ROM r1 // 67
	LOAD r2 "name" // 70
	GET r1 r1 r2 // 78
	PUSH r1 // 82
	JMP @exit_getName // 84
@exit_getName: // 87
RET // 88
// Line 42:        }

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
// Line 43:
// Line 44:        property description: string{
// Line 45:            return _ROM.description;
	COPY $_ROM r1 // 156
	LOAD r2 "description" // 159
	GET r1 r1 r2 // 174
	PUSH r1 // 178
	JMP @exit_getDescription // 180
@exit_getDescription: // 183
RET // 184
// Line 46:
// Line 47:        }

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
// Line 48:        property infoURL: string{
// Line 49:            return _ROM.infoURL;
	COPY $_ROM r1 // 252
	LOAD r2 "infoURL" // 255
	GET r1 r1 r2 // 266
	PUSH r1 // 270
	JMP @exit_getInfoURL // 272
@exit_getInfoURL: // 275
RET // 276
// Line 50:
// Line 51:        }

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
// Line 52:        property imageURL: string{
// Line 53:           return  _ROM.imageURL;
	COPY $_ROM r1 // 344
	LOAD r2 "imageURL" // 347
	GET r1 r1 r2 // 359
	PUSH r1 // 363
	JMP @exit_getImageURL // 365
@exit_getImageURL: // 368
RET // 369
// Line 54:
// Line 55:        }

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
// Line 56:
// Line 57:        property created: timestamp{
// Line 58:            return _ROM.created;
	COPY $_ROM r1 // 437
	LOAD r2 "created" // 440
	GET r1 r1 r2 // 451
	PUSH r1 // 455
	JMP @exit_getCreated // 457
@exit_getCreated: // 460
RET // 461
// Line 59:
// Line 60:        }

// ********* getDna Property ***********
@entry_getDna: // 462
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
// Line 61:
// Line 62:        property dna: bytes{
// Line 63:            return _ROM.dna;
	COPY $_ROM r1 // 529
	LOAD r2 "dna" // 532
	GET r1 r1 r2 // 539
	PUSH r1 // 543
	JMP @exit_getDna // 545
@exit_getDna: // 548
RET // 549
