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
// Line 14:
// Line 15:}
// Line 16:
// Line 17:struct body_rom{
// Line 18:    created: timestamp;
// Line 19:    name: string;
// Line 20:    description: string;
// Line 21:    infoURL: string;
// Line 22:    imageURL: string;
// Line 23:    sandType: string;
// Line 24:    skinType: string;
// Line 25:    bodyType: number;           // Could be in range of 1 ~ 
// Line 26:}
// Line 27:
// Line 28://Will change once complete
// Line 29:token STST {
// Line 30:    import Array;
// Line 31:    import NFT;
// Line 32:    import Runtime;
// Line 33:    import Time;
// Line 34:    import Token;
// Line 35:    import Map;
// Line 36:    import Random;
// Line 37:
// Line 38:    global owner: address;
// Line 39:    global owns_sandy: storage_map<address,bool>; 
// Line 40:    global _infusionAmt: number;
// Line 41:    /*
// Line 42:     - Can use the seriesID as the number and can use randomization that way. Will have to think more about this
// Line 43:    */
// Line 44:    global _limbs: storage_map<string,number>; //wanted this to be an array so I can get index by modulus. Will test out.
// Line 45:    global _categories: storage_map<string,number>;
// Line 46:    global _infusionTkn: string;
// Line 47:
// Line 48:
// Line 49:	const DOLL_SUPPLY: number = 500;
// Line 50:    const SANDY_SERIESID: number = 1;
// Line 51:
// Line 52:    property name: string = "Test Sandy";    //Will change to SANDY once thoroughly tested
// Line 53:    property symbol: string = "STST";  // Will change once properly tested
// Line 54:    property isFungible: bool = false;
// Line 55:    property isFinite: bool = true;
// Line 56:    property isBurnable: bool = true;
// Line 57:    property maxSupply: number = DOLL_SUPPLY;
// Line 58:    property isTransferable: bool = true;
// Line 59:    property isCapped: bool = false;
// Line 60:    property decimals:number = 8;
// Line 61:    property owner:address = owner;
// Line 62:    
// Line 63:    nft limb<limb_rom,limb_ram> {

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
// Line 64:        property name: string{
// Line 65:            return _ROM.name;
	COPY $_ROM r1 // 66
	LOAD r2 "name" // 69
	GET r1 r1 r2 // 77
	PUSH r1 // 81
	JMP @exit_getName // 83
@exit_getName: // 86
RET // 87
// Line 66:        }

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
// Line 67:
// Line 68:        property description: string{
// Line 69:            return _ROM.description;
	COPY $_ROM r1 // 154
	LOAD r2 "description" // 157
	GET r1 r1 r2 // 172
	PUSH r1 // 176
	JMP @exit_getDescription // 178
@exit_getDescription: // 181
RET // 182
// Line 70:        }

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
// Line 71:
// Line 72:        property infoURL: string{
// Line 73:            return _ROM.infoURL;
	COPY $_ROM r1 // 249
	LOAD r2 "infoURL" // 252
	GET r1 r1 r2 // 263
	PUSH r1 // 267
	JMP @exit_getInfoURL // 269
@exit_getInfoURL: // 272
RET // 273
// Line 74:        }

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
// Line 75:
// Line 76:        property imageURL: string{
// Line 77:            return _ROM.imageURL;
	COPY $_ROM r1 // 340
	LOAD r2 "imageURL" // 343
	GET r1 r1 r2 // 355
	PUSH r1 // 359
	JMP @exit_getImageURL // 361
@exit_getImageURL: // 364
RET // 365
