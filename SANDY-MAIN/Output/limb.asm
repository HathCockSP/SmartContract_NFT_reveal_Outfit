// Line 1:struct limb_ram{
// Line 2:    inUse: bool;
// Line 3:
// Line 4:}
// Line 5:
// Line 6:struct limb_rom {
// Line 7:    name: string;
// Line 8:    description: string;
// Line 9:    infoURL: string;
// Line 10:    imageURL: string;
// Line 11:}
// Line 12:
// Line 13:struct body_ram{ 
// Line 14:}
// Line 15:
// Line 16:struct body_rom{
// Line 17:    created: timestamp;
// Line 18:    name: string;
// Line 19:    description: string;
// Line 20:    infoURL: string;
// Line 21:    imageURL: string;
// Line 22:    sandType: string;
// Line 23:    skinType: string;
// Line 24:
// Line 25:}
// Line 26:token SANDY {
// Line 27:    import Array;
// Line 28:    import NFT;
// Line 29:    import Runtime;
// Line 30:    import Time;
// Line 31:    import Token;
// Line 32:    import Map;
// Line 33:
// Line 34:    global owner: address;
// Line 35:    global owns_sandy: storage_map<address,bool>; 
// Line 36:    global _infusionAmt: number;
// Line 37:    /*
// Line 38:     - Can use the seriesID as the number and can use randomization that way. Will have to think more about this
// Line 39:    */
// Line 40:    global _limbs: storage_map<string,number>; //wanted this to be an array so I can get index by modulus. Will test out.
// Line 41:    global _categories: storage_map<string,number>;
// Line 42:    global _infusionTkn: string;
// Line 43:
// Line 44:
// Line 45:	const DOLL_SUPPLY: number = 500;
// Line 46:    const SANDY_SERIESID: number = 1;
// Line 47:    property name: string = "Test";//Will change to SANDY once thoroughly tested
// Line 48:    property symbol: string = "TST";// Will change once properly tested
// Line 49:    property isFungible: bool = false;
// Line 50:    property isFinite: bool = true;
// Line 51:    property isBurnable: bool = true;
// Line 52:	property maxSupply: number = DOLL_SUPPLY;
// Line 53:    property owner: address = owner;
// Line 54:    
// Line 55:    nft limb<limb_rom,limb_ram> {

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
// Line 56:
// Line 57:    property name: string{
// Line 58:        return _ROM.name;
	COPY $_ROM r1 // 67
	LOAD r2 "name" // 70
	GET r1 r1 r2 // 78
	PUSH r1 // 82
	JMP @exit_getName // 84
@exit_getName: // 87
RET // 88
// Line 59:
// Line 60:    }

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
// Line 61:
// Line 62:    property description: string{
// Line 63:        return _ROM.description;
	COPY $_ROM r1 // 156
	LOAD r2 "description" // 159
	GET r1 r1 r2 // 174
	PUSH r1 // 178
	JMP @exit_getDescription // 180
@exit_getDescription: // 183
RET // 184
// Line 64:
// Line 65:    }

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
// Line 66:    property infoURL: string{
// Line 67:        return _ROM.infoURL;
	COPY $_ROM r1 // 252
	LOAD r2 "infoURL" // 255
	GET r1 r1 r2 // 266
	PUSH r1 // 270
	JMP @exit_getInfoURL // 272
@exit_getInfoURL: // 275
RET // 276
// Line 68:
// Line 69:    }

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
// Line 70:    property imageURL: string{
// Line 71:        return _ROM.imageURL;
	COPY $_ROM r1 // 344
	LOAD r2 "imageURL" // 347
	GET r1 r1 r2 // 359
	PUSH r1 // 363
	JMP @exit_getImageURL // 365
@exit_getImageURL: // 368
RET // 369
