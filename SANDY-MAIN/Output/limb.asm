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
// Line 28:enum SkinCount {
// Line 29:    Organic = 175,
// Line 30:    Precious = 175,
// Line 31:    Energy = 150
// Line 32:}
// Line 33:
// Line 34://Will change once complete
// Line 35:token STLN {
// Line 36:    import Array;
// Line 37:    import NFT;
// Line 38:    import Runtime;
// Line 39:    import Time;
// Line 40:    import Token;
// Line 41:    import Map;
// Line 42:    import Random;
// Line 43:    import Stake;
// Line 44:
// Line 45:    global owner: address;
// Line 46:
// Line 47:    global owns_sandy: storage_map<address,bool>; 
// Line 48:    global balances: storage_map <address, number>;
// Line 49:    global _infusionAmt: number;
// Line 50:
// Line 51:    global mintBodyInited: bool;
// Line 52:    global bodyBaseURI: string;
// Line 53:
// Line 54:    global _limbs: storage_map<string,number>; //wanted this to be an array so I can get index by modulus. Will test out.
// Line 55:    global _categories: storage_map<string,number>;
// Line 56:    global _infusionTkn: string;
// Line 57:
// Line 58:	const DOLL_SUPPLY: number = 500;
// Line 59:
// Line 60:    /**
// Line 61:    * Constant variables for sandy NFT series IDs.
// Line 62:    */
// Line 63:    const SERIES_BODY: number = 1;
// Line 64:    const SERIES_EYE: number = 2;
// Line 65:    const SERIES_MOUTH: number = 3;
// Line 66:    const SERIES_BACKGROUND: number = 4;
// Line 67:
// Line 68:    /**
// Line 69:    * Constant variables for sandy max supply 
// Line 70:    */
// Line 71:
// Line 72:    global organicCount: number;
// Line 73:    global preciousCount: number;
// Line 74:    global energyCount: number;
// Line 75:
// Line 76:    const ORGANIC_CATEGORIES: number = 12;
// Line 77:    const PRECIOUS_CATEGORIES: number = 12;
// Line 78:    const ENERGY_CATEGORIES: number = 10;
// Line 79:
// Line 80:    property name: string = "Test Sandy";    //Will change to SANDY once thoroughly tested
// Line 81:    property symbol: string = "STLN";  // Will change once properly tested
// Line 82:    property isFungible: bool = false;
// Line 83:    property isFinite: bool = true;
// Line 84:    property isBurnable: bool = true;
// Line 85:    property maxSupply: number = DOLL_SUPPLY;
// Line 86:    property isTransferable: bool = true;
// Line 87:    property isCapped: bool = false;
// Line 88:    property decimals:number = 8;
// Line 89:    property owner:address = owner;
// Line 90:    
// Line 91:    nft limb<limb_rom,limb_ram> {

// ********* getName Property ***********
@entry_getName: // 0
POP r1 // get nft tokenID from stack // 1
// reading nft data
LOAD r0 "ROM" // 3
PUSH r0 // fields // 10
PUSH r1 // tokenID // 12
LOAD r0 "STLN" // 14
PUSH r0 // symbol // 22
LOAD r0 "Runtime.ReadToken" // 24
EXTCALL r0 // 45
POP r2 // 47
UNPACK r2 r2 // 49
ALIAS r3 $_ROM // 52
LOAD r0 "ROM" // 52
GET r2 $_ROM r0 // 59
UNPACK $_ROM $_ROM // 63
// Line 92:        property name: string{
// Line 93:            return _ROM.name;
	COPY $_ROM r1 // 66
	LOAD r2 "name" // 69
	GET r1 r1 r2 // 77
	PUSH r1 // 81
	JMP @exit_getName // 83
@exit_getName: // 86
RET // 87
// Line 94:        }

// ********* getDescription Property ***********
@entry_getDescription: // 88
POP r1 // get nft tokenID from stack // 89
// reading nft data
LOAD r0 "ROM" // 91
PUSH r0 // fields // 98
PUSH r1 // tokenID // 100
LOAD r0 "STLN" // 102
PUSH r0 // symbol // 110
LOAD r0 "Runtime.ReadToken" // 112
EXTCALL r0 // 133
POP r2 // 135
UNPACK r2 r2 // 137
ALIAS r3 $_ROM // 140
LOAD r0 "ROM" // 140
GET r2 $_ROM r0 // 147
UNPACK $_ROM $_ROM // 151
// Line 95:
// Line 96:        property description: string{
// Line 97:            return _ROM.description;
	COPY $_ROM r1 // 154
	LOAD r2 "description" // 157
	GET r1 r1 r2 // 172
	PUSH r1 // 176
	JMP @exit_getDescription // 178
@exit_getDescription: // 181
RET // 182
// Line 98:        }

// ********* getInfoURL Property ***********
@entry_getInfoURL: // 183
POP r1 // get nft tokenID from stack // 184
// reading nft data
LOAD r0 "ROM" // 186
PUSH r0 // fields // 193
PUSH r1 // tokenID // 195
LOAD r0 "STLN" // 197
PUSH r0 // symbol // 205
LOAD r0 "Runtime.ReadToken" // 207
EXTCALL r0 // 228
POP r2 // 230
UNPACK r2 r2 // 232
ALIAS r3 $_ROM // 235
LOAD r0 "ROM" // 235
GET r2 $_ROM r0 // 242
UNPACK $_ROM $_ROM // 246
// Line 99:
// Line 100:        property infoURL: string{
// Line 101:            return _ROM.infoURL;
	COPY $_ROM r1 // 249
	LOAD r2 "infoURL" // 252
	GET r1 r1 r2 // 263
	PUSH r1 // 267
	JMP @exit_getInfoURL // 269
@exit_getInfoURL: // 272
RET // 273
// Line 102:        }

// ********* getImageURL Property ***********
@entry_getImageURL: // 274
POP r1 // get nft tokenID from stack // 275
// reading nft data
LOAD r0 "ROM" // 277
PUSH r0 // fields // 284
PUSH r1 // tokenID // 286
LOAD r0 "STLN" // 288
PUSH r0 // symbol // 296
LOAD r0 "Runtime.ReadToken" // 298
EXTCALL r0 // 319
POP r2 // 321
UNPACK r2 r2 // 323
ALIAS r3 $_ROM // 326
LOAD r0 "ROM" // 326
GET r2 $_ROM r0 // 333
UNPACK $_ROM $_ROM // 337
// Line 103:
// Line 104:        property imageURL: string{
// Line 105:            return _ROM.imageURL;
	COPY $_ROM r1 // 340
	LOAD r2 "imageURL" // 343
	GET r1 r1 r2 // 355
	PUSH r1 // 359
	JMP @exit_getImageURL // 361
@exit_getImageURL: // 364
RET // 365
