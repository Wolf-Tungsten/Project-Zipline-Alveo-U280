/* File successfully dumped                                             */
//* COMMAND_LINE_SYMBOLS: 1
`ifdef RAWTOKENS_COMMAND_LINE_SYMBOLS
`define ENA_BIMC
`endif // RAWTOKENS_COMMAND_LINE_SYMBOLS


//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/cr_cceip_64/cr_cceip_64.v
/*************************************************************************
*
* Copyright ï¿½ Microsoft Corporation. All rights reserved.
* Copyright ï¿½ Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/





//* INLINED_FILE: `include "cr_native_types.svp"
//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_native_types.svp
// *************************************************************************
//
// Copyright ï¿½ Microsoft Corporation. All rights reserved.
// Copyright ï¿½ Broadcom Inc. All rights reserved.
// Licensed under the MIT License.
//
// *************************************************************************

// grh fix : wrap native types in package

`ifndef CR_NATIVE_TYPES_SVP
`define CR_NATIVE_TYPES_SVP

package cr_native_types;

typedef enum logic [1:0] {
	ENET=0,
	IPV4=1,
	IPV6=2,
	MPLS=3
} pkt_hdr_e;

typedef enum logic [3:0] {
	CMD_SIMPLE=0,
	COMPND_4K=5,
	COMPND_8K=6,
	COMPND_RSV=15
} cmd_compound_cmd_frm_size_e;

typedef enum logic [0:0] {
	GUID_NOT_PRESENT=0,
	GUID_PRESENT=1
} cmd_guid_present_e;

typedef enum logic [0:0] {
	CRC_NOT_PRESENT=0,
	CRC_PRESENT=1
} cmd_frmd_crc_in_e;

typedef enum logic [6:0] {
	CCEIP_FRMD_USER_NULL=11,
	CCEIP_FRMD_USER_PI16=12,
	CCEIP_FRMD_USER_PI64=13,
	CCEIP_FRMD_USER_VM=14,
	CCEIP_TYPE_IN_RSV=127
} cceip_cmd_frmd_in_type_e;

typedef enum logic [6:0] {
	CDDIP_FRMD_INT_APP=15,
	CDDIP_FRMD_INT_SIP=16,
	CDDIP_FRMD_INT_LIP=17,
	CDDIP_FRMD_INT_VM=18,
	CDDIP_FRMD_INT_VM_SHORT=22,
	CDDIP_TYPE_IN_RSV=127
} cddip_cmd_frmd_in_type_e;

typedef enum logic [6:0] {
	CCEIP_FRMD_INT_APP=15,
	CCEIP_FRMD_INT_SIP=16,
	CCEIP_FRMD_INT_LIP=17,
	CCEIP_FRMD_INT_VM=18,
	CCEIP_FRMD_INT_VM_SHORT=22,
	CCEIP_TYPE_OUT_RSV=127
} cceip_cmd_frmd_out_type_e;

typedef enum logic [6:0] {
	CDDIP_FRMD_USER_NULL=11,
	CDDIP_FRMD_USER_PI16=12,
	CDDIP_FRMD_USER_PI64=13,
	CDDIP_FRMD_USER_VM=14,
	CDDIP_TYPE_OUT_RSV=127
} cddip_cmd_frmd_out_type_e;

typedef enum logic [0:0] {
	NOT_GEN=0,
	GEN=1
} cmd_frmd_out_crc_e;

typedef enum logic [1:0] {
	FRMD_T10_DIX=0,
	FRMD_CRC64=1,
	FRMD_CRC64E=2,
	FRMD_CRC_RSV=3
} cmd_frmd_out_crc_type_e;

typedef enum logic [1:0] {
	NO_CRC=0,
	CRC_8B_CRC64=1,
	CRC_8B_CRC64E=2,
	MD_TYPE_RSV=3
} cmd_md_type_e;

typedef enum logic [1:0] {
	CRC_GEN_VERIFY=0,
	CRC_RSV1=1,
	CRC_RSV2=2,
	CRC_RSV3=3
} cmd_md_op_e;

typedef enum logic [0:0] {
	FRMD_MAC_NOP=0,
	FRMD_MAC_CAL=1
} cmd_frmd_raw_mac_sel_e;

typedef enum logic [0:0] {
	CHU_NORMAL=0,
	CHU_APPEND=1
} cmd_chu_append_e;

typedef enum logic [3:0] {
	NONE=0,
	ZLIB=1,
	GZIP=2,
	XP9=3,
	XP10=4,
	CHU4K=5,
	CHU8K=6,
	RSV_MODE=15
} cmd_comp_mode_e;

typedef enum logic [3:0] {
	WIN_32B=0,
	WIN_4K=1,
	WIN_8K=2,
	WIN_16K=3,
	WIN_32K=4,
	WIN_64K=5,
	RSV_WIN=15
} cmd_lz77_win_size_e;

typedef enum logic [1:0] {
	NO_MATCH=0,
	CHAR_1=1,
	CHAR_2=2,
	RSV_DLY=3
} cmd_lz77_dly_match_win_e;

typedef enum logic [0:0] {
	CHAR_3=0,
	CHAR_4=1
} cmd_lz77_min_match_len_e;

typedef enum logic [1:0] {
	LEN_LZ77_WIN=0,
	LEN_256B=1,
	MIN_MTCH_14=2,
	LEN_64B=3
} cmd_lz77_max_symb_len_e;

typedef enum logic [1:0] {
	NO_PREFIX=0,
	USER_PREFIX=1,
	PREDEF_PREFIX=2,
	PREDET_HUFF=3
} cmd_xp10_prefix_mode_e;

typedef enum logic [0:0] {
	CRC32=0,
	CRC64=1
} cmd_xp10_crc_mode_e;

typedef enum logic [1:0] {
	FRM=0,
	FRM_LESS_16=1,
	INF=2,
	RSV_THRSH=3
} cmd_chu_comp_thrsh_e;

typedef enum logic [0:0] {
	NO_CIPHER=0,
	CIPHER=1
} cmd_cipher_mode_e;

typedef enum logic [3:0] {
	AUTH_NULL=0,
	SHA2=1,
	HMAC_SHA2=2,
	AUTH_RSVD=15
} cmd_auth_op_e;

typedef enum logic [3:0] {
	CPH_NULL=0,
	AES_GCM=1,
	AES_XTS_XEX=2,
	AES_GMAC=3,
	CPH_RSVD=15
} cmd_cipher_op_e;

typedef enum logic [1:0] {
	IV_NONE=0,
	IV_AUX_CMD=1,
	IV_KEYS=2,
	IV_AUX_FRMD=3
} cmd_iv_src_e;

typedef enum logic [1:0] {
	IV_SRC=0,
	IV_RND=1,
	IV_INC=2,
	IV_RSV=3
} cmd_iv_op_e;

typedef enum logic [0:0] {
	NO_PAD=0,
	PAD_16B=1
} cmd_cipher_pad_e;

typedef enum logic [0:0] {
	DGST_256=0,
	DGST_64=1
} cmd_digest_size_e;

typedef enum logic [0:0] {
	SIMPLE=0,
	COMPOUND=1
} rqe_frame_type_e;

typedef enum logic [0:0] {
	TRACE_OFF=0,
	TRACE_ON=1
} rqe_trace_e;

typedef enum logic [3:0] {
	RQE_SIMPLE=0,
	RQE_COMPOUND_4K=5,
	RQE_COMPOUND_8K=6,
	RQE_RSV_FRAME_SIZE=15
} rqe_frame_size_e;

typedef enum logic [1:0] {
	PARSEABLE=0,
	RAW=1,
	XP10CFH4K=2,
	XP10CFH8K=3
} frmd_coding_e;

typedef enum logic [1:0] {
	DIGEST_64b=0,
	DIGEST_128b=1,
	DIGEST_256b=2,
	DIGEST_0b=3
} frmd_mac_size_e;

typedef enum logic [7:0] {
	RQE=0,
	CMD=1,
	KEY=2,
	PHD=3,
	PFD=4,
	DATA_UNK=5,
	FTR=6,
	LZ77=7,
	STAT=8,
	CQE=9,
	GUID=10,
	FRMD_USER_NULL=11,
	FRMD_USER_PI16=12,
	FRMD_USER_PI64=13,
	FRMD_USER_VM=14,
	FRMD_INT_APP=15,
	FRMD_INT_SIP=16,
	FRMD_INT_LIP=17,
	FRMD_INT_VM=18,
	DATA=19,
	CR_IV=20,
	AUX_CMD=21,
	FRMD_INT_VM_SHORT=22,
	AUX_CMD_IV=23,
	AUX_CMD_GUID=24,
	AUX_CMD_GUID_IV=25,
	SCH=26,
	RSV_TLV=255
} tlv_types_e;

typedef enum logic [1:0] {
	REP=0,
	PASS=1,
	MODIFY=2,
	DELETE=3
} tlv_parse_action_e;


typedef enum logic [0:0] {
	USER=0,
	TLVP=1
} tlvp_corrupt_e;

typedef enum logic [0:0] {
	DATAPATH_CORRUPT=0,
	FUNCTIONAL_ERROR=1
} cmd_type_e;

typedef enum logic [1:0] {
	SINGLE_ERR=0,
	CONTINUOUS_ERROR=1,
	STOP=2,
	EOT=3
} cmd_mode_e;

typedef enum logic [5:0] {
	NO_AUX_KEY=0,
	AUX_KEY_ONLY=1,
	DEK256=2,
	DEK512=3,
	DAK=4,
	DEK256_DAK=5,
	DEK512_DAK=6,
	ENC_DEK256=7,
	ENC_DEK512=8,
	ENC_DAK=9,
	ENC_DEK256_DAK=10,
	ENC_DEK512_DAK=11,
	ENC_DEK256_DAK_COMB=12,
	ENC_DEK512_DAK_COMB=13,
	KEY_TYPE_RSV=63
} aux_key_type_e;

typedef enum logic [0:0] {
	NOOP=0,
	KDF=1
} aux_key_op_e;

typedef enum logic [1:0] {
	KDF_MODE_GUID=0,
	KDF_MODE_RGUID=1,
	KDF_MODE_COMB_GUID=2,
	KDF_MODE_COMB_RGUID=3
} aux_kdf_mode_e;

typedef enum logic [9:0] {
	CKMIC_IV_MISMATCH_FRAME=0,
	CKMIC_ENGINE_ID_MISMATCH_FRAME=1,
	CKMIC_SEQ_ID_MISMATCH_FRAME=2,
	CKMIC_HMAC_SHA256_TAG_FAIL_FRAME=3,
	CKMIC_SHA256_TAG_FAIL_FRAME=4,
	CKMIC_GMAC_TAG_FAIL_FRAME=5,
	CKMIC_GCM_TAG_FAIL_FRAME=6,
	CKMIC_AUTH_NOP_FRAME=7,
	CKMIC_AUTH_HMAC_SHA256_FRAME=8,
	CKMIC_AUTH_SHA256_FRAME=9,
	CKMIC_AUTH_AES_GMAC_FRAME=10,
	CKMIC_CIPH_NOP_FRAME=11,
	CKMIC_CIPH_AES_XEX_FRAME=12,
	CKMIC_CIPH_AES_XTS_FRAME=13,
	CKMIC_CIPH_AES_GCM_FRAME=14,
	CRCG0_RAW_CHSUM_GOOD_TOTAL=64,
	CRCG0_RAW_CHSUM_ERROR_TOTAL=65,
	CRCG0_CRC64E_CHSUM_GOOD_TOTAL=66,
	CRCG0_CRC64E_CHSUM_ERROR_TOTAL=67,
	CRCG0_ENC_CHSUM_GOOD_TOTAL=68,
	CRCG0_ENC_CHSUM_ERROR_TOTAL=69,
	CRCG0_NVME_CHSUM_GOOD_TOTAL=70,
	CRCG0_NVME_CHSUM_ERROR_TOTAL=71,
	CRCGC0_RAW_CHSUM_GOOD_TOTAL=72,
	CRCGC0_RAW_CHSUM_ERROR_TOTAL=73,
	CRCGC0_CRC64E_CHSUM_GOOD_TOTAL=74,
	CRCGC0_CRC64E_CHSUM_ERROR_TOTAL=75,
	CRCGC0_ENC_CHSUM_GOOD_TOTAL=76,
	CRCGC0_ENC_CHSUM_ERROR_TOTAL=77,
	CRCGC0_NVME_CHSUM_GOOD_TOTAL=78,
	CRCGC0_NVME_CHSUM_ERROR_TOTAL=79,
	CRCC1_RAW_CHSUM_GOOD_TOTAL=80,
	CRCC1_RAW_CHSUM_ERROR_TOTAL=81,
	CRCC1_CRC64E_CHSUM_GOOD_TOTAL=82,
	CRCC1_CRC64E_CHSUM_ERROR_TOTAL=83,
	CRCC1_ENC_CHSUM_GOOD_TOTAL=84,
	CRCC1_ENC_CHSUM_ERROR_TOTAL=85,
	CRCC1_NVME_CHSUM_GOOD_TOTAL=86,
	CRCC1_NVME_CHSUM_ERROR_TOTAL=87,
	CRCC0_RAW_CHSUM_GOOD_TOTAL=88,
	CRCC0_RAW_CHSUM_ERROR_TOTAL=89,
	CRCC0_CRC64E_CHSUM_GOOD_TOTAL=90,
	CRCC0_CRC64E_CHSUM_ERROR_TOTAL=91,
	CRCC0_ENC_CHSUM_GOOD_TOTAL=92,
	CRCC0_ENC_CHSUM_ERROR_TOTAL=93,
	CRCC0_NVME_CHSUM_GOOD_TOTAL=94,
	CRCC0_NVME_CHSUM_ERROR_TOTAL=95,
	CG_ENGINE_ERROR_COMMAND=96,
	CG_SELECT_ENGINE_ERROR_COMMAND=97,
	CG_SYSTEM_ERROR_COMMAND=98,
	CG_CQE_OUTPUT_COMMAND=99,
	HUFD_FE_XP9_FRM_TOTAL=320,
	HUFD_FE_XP9_BLK_TOTAL=321,
	HUFD_FE_XP9_RAW_FRM_TOTAL=322,
	HUFD_FE_XP10_FRM_TOTAL=323,
	HUFD_FE_XP10_FRM_PFX_TOTAL=324,
	HUFD_FE_XP10_FRM_PDH_TOTAL=325,
	HUFD_FE_XP10_BLK_TOTAL=326,
	HUFD_FE_XP10_RAW_BLK_TOTAL=327,
	HUFD_FE_GZIP_FRM_TOTAL=328,
	HUFD_FE_GZIP_BLK_TOTAL=329,
	HUFD_FE_GZIP_RAW_BLK_TOTAL=330,
	HUFD_FE_ZLIB_FRM_TOTAL=331,
	HUFD_FE_ZLIB_BLK_TOTAL=332,
	HUFD_FE_ZLIB_RAW_BLK_TOTAL=333,
	HUFD_FE_CHU4K_TOTAL=334,
	HUFD_FE_CHU8K_TOTAL=335,
	HUFD_FE_CHU4K_RAW_TOTAL=336,
	HUFD_FE_CHU8K_RAW_TOTAL=337,
	HUFD_FE_PFX_CRC_ERR_TOTAL=338,
	HUFD_FE_PHD_CRC_ERR_TOTAL=339,
	HUFD_FE_XP9_CRC_ERR_TOTAL=340,
	HUFD_HTF_XP9_SIMPLE_SHORT_BLK_TOTAL=341,
	HUFD_HTF_XP9_RETRO_SHORT_BLK_TOTAL=342,
	HUFD_HTF_XP9_SIMPLE_LONG_BLK_TOTAL=343,
	HUFD_HTF_XP9_RETRO_LONG_BLK_TOTAL=344,
	HUFD_HTF_XP10_SIMPLE_SHORT_BLK_TOTAL=345,
	HUFD_HTF_XP10_RETRO_SHORT_BLK_TOTAL=346,
	HUFD_HTF_XP10_PREDEF_SHORT_BLK_TOTAL=347,
	HUFD_HTF_XP10_SIMPLE_LONG_BLK_TOTAL=348,
	HUFD_HTF_XP10_RETRO_LONG_BLK_TOTAL=349,
	HUFD_HTF_XP10_PREDEF_LONG_BLK_TOTAL=350,
	HUFD_HTF_CHU4K_SIMPLE_SHORT_BLK_TOTAL=351,
	HUFD_HTF_CHU4K_RETRO_SHORT_BLK_TOTAL=352,
	HUFD_HTF_CHU4K_PREDEF_SHORT_BLK_TOTAL=353,
	HUFD_HTF_CHU4K_SIMPLE_LONG_BLK_TOTAL=354,
	HUFD_HTF_CHU4K_RETRO_LONG_BLK_TOTAL=355,
	HUFD_HTF_CHU4K_PREDEF_LONG_BLK_TOTAL=356,
	HUFD_HTF_CHU8K_SIMPLE_SHORT_BLK_TOTAL=357,
	HUFD_HTF_CHU8K_RETRO_SHORT_BLK_TOTAL=358,
	HUFD_HTF_CHU8K_PREDEF_SHORT_BLK_TOTAL=359,
	HUFD_HTF_CHU8K_SIMPLE_LONG_BLK_TOTAL=360,
	HUFD_HTF_CHU8K_RETRO_LONG_BLK_TOTAL=361,
	HUFD_HTF_CHU8K_PREDEF_LONG_BLK_TOTAL=362,
	HUFD_HTF_DEFLATE_DYNAMIC_BLK_TOTAL=363,
	HUFD_HTF_DEFLATE_FIXED_BLK_TOTAL=364,
	HUFD_MTF_0_TOTAL=365,
	HUFD_MTF_1_TOTAL=366,
	HUFD_MTF_2_TOTAL=367,
	HUFD_MTF_3_TOTAL=368,
	HUFD_FE_FHP_STALL_TOTAL=369,
	HUFD_FE_LFA_STALL_TOTAL=370,
	HUFD_HTF_PREDEF_STALL_TOTAL=371,
	HUFD_HTF_HDR_DATA_STALL_TOTAL=372,
	HUFD_HTF_HDR_INFO_STALL_TOTAL=373,
	HUFD_SDD_INPUT_STALL_TOTAL=374,
	HUFD_SDD_BUF_FULL_STALL_TOTAL=375,
	LZ77D_PTR_LEN_256_TOTAL=384,
	LZ77D_PTR_LEN_128_TOTAL=385,
	LZ77D_PTR_LEN_64_TOTAL=386,
	LZ77D_PTR_LEN_32_TOTAL=387,
	LZ77D_PTR_LEN_11_TOTAL=388,
	LZ77D_PTR_LEN_10_TOTAL=389,
	LZ77D_PTR_LEN_9_TOTAL=390,
	LZ77D_PTR_LEN_8_TOTAL=391,
	LZ77D_PTR_LEN_7_TOTAL=392,
	LZ77D_PTR_LEN_6_TOTAL=393,
	LZ77D_PTR_LEN_5_TOTAL=394,
	LZ77D_PTR_LEN_4_TOTAL=395,
	LZ77D_PTR_LEN_3_TOTAL=396,
	LZ77D_LANE_1_LITERALS_TOTAL=397,
	LZ77D_LANE_2_LITERALS_TOTAL=398,
	LZ77D_LANE_3_LITERALS_TOTAL=399,
	LZ77D_LANE_4_LITERALS_TOTAL=400,
	LZ77D_PTRS_TOTAL=401,
	LZ77D_FRM_IN_TOTAL=402,
	LZ77D_FRM_OUT_TOTAL=403,
	LZ77D_STALL_TOTAL=404,
	DECRYPT_IV_MISMATCH_FRAME=448,
	DECRYPT_ENGINE_ID_MISMATCH_FRAME=449,
	DECRYPT_SEQ_ID_MISMATCH_FRAME=450,
	DECRYPT_HMAC_SHA256_TAG_FAIL_FRAME=451,
	DECRYPT_SHA256_TAG_FAIL_FRAME=452,
	DECRYPT_GMAC_TAG_FAIL_FRAME=453,
	DECRYPT_GCM_TAG_FAIL_FRAME=454,
	DECRYPT_AUTH_NOP_FRAME=455,
	DECRYPT_AUTH_HMAC_SHA256_FRAME=456,
	DECRYPT_AUTH_SHA256_FRAME=457,
	DECRYPT_AUTH_AES_GMAC_FRAME=458,
	DECRYPT_CIPH_NOP_FRAME=459,
	DECRYPT_CIPH_AES_XEX_FRAME=460,
	DECRYPT_CIPH_AES_XTS_FRAME=461,
	DECRYPT_CIPH_AES_GCM_FRAME=462,
	OSF_DATA_INPUT_STALL_TOTAL=512,
	OSF_CG_INPUT_STALL_TOTAL=513,
	OSF_OUTPUT_BACKPRESSURE_TOTAL=514,
	OSF_OUTPUT_STALL_TOTAL=515,
	ENCRYPT_IV_MISMATCH_FRAME=576,
	ENCRYPT_ENGINE_ID_MISMATCH_FRAME=577,
	ENCRYPT_SEQ_ID_MISMATCH_FRAME=578,
	ENCRYPT_HMAC_SHA256_TAG_FAIL_FRAME=579,
	ENCRYPT_SHA256_TAG_FAIL_FRAME=580,
	ENCRYPT_GMAC_TAG_FAIL_FRAME=581,
	ENCRYPT_GCM_TAG_FAIL_FRAME=582,
	ENCRYPT_AUTH_NOP_FRAME=583,
	ENCRYPT_AUTH_HMAC_SHA256_FRAME=584,
	ENCRYPT_AUTH_SHA256_FRAME=585,
	ENCRYPT_AUTH_AES_GMAC_FRAME=586,
	ENCRYPT_CIPH_NOP_FRAME=587,
	ENCRYPT_CIPH_AES_XEX_FRAME=588,
	ENCRYPT_CIPH_AES_XTS_FRAME=589,
	ENCRYPT_CIPH_AES_GCM_FRAME=590,
	SHORT_MAP_ERR_TOTAL=640,
	LONG_MAP_ERR_TOTAL=641,
	XP9_BLK_COMP_TOTAL=642,
	XP9_FRM_RAW_TOTAL=643,
	XP9_FRM_TOTAL=644,
	XP9_BLK_SHORT_SIM_TOTAL=645,
	XP9_BLK_LONG_SIM_TOTAL=646,
	XP9_BLK_SHORT_RET_TOTAL=647,
	XP9_BLK_LONG_RET_TOTAL=648,
	XP10_BLK_COMP_TOTAL=649,
	XP10_BLK_RAW_TOTAL=650,
	XP10_BLK_SHORT_SIM_TOTAL=651,
	XP10_BLK_LONG_SIM_TOTAL=652,
	XP10_BLK_SHORT_RET_TOTAL=653,
	XP10_BLK_LONG_RET_TOTAL=654,
	XP10_BLK_SHORT_PRE_TOTAL=655,
	XP10_BLK_LONG_PRE_TOTAL=656,
	XP10_FRM_TOTAL=657,
	CHU8_FRM_RAW_TOTAL=658,
	CHU8_FRM_COMP_TOTAL=659,
	CHU8_FRM_SHORT_SIM_TOTAL=660,
	CHU8_FRM_LONG_SIM_TOTAL=661,
	CHU8_FRM_SHORT_RET_TOTAL=662,
	CHU8_FRM_LONG_RET_TOTAL=663,
	CHU8_FRM_SHORT_PRE_TOTAL=664,
	CHU8_FRM_LONG_PRE_TOTAL=665,
	CHU8_CMD_TOTAL=666,
	CHU4_FRM_RAW_TOTAL=667,
	CHU4_FRM_COMP_TOTAL=668,
	CHU4_FRM_SHORT_SIM_TOTAL=669,
	CHU4_FRM_LONG_SIM_TOTAL=670,
	CHU4_FRM_SHORT_RET_TOTAL=671,
	CHU4_FRM_LONG_RET_TOTAL=672,
	CHU4_FRM_SHORT_PRE_TOTAL=673,
	CHU4_FRM_LONG_PRE_TOTAL=674,
	CHU4_CMD_TOTAL=675,
	DF_BLK_COMP_TOTAL=676,
	DF_BLK_RAW_TOTAL=677,
	DF_BLK_SHORT_SIM_TOTAL=678,
	DF_BLK_LONG_SIM_TOTAL=679,
	DF_BLK_SHORT_RET_TOTAL=680,
	DF_BLK_LONG_RET_TOTAL=681,
	DF_FRM_TOTAL=682,
	PASS_THRU_FRM_TOTAL=683,
	BYTE_0_TOTAL=684,
	BYTE_1_TOTAL=685,
	BYTE_2_TOTAL=686,
	BYTE_3_TOTAL=687,
	BYTE_4_TOTAL=688,
	BYTE_5_TOTAL=689,
	BYTE_6_TOTAL=690,
	BYTE_7_TOTAL=691,
	ENCRYPT_STALL_TOTAL=692,
	LZ77_STALL_TOTAL=693,
	LZ77C_eof_FRAME=704,
	LZ77C_bypass_FRAME=705,
	LZ77C_mtf_3_TOTAL=706,
	LZ77C_mtf_2_TOTAL=707,
	LZ77C_mtf_1_TOTAL=708,
	LZ77C_mtf_0_TOTAL=709,
	LZ77C_run_256_nup_TOTAL=710,
	LZ77C_run_128_255_TOTAL=711,
	LZ77C_run_64_127_TOTAL=712,
	LZ77C_run_32_63_TOTAL=713,
	LZ77C_run_11_31_TOTAL=714,
	LZ77C_run_10_TOTAL=715,
	LZ77C_run_9_TOTAL=716,
	LZ77C_run_8_TOTAL=717,
	LZ77C_run_7_TOTAL=718,
	LZ77C_run_6_TOTAL=719,
	LZ77C_run_5_TOTAL=720,
	LZ77C_run_4_TOTAL=721,
	LZ77C_run_3_TOTAL=722,
	LZ77C_mtf_TOTAL=723,
	LZ77C_ptr_TOTAL=724,
	LZ77C_four_lit_TOTAL=725,
	LZ77C_three_lit_TOTAL=726,
	LZ77C_two_lit_TOTAL=727,
	LZ77C_one_lit_TOTAL=728,
	LZ77C_throttled_FRAME=729,
	PREFIX_NUM_0_TOTAL=832,
	PREFIX_NUM_1_TOTAL=833,
	PREFIX_NUM_2_TOTAL=834,
	PREFIX_NUM_3_TOTAL=835,
	PREFIX_NUM_4_TOTAL=836,
	PREFIX_NUM_5_TOTAL=837,
	PREFIX_NUM_6_TOTAL=838,
	PREFIX_NUM_7_TOTAL=839,
	PREFIX_NUM_8_TOTAL=840,
	PREFIX_NUM_9_TOTAL=841,
	PREFIX_NUM_10_TOTAL=842,
	PREFIX_NUM_11_TOTAL=843,
	PREFIX_NUM_12_TOTAL=844,
	PREFIX_NUM_13_TOTAL=845,
	PREFIX_NUM_14_TOTAL=846,
	PREFIX_NUM_15_TOTAL=847,
	PREFIX_NUM_16_TOTAL=848,
	PREFIX_NUM_17_TOTAL=849,
	PREFIX_NUM_18_TOTAL=850,
	PREFIX_NUM_19_TOTAL=851,
	PREFIX_NUM_20_TOTAL=852,
	PREFIX_NUM_21_TOTAL=853,
	PREFIX_NUM_22_TOTAL=854,
	PREFIX_NUM_23_TOTAL=855,
	PREFIX_NUM_24_TOTAL=856,
	PREFIX_NUM_25_TOTAL=857,
	PREFIX_NUM_26_TOTAL=858,
	PREFIX_NUM_27_TOTAL=859,
	PREFIX_NUM_28_TOTAL=860,
	PREFIX_NUM_29_TOTAL=861,
	PREFIX_NUM_30_TOTAL=862,
	PREFIX_NUM_31_TOTAL=863,
	PREFIX_NUM_32_TOTAL=864,
	PREFIX_NUM_33_TOTAL=865,
	PREFIX_NUM_34_TOTAL=866,
	PREFIX_NUM_35_TOTAL=867,
	PREFIX_NUM_36_TOTAL=868,
	PREFIX_NUM_37_TOTAL=869,
	PREFIX_NUM_38_TOTAL=870,
	PREFIX_NUM_39_TOTAL=871,
	PREFIX_NUM_40_TOTAL=872,
	PREFIX_NUM_41_TOTAL=873,
	PREFIX_NUM_42_TOTAL=874,
	PREFIX_NUM_43_TOTAL=875,
	PREFIX_NUM_44_TOTAL=876,
	PREFIX_NUM_45_TOTAL=877,
	PREFIX_NUM_46_TOTAL=878,
	PREFIX_NUM_47_TOTAL=879,
	PREFIX_NUM_48_TOTAL=880,
	PREFIX_NUM_49_TOTAL=881,
	PREFIX_NUM_50_TOTAL=882,
	PREFIX_NUM_51_TOTAL=883,
	PREFIX_NUM_52_TOTAL=884,
	PREFIX_NUM_53_TOTAL=885,
	PREFIX_NUM_54_TOTAL=886,
	PREFIX_NUM_55_TOTAL=887,
	PREFIX_NUM_56_TOTAL=888,
	PREFIX_NUM_57_TOTAL=889,
	PREFIX_NUM_58_TOTAL=890,
	PREFIX_NUM_59_TOTAL=891,
	PREFIX_NUM_60_TOTAL=892,
	PREFIX_NUM_61_TOTAL=893,
	PREFIX_NUM_62_TOTAL=894,
	PREFIX_NUM_63_TOTAL=895,
	ISF_INPUT_COMMANDS=896,
	ISF_INPUT_FRAMES=897,
	ISF_INPUT_STALL_TOTAL=898,
	ISF_INPUT_SYSTEM_STALL_TOTAL=899,
	ISF_OUTPUT_BACKPRESSURE_TOTAL=900,
	ISF_AUX_CMD_COMPRESS_CTL_MATCH_COMMAND_0=901,
	ISF_AUX_CMD_COMPRESS_CTL_MATCH_COMMAND_1=902,
	ISF_AUX_CMD_COMPRESS_CTL_MATCH_COMMAND_2=903,
	ISF_AUX_CMD_COMPRESS_CTL_MATCH_COMMAND_3=904,
	HUF_COMP_LZ77D_PTR_LEN_256_TOTAL=960,
	HUF_COMP_LZ77D_PTR_LEN_128_TOTAL=961,
	HUF_COMP_LZ77D_PTR_LEN_64_TOTAL=962,
	HUF_COMP_LZ77D_PTR_LEN_32_TOTAL=963,
	HUF_COMP_LZ77D_PTR_LEN_11_TOTAL=964,
	HUF_COMP_LZ77D_PTR_LEN_10_TOTAL=965,
	HUF_COMP_LZ77D_PTR_LEN_9_TOTAL=966,
	HUF_COMP_LZ77D_PTR_LEN_8_TOTAL=967,
	HUF_COMP_LZ77D_PTR_LEN_7_TOTAL=968,
	HUF_COMP_LZ77D_PTR_LEN_6_TOTAL=969,
	HUF_COMP_LZ77D_PTR_LEN_5_TOTAL=970,
	HUF_COMP_LZ77D_PTR_LEN_4_TOTAL=971,
	HUF_COMP_LZ77D_PTR_LEN_3_TOTAL=972,
	HUF_COMP_LZ77D_LANE_4_LITERALS_TOTAL=973,
	HUF_COMP_LZ77D_LANE_3_LITERALS_TOTAL=974,
	HUF_COMP_LZ77D_LANE_2_LITERALS_TOTAL=975,
	HUF_COMP_LZ77D_LANE_1_LITERALS_TOTAL=976,
	HUF_COMP_LZ77D_PTRS_TOTAL=977,
	HUF_COMP_LZ77D_FRM_IN_TOTAL=978,
	HUF_COMP_LZ77D_FRM_OUT_TOTAL=979,
	HUF_COMP_LZ77D_STALL_STB_TOTAL=980,
	CCEIP_STATS_RESERVED=1023
} cceip_stats_e;

endpackage:cr_native_types

`endif


//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_native_types.svp

//* INLINED_FILE: `include "cr_error_codes.svp"
//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_error_codes.svp
// *************************************************************************
//
// Copyright ï¿½ Microsoft Corporation. All rights reserved.
// Copyright ï¿½ Broadcom Inc. All rights reserved.
// Licensed under the MIT License.
//
// *************************************************************************


`ifndef CR_ERROR_CODES_SVP
`define CR_ERROR_CODES_SVP
package cr_error_codes;
typedef enum logic [7:0]
        {NO_ERRORS=0,
         
         //ISF, OSF:
         

         //CRC Checker/Generator
         //
         //                     cceip  cceip   cceip    cceip   cddip   cddip
         //                     crcc0  crcc1   crcg0   crcgc0   crcg0   crcc0
         //                    ------  -----  ------  -------  ------  ------
         // cceip_cfg               1      1       1        1       0       0
         // crcgc_mode              3      2       1        0       4       3
         // ERROR_CODE hex       0x33   0x34    0x35     0x36    0x37    x038
         //            int         51     52      53       54      55      56 
         //
         CRCCG_CRC_ERROR  = 50,
         CRCC0_CRC_ERROR  = 51,
         CRCC1_CRC_ERROR  = 52,
         CRCG0_CRC_ERROR  = 53,
         CRCGC0_CRC_ERROR = 54,
         CRCDG0_CRC_ERROR = 55,
         CRCDC0_CRC_ERROR = 56,
         
         
         //Prefix Errors
         PREFIX_PC_OVERRUN_ERROR    = 150,
         PREFIX_NUM_WR_ERROR        = 151,
         PREFIX_ILLEGAL_OPCODE      = 152,
         PREFIX_REC_US_SW_EN_ERROR  = 153,

         
         
         //Prefix Attach Errors
         PREFIX_ATTACH_PHD_CRC_ERROR = 155,
         PREFIX_ATTACH_PFD_CRC_ERROR = 156,
         

         
         //LZ77 Compressor

         LZ77_COMP_PREFIX_CRC_ERROR     = 64,
         LZ77_COMP_INVALID_COMP_ALG     = 65,
         LZ77_COMP_INVALID_WIN_SIZE     = 66,
         LZ77_COMP_INVALID_MIN_LEN      = 67,
         LZ77_COMP_INVALID_NUM_MTF      = 68,
         LZ77_COMP_INVALID_MAX_LEN      = 69,
         LZ77_COMP_INVALID_DMW_SIZE     = 70,
         LZ77_COMP_LZ_ERROR             = 71,
         
         
         //Huffman Encoder
         HE_MEM_ECC                     = 80,
         HE_PDH_CRC                     = 81,
         HE_PFX_CRC                     = 82,
         HE_SYM_MAP_ERR                 = 83,
         
         
         //Crypto Encrypt
         CRYPTO_ENC_DRNG_HEALTH_FAIL = 108,
	 CRYPTO_ENC_AAD_LEN_ERROR = 107,
         CRYPTO_ENC_XTS_LEN_ERROR = 106,
         CRYPTO_ENC_MAL_CMD = 105,
         CRYPTO_ENC_KEY_TLV_CRC_ERROR = 104,
         CRYPTO_ENC_INVALID_ENGINE_ID = 103,
         CRYPTO_ENC_INVALID_SEQNUM = 102,
         CRYPTO_ENC_IV_MISSING = 101,
         CRYPTO_ENC_SEED_EXPIRED = 100,

         //Crypto Decrypt/Validate
         CRYPTO_DEC_AAD_LEN_ERROR = 118,
         CRYPTO_DEC_XTS_LEN_ERROR = 117,
         CRYPTO_DEC_MAL_CMD = 116,
         CRYPTO_DEC_KEY_TLV_CRC_ERROR = 115,
         CRYPTO_DEC_INVALID_ENGINE_ID = 114,
         CRYPTO_DEC_INVALID_SEQNUM = 113,
         CRYPTO_DEC_IV_MISSING = 112,
         CRYPTO_DEC_TAG_MISCOMPARE = 110,

         //Crypto Integrity Gen/Check
         CRYPTO_INT_KEY_TLV_CRC_ERROR = 123,
         CRYPTO_INT_INVALID_ENGINE_ID = 122,
         CRYPTO_INT_INVALID_SEQNUM = 121,
         CRYPTO_INT_TAG_MISCOMPARE = 120,

         //KME
         KME_DAK_INV_KIM = 130,
         KME_DAK_PF_VF_VAL_ERR = 131,
         KME_DEK_INV_KIM = 132,
         KME_DEK_PF_VF_VAL_ERR = 133,
         KME_SEED_EXPIRED = 134,
         KME_DEK_GCM_TAG_FAIL = 135,
         KME_DAK_GCM_TAG_FAIL = 136,
         KME_ECC_FAIL = 137,
         KME_UNSUPPORTED_KEY_TYPE = 138,
         KME_DEK_ILLEGAL_KEK_USAGE = 139,
         KME_DAK_ILLEGAL_KEK_USAGE = 140,
         KME_DRNG_HEALTH_FAIL = 141,

         //Huffman Decoder
         HD_MEM_ECC=1,
         
         HD_FHP_PFX_CRC=2,
         HD_FHP_PFX_DATA_ABSENT=3,
         HD_FHP_PHD_CRC=4,
         HD_FHP_BAD_FORMAT=5,

         HD_BHP_INVALID_WSIZE=6,
         HD_BHP_BLK_CRC=7,
         HD_BHP_HDR_INVALID=8,
         HD_BHP_XP9_HDR_SEQ=9,
         HD_BHP_XP10_XTRA_FLAG_PRSNT=10,
         HD_BHP_ZLIB_FDICT_PRSNT=11,
         HD_BHP_GZ_CM_NOT_DEFLATE=12,
         HD_BHP_ZLIB_CINFO_RANGE=13,
         HD_BHP_ZLIB_FCHECK=14,
         HD_BHP_DFLATE_LEN_CHECK = 15,
         HD_LFA_REWIND_FAIL=16,
         HD_LFA_PREMATURE_EOF = 17,
         HD_LFA_LATE_EOF = 18,
         HD_LFA_MISSING_EOF = 19,

         HD_HTF_XP9_RESERVED_SYMBOL_TABLE_ENCODING=20,
         HD_HTF_XP10_RESERVED_SYMBOL_TABLE_ENCODING=21,
         HD_HTF_XP10_PREDEF_SYMBOL_TABLE_ENCODING=22,
         HD_HTF_XP9_ILLEGAL_NONZERO_BL=23,
         HD_HTF_RLE_OVERRUN=24,
         HD_HTF_BAD_HUFFMAN_CODE=25,
         HD_HTF_ILLEGAL_SMALL_HUFFTREE=26,
         HD_HTF_ILLEGAL_HUFFTREE=27,
         HD_HTF_HDR_UNDERRUN=28,
         HD_BHP_STBL_SIZE_ERR=29,
         HD_SDD_INVALID_SYMBOL=32,
         HD_SDD_END_MISMATCH=33,
         HD_SDD_MISSING_EOB_SYM=34,
         HD_MTF_XP9_MTF3_AFTER_BACKREF=35,
         HD_MTF_XP10_MISSING_MTF=36,

         HD_BHP_ILLEGAL_MTF_SZ=37,
         //LZ77 Decompressor
         HD_LZ_HBIF_SOFT_OFLOW=38,
         HD_BE_FRM_CRC=39,
         HD_BE_OLIMIT=40,
         HD_BE_SZ_MISMATCH=41,
         
         //Completion Generator
         CG_UNDEF_FRMD_OUT = 170,

         //ISF
         ISF_PREFIX_ERR = 180,

         //TLV Parser
         TLVP_BIP2_ERROR = 255
       
  

         } zipline_error_e;

endpackage:cr_error_codes

`endif
//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_error_codes.svp

//* INLINED_FILE: `include "cr_structs.svp"
//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_structs.svp
// *************************************************************************
//
// Copyright ï¿½ Microsoft Corporation. All rights reserved.
// Copyright ï¿½ Broadcom Inc. All rights reserved.
// Licensed under the MIT License.
//
// *************************************************************************
//
//------------------------------------------------------------------------------
//* INLINED_FILE: `include "cr_global_params.vh"
//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_global_params.vh
/*************************************************************************
*
* Copyright © Microsoft Corporation. All rights reserved.
* Copyright © Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/



`ifndef CR_GLOBAL_PARAMS_VH
`define CR_GLOBAL_PARAMS_VH

`define N_RBUS_ADDR_BITS        20
`define N_KME_RBUS_ADDR_BITS    16
`define N_RBUS_DATA_BITS        32
`define CR_CDDIP_N_BLKS         10
`define CR_CCEIP_64_N_BLKS      15
`define CR_CCEIP_16_N_BLKS      9
`define AXI_S_DP_DWIDTH         64
`define AXI_S_STAT_DWIDTH       32
`define AXI_S_SCH_DWIDTH        32
`define AXI_S_CPL_DWIDTH        32

`define AXI_S_TID_WIDTH         1
`define AXI_S_USER_WIDTH        8
`define AXI_S_KEEP_WIDTH        8
`define AXI_S_TSTRB_WIDTH       8

`define AXI_S_TOTAL_WIDTH       82

`define N_AXI_IM_ENTRIES        512
`define N_AXI_IM_DECS_WIDTH     32
`define N_AXI_IM_DATA_WIDTH     64
`define N_AXI_IM_WIDTH          96

`define N_MAX_WINDOW_BYTES      65536
`define N_WINDOW_WIDTH          16
`define N_EXTRA_BITS_WIDTH      15
`define N_EXTRA_BITS_TOT_WIDTH  18
`define N_EXTRA_BITS_LEN_WIDTH  4
`define N_MAX_ENCODE_WIDTH      27

`define N_MAX_BUFFER_SIZE       8388609
`define N_MAX_BUFFER_SIZE_WIDTH 24
`define N_RAW_SIZE_WIDTH        24

`define N_XP9_SHRT_SYMBOLS      704
`define N_XP9_LONG_SYMBOLS      256
`define N_XP10_64K_SHRT_SYMBOLS 576
`define N_XP10_64K_LONG_SYMBOLS 248
`define N_XP10_16K_SHRT_SYMBOLS 544
`define N_XP10_16K_LONG_SYMBOLS 246
`define N_XP10_8K_SHRT_SYMBOLS  528
`define N_XP10_8K_LONG_SYMBOLS  245
`define N_XP10_4K_SHRT_SYMBOLS  512
`define N_XP10_4K_LONG_SYMBOLS  244
`define N_SHRT_SYM_WIDTH        10
`define N_LONG_SYM_WIDTH        8
`define N_LENLIT_SYMBOLS        288
`define N_DIST_SYMBOLS          30
`define N_SMALL_SYMBOLS         33
`define N_CODELEN_SYMBOLS       19
`define N_MAX_XP_HUFF_BITS      27
`define N_MAX_DEFLATE_HUFF_BITS 15
`define N_MAX_SMALL_HUFF_BITS   8
`define N_MAX_CODELEN_HUFF_BITS 7
`define N_MAX_SUPPORTED_SYMBOLS 576
`define N_MAX_HUFF_BITS         27
`define N_HTF_BL_OUT_ENTRIES    226


`define N_MAX_MTF               4
`define N_MAX_MTF_WIDTH         2
`define N_MAX_NGRAM             4
`define N_MAX_NGRAM_WIDTH       3

`define N_HUFF_SQ_DEPTH         20480
`define N_HUFF_SQ_ADDR_WIDTH    15

`define XPRESS9_ID              1317459754
`define XPRESS10_ID             3225019664

`define CR_CCEIP_16_BLKID       52758
`define CR_CCEIP_64_BLKID       52836
`define CR_CDDIP_BLKID          52580

`define FRAME_ID_WIDTH          64
`define MODULE_ID_WIDTH         5
`define SU_BYTES_WIDTH          24

`define PREFIX_STATS_WIDTH      64
`define LZ77C_STATS_WIDTH       64
`define HUFE_STATS_WIDTH        32
`define CRYPTO_STATS_WIDTH      32
`define LZ77D_STATS_WIDTH       64
`define HUFD_STATS_WIDTH        64
`define CRCGC_STATS_WIDTH       8
`define ISF_STATS_WIDTH         64
`define OSF_STATS_WIDTH         16
`define CG_STATS_WIDTH          4

`define TLVP_SEQ_NUM_WIDTH      13
`define TLVP_ORD_NUM_WIDTH      13
`define TLVP_TYP_NUM_WIDTH      8
`define TLVP_PA_WIDTH           64

`define TLV_FRAME_NUM_WIDTH     11

`define N_PREFIX_FEATURES       256
`define N_PREFIX_FEATURE_CTR    64

`define N_PREFIX_IM_ENTRIES     256
`define N_PREFIX_SAT_ENTRIES    128
`define N_PREFIX_CT_ENTRIES     128
`define CR_PREFIX_N_NEURONS     128
`define CR_PREFIX_NEURON_WIDTH  7
`define CR_PREFIX_PFD_ENTRIES   8192
`define CR_PREFIX_PHD_ENTRIES   4096
`define CR_PREFIX_N_PHD_WORDS   67
`define CR_PREFIX_N_PFD_WORDS   130

`define ISF_FIFO_ENTRIES        1024
`define ISF_FIFO_WIDTH          92

`define OSF_DATA_FIFO_ENTRIES   512
`define OSF_DATA_FIFO_WIDTH     92

`define OSF_PDT_FIFO_ENTRIES    256
`define OSF_PDT_FIFO_WIDTH      92

`define SU_FIFO_ENTRIES         64

`define TLV_LEN_WIDTH           8
`define N_FTR_WORDS             14
`define N_FTR_WORDS_EXP         20

`define TLV_LATENCY_WIDTH       16
`define TLV_SEQ_NUM_WIDTH       8

`define AXI_S_TID_PAD_WIDTH     8


`define XP10CRC64_POLYNOMIAL    11127430586519243189
`define XP10CRC64_INIT          18446744073709551615

`define XP10CRC32_POLYNOMIAL    2197175160
`define XP10CRC32_INIT          4294967295

`define CRC64E_POLYNOMIAL       4823603603198064275
`define CRC64E_INIT             18446744073709551615

`define GZIPCRC32_POLYNOMIAL    3988292384
`define GZIPCRC32_INIT          4294967295

`define CRC16T_POLYNOMIAL       35767
`define CRC16T_INIT             65535

`endif

//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_global_params.vh


// `include "cr_native_types.svh"

// `include "cr_error_codes.svh"

`ifndef CR_STRUCTS_SVP
`define CR_STRUCTS_SVP

package cr_structs;

import cr_native_types::*;
import cr_error_codes::*;

//Structs for AXI4S Data Path Interfaces
typedef struct packed {
  logic                          tvalid;
  logic                          tlast;
  logic [`AXI_S_TID_WIDTH-1:0]   tid;
  logic [`AXI_S_TSTRB_WIDTH-1:0] tstrb;
  logic [`AXI_S_USER_WIDTH-1:0]  tuser;
  logic [`AXI_S_DP_DWIDTH-1:0]   tdata;
} axi4s_dp_bus_t;

// Slave inputs
typedef struct packed {
  logic        tready;
} axi4s_dp_rdy_t;

// For rbus top level input
typedef struct packed {
  logic [`N_RBUS_ADDR_BITS-1:0] addr;
  logic                         wr_strb;
  logic [`N_RBUS_DATA_BITS-1:0] wr_data;
  logic                         rd_strb;
} rbus_in_t;

// For rbus top level output
typedef struct packed {
  logic [`N_RBUS_DATA_BITS-1:0] rd_data;
  logic                         ack;
  logic                         err_ack;
} rbus_out_t;

// For rbus ring network
typedef struct packed {
  logic [`N_RBUS_ADDR_BITS-1:0] addr;  
  logic                         wr_strb;
  logic [`N_RBUS_DATA_BITS-1:0] wr_data;
  logic                         rd_strb;
  logic [`N_RBUS_DATA_BITS-1:0] rd_data;
  logic                         ack;    
  logic                         err_ack;
} rbus_ring_t;

// For rbus ring network
typedef struct packed {
  logic [`N_KME_RBUS_ADDR_BITS-1:0] addr;  
  logic                         wr_strb;
  logic [`N_RBUS_DATA_BITS-1:0] wr_data;
  logic                         rd_strb;
  logic [`N_RBUS_DATA_BITS-1:0] rd_data;
  logic                         ack;    
  logic                         err_ack;
} kme_rbus_ring_t;

// Interface monitor structures
typedef struct packed {
   logic                          eob;
   logic [`AXI_S_TSTRB_WIDTH-1:0] bytes_vld;
   logic [22:0]                   im_meta;                     
} im_desc_t;

typedef struct packed {
   logic [`AXI_S_DP_DWIDTH-1:0]  data;
} im_data_t;

typedef struct packed {
   im_data_t data;
   im_desc_t desc;
} im_din_t;
   
typedef struct packed {
   logic                         bank_hi;   
   logic                         bank_lo;         
} im_available_t;

typedef struct packed {
   logic                         bank_hi;   
   logic                         bank_lo;         
} im_consumed_t;

//Frame Latency Interface
typedef struct packed {
  logic                           valid;
  logic [`TLV_SEQ_NUM_WIDTH-1:0]  seq_num;
} frame_latency_if_bus_t;

// Scheduler Update Interface
typedef struct packed {
  logic                         valid;
  logic [15:0]                  rqe_sched_handle;
  logic                         last;
  logic [10:0]                  tlv_frame_num;
  logic [3:0]                   tlv_eng_id;
  logic [7:0]                   tlv_seq_num;
  logic [`SU_BYTES_WIDTH-1:0]   bytes_in;
  logic [`SU_BYTES_WIDTH-1:0]   bytes_out;
  logic [`SU_BYTES_WIDTH-1:0]   basis;
} sched_update_if_bus_t;


// TLV Parser Interface
typedef struct packed {
  logic                           insert;
  logic [`TLVP_ORD_NUM_WIDTH-1:0] ordern;
  tlv_types_e                     typen;
  logic                           sot;
  logic                           eot;
  logic                           tlast;
  logic [`AXI_S_TID_WIDTH-1:0]    tid;
  logic [`AXI_S_TSTRB_WIDTH-1:0]  tstrb;
  logic [`AXI_S_USER_WIDTH-1:0]   tuser;
  logic [`AXI_S_DP_DWIDTH-1:0]    tdata;
} tlvp_if_bus_t;

// LZ77 to Huffman Compress interface
typedef struct  packed {
   logic [3:0]  framing;
   logic [7:0]  data0;
   logic [7:0]  data1;
   logic [7:0]  data2;
   logic [7:0]  data3;
   logic        backref;
   logic        backref_type;
   logic [1:0]  backref_lane;
   logic [7:0]  offset_msb;
   logic [15:0] length;
} lz_symbol_bus_t;

// TLV word 0, common to all TLV types       
typedef struct  packed {
   logic [ 1:0]      tlv_bip2;
   logic [18:0]      resv0;
   logic [10:0]      tlv_frame_num;
   logic [ 3:0]      resv1;
   logic [ 3:0]      tlv_eng_id;
   logic [ 7:0]      tlv_seq_num;       
   logic [ 7:0]      tlv_len;
   tlv_types_e       tlv_type;
} tlv_word_0_t;
 
// TLV word 0 for RQE TLV                    
typedef struct  packed {
   logic [1:0]      tlv_bip2;
   logic            no_data;
   logic            aux_frmd_crc;
   rqe_frame_size_e frame_size;
   logic            vf_valid;
   rqe_trace_e      trace;
   logic [10:0]     unused;
   logic [10:0]     tlv_frame_num;
   logic [3:0]      resv0;
   logic [3:0]      tlv_eng_id;
   logic [7:0]      tlv_seq_num;
   logic [7:0]      tlv_len;
   tlv_types_e      tlv_type;
} tlv_rqe_word_0_t;
 
// TLV word 0 for data unknown TLV            
typedef struct  packed {
   logic [1:0]      tlv_bip2;
   logic            last_of_command;   
   logic [15:0]     resv0;
   frmd_coding_e    coding;      
   logic [10:0]     tlv_frame_num;
   logic [3:0]      resv1;
   logic [3:0]      tlv_eng_id;
   logic [7:0]      tlv_seq_num;        
   logic [7:0]      tlv_len;     
   tlv_types_e      tlv_type;
} tlv_data_word_0_t;
 

// RQE TLV word 1                          
typedef struct  packed {
   logic [ 3:0]       pf_number;
   logic [11:0]       vf_number;
   logic [15:0]       scheduler_handle;
   logic [31:0]       src_data_len;
} tlv_rqe_word_1_t;

//Struct for CMD.debug field
typedef struct packed { 
   tlvp_corrupt_e     tlvp_corrupt;
   cmd_mode_e         cmd_mode;
   logic [4:0]        module_id;  
   cmd_type_e         cmd_type;
   logic [4:0]        tlv_num;
   logic [9:0]        byte_num;
   logic [7:0]        byte_msk;
} cmd_debug_t;

//Struct for backpressure debug field
typedef struct packed {
   logic [0:0]        rsvd;
   logic [10:0]       on_count;
   logic [10:0]       off_count;
} bp_debug_t;


// CMD TLV word 1                                 
typedef struct  packed {
   cmd_debug_t                  debug;             // 32
   logic                        trace;             // 1    
   logic                        dst_guid_present;  // 1    
   logic [6:0]                  frmd_out_type;     // 7    
   cmd_md_op_e                  md_op;             // 2 
   cmd_md_type_e                md_type;           // 2 
   logic [6:0]                  frmd_in_type;      // 7 
   logic [5:0]                  frmd_in_aux;       // 6
   cmd_frmd_crc_in_e            frmd_crc_in;       // 1 
   cmd_guid_present_e           src_guid_present;  // 1  
   cmd_compound_cmd_frm_size_e  compound_cmd_frm_size; // 4
} tlv_cmd_word_1_t;

// CMD TLV word 2
typedef struct  packed {   
   logic                       rsvd2;                 // 1 
   aux_key_type_e              key_type;              // 6
   logic [1:0]                 rsvd1;                 // 2
   cmd_cipher_pad_e            cipher_pad;            // 1 
   cmd_iv_op_e                 iv_op;                 // 2
   logic [7:0]                 aad_len;               // 8
   cmd_cipher_op_e             cipher_op;             // 4
   cmd_auth_op_e               auth_op;               // 4
   cmd_auth_op_e               raw_auth_op;           // 4
   logic [7:0]                 rsvd0;                 // 8
   cmd_chu_comp_thrsh_e        chu_comp_thrsh;        // 2
   cmd_xp10_crc_mode_e         xp10_crc_mode;         // 1
   logic [5:0]                 xp10_user_prefix_size; // 6
   cmd_xp10_prefix_mode_e      xp10_prefix_mode;      // 2
   cmd_lz77_max_symb_len_e     lz77_max_symb_len;     // 2
   cmd_lz77_min_match_len_e    lz77_min_match_len;    // 1
   cmd_lz77_dly_match_win_e    lz77_dly_match_win;    // 2
   cmd_lz77_win_size_e         lz77_win_size;         // 4
   cmd_comp_mode_e             comp_mode;             // 4
} tlv_cmd_word_2_t;


// KEY TLV word 1
typedef struct packed { 
   logic [63:0] guid;
} tlv_key_word1_t;

// KEY TLV word 2
typedef struct packed { 
   logic [63:0] guid;
} tlv_key_word2_t;


// KEY TLV word 3
typedef struct packed { 
   logic [63:0] guid;
} tlv_key_word3_t;

// KEY TLV word 4
typedef struct packed { 
   logic [63:0] guid;
} tlv_key_word4_t;


// KEY TLV word 5
typedef struct packed { 
   logic [63:0] ivtweak;
} tlv_key_word5_t;


// KEY TLV word 6
typedef struct packed { 
   logic [63:0] ivtweak;
} tlv_key_word6_t;


// KEY TLV word 7
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word7_t;


// KEY TLV word 8
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word8_t;


// KEY TLV word 9
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word9_t;


// KEY TLV word 10
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word10_t;


// KEY TLV word 11
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word11_t;


// KEY TLV word 12
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word12_t;


// KEY TLV word 13
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word13_t;



// KEY TLV word 14
typedef struct packed { 
   logic [63:0] dek;
} tlv_key_word14_t;


// KEY TLV word 15
typedef struct packed { 
   logic [63:0] dak;
} tlv_key_word15_t;


// KEY TLV word 16
typedef struct packed { 
   logic [63:0] dak;
} tlv_key_word16_t;

// KEY TLV word 17
typedef struct packed { 
   logic [63:0] dak;
} tlv_key_word17_t;


// KEY TLV word 18
typedef struct packed { 
   logic [63:0] dak;
} tlv_key_word18_t;

// KEY TLV word 19
typedef struct packed { 
   logic   [55:0]   rsvd;
   zipline_error_e   kme_errors;
} tlv_key_word19_t;

// KEY TLV word 20
typedef struct packed { 
   logic [31:0] rsvd;
   logic [31:0] crc32;
} tlv_key_word20_t;



// Predetermined Huffman TLV Word 1
typedef struct packed { 
   logic [63:6] rsvd;
   logic [5:0] xp10_prefix_sel;
} tlv_phd_word1_t;

// Prefix Data TLV word 0
typedef struct  packed {
   logic [1:0]      tlv_bip2;
   logic [11:0]     resv0;
   logic            prefix_src;
   logic [5:0]      xp10_prefix_sel;
   logic [10:0]     tlv_frame_num;
   logic [3:0]      resv1;
   logic [3:0]      tlv_eng_id;
   logic [7:0]      tlv_seq_num;
   logic [7:0]      tlv_len;
   tlv_types_e      tlv_type;
} tlv_pfd_word0_t;

// Prefix TLV Word 1  
typedef struct packed { 
   logic [63:6] rsvd;
   logic [5:0] xp10_prefix_sel;
} tlv_pfd_word1_t;


//GUID TLV word 1
typedef struct packed { 
   logic [63:0] guid;
} tlv_guid_word1_t;


//GUID TLV word 2
typedef struct packed { 
   logic [63:0] guid;
} tlv_guid_word2_t;



//GUID TLV word 3
typedef struct packed { 
   logic [63:0] guid;
} tlv_guid_word3_t;


//GUID TLV word 4
typedef struct packed { 
   logic [63:0] guid;
} tlv_guid_word4_t;


//FOOTER TLV word 0
typedef struct  packed {
   logic [1:0]      tlv_bip2;
   logic [1:0]      rsvd3;
   logic [7:0]      gen_frmd_out_type;
   logic [1:0]      rsvd2;  
   frmd_mac_size_e  raw_data_mac_size;  
   frmd_mac_size_e  enc_cmp_data_mac_size;
   frmd_coding_e    coding;
   logic            rsvd1;  
   logic [10:0]     tlv_frame_num;
   logic [3:0]      rsvd0;
   logic [3:0]      tlv_eng_id;
   logic [7:0]      tlv_seq_num;
   logic [7:0]      tlv_len;
   tlv_types_e      tlv_type;
} tlv_ftr_word0_t;
 

//FOOTER TLV word 1
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} tlv_ftr_word1_t;

//FOOTER TLV word 2
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} tlv_ftr_word2_t;

//FOOTER TLV word 3 
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} tlv_ftr_word3_t;

//FOOTER TLV word 4 
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} tlv_ftr_word4_t;


//FOOTER TLV word 5 
typedef struct packed { 
   logic [63:0]     raw_data_cksum;
} tlv_ftr_word5_t;


//FOOTER TLV word 6 
typedef struct packed { 
  logic [63:0]      raw_data_cksum_protocol;
} tlv_ftr_word6_t;

//FOOTER TLV word 7 
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;
} tlv_ftr_word7_t;

//FOOTER TLV word 8 
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;
} tlv_ftr_word8_t;

//FOOTER TLV word 9 
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;
} tlv_ftr_word9_t;

//FOOTER TLV word 10
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;
} tlv_ftr_word10_t;

//FOOTER TLV word 11
typedef struct packed { 
   logic [63:0]     enc_cmp_data_cksum;
} tlv_ftr_word11_t;

//FOOTER TLV word 12
typedef struct packed { 
   logic [15:0]     nvme_raw_cksum_crc16t;
   logic [23:0]     bytes_in;
   logic [23:0]     bytes_out;  
} tlv_ftr_word12_t;


//FOOTER TLV word 13
typedef struct packed { 
   logic [19:0]     rsvd1;  
   logic [23:0]     compressed_length;  
   zipline_error_e   error_code;
   logic            rsvd0;  
   logic [10:0]     errored_frame_number;
} tlv_ftr_word13_t;


//FOOTER TLV GUID word 0
typedef struct packed { 
   logic [63:0] guid;
} tlv_ftr_guid_word0_t;

//FOOTER TLV GUID word 1
typedef struct packed { 
   logic [63:0] guid;
} tlv_ftr_guid_word1_t;

//FOOTER TLV GUID word 2
typedef struct packed { 
   logic [63:0] guid;
} tlv_ftr_guid_word2_t;

//FOOTER TLV GUID word 3
typedef struct packed { 
   logic [63:0] guid;
} tlv_ftr_guid_word3_t;

//FOOTER TLV IV word 0
typedef struct packed {  
   logic [31:0] rsvd;
   logic [31:0] iv;
} tlv_ftr_iv_word0_t;

//FOOTER TLV IV word 1
typedef struct packed { 
   logic [63:0] iv;
} tlv_ftr_iv_word1_t;


//STATS TLV word1                            
typedef struct packed { 
   logic [ 7:0]                       rsvd1;
   logic [23:0]                       bytes_in;
   logic [ 7:0]                       rsvd0;
   logic [23:0]                       bytes_out;  
} tlv_stats_word1_t;

//STATS TLV word2                            
typedef struct packed { 
   logic [30:0]                       rsvd1;
   logic                              frame_error;
   logic [ 7:0]                       rsvd0;
   logic [23:0]                       latency;  
} tlv_stats_word2_t;



//CQE TLV word1                             
typedef struct packed { 
   logic [ 7:0]  status_code; 
   logic         do_not_resend; 
   logic         vf_valid; 
   logic [ 1:0]  rsvd0;
   logic [ 7:0]  error_code;
   logic [11:0]  errored_frame_number;
   logic [ 2:0]  status_code_type; 
   logic [12:0]  stat_cts;
   logic [ 3:0]  pf_number; 
   logic [11:0]  vf_number; 
} tlv_cqe_word1_t;




//FRMD_USER_PI16 TLV Word1                    
typedef struct packed { 
   logic [47:0]     rsvd;
   logic [15:0]     nvme_raw_cksum_crc16t;
} fmd_user_pi16_word1_t;



//FRMD_USER_PI64 TLV Word1                 
typedef struct packed { 
   logic [63:0]     raw_data_cksum;
} fmd_user_pi64_word1_t;



//FRMD_USER_VM TLV Word1                    
typedef struct packed { 
   logic [63:0]     ivtweak;
} fmd_user_vm_word1_t;

//FRMD_USER_VM TLV Word2                    
typedef struct packed { 
   logic [63:0]     ivtweak;
} fmd_user_vm_word2_t;

//FRMD_USER_VM TLV Word3                     
typedef struct packed { 
   logic [63:0]     raw_data_cksum;
} fmd_user_vm_word3_t;


//FRMD_USER_VM TLV Word4                    
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} fmd_user_vm_word4_t;


//FRMD_USER_VM TLV Word5                    
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} fmd_user_vm_word5_t;


//FRMD_USER_VM TLV Word6                    
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} fmd_user_vm_word6_t;


//FRMD_USER_VM TLV Word7                    
typedef struct packed { 
   logic [63:0]     raw_data_mac;
} fmd_user_vm_word7_t;



//FRMD_INT_APP Word7                        
typedef struct packed { 
   logic [31:0]     rsvd;
   logic [5:0]      rsvd0;   
   frmd_coding_e    coding;
   logic [23:0]     compressed_length;
} fmd_int_app_word6_t;


//FRMD_INT_APP Word1                        
typedef struct packed { 
   logic [63:0]     enc_cmp_data_cksum;  
} fmd_int_app_word1_t;


//FRMD_INT_APP Word2                        
typedef struct packed { 
 logic [63:0] enc_cmp_mac;
} fmd_int_app_word2_t;


//FRMD_INT_APP Word3                        
typedef struct packed { 
 logic [63:0] enc_cmp_mac;
} fmd_int_app_word3_t;
 
//FRMD_INT_APP Word4                        
typedef struct packed { 
 logic [63:0] ivtweak;
} fmd_int_app_word4_t;

//FRMD_INT_APP Word5                        
typedef struct packed { 
  logic [31:0] rsvd;
  logic [31:0] ivtweak;
} fmd_int_app_word5_t;

//FRMD_INT_SIP Word3                        
typedef struct packed { 
   logic [31:0]     rsvd;
   logic [5:0]      rsvd0;   
   frmd_coding_e    coding;
   logic [23:0]     compressed_length;
} fmd_int_sip_word3_t;


//FRMD_INT_SIP Word1                        
typedef struct packed { 
   logic [63:0]     enc_cmp_data_cksum;  
} fmd_int_sip_word1_t;



//FRMD_INT_SIP Word2                        
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_sip_word2_t;


//FRMD_INT_LIP Word6                           
typedef struct packed { 
   logic [31:0]     rsvd;
   logic [5:0]      rsvd0;   
   frmd_coding_e    coding;
   logic [23:0]     compressed_length;
} fmd_int_lip_word6_t;


//FRMD_INT_LIP Word1                            
typedef struct packed { 
   logic [63:0]     enc_cmp_data_cksum;  
} fmd_int_lip_word1_t;



//FRMD_INT_LIP Word2                             
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_lip_word2_t;



//FRMD_INT_LIP Word3                            
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_lip_word3_t;


//FRMD_INT_LIP Word4                            
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_lip_word4_t;


//FRMD_INT_LIP Word5                            
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_lip_word5_t;


//FRMD_INT_VM Word12                        
typedef struct packed { 
   logic [31:0]     rsvd;
   logic [5:0]      rsvd0;   
   frmd_coding_e    coding;
   logic [23:0]     compressed_length;    
} fmd_int_vm_word12_t;


//FRMD_INT_VM Word1                        
typedef struct packed { 
   logic [63:0]     enc_cmp_data_cksum;  
} fmd_int_vm_word1_t;


//FRMD_INT_VM Word2                         
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_word2_t;


//FRMD_INT_VM Word3
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_word3_t;


//FRMD_INT_VM Word4
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_word4_t;


//FRMD_INT_VM Word5
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_word5_t;


//FRMD_INT_VM Word6                         
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_vm_word6_t;


//FRMD_INT_VM Word7
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_vm_word7_t;


//FRMD_INT_VM Word8
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_vm_word8_t;

//FRMD_INT_VM Word9
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_vm_word9_t;


//FRMD_INT_VM Word10                         
typedef struct packed { 
  logic [63:0]      ivtweak;
} fmd_int_vm_word10_t;


//FRMD_INT_VM Word11                          
typedef struct packed { 
  logic [63:0]      ivtweak;           
} fmd_int_vm_word11_t;


//FRMD_INT_VM_SHORT Word9
typedef struct packed { 
   logic [31:0]     rsvd;
   logic [5:0]      rsvd0;   
   frmd_coding_e    coding;
   logic [23:0]     compressed_length;    
} fmd_int_vm_short_word9_t;


//FRMD_INT_VM_SHORT Word1
typedef struct packed { 
   logic [63:0]     enc_cmp_data_cksum;  
} fmd_int_vm_short_word1_t;


//FRMD_INT_VM_SHORT Word2
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_short_word2_t;

//FRMD_INT_VM_SHORT Word3
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_short_word3_t;

//FRMD_INT_VM_SHORT Word4
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_short_word4_t;

//FRMD_INT_VM_SHORT Word5
typedef struct packed { 
   logic [63:0]     enc_cmp_data_mac;  
} fmd_int_vm_short_word5_t;

//FRMD_INT_VM_SHORT Word6
typedef struct packed { 
   logic [63:0]     raw_data_mac;  
} fmd_int_vm_short_word6_t;

//FRMD_INT_VM_SHORT Word7
typedef struct packed { 
  logic [63:0]      ivtweak;
} fmd_int_vm_short_word7_t;

//FRMD_INT_VM_SHORT Word8
typedef struct packed { 
  logic [63:0]      ivtweak;
} fmd_int_vm_short_word8_t;


// Symbol mapper to sequence ID array interface data fields
typedef struct packed {
   logic                                 predet_mem_mask;
   logic [3:0]                           predet_mem_id;
   cmd_comp_mode_e                       comp_mode;
   cmd_lz77_win_size_e                   lz77_win_size;
   cmd_lz77_min_match_len_e              lz77_min_match_len;
   cmd_xp10_prefix_mode_e                xp10_prefix_mode;
   logic [5:0]                           xp10_user_prefix_size;
   cmd_xp10_crc_mode_e                   xp10_crc_mode;
   cmd_chu_comp_thrsh_e                  chu_comp_thrsh;
   logic [`AXI_S_TID_WIDTH-1:0]          tid;
   logic [`AXI_S_USER_WIDTH-1:0]         tuser;
   logic [`N_RAW_SIZE_WIDTH-1:0]         raw_byte_count;
   logic [`N_EXTRA_BITS_TOT_WIDTH-1:0]   extra_bit_count;
   logic [10:0]                          blk_count;
   logic                                 blk_last;
   logic                                 pdh_crc_err;
   logic [63:0]                          raw_crc;
} s_sm_seq_id_intf;

typedef struct packed {
   cmd_comp_mode_e                       comp_mode;
   cmd_lz77_win_size_e                   lz77_win_size;
   cmd_xp10_prefix_mode_e                xp10_prefix_mode;
} s_seq_id_type_intf;

// Struct for 50-bit counters to map to 32-bit reads
   typedef struct                     packed {
      logic [17:0]                    count_part1;              // [49:32]
      logic [31:0]                    count_part0;              // [31:0]
   } counter_50_t;


// CG Stat Event Struct
typedef struct  packed {
  logic         cqe_out;
  logic         cqe_sys_err;
  logic         cqe_err_sel;
  logic         cqe_eng_err;
} cg_stats_t;

// OSF Stat Event Struct
typedef struct  packed {
  logic [59:0]  rsvd;
  logic         ob_stall;
  logic         ob_sys_bp;
  logic         pdt_fifo_stall;
  logic         dat_fifo_stall;
} osf_stats_t;

// ISF Stat Event Struct
typedef struct  packed {
  logic [54:0]  rsvd;
  logic         aux_cmd_match3;
  logic         aux_cmd_match2;
  logic         aux_cmd_match1;
  logic         aux_cmd_match0;
  logic         ob_sys_bp;
  logic         ib_sys_stall;
  logic         ib_stall;
  logic         ib_frame;
  logic         ib_cmd;
} isf_stats_t;

typedef struct packed {
   logic [9:0] huff_comp_rsvd;
   logic       lz77_stall_stb;
   logic       encrypt_stall_stb;
   logic       byte_7_stb;
   logic       byte_6_stb;
   logic       byte_5_stb;
   logic       byte_4_stb;
   logic       byte_3_stb;
   logic       byte_2_stb;
   logic       byte_1_stb;
   logic       byte_0_stb;
   logic       pass_thru_frm_stb;
   logic       df_frm_stb;
   logic       df_blk_long_ret_stb;
   logic       df_blk_shrt_ret_stb;
   logic       df_blk_long_sim_stb;
   logic       df_blk_shrt_sim_stb;
   logic       df_blk_raw_stb;
   logic       df_blk_enc_stb;
   logic       chu4_cmd_stb;    
   logic       chu4_frm_long_pre_stb;   
   logic       chu4_frm_shrt_pre_stb;
   logic       chu4_frm_long_ret_stb;
   logic       chu4_frm_shrt_ret_stb;
   logic       chu4_frm_long_sim_stb;
   logic       chu4_frm_shrt_sim_stb;
   logic       chu4_frm_enc_stb;
   logic       chu4_frm_raw_stb;
   logic       chu8_cmd_stb;
   logic       chu8_frm_long_pre_stb;   
   logic       chu8_frm_shrt_pre_stb;
   logic       chu8_frm_long_ret_stb;
   logic       chu8_frm_shrt_ret_stb;
   logic       chu8_frm_long_sim_stb;
   logic       chu8_frm_shrt_sim_stb;
   logic       chu8_frm_enc_stb;
   logic       chu8_frm_raw_stb;
   logic       xp10_frm_stb;
   logic       xp10_blk_long_pre_stb;
   logic       xp10_blk_shrt_pre_stb;
   logic       xp10_blk_long_ret_stb;
   logic       xp10_blk_shrt_ret_stb;
   logic       xp10_blk_long_sim_stb;
   logic       xp10_blk_shrt_sim_stb;
   logic       xp10_blk_raw_stb;
   logic       xp10_blk_enc_stb;
   logic       xp9_blk_long_ret_stb;
   logic       xp9_blk_shrt_ret_stb;
   logic       xp9_blk_long_sim_stb;
   logic       xp9_blk_shrt_sim_stb;
   logic       xp9_frm_stb;
   logic       xp9_frm_raw_stb;
   logic       xp9_blk_enc_stb;
   logic       long_map_err_stb;
   logic       shrt_map_err_stb;
} huf_comp_stats_t;

typedef struct packed {
    logic [48:0] unused;
    logic  [0:0] cipher_aes_gcm; 
    logic  [0:0] cipher_aes_xts; 
    logic  [0:0] cipher_aes_xex; 
    logic  [0:0] cipher_nop; 
    logic  [0:0] auth_aes_gmac; 
    logic  [0:0] auth_sha256; 
    logic  [0:0] auth_sha256_hmac; 
    logic  [0:0] auth_nop; 
    logic  [0:0] gcm_tag_fail; 
    logic  [0:0] gmac_tag_fail; 
    logic  [0:0] sha256_tag_fail; 
    logic  [0:0] hmac_sha256_tag_fail;
    logic  [0:0] seq_id_mismatch; 
    logic  [0:0] eng_id_mismatch;
    logic  [0:0] reserved;
} crypto_stats_t;

typedef struct packed {
    aux_key_op_e    dak_key_op;
    logic [13:0]    dak_key_ref;
    aux_kdf_mode_e  kdf_mode;
    aux_key_op_e    dek_key_op;
    logic [13:0]    dek_key_ref;
} aux_key_ctrl_t;


//Structs for Scheduler Update AXI4S Bus
typedef struct packed {
  logic            tvalid;
  logic            tlast;
  logic [1:0]      tuser;
  logic [7:0]      tdata;
} axi4s_su_dp_bus_t;


//Structs for interrupts

typedef struct packed {
  logic        tlvp_err;
  logic        uncor_ecc_err;
  logic        bimc_int;
} generic_int_t;

typedef struct packed {
  logic        uncor_ecc_err;
} ecc_int_t;

typedef struct packed {
  logic        tlvp_err;
} tlvp_int_t;

typedef struct packed {
  logic        bimc_err;
} bimc_int_t;

typedef struct packed {
  logic        seed_expire;
  logic        id_mismatch;
  logic        tlvp_err;
  logic        uncor_ecc_err;
} crypto_int_t;

typedef struct packed {
  logic        id_mismatch;
  logic        tlvp_err;
} crypto_ckmic_int_t;

typedef struct packed {
  logic        tlvp_err;
  logic        uncor_ecc_err;
} osf_int_t;

typedef struct packed {
  logic        sys_stall;        
  logic        ovfl;
  logic        prot_err;
  logic        tlvp_int;
  logic        uncor_ecc_err;
} isf_int_t;

typedef struct packed {
  logic        tlvp_err;
  logic        uncor_ecc_err;
} prefix_attach_int_t;


// Footer Error Struct
typedef struct packed { 
   zipline_error_e   error_code;
   logic [10:0]     errored_frame_number;
} ftr_error_t;

endpackage:cr_structs

`endif
//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_structs.svp


//* INLINED_FILE: `include "cr_global_params.vh"
//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_global_params.vh
/*************************************************************************
*
* Copyright © Microsoft Corporation. All rights reserved.
* Copyright © Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/



`ifndef CR_GLOBAL_PARAMS_VH
`define CR_GLOBAL_PARAMS_VH

`define N_RBUS_ADDR_BITS        20
`define N_KME_RBUS_ADDR_BITS    16
`define N_RBUS_DATA_BITS        32
`define CR_CDDIP_N_BLKS         10
`define CR_CCEIP_64_N_BLKS      15
`define CR_CCEIP_16_N_BLKS      9
`define AXI_S_DP_DWIDTH         64
`define AXI_S_STAT_DWIDTH       32
`define AXI_S_SCH_DWIDTH        32
`define AXI_S_CPL_DWIDTH        32

`define AXI_S_TID_WIDTH         1
`define AXI_S_USER_WIDTH        8
`define AXI_S_KEEP_WIDTH        8
`define AXI_S_TSTRB_WIDTH       8

`define AXI_S_TOTAL_WIDTH       82

`define N_AXI_IM_ENTRIES        512
`define N_AXI_IM_DECS_WIDTH     32
`define N_AXI_IM_DATA_WIDTH     64
`define N_AXI_IM_WIDTH          96

`define N_MAX_WINDOW_BYTES      65536
`define N_WINDOW_WIDTH          16
`define N_EXTRA_BITS_WIDTH      15
`define N_EXTRA_BITS_TOT_WIDTH  18
`define N_EXTRA_BITS_LEN_WIDTH  4
`define N_MAX_ENCODE_WIDTH      27

`define N_MAX_BUFFER_SIZE       8388609
`define N_MAX_BUFFER_SIZE_WIDTH 24
`define N_RAW_SIZE_WIDTH        24

`define N_XP9_SHRT_SYMBOLS      704
`define N_XP9_LONG_SYMBOLS      256
`define N_XP10_64K_SHRT_SYMBOLS 576
`define N_XP10_64K_LONG_SYMBOLS 248
`define N_XP10_16K_SHRT_SYMBOLS 544
`define N_XP10_16K_LONG_SYMBOLS 246
`define N_XP10_8K_SHRT_SYMBOLS  528
`define N_XP10_8K_LONG_SYMBOLS  245
`define N_XP10_4K_SHRT_SYMBOLS  512
`define N_XP10_4K_LONG_SYMBOLS  244
`define N_SHRT_SYM_WIDTH        10
`define N_LONG_SYM_WIDTH        8
`define N_LENLIT_SYMBOLS        288
`define N_DIST_SYMBOLS          30
`define N_SMALL_SYMBOLS         33
`define N_CODELEN_SYMBOLS       19
`define N_MAX_XP_HUFF_BITS      27
`define N_MAX_DEFLATE_HUFF_BITS 15
`define N_MAX_SMALL_HUFF_BITS   8
`define N_MAX_CODELEN_HUFF_BITS 7
`define N_MAX_SUPPORTED_SYMBOLS 576
`define N_MAX_HUFF_BITS         27
`define N_HTF_BL_OUT_ENTRIES    226


`define N_MAX_MTF               4
`define N_MAX_MTF_WIDTH         2
`define N_MAX_NGRAM             4
`define N_MAX_NGRAM_WIDTH       3

`define N_HUFF_SQ_DEPTH         20480
`define N_HUFF_SQ_ADDR_WIDTH    15

`define XPRESS9_ID              1317459754
`define XPRESS10_ID             3225019664

`define CR_CCEIP_16_BLKID       52758
`define CR_CCEIP_64_BLKID       52836
`define CR_CDDIP_BLKID          52580

`define FRAME_ID_WIDTH          64
`define MODULE_ID_WIDTH         5
`define SU_BYTES_WIDTH          24

`define PREFIX_STATS_WIDTH      64
`define LZ77C_STATS_WIDTH       64
`define HUFE_STATS_WIDTH        32
`define CRYPTO_STATS_WIDTH      32
`define LZ77D_STATS_WIDTH       64
`define HUFD_STATS_WIDTH        64
`define CRCGC_STATS_WIDTH       8
`define ISF_STATS_WIDTH         64
`define OSF_STATS_WIDTH         16
`define CG_STATS_WIDTH          4

`define TLVP_SEQ_NUM_WIDTH      13
`define TLVP_ORD_NUM_WIDTH      13
`define TLVP_TYP_NUM_WIDTH      8
`define TLVP_PA_WIDTH           64

`define TLV_FRAME_NUM_WIDTH     11

`define N_PREFIX_FEATURES       256
`define N_PREFIX_FEATURE_CTR    64

`define N_PREFIX_IM_ENTRIES     256
`define N_PREFIX_SAT_ENTRIES    128
`define N_PREFIX_CT_ENTRIES     128
`define CR_PREFIX_N_NEURONS     128
`define CR_PREFIX_NEURON_WIDTH  7
`define CR_PREFIX_PFD_ENTRIES   8192
`define CR_PREFIX_PHD_ENTRIES   4096
`define CR_PREFIX_N_PHD_WORDS   67
`define CR_PREFIX_N_PFD_WORDS   130

`define ISF_FIFO_ENTRIES        1024
`define ISF_FIFO_WIDTH          92

`define OSF_DATA_FIFO_ENTRIES   512
`define OSF_DATA_FIFO_WIDTH     92

`define OSF_PDT_FIFO_ENTRIES    256
`define OSF_PDT_FIFO_WIDTH      92

`define SU_FIFO_ENTRIES         64

`define TLV_LEN_WIDTH           8
`define N_FTR_WORDS             14
`define N_FTR_WORDS_EXP         20

`define TLV_LATENCY_WIDTH       16
`define TLV_SEQ_NUM_WIDTH       8

`define AXI_S_TID_PAD_WIDTH     8


`define XP10CRC64_POLYNOMIAL    11127430586519243189
`define XP10CRC64_INIT          18446744073709551615

`define XP10CRC32_POLYNOMIAL    2197175160
`define XP10CRC32_INIT          4294967295

`define CRC64E_POLYNOMIAL       4823603603198064275
`define CRC64E_INIT             18446744073709551615

`define GZIPCRC32_POLYNOMIAL    3988292384
`define GZIPCRC32_INIT          4294967295

`define CRC16T_POLYNOMIAL       35767
`define CRC16T_INIT             65535

`endif

//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_global_params.vh
  

module cr_cceip_64
#(parameter 
  PREFIX_STUB = 0,
  PREFIX_ATTACH_STUB = 0,
  CR_LZ77_COMPRESSOR_STUB = 0,
  LZ77_COMP_SHORT_WINDOW = 0,
  HUF_COMP_STUB = 0,
  XP10_DECOMP_STUB = 0,
  SINGLE_PIPE = 0,
  FPGA_MOD   = 0
  ) 
(
 
  
  ib_tready, ob_tvalid, ob_tlast, ob_tid, ob_tstrb, ob_tuser,
  ob_tdata, sch_update_tvalid, sch_update_tlast, sch_update_tuser,
  sch_update_tdata, apb_prdata, apb_pready, apb_pslverr, cceip_int,
  cceip_idle,
  
  clk, rst_n, scan_en, scan_mode, scan_rst_n, ovstb, lvm, mlvm,
  ib_tvalid, ib_tlast, ib_tid, ib_tstrb, ib_tuser, ib_tdata,
  ob_tready, sch_update_tready, apb_paddr, apb_psel, apb_penable,
  apb_pwrite, apb_pwdata, key_mode, dbg_cmd_disable, xp9_disable
  );

//* INLINED_FILE: `include "cr_cceip_64_regs.vh"
//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/cr_cceip_64/cr_cceip_64_regs.vh
/*************************************************************************
*
* Copyright © Microsoft Corporation. All rights reserved.
* Copyright © Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/
`ifdef CR_CCEIP_64_REGS_VH
`else
`define CR_CCEIP_64_REGS_VH






`define CR_CCEIP_64_RBUS_WIDTH 20
`define CR_CCEIP_64_RBUS_DECL  19:0

`define CCEIP64_SUPPORT_RBUS_START       20'h00000
`define CCEIP64_SUPPORT_RBUS_END         20'h0009f

`define CCEIP64_ISF_RBUS_START           20'h10000
`define CCEIP64_ISF_RBUS_END             20'h100d7

`define CCEIP64_CRCGC0_RBUS_START        20'h20000
`define CCEIP64_CRCGC0_RBUS_END          20'h2007f

`define CCEIP64_PREFIX_RBUS_START        20'h30000
`define CCEIP64_PREFIX_RBUS_END          20'h302ff

`define CCEIP64_PREFIX_ATTACH_RBUS_START 20'h40000
`define CCEIP64_PREFIX_ATTACH_RBUS_END   20'h4005f

`define CCEIP64_LZ77_COMP_RBUS_START     20'h50000
`define CCEIP64_LZ77_COMP_RBUS_END       20'h5004b

`define CCEIP64_HUF_COMP_RBUS_START      20'h60000
`define CCEIP64_HUF_COMP_RBUS_END        20'h601eb

`define CCEIP64_CRCG0_RBUS_START         20'h80000
`define CCEIP64_CRCG0_RBUS_END           20'h8007f

`define CCEIP64_CRCC0_RBUS_START         20'h90000
`define CCEIP64_CRCC0_RBUS_END           20'h9007f

`define CCEIP64_XP10_DECOMP_RBUS_START   20'hb0000
`define CCEIP64_XP10_DECOMP_RBUS_END     20'hb0123

`define CCEIP64_CRCC1_RBUS_START         20'hd0000
`define CCEIP64_CRCC1_RBUS_END           20'hd007f

`define CCEIP64_CG_RBUS_START            20'he0000
`define CCEIP64_CG_RBUS_END              20'he0017

`define CCEIP64_OSF_RBUS_START           20'hf0000
`define CCEIP64_OSF_RBUS_END             20'hf00af

`define CCEIP64_SA_RBUS_START            20'hf4000
`define CCEIP64_SA_RBUS_END              20'hf4057

`define CCEIP64_SU_RBUS_START            20'hf8000
`define CCEIP64_SU_RBUS_END              20'hf8097

`endif

//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/cr_cceip_64/cr_cceip_64_regs.vh

  import cr_native_types::*;
  import cr_error_codes::*;
  import cr_structs::*; // grh fix
  
  
  
  
  input                           clk;
  input                           rst_n; 

  
  
  
  input                           scan_en;
  input                           scan_mode;
  input                           scan_rst_n;

  
  
  
  input                           ovstb;
  input                           lvm;
  input                           mlvm;
  

  
  
  
  input                           ib_tvalid;
  input                           ib_tlast;
  input [`AXI_S_TID_WIDTH-1:0]    ib_tid;
  input [`AXI_S_TSTRB_WIDTH-1:0]  ib_tstrb;
  input [`AXI_S_USER_WIDTH-1:0]   ib_tuser;
  input [`AXI_S_DP_DWIDTH-1:0]    ib_tdata;
  output                          ib_tready;

  
  
  
  output                          ob_tvalid;
  output                          ob_tlast;
  output [`AXI_S_TID_WIDTH-1:0]   ob_tid;
  output [`AXI_S_TSTRB_WIDTH-1:0] ob_tstrb;
  output [`AXI_S_USER_WIDTH-1:0]  ob_tuser;
  output [`AXI_S_DP_DWIDTH-1:0]   ob_tdata;
  input                           ob_tready;
  
  
  
  output                          sch_update_tvalid;
  output                          sch_update_tlast;
  output [1:0]                    sch_update_tuser;
  output [7:0]                    sch_update_tdata;
  input                           sch_update_tready;

  
  
  
  input  [`N_RBUS_ADDR_BITS-1:0]  apb_paddr;
  input                           apb_psel;
  input                           apb_penable;
  input                           apb_pwrite;
  input  [`N_RBUS_DATA_BITS-1:0]  apb_pwdata;  
  output [`N_RBUS_DATA_BITS-1:0]  apb_prdata;
  output                          apb_pready;                      
  output                          apb_pslverr;                     

  
  
  
  input                           key_mode;  
  input                           dbg_cmd_disable;
  input                           xp9_disable;
  
  
  
  output                          cceip_int;

  
  
  
  output                          cceip_idle;


  localparam STUB_MODE=1;


  
  
  axi4s_dp_rdy_t        cg_crcc1_ib_out;        
  tlvp_int_t            cg_int;                 
  axi4s_dp_bus_t        cg_osf_ob_out;          
  cg_stats_t            cg_sa_stat_events;      
  axi4s_dp_rdy_t        crcc0_crcg0_ib_out;     
  logic                 crcc0_int;              
  logic [`CRCGC_STATS_WIDTH-1:0] crcc0_sa_stat_events;
  axi4s_dp_bus_t        crcc0_xp10_decomp_ob_out;
  axi4s_dp_bus_t        crcc1_cg_ob_out;        
  logic                 crcc1_int;              
  logic [`CRCGC_STATS_WIDTH-1:0] crcc1_sa_stat_events;
  axi4s_dp_rdy_t        crcc1_xp10_decomp_ib_out;
  axi4s_dp_bus_t        crcg0_df_mux_ob_out;    
  axi4s_dp_rdy_t        crcg0_huf_comp_ib_out;  
  logic                 crcg0_int;              
  logic [`CRCGC_STATS_WIDTH-1:0] crcg0_sa_stat_events;
  logic                 crcgc0_int;             
  axi4s_dp_rdy_t        crcgc0_isf_ib_out;      
  axi4s_dp_bus_t        crcgc0_prefix_ob_out;   
  logic [`CRCGC_STATS_WIDTH-1:0] crcgc0_sa_stat_events;
  axi4s_dp_rdy_t        df_mux_crcc1_ib_out;    
  axi4s_dp_rdy_t        df_mux_crcg0_ib_out;    
  axi4s_dp_bus_t        df_mux_osf_ob_out;      
  logic                 eng_self_test_en;       
  axi4s_dp_bus_t        huf_comp_crcg0_ob_out;  
  generic_int_t         huf_comp_int;           
  axi4s_dp_rdy_t        huf_comp_lz77_comp_ib_out;
  huf_comp_stats_t      huf_comp_sa_stat_events;
  sched_update_if_bus_t huf_comp_su_sch_update; 
  logic [`LZ77D_STATS_WIDTH-1:0] huf_comp_xp10_decomp_lz77d_sa_stat_events;
  im_available_t        im_available_he_lng;    
  im_available_t        im_available_he_sh;     
  im_available_t        im_available_he_st_lng; 
  im_available_t        im_available_he_st_sh;  
  im_available_t        im_available_htf_bl;    
  im_consumed_t         im_consumed_he_lng;     
  im_consumed_t         im_consumed_he_sh;      
  im_consumed_t         im_consumed_he_st_lng;  
  im_consumed_t         im_consumed_he_st_sh;   
  im_consumed_t         im_consumed_htf_bl;     
  im_consumed_t         im_consumed_lz77c;      
  im_consumed_t         im_consumed_lz77d;      
  im_consumed_t         im_consumed_xpc;        
  im_consumed_t         im_consumed_xpd;        
  logic                 isf_bimc_odat;          
  logic                 isf_bimc_osync;         
  axi4s_dp_bus_t        isf_crcgc0_ob_out;      
  axi4s_dp_rdy_t        isf_ib_out;             
  isf_int_t             isf_int;                
  isf_stats_t           isf_sa_stat_events;     
  logic                 isf_sup_cqe_exit;       
  logic                 isf_sup_cqe_rx;         
  logic                 isf_sup_rqe_rx;         
  axi4s_dp_bus_t        lz77_comp_huf_comp_ob_out;
  axi4s_dp_rdy_t        lz77_comp_prefix_attach_ib_out;
  logic [`LZ77C_STATS_WIDTH-1:0] lz77_comp_sa_stat_events;
  logic                 osf_bimc_odat;          
  logic                 osf_bimc_osync;         
  axi4s_dp_rdy_t        osf_cg_ib_out;          
  axi4s_dp_rdy_t        osf_df_mux_ob_in;       
  osf_int_t             osf_int;                
  axi4s_dp_bus_t        osf_ob_out;             
  osf_stats_t           osf_sa_stat_events;     
  logic                 osf_sup_cqe_exit;       
  logic                 prefix_attach_bimc_odat;
  logic                 prefix_attach_bimc_osync;
  logic                 prefix_attach_int;      
  axi4s_dp_bus_t        prefix_attach_lz77_comp_ob_out;
  axi4s_dp_rdy_t        prefix_attach_prefix_ib_out;
  axi4s_dp_rdy_t        prefix_crcgc0_ib_out;   
  axi4s_dp_bus_t        prefix_prefix_attach_ob_out;
  logic [`PREFIX_STATS_WIDTH-1:0] prefix_sa_stat_events;
  logic                 rst_sync_n;             
  axi4s_su_dp_bus_t     sch_update_ob_out;      
  logic                 su_bimc_odat;           
  logic                 su_bimc_osync;          
  ecc_int_t             su_int;                 
  logic                 su_ready;               
  logic                 sup_osf_halt;           
  logic                 top_bimc_mstr_rst_n;    
  axi4s_dp_rdy_t        xp10_decomp_crcc0_ib_out;
  axi4s_dp_bus_t        xp10_decomp_crcc1_ob_out;
  logic [`HUFD_STATS_WIDTH-1:0] xp10_decomp_hufd_sa_stat_events;
  generic_int_t         xp10_decomp_int;        
  logic [`LZ77D_STATS_WIDTH-1:0] xp10_decomp_lz77d_sa_stat_events;
  

  
  
  
  axi4s_dp_bus_t         isf_ib_in; 
  axi4s_dp_rdy_t         osf_ob_in;
  axi4s_dp_rdy_t         sch_update_ob_in;
  axi4s_dp_rdy_t         crcg0_ob_in;
  axi4s_dp_rdy_t         crcc1_ob_in;

  rbus_ring_t            rbus_ring_i[`CR_CCEIP_64_N_BLKS-1:0]; 
  rbus_ring_t            rbus_ring_o[`CR_CCEIP_64_N_BLKS-1:0]; 
  rbus_ring_t            rbus_i;
  rbus_ring_t            rbus_o; 

  im_available_t         im_available_lz77c;   
  im_available_t         im_available_lz77d;   
  im_available_t         im_available_xpd;
  im_available_t         im_available_xpc;

  logic                 top_bimc_mstr_odat;
  logic                 top_bimc_mstr_osync;
  logic                 top_bimc_mstr_idat;
  logic                 top_bimc_mstr_isync;
  logic [2:0]           prefix_int;

  assign isf_ib_in.tvalid        = ib_tvalid & !eng_self_test_en;
  assign isf_ib_in.tlast         = ib_tlast;
  assign isf_ib_in.tid           = ib_tid;
  assign isf_ib_in.tstrb         = ib_tstrb;
  assign isf_ib_in.tuser         = ib_tuser;
  assign isf_ib_in.tdata         = ib_tdata;
  assign ib_tready               = isf_ib_out.tready | eng_self_test_en;

  assign ob_tvalid               = osf_ob_out.tvalid & !eng_self_test_en;
  assign ob_tlast                = osf_ob_out.tlast;
  assign ob_tid                  = osf_ob_out.tid;
  assign ob_tstrb                = osf_ob_out.tstrb;
  assign ob_tuser                = osf_ob_out.tuser;
  assign ob_tdata                = osf_ob_out.tdata;
  assign osf_ob_in.tready        = ob_tready | eng_self_test_en;

  assign sch_update_tvalid       = sch_update_ob_out.tvalid & !eng_self_test_en;
  assign sch_update_tlast        = sch_update_ob_out.tlast;
  assign sch_update_tuser        = sch_update_ob_out.tuser;
  assign sch_update_tdata        = sch_update_ob_out.tdata;
  assign sch_update_ob_in.tready = sch_update_tready | eng_self_test_en;


  logic       lz77_comp_int;
  logic [2:0] prefix_int_pre;
   
  
  always_comb
  for (int j=0; j<`CR_CCEIP_64_N_BLKS; j++) begin
    
    if (j==0) begin
      rbus_ring_i[j]         = 0;
      rbus_ring_i[j].addr    = rbus_i.addr;  
      rbus_ring_i[j].wr_strb = rbus_i.wr_strb;
      rbus_ring_i[j].wr_data = rbus_i.wr_data;
      rbus_ring_i[j].rd_strb = rbus_i.rd_strb;  
    end
    
    else begin
      rbus_ring_i[j]         = rbus_ring_o[j-1];
    end 
    
    if (j == `CR_CCEIP_64_N_BLKS-1) begin
      rbus_o.rd_data         = rbus_ring_o[j].rd_data;
      rbus_o.ack             = rbus_ring_o[j].ack;
      rbus_o.rd_strb         = rbus_ring_o[j].rd_strb;
      rbus_o.wr_strb         = rbus_ring_o[j].wr_strb;
      rbus_o.err_ack         = rbus_ring_o[j].err_ack;
    end
  end 

  assign prefix_int[0] = prefix_int_pre[1];
  assign prefix_int[1] = prefix_int_pre[2];
  assign prefix_int[2] = prefix_int_pre[0];
   
  
  
  

   

  cr_rst_sync u_cr_rst_sync_cceip
     (
      
      .rst_n                            (rst_sync_n),            
      
      .clk                              (clk),
      .async_rst_n                      (rst_n),                 
      .bypass_reset                     (scan_mode),             
      .test_rst_n                       (scan_rst_n));            


  
  
  

  
  
  
  nx_rbus_apb 
  #(.N_RBUS_ADDR_BITS(`N_RBUS_ADDR_BITS),  
    .N_RBUS_DATA_BITS(`N_RBUS_DATA_BITS))  
  u_nx_rbus_apb 
  (
   
   
   .rbus_addr_o                         (rbus_i.addr),           
   .rbus_wr_strb_o                      (rbus_i.wr_strb),        
   .rbus_wr_data_o                      (rbus_i.wr_data),        
   .rbus_rd_strb_o                      (rbus_i.rd_strb),        
   .apb_prdata                          (apb_prdata),            
   .apb_pready                          (apb_pready),
   .apb_pslverr                         (apb_pslverr),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .rbus_rd_data_i                      (rbus_o.rd_data),        
   .rbus_ack_i                          (rbus_o.ack),            
   .rbus_err_ack_i                      (rbus_o.err_ack),        
   .rbus_wr_strb_i                      (rbus_o.wr_strb),        
   .rbus_rd_strb_i                      (rbus_o.rd_strb),        
   .apb_paddr                           (apb_paddr),             
   .apb_psel                            (apb_psel),
   .apb_penable                         (apb_penable),
   .apb_pwrite                          (apb_pwrite),
   .apb_pwdata                          (apb_pwdata));            

  
  
  

   


  cr_cceip_64_support u_cr_cceip_64_support
  (
   
   
   .top_bimc_mstr_rst_n                 (top_bimc_mstr_rst_n),
   .top_bimc_mstr_osync                 (top_bimc_mstr_osync),
   .top_bimc_mstr_odat                  (top_bimc_mstr_odat),
   .crcg0_ib_out                        (df_mux_crcg0_ib_out),   
   .crcc1_ib_out                        (df_mux_crcc1_ib_out),   
   .rbus_ring_o                         (rbus_ring_o[0]),        
   .df_mux_ob_out                       (df_mux_osf_ob_out),     
   .im_consumed_lz77c                   (im_consumed_lz77c),
   .im_consumed_lz77d                   (im_consumed_lz77d),
   .im_consumed_htf_bl                  (im_consumed_htf_bl),
   .im_consumed_xpc                     (im_consumed_xpc),
   .im_consumed_xpd                     (im_consumed_xpd),
   .im_consumed_he_sh                   (im_consumed_he_sh),
   .im_consumed_he_lng                  (im_consumed_he_lng),
   .im_consumed_he_st_sh                (im_consumed_he_st_sh),
   .im_consumed_he_st_lng               (im_consumed_he_st_lng),
   .cceip_int                           (cceip_int),
   .cceip_idle                          (cceip_idle),
   .sup_osf_halt                        (sup_osf_halt),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .top_bimc_mstr_idat                  (top_bimc_mstr_idat),
   .top_bimc_mstr_isync                 (top_bimc_mstr_isync),
   .crcc0_crcg0_ib_out                  (crcc0_crcg0_ib_out),
   .crcg0_ib_in                         (crcg0_df_mux_ob_out),   
   .cg_crcc1_ib_out                     (cg_crcc1_ib_out),
   .crcc1_ib_in                         (crcc1_cg_ob_out),       
   .rbus_ring_i                         (rbus_ring_i[0]),        
   .cfg_start_addr                      (`CCEIP64_SUPPORT_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_SUPPORT_RBUS_END), 
   .df_mux_ob_in                        (osf_df_mux_ob_in),      
   .im_available_lz77c                  (im_available_lz77c),
   .im_available_lz77d                  (im_available_lz77d),
   .im_available_htf_bl                 (im_available_htf_bl),
   .im_available_xpc                    (im_available_xpc),
   .im_available_xpd                    (im_available_xpd),
   .im_available_he_lng                 (im_available_he_lng),
   .im_available_he_sh                  (im_available_he_sh),
   .im_available_he_st_lng              (im_available_he_st_lng),
   .im_available_he_st_sh               (im_available_he_st_sh),
   .osf_sup_cqe_exit                    (osf_sup_cqe_exit),
   .isf_sup_cqe_exit                    (isf_sup_cqe_exit),
   .isf_sup_cqe_rx                      (isf_sup_cqe_rx),
   .isf_sup_rqe_rx                      (isf_sup_rqe_rx),
   .prefix_int                          (prefix_int),
   .prefix_attach_int                   (prefix_attach_int),
   .lz77_comp_int                       (lz77_comp_int),
   .huf_comp_int                        (huf_comp_int),
   .xp10_decomp_int                     (xp10_decomp_int),
   .crcgc0_int                          (crcgc0_int),
   .crcg0_int                           (crcg0_int),
   .crcc0_int                           (crcc0_int),
   .crcc1_int                           (crcc1_int),
   .cg_int                              (cg_int),
   .su_int                              (su_int),
   .osf_int                             (osf_int),
   .isf_int                             (isf_int));
  
  
  
  

   

  cr_isf u_cr_isf
  (
   
   
   .bimc_odat                           (isf_bimc_odat),         
   .bimc_osync                          (isf_bimc_osync),        
   .isf_ib_out                          (isf_ib_out),            
   .rbus_ring_o                         (rbus_ring_o[1]),        
   .isf_ob_out                          (isf_crcgc0_ob_out),     
   .isf_stat_events                     (isf_sa_stat_events),    
   .isf_int                             (isf_int),
   .isf_sup_cqe_exit                    (isf_sup_cqe_exit),
   .isf_sup_cqe_rx                      (isf_sup_cqe_rx),
   .isf_sup_rqe_rx                      (isf_sup_rqe_rx),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .bimc_rst_n                          (top_bimc_mstr_rst_n),   
   .bimc_isync                          (top_bimc_mstr_osync),   
   .bimc_idat                           (top_bimc_mstr_odat),    
   .isf_ib_in                           (isf_ib_in),             
   .rbus_ring_i                         (rbus_ring_i[1]),        
   .cfg_start_addr                      (`CCEIP64_ISF_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_ISF_RBUS_END), 
   .isf_ob_in                           (crcgc0_isf_ib_out),     
   .dbg_cmd_disable                     (dbg_cmd_disable),
   .xp9_disable                         (xp9_disable),
   .isf_module_id                       (`MODULE_ID_WIDTH'h0),   
   .cceip_cfg                           (1'b1));                  


  
  
  

   

  cr_crcgc u_cr_crcgc0
  (
   
   
   .crcgc_ib_out                        (crcgc0_isf_ib_out),     
   .rbus_ring_o                         (rbus_ring_o[2]),        
   .crcgc_ob_out                        (crcgc0_prefix_ob_out),  
   .crcgc_stat_events                   (crcgc0_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .crcgc_int                           (crcgc0_int),            
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .ext_ib_out                          (1'b1),                  
   .crcgc_ib_in                         (isf_crcgc0_ob_out),     
   .rbus_ring_i                         (rbus_ring_i[2]),        
   .cfg_start_addr                      (`CCEIP64_CRCGC0_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_CRCGC0_RBUS_END), 
   .crcgc_ob_in                         (prefix_crcgc0_ib_out),  
   .cceip_cfg                           (1'b1),                  
   .crcgc_mode                          (3'h0),                  
   .crcgc_module_id                     (`MODULE_ID_WIDTH'h1));   


  
  
  

   

  cr_prefix #
  (
   .PREFIX_STUB(PREFIX_STUB)
   )
  u_cr_prefix
  (
   
   
   .prefix_ib_out                       (prefix_crcgc0_ib_out),  
   .rbus_ring_o                         (rbus_ring_o[3]),        
   .prefix_ob_out                       (prefix_prefix_attach_ob_out), 
   .prefix_stat_events                  (prefix_sa_stat_events[`PREFIX_STATS_WIDTH-1:0]), 
   .prefix_int                          (prefix_int_pre),        
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .prefix_ib_in                        (crcgc0_prefix_ob_out),  
   .rbus_ring_i                         (rbus_ring_i[3]),        
   .cfg_start_addr                      (`CCEIP64_PREFIX_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_PREFIX_RBUS_END), 
   .prefix_ob_in                        (prefix_attach_prefix_ib_out), 
   .prefix_module_id                    (`MODULE_ID_WIDTH'h2));   


  
  
  

   

  cr_prefix_attach #
  (
   .PREFIX_ATTACH_STUB(PREFIX_ATTACH_STUB)
   )
  u_cr_prefix_attach
  (
   
   
   .bimc_odat                           (prefix_attach_bimc_odat), 
   .bimc_osync                          (prefix_attach_bimc_osync), 
   .prefix_attach_ib_out                (prefix_attach_prefix_ib_out), 
   .rbus_ring_o                         (rbus_ring_o[4]),        
   .prefix_attach_ob_out                (prefix_attach_lz77_comp_ob_out), 
   .prefix_attach_int                   (prefix_attach_int),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .bimc_rst_n                          (top_bimc_mstr_rst_n),   
   .bimc_idat                           (isf_bimc_odat),         
   .bimc_isync                          (isf_bimc_osync),        
   .prefix_attach_ib_in                 (prefix_prefix_attach_ob_out), 
   .rbus_ring_i                         (rbus_ring_i[4]),        
   .cfg_start_addr                      (`CCEIP64_PREFIX_ATTACH_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_PREFIX_ATTACH_RBUS_END), 
   .prefix_attach_ob_in                 (lz77_comp_prefix_attach_ib_out), 
   .cceip_cfg                           (1'b1),                  
   .prefix_attach_module_id             (`MODULE_ID_WIDTH'h3));   


  
  
  

   

  cr_lz77_comp
  #(
   .CR_LZ77_COMPRESSOR_STUB(CR_LZ77_COMPRESSOR_STUB),
   .LZ77_COMP_SHORT_WINDOW(LZ77_COMP_SHORT_WINDOW)
   )
  u_cr_lz77_comp
  (
   
   
   .lz77_comp_ib_out                    (lz77_comp_prefix_attach_ib_out), 
   .rbus_ring_o                         (rbus_ring_o[5]),        
   .lz77_comp_ob_out                    (lz77_comp_huf_comp_ob_out), 
   .im_available_lz77c                  (im_available_lz77c),
   .lz77_comp_stat_events               (lz77_comp_sa_stat_events[`LZ77C_STATS_WIDTH-1:0]), 
   .lz77_comp_int                       (lz77_comp_int),
   
   .cfg_start_addr                      (`CCEIP64_LZ77_COMP_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_LZ77_COMP_RBUS_END), 
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .lz77_comp_ib_in                     (prefix_attach_lz77_comp_ob_out), 
   .rbus_ring_i                         (rbus_ring_i[5]),        
   .lz77_comp_ob_in                     (huf_comp_lz77_comp_ib_out), 
   .im_consumed_lz77c                   (im_consumed_lz77c),
   .lz77_comp_module_id                 (`MODULE_ID_WIDTH'h4));   


  
  
  

   


  cr_huf_comp #
  (
   .HUF_COMP_STUB(HUF_COMP_STUB),
   .SINGLE_PIPE(SINGLE_PIPE),
   .FPGA_MOD(FPGA_MOD)
   )
  u_cr_huf_comp
  (
   
   
   .huf_comp_ib_out                     (huf_comp_lz77_comp_ib_out), 
   .rbus_ring_o                         (rbus_ring_o[6]),        
   .huf_comp_ob_out                     (huf_comp_crcg0_ob_out), 
   .huf_comp_sch_update                 (huf_comp_su_sch_update), 
   .huf_comp_stat_events                (huf_comp_sa_stat_events), 
   .huf_comp_int                        (huf_comp_int),
   .huf_comp_xp10_decomp_lz77d_stat_events(huf_comp_xp10_decomp_lz77d_sa_stat_events[`LZ77D_STATS_WIDTH-1:0]), 
   .im_available_huf                    (im_available_xpc),      
   .im_available_he_lng                 (im_available_he_lng),
   .im_available_he_sh                  (im_available_he_sh),
   .im_available_he_st_lng              (im_available_he_st_lng),
   .im_available_he_st_sh               (im_available_he_st_sh),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .huf_comp_ib_in                      (lz77_comp_huf_comp_ob_out), 
   .rbus_ring_i                         (rbus_ring_i[6]),        
   .cfg_start_addr                      (`CCEIP64_HUF_COMP_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_HUF_COMP_RBUS_END), 
   .huf_comp_ob_in                      (crcg0_huf_comp_ib_out), 
   .huf_comp_in_module_id               (`MODULE_ID_WIDTH'h5),   
   .huf_comp_out_module_id              (`MODULE_ID_WIDTH'h10),  
   .su_ready                            (su_ready),
   .im_consumed_huf                     (im_consumed_xpc),       
   .im_consumed_he_sh                   (im_consumed_he_sh),
   .im_consumed_he_lng                  (im_consumed_he_lng),
   .im_consumed_he_st_sh                (im_consumed_he_st_sh),
   .im_consumed_he_st_lng               (im_consumed_he_st_lng));




   

  cr_crcgc u_cr_crcg0
  (
   
   
   .crcgc_ib_out                        (crcg0_huf_comp_ib_out), 
   .rbus_ring_o                         (rbus_ring_o[7]),        
   .crcgc_ob_out                        (crcg0_df_mux_ob_out),   
   .crcgc_stat_events                   (crcg0_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .crcgc_int                           (crcg0_int),             
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .ext_ib_out                          (1'b1),                  
   .crcgc_ib_in                         (huf_comp_crcg0_ob_out), 
   .rbus_ring_i                         (rbus_ring_i[7]),        
   .cfg_start_addr                      (`CCEIP64_CRCG0_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_CRCG0_RBUS_END), 
   .crcgc_ob_in                         (crcg0_ob_in),           
   .cceip_cfg                           (1'b1),                  
   .crcgc_mode                          (3'h1),                  
   .crcgc_module_id                     (`MODULE_ID_WIDTH'h7));   


   
   

  assign crcg0_ob_in.tready = crcc0_crcg0_ib_out.tready & df_mux_crcg0_ib_out.tready;

  
  
  
  

   

  cr_crcgc u_cr_crcc0
  (
   
   
   .crcgc_ib_out                        (crcc0_crcg0_ib_out),    
   .rbus_ring_o                         (rbus_ring_o[8]),        
   .crcgc_ob_out                        (crcc0_xp10_decomp_ob_out), 
   .crcgc_stat_events                   (crcc0_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .crcgc_int                           (crcc0_int),             
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .ext_ib_out                          (df_mux_crcg0_ib_out),   
   .crcgc_ib_in                         (crcg0_df_mux_ob_out),   
   .rbus_ring_i                         (rbus_ring_i[8]),        
   .cfg_start_addr                      (`CCEIP64_CRCC0_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_CRCC0_RBUS_END), 
   .crcgc_ob_in                         (xp10_decomp_crcc0_ib_out), 
   .cceip_cfg                           (1'b1),                  
   .crcgc_mode                          (3'h3),                  
   .crcgc_module_id                     (`MODULE_ID_WIDTH'h8));   



  
  
  

   

  cr_xp10_decomp #
  (
   .XP10_DECOMP_STUB(XP10_DECOMP_STUB),
   .FPGA_MOD(FPGA_MOD)
   )
  u_cr_xp10_decomp
  (
   
   
   .xp10_decomp_ib_out                  (xp10_decomp_crcc0_ib_out), 
   .rbus_ring_o                         (rbus_ring_o[9]),        
   .xp10_decomp_ob_out                  (xp10_decomp_crcc1_ob_out), 
   .xp10_decomp_sch_update              (),                      
   .im_available_xpd                    (im_available_xpd),
   .im_available_lz77d                  (im_available_lz77d),
   .im_available_htf_bl                 (im_available_htf_bl),
   .xp10_decomp_hufd_stat_events        (xp10_decomp_hufd_sa_stat_events[`HUFD_STATS_WIDTH-1:0]), 
   .xp10_decomp_lz77d_stat_events       (xp10_decomp_lz77d_sa_stat_events[`LZ77D_STATS_WIDTH-1:0]), 
   .xp10_decomp_int                     (xp10_decomp_int),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .xp10_decomp_ib_in                   (crcc0_xp10_decomp_ob_out), 
   .rbus_ring_i                         (rbus_ring_i[9]),        
   .cfg_start_addr                      (`CCEIP64_XP10_DECOMP_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_XP10_DECOMP_RBUS_END), 
   .xp10_decomp_ob_in                   (crcc1_xp10_decomp_ib_out), 
   .su_afull_n                          (1'b1),                  
   .im_consumed_xpd                     (im_consumed_xpd),
   .im_consumed_lz77d                   (im_consumed_lz77d),
   .im_consumed_htf_bl                  (im_consumed_htf_bl),
   .xp10_decomp_module_id               (`MODULE_ID_WIDTH'ha),   
   .cceip_cfg                           (1'b1));                  


  
  
  

   

  cr_crcgc # 
  (
   .STUB_MODE(STUB_MODE)
   )
  u_cr_crcc1
  (
   
   
   .crcgc_ib_out                        (crcc1_xp10_decomp_ib_out), 
   .rbus_ring_o                         (rbus_ring_o[10]),       
   .crcgc_ob_out                        (crcc1_cg_ob_out),       
   .crcgc_stat_events                   (crcc1_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .crcgc_int                           (crcc1_int),             
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .ext_ib_out                          (1'b1),                  
   .crcgc_ib_in                         (xp10_decomp_crcc1_ob_out), 
   .rbus_ring_i                         (rbus_ring_i[10]),       
   .cfg_start_addr                      (`CCEIP64_CRCC1_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_CRCC1_RBUS_END), 
   .crcgc_ob_in                         (crcc1_ob_in),           
   .cceip_cfg                           (1'b1),                  
   .crcgc_mode                          (3'h2),                  
   .crcgc_module_id                     (`MODULE_ID_WIDTH'hc));   

   
  assign crcc1_ob_in.tready = cg_crcc1_ib_out.tready & df_mux_crcc1_ib_out.tready;

  
  
  

   

  cr_cg #
  (
   .STUB_MODE(STUB_MODE)
   )
  u_cr_cg
  (
   
   
   .cg_ib_out                           (cg_crcc1_ib_out),       
   .rbus_ring_o                         (rbus_ring_o[11]),       
   .cg_ob_out                           (cg_osf_ob_out),         
   .cg_stat_events                      (cg_sa_stat_events),     
   .cg_int                              (cg_int),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .ext_ib_out                          (df_mux_crcc1_ib_out),   
   .cg_ib_in                            (crcc1_cg_ob_out),       
   .rbus_ring_i                         (rbus_ring_i[11]),       
   .cfg_start_addr                      (`CCEIP64_CG_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_CG_RBUS_END),  
   .cg_ob_in                            (osf_cg_ib_out),         
   .cg_module_id                        (`MODULE_ID_WIDTH'hd),   
   .cceip_cfg                           (1'b1));                  

  
  
  

   

  cr_osf u_cr_osf
  (
   
   
   .bimc_odat                           (osf_bimc_odat),         
   .bimc_osync                          (osf_bimc_osync),        
   .osf_ib_out                          (osf_df_mux_ob_in),      
   .osf_cg_ib_out                       (osf_cg_ib_out),         
   .rbus_ring_o                         (rbus_ring_o[12]),       
   .osf_ob_out                          (osf_ob_out),            
   .osf_stat_events                     (osf_sa_stat_events),    
   .osf_sup_cqe_exit                    (osf_sup_cqe_exit),
   .osf_int                             (osf_int),
   .eng_self_test_en                    (eng_self_test_en),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .bimc_rst_n                          (top_bimc_mstr_rst_n),   
   .bimc_isync                          (prefix_attach_bimc_osync), 
   .bimc_idat                           (prefix_attach_bimc_odat), 
   .osf_ib_in                           (df_mux_osf_ob_out),     
   .osf_cg_ib_in                        (cg_osf_ob_out),         
   .ext_ib_out                          (1'b1),                  
   .rbus_ring_i                         (rbus_ring_i[12]),       
   .cfg_start_addr                      (`CCEIP64_OSF_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_OSF_RBUS_END), 
   .osf_ob_in                           (osf_ob_in),             
   .sup_osf_halt                        (sup_osf_halt),
   .osf_module_id                       (`MODULE_ID_WIDTH'he));   

  
  
  

   

  cr_cceip_64_sa u_cr_cceip_64_sa
  (
   
   
   .rbus_ring_o                         (rbus_ring_o[13]),       
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .rbus_ring_i                         (rbus_ring_i[13]),       
   .cfg_start_addr                      (`CCEIP64_SA_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_SA_RBUS_END),  
   .crcc0_stat_events                   (crcc0_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .crcc1_stat_events                   (crcc1_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .crcg0_stat_events                   (crcg0_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .crcgc0_stat_events                  (crcgc0_sa_stat_events[`CRCGC_STATS_WIDTH-1:0]), 
   .cg_stat_events                      (cg_sa_stat_events[`CG_STATS_WIDTH-1:0]), 
   .xp10_decomp_hufd_stat_events        (xp10_decomp_hufd_sa_stat_events[`HUFD_STATS_WIDTH-1:0]), 
   .xp10_decomp_lz77d_stat_events       (xp10_decomp_lz77d_sa_stat_events[`LZ77D_STATS_WIDTH-1:0]), 
   .osf_stat_events                     (osf_sa_stat_events),    
   .huf_comp_stat_events                (huf_comp_sa_stat_events), 
   .lz77_comp_stat_events               (lz77_comp_sa_stat_events[`LZ77C_STATS_WIDTH-1:0]), 
   .prefix_stat_events                  (prefix_sa_stat_events[`PREFIX_STATS_WIDTH-1:0]), 
   .isf_stat_events                     (isf_sa_stat_events[`ISF_STATS_WIDTH-1:0]), 
   .huf_comp_xp10_decomp_lz77d_stat_events(huf_comp_xp10_decomp_lz77d_sa_stat_events[`LZ77D_STATS_WIDTH-1:0]), 
   .cceip_64_sa_module_id               (`MODULE_ID_WIDTH'hf));   


  
  
  

   

  cr_su u_cr_su
  (
   
   
   .bimc_odat                           (su_bimc_odat),          
   .bimc_osync                          (su_bimc_osync),         
   .rbus_ring_o                         (rbus_ring_o[14]),       
   .su_ready                            (su_ready),
   .su_ob_out                           (sch_update_ob_out),     
   .su_int                              (su_int),
   
   .clk                                 (clk),
   .rst_n                               (rst_sync_n),            
   .scan_en                             (scan_en),
   .scan_mode                           (scan_mode),
   .scan_rst_n                          (scan_rst_n),
   .bimc_rst_n                          (top_bimc_mstr_rst_n),   
   .bimc_isync                          (osf_bimc_osync),        
   .bimc_idat                           (osf_bimc_odat),         
   .ovstb                               (ovstb),
   .lvm                                 (lvm),
   .mlvm                                (mlvm),
   .su_in                               (huf_comp_su_sch_update), 
   .rbus_ring_i                         (rbus_ring_i[14]),       
   .cfg_start_addr                      (`CCEIP64_SU_RBUS_START), 
   .cfg_end_addr                        (`CCEIP64_SU_RBUS_END),  
   .su_ob_in                            (sch_update_ob_in));      




  assign top_bimc_mstr_idat  = su_bimc_odat;
  assign top_bimc_mstr_isync = su_bimc_osync;

    
endmodule










//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/cr_cceip_64/cr_cceip_64.v

//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../dv/agents/apb/apb_xactor.v

/*************************************************************************
*
* Copyright © Microsoft Corporation. All rights reserved.
* Copyright © Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/

module apb_xactor #( parameter ADDR_WIDTH = 32, DATA_WIDTH = 32 ) (/*AUTOARG*/
   // Outputs
   psel, penable, paddr, pwdata, pwrite,
   // Inputs
   clk, reset_n, prdata, pready, pslverr
   );
   input                    clk;
   input 		    reset_n;
   
   output reg 		    psel;
   output reg 		    penable;
   output reg [ADDR_WIDTH-1:0] 	    paddr;
   output reg [DATA_WIDTH-1:0] 	    pwdata;
   output reg 		    pwrite;
   input [DATA_WIDTH-1:0] 	    prdata;
   input                    pready;
   input 		    pslverr;
   
   
   reg [7:0] 		    bus_timer;
   parameter 		    BUS_TIMER_EXPIRATION = 100;

   
   always @(posedge clk)
     begin
	if (!reset_n)
	  begin	        
	     bus_timer <= 0;	  
	     psel    <= 0;
	     penable <= 0;
	     paddr   <= 0;
	     pwdata  <= 0;
	     pwrite  <= 0;	     
	  end	
     end
   


   task write;
      input [63:0] addr;
      input [31:0] data;
      output reg   response;
      
      begin
	 psel      <= 1;
	 penable   <= 0;
	 pwrite    <= 1;
	 paddr     <= addr[31:0];
	 pwdata    <= data[31:0];

	 @(posedge clk);
	 penable   <= 1;
	 
	 while ((!pready) && (bus_timer < BUS_TIMER_EXPIRATION))
	   begin
	      bus_timer <= bus_timer + 1;
	      @(posedge clk);
	   end
	 
	 bus_timer <= 0;	  
	 psel      <= 0 ;
	 penable   <= 0 ;
	 pwrite    <= 0 ;
	 paddr     <= 0 ;
	 pwdata    <= 0 ;
	 response  <= (pslverr) | (bus_timer == BUS_TIMER_EXPIRATION) ;
	 
	 @(posedge clk);
      end      
   endtask // write
   
   task read;
      input [63:0]      addr;
      output reg [31:0] data;
      output reg 	response;
      begin
	 psel      <= 1;
	 penable   <= 0;
	 pwrite    <= 0;
	 paddr     <= addr[31:0];

	 @(posedge clk);
	 penable   <= 1;

	 while ((!pready) && (bus_timer < BUS_TIMER_EXPIRATION))
	   begin
	      bus_timer <= bus_timer + 1;
	      @(posedge clk);
	   end
	 
	 bus_timer <= 0;	 
	 psel      <= 0 ;
	 penable   <= 0 ;
	 pwrite    <= 0 ;
	 paddr     <= 0 ;
	 data      <= prdata;	 
	 response  <= (pslverr) | (bus_timer == BUS_TIMER_EXPIRATION) ;

	 @(posedge clk);
      end
   endtask
   


endmodule // apb_xactor

//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../dv/agents/apb/apb_xactor.v

//* SOURCE_FILE_START: ./zipline_tb.v
/*************************************************************************
*
* Copyright © Microsoft Corporation. All rights reserved.
* Copyright © Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/
//* INLINED_FILE: `include "cr_global_params.vh"
//* SOURCE_FILE_START: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_global_params.vh
/*************************************************************************
*
* Copyright © Microsoft Corporation. All rights reserved.
* Copyright © Broadcom Inc. All rights reserved.
* Licensed under the MIT License.
*
*************************************************************************/



`ifndef CR_GLOBAL_PARAMS_VH
`define CR_GLOBAL_PARAMS_VH

`define N_RBUS_ADDR_BITS        20
`define N_KME_RBUS_ADDR_BITS    16
`define N_RBUS_DATA_BITS        32
`define CR_CDDIP_N_BLKS         10
`define CR_CCEIP_64_N_BLKS      15
`define CR_CCEIP_16_N_BLKS      9
`define AXI_S_DP_DWIDTH         64
`define AXI_S_STAT_DWIDTH       32
`define AXI_S_SCH_DWIDTH        32
`define AXI_S_CPL_DWIDTH        32

`define AXI_S_TID_WIDTH         1
`define AXI_S_USER_WIDTH        8
`define AXI_S_KEEP_WIDTH        8
`define AXI_S_TSTRB_WIDTH       8

`define AXI_S_TOTAL_WIDTH       82

`define N_AXI_IM_ENTRIES        512
`define N_AXI_IM_DECS_WIDTH     32
`define N_AXI_IM_DATA_WIDTH     64
`define N_AXI_IM_WIDTH          96

`define N_MAX_WINDOW_BYTES      65536
`define N_WINDOW_WIDTH          16
`define N_EXTRA_BITS_WIDTH      15
`define N_EXTRA_BITS_TOT_WIDTH  18
`define N_EXTRA_BITS_LEN_WIDTH  4
`define N_MAX_ENCODE_WIDTH      27

`define N_MAX_BUFFER_SIZE       8388609
`define N_MAX_BUFFER_SIZE_WIDTH 24
`define N_RAW_SIZE_WIDTH        24

`define N_XP9_SHRT_SYMBOLS      704
`define N_XP9_LONG_SYMBOLS      256
`define N_XP10_64K_SHRT_SYMBOLS 576
`define N_XP10_64K_LONG_SYMBOLS 248
`define N_XP10_16K_SHRT_SYMBOLS 544
`define N_XP10_16K_LONG_SYMBOLS 246
`define N_XP10_8K_SHRT_SYMBOLS  528
`define N_XP10_8K_LONG_SYMBOLS  245
`define N_XP10_4K_SHRT_SYMBOLS  512
`define N_XP10_4K_LONG_SYMBOLS  244
`define N_SHRT_SYM_WIDTH        10
`define N_LONG_SYM_WIDTH        8
`define N_LENLIT_SYMBOLS        288
`define N_DIST_SYMBOLS          30
`define N_SMALL_SYMBOLS         33
`define N_CODELEN_SYMBOLS       19
`define N_MAX_XP_HUFF_BITS      27
`define N_MAX_DEFLATE_HUFF_BITS 15
`define N_MAX_SMALL_HUFF_BITS   8
`define N_MAX_CODELEN_HUFF_BITS 7
`define N_MAX_SUPPORTED_SYMBOLS 576
`define N_MAX_HUFF_BITS         27
`define N_HTF_BL_OUT_ENTRIES    226


`define N_MAX_MTF               4
`define N_MAX_MTF_WIDTH         2
`define N_MAX_NGRAM             4
`define N_MAX_NGRAM_WIDTH       3

`define N_HUFF_SQ_DEPTH         20480
`define N_HUFF_SQ_ADDR_WIDTH    15

`define XPRESS9_ID              1317459754
`define XPRESS10_ID             3225019664

`define CR_CCEIP_16_BLKID       52758
`define CR_CCEIP_64_BLKID       52836
`define CR_CDDIP_BLKID          52580

`define FRAME_ID_WIDTH          64
`define MODULE_ID_WIDTH         5
`define SU_BYTES_WIDTH          24

`define PREFIX_STATS_WIDTH      64
`define LZ77C_STATS_WIDTH       64
`define HUFE_STATS_WIDTH        32
`define CRYPTO_STATS_WIDTH      32
`define LZ77D_STATS_WIDTH       64
`define HUFD_STATS_WIDTH        64
`define CRCGC_STATS_WIDTH       8
`define ISF_STATS_WIDTH         64
`define OSF_STATS_WIDTH         16
`define CG_STATS_WIDTH          4

`define TLVP_SEQ_NUM_WIDTH      13
`define TLVP_ORD_NUM_WIDTH      13
`define TLVP_TYP_NUM_WIDTH      8
`define TLVP_PA_WIDTH           64

`define TLV_FRAME_NUM_WIDTH     11

`define N_PREFIX_FEATURES       256
`define N_PREFIX_FEATURE_CTR    64

`define N_PREFIX_IM_ENTRIES     256
`define N_PREFIX_SAT_ENTRIES    128
`define N_PREFIX_CT_ENTRIES     128
`define CR_PREFIX_N_NEURONS     128
`define CR_PREFIX_NEURON_WIDTH  7
`define CR_PREFIX_PFD_ENTRIES   8192
`define CR_PREFIX_PHD_ENTRIES   4096
`define CR_PREFIX_N_PHD_WORDS   67
`define CR_PREFIX_N_PFD_WORDS   130

`define ISF_FIFO_ENTRIES        1024
`define ISF_FIFO_WIDTH          92

`define OSF_DATA_FIFO_ENTRIES   512
`define OSF_DATA_FIFO_WIDTH     92

`define OSF_PDT_FIFO_ENTRIES    256
`define OSF_PDT_FIFO_WIDTH      92

`define SU_FIFO_ENTRIES         64

`define TLV_LEN_WIDTH           8
`define N_FTR_WORDS             14
`define N_FTR_WORDS_EXP         20

`define TLV_LATENCY_WIDTH       16
`define TLV_SEQ_NUM_WIDTH       8

`define AXI_S_TID_PAD_WIDTH     8


`define XP10CRC64_POLYNOMIAL    11127430586519243189
`define XP10CRC64_INIT          18446744073709551615

`define XP10CRC32_POLYNOMIAL    2197175160
`define XP10CRC32_INIT          4294967295

`define CRC64E_POLYNOMIAL       4823603603198064275
`define CRC64E_INIT             18446744073709551615

`define GZIPCRC32_POLYNOMIAL    3988292384
`define GZIPCRC32_INIT          4294967295

`define CRC16T_POLYNOMIAL       35767
`define CRC16T_INIT             65535

`endif

//* SOURCE_FILE_END: /nvme0n1/gaoruihao/zipline/Project-Zipline-FPGA/dv/CCE_64/run/../../../rtl/common/include/cr_global_params.vh


`define FSDB_PATH zipline_tb

module zipline_tb;
   string testname;
   string seed;
   reg[31:0] initial_seed;
   int  error_cntr;

   string fsdbFilename;
  

   logic clk;
   logic rst_n;

   logic ib_tready;
   logic [`AXI_S_TID_WIDTH-1:0]  ib_tid;
   logic [`AXI_S_DP_DWIDTH-1:0]  ib_tdata;
   logic [`AXI_S_TSTRB_WIDTH-1:0] ib_tstrb;
   logic [`AXI_S_USER_WIDTH-1:0] ib_tuser;
   logic                         ib_tvalid;
   logic                         ib_tlast;

   logic ob_tready;
   logic [`AXI_S_TID_WIDTH-1:0]  ob_tid;
   logic [`AXI_S_DP_DWIDTH-1:0]  ob_tdata;
   logic [`AXI_S_TSTRB_WIDTH-1:0] ob_tstrb;
   logic [`AXI_S_USER_WIDTH-1:0] ob_tuser;
   logic                         ob_tvalid;
   logic                         ob_tlast;
   
   logic                         sch_update_tready;
   logic [7:0]                   sch_update_tdata;
   logic                         sch_update_tvalid;
   logic                         sch_update_tlast;
   logic [1:0]                   sch_update_tuser;

   logic [`N_RBUS_ADDR_BITS-1:0] apb_paddr;
   logic                         apb_psel;
   logic                         apb_penable;
   logic                         apb_pwrite;
   logic [`N_RBUS_DATA_BITS-1:0] apb_pwdata;  
   logic [`N_RBUS_DATA_BITS-1:0] apb_prdata;
   logic                         apb_pready;		        
   logic                         apb_pslverr;		        
   logic                         engine_int;
   logic                         engine_idle;
   logic                         key_mode;
   logic                         dbg_cmd_disable;
   logic                         xp9_disable;
   


   initial begin
     clk = 1'b0;
     forever
     begin
         #0.625;
         clk = ~clk;
     end
   end


   apb_xactor #(.ADDR_WIDTH(`N_RBUS_ADDR_BITS),.DATA_WIDTH(`N_RBUS_DATA_BITS)) apb_xactor(
	.clk(clk), 
	.reset_n(rst_n), 
        .prdata(apb_prdata), 
        .pready(apb_pready), 
        .pslverr(apb_pslverr), 
        .psel(apb_psel), 
        .penable(apb_penable), 
        .paddr(apb_paddr), 
        .pwdata(apb_pwdata), 
        .pwrite(apb_pwrite)
   );
   
   cr_cceip_64 
     #(
       )  
   dut(
       .ib_tready(ib_tready), 
       .ib_tvalid(ib_tvalid),
       .ib_tlast(ib_tlast),
       .ib_tid(ib_tid),
       .ib_tstrb(ib_tstrb),
       .ib_tuser(ib_tuser),
       .ib_tdata(ib_tdata),

       .ob_tready(ob_tready), 
       .ob_tvalid(ob_tvalid),
       .ob_tlast(ob_tlast),
       .ob_tid(ob_tid),
       .ob_tstrb(ob_tstrb),
       .ob_tuser(ob_tuser),
       .ob_tdata(ob_tdata),

       .sch_update_tready(sch_update_tready), 
       .sch_update_tvalid(sch_update_tvalid),
       .sch_update_tlast(sch_update_tlast),
       .sch_update_tuser(sch_update_tuser),
       .sch_update_tdata(sch_update_tdata),

       .apb_paddr(apb_paddr),
       .apb_psel(apb_psel), 
       .apb_penable(apb_penable), 
       .apb_pwrite(apb_pwrite), 
       .apb_pwdata(apb_pwdata),
       .apb_prdata(apb_prdata),
       .apb_pready(apb_pready), 
       .apb_pslverr(apb_pslverr),

       .clk(clk), 
       .rst_n(rst_n), 
       .key_mode (key_mode),
       .dbg_cmd_disable (dbg_cmd_disable),
       .xp9_disable (xp9_disable),
       .cceip_int (engine_int),            
       .cceip_idle (engine_idle),            
       .scan_en(1'b0), 
       .scan_mode(1'b0), 
       .scan_rst_n(1'b0), 
    
       .ovstb(1'b1), 
       .lvm(1'b0),
       .mlvm(1'b0)
       );

  initial begin

     error_cntr = 0;

     key_mode = 1'b0;
     dbg_cmd_disable = 1'b0;
     xp9_disable = 1'b0;
     rst_n = 1'b0; 
     
     if( $test$plusargs("SEED") ) begin
        $value$plusargs("SEED=%d", seed);
     end else begin
	seed="1";	
     end
     
     if( $test$plusargs("TESTNAME") ) begin
        $value$plusargs("TESTNAME=%s", testname);
        $display("TESTNAME=%s SEED=%d", testname, seed);
     end else begin
	testname="unknown";	
     end
     
     if ( $test$plusargs("waves") ) begin
        if( $test$plusargs("dump_fsdb") ) begin
          $value$plusargs("fsdbfile+%s", fsdbFilename);
          $fsdbDumpfile(fsdbFilename);
          $fsdbDumpvars(0, `FSDB_PATH);
          $fsdbDumpMDA(0, `FSDB_PATH);
          $fsdbDumpvars(0, "+all", `FSDB_PATH);
        end else begin
          $vcdpluson();
          $vcdplusmemon();
        end
     end

     $display("--- \"rst_n\" is being ASSERTED for 100ns ---");

     #100;

     sch_update_tready <= 1'b1;
     ib_tid <= 0;
     ib_tvalid <= 0;
     ib_tlast <= 0;
     ib_tdata <= 0;
     ib_tstrb <= 0;
     ib_tuser <= 0;
     ob_tready <= 1;

     #50;

     $display("--- \"rst_n\" has been DE-ASSERTED! ---");

     rst_n = 1'b1; 

     #100;

     @(posedge clk);

     do_engine_config();

     fork
        begin
           service_ib_interface();
        end
        begin
           service_ob_interface();
        end
     join


     if ( error_cntr ) begin
       $display("\nTest %s FAILED!\n", testname);
     end else begin
       $display("\nTest %s PASSED!\n", testname);
     end

     #10ns;
     $finish;
     
  end // initial

  task service_ib_interface();
    reg[7:0]       tstrb;
    reg[63:0]      tdata;
    string         tuser_string;
    string         file_name;
    string         vector;
    integer        str_get;
    integer        file_descriptor; 
    logic          saw_cqe;



    file_name = $psprintf("../tests/%s.inbound", testname);
    file_descriptor = $fopen(file_name, "r");
    if ( file_descriptor == 0 ) begin
      $display ("INBOUND_FATAL:  @time:%-d File %s NOT found!", $time, file_name );
      $finish;
    end else begin
      $display ("INBOUND_INFO:  @time:%-d Openned test file -->  %s", $time, file_name );
    end

    saw_cqe = 0;
    while( !$feof(file_descriptor) ) begin
      if ( ib_tready === 1'b1 ) begin
        ib_tlast <= 1'b0;
        if ( $fgets(vector,file_descriptor) ) begin
          str_get = $sscanf(vector, "0x%h %s 0x%h", tdata, tuser_string, tstrb);
//        $display ("INBOUND_INFO:  @time:%-d parsed vector --> 0x%h %s 0x%h %d", $time, tdata, tuser_string, tstrb, str_get ); 
          if ( str_get >= 2 ) begin
            $display ("INBOUND_INFO:  @time:%-d vector --> %s", $time, vector ); 
            if ( str_get == 3 ) begin
              if ( tuser_string == "SoT" && tdata[7:0] == 8'h09 ) begin
                saw_cqe = 1;
              end
              if ( tuser_string == "EoT" && saw_cqe == 1 ) begin
                ib_tlast <= 1'b1;
                saw_cqe = 0;
              end
              ib_tuser <= translate_tuser( tuser_string );
            end else begin
              ib_tuser <= 8'h00;
            end
            ib_tvalid <= 1'b1;
            ib_tdata <= tdata;
            ib_tstrb <= tstrb;
          end else begin
            ib_tvalid <= 1'b0;
          end
        end else begin
          ib_tvalid <= 1'b0;
        end
      end
      @(posedge clk);
    end

    ib_tvalid <= 1'b0;
    ib_tlast <= 1'b0;

    @(posedge clk);

    $display ("INBOUND_INFO:  @time:%-d Exiting INBOUND thread...", $time );

  endtask // service_ib_interface




  task service_ob_interface();
    reg[7:0]       tstrb;
    reg[7:0]       tuser;
    reg[63:0]      tdata;
    reg            tlast;
    string         tuser_string;
    string         file_name;
    string         vector;
    integer        str_get;
    integer        file_descriptor; 
    logic          saw_cqe;
    logic          saw_stats;
    logic          ignore_compare_result;
    logic          got_next_line;
    integer        watchdog_timer; 
    integer        rc; 

    

    file_name = $psprintf("../tests/%s.outbound", testname);
    file_descriptor = $fopen(file_name, "r");
    if ( file_descriptor == 0 ) begin
      $display ("OUTBOUND_FATAL:  @time:%-d File %s NOT found!", $time, file_name );
      $finish;
    end else begin
      $display ("OUTBOUND_INFO:  @time:%-d Openned test file -->  %s", $time, file_name );
    end

    saw_cqe = 0;
    saw_stats = 0;
    got_next_line = 0; 
    watchdog_timer = 0;
    while( !$feof(file_descriptor) ) begin
      if ( ob_tvalid === 1'b1 ) begin
        watchdog_timer = 0;
        tlast = 1'b0;
        ignore_compare_result = 0;
        if ( got_next_line == 1 || $fgets(vector,file_descriptor) ) begin
          got_next_line = 0;
          while ( vector[0] === "#" && !$feof(file_descriptor) ) begin
            rc = $fgets(vector,file_descriptor);
          end
          $display ("OUTBOUND_INFO:  @time:%-d vector --> %s", $time, vector );
          str_get = $sscanf(vector, "0x%h %s 0x%h", tdata, tuser_string, tstrb);
//        $display ("OUTBOUND_INFO:  @time:%-d parsed vector --> 0x%h %s 0x%h %d", $time, tdata, tuser_string, tstrb, str_get ); 
          if ( str_get == 3 ) begin
            tuser = translate_tuser( tuser_string );
            if ( tuser_string == "SoT" && tdata[7:0] == 8'h09 ) begin
              saw_cqe = 1;
            end
            if ( tuser_string == "EoT" && saw_cqe == 1 ) begin
              tlast = 1'b1;
              saw_cqe = 0;
              rc = $fgets(vector,file_descriptor);
              got_next_line = 1;
            end
            if ( tuser_string == "SoT" && tdata[7:0] == 8'h08 ) begin
              saw_stats = 1;
            end
            if ( tuser_string == "EoT" && saw_stats == 1 ) begin
              ignore_compare_result = 1;
              saw_stats = 0;
            end
          end else begin
            tuser = 8'h00;
          end
          if ( ob_tdata !== tdata && ignore_compare_result == 0 ) begin
            $display ("OUTBOUND_ERROR:  @time:%-d   ob_tdata MISMATCH --> Actual: 0x%h  Expect: 0x%h", $time, ob_tdata, tdata ); 
            ++error_cntr;
          end
          if ( ob_tuser !== tuser ) begin
            $display ("OUTBOUND_ERROR:  @time:%-d   ob_tuser MISMATCH --> Actual: 0x%h  Expect: 0x%h", $time, ob_tuser, tuser ); 
            ++error_cntr;
          end
          if ( ob_tstrb !== tstrb ) begin
            $display ("OUTBOUND_ERROR:  @time:%-d   ob_tstrb MISMATCH --> Actual: 0x%h  Expect: 0x%h", $time, ob_tstrb, tstrb ); 
            ++error_cntr;
          end
          if ( ob_tlast !== tlast ) begin
            $display ("OUTBOUND_ERROR:  @time:%-d   ob_tlast MISMATCH --> Actual: 0x%h  Expect: 0x%h", $time, ob_tlast, tlast ); 
            ++error_cntr;
          end
        end else begin
          ++error_cntr;
          $display ("\nOUTBOUND_FATAL:  @time:%-d  No corresponding expect vector!\n", $time ); 
          $finish;
        end
      end else begin
        ++watchdog_timer;
        if ( watchdog_timer > 10000 ) begin
          ++error_cntr;
          $display ("\nOUTBOUND_ERROR:  @time:%-d  Watchdog timer EXPIRED!\n", $time ); 
          $finish;
        end
      end
      @(posedge clk);
    end


    @(posedge clk);

    $display ("OUTBOUND_INFO:  @time:%-d Exiting OUTBOUND thread...", $time );

  endtask // service_ob_interface


  
  task do_engine_config();
    reg[31:0]      address;
    reg[31:0]      data;
    reg[31:0]      returned_data;
    string         operation;
    string         file_name;
    string         vector;
    integer        str_get;
    integer        file_descriptor;
    reg            response;

    
    file_name = $psprintf("../tests/%s.config", testname);
    file_descriptor = $fopen(file_name, "r");
    if ( file_descriptor == 0 ) begin
      $display ("\nAPB_INFO:  @time:%-d File %s NOT found!\n", $time, file_name );
      return;
    end else begin
      $display ("APB_INFO:  @time:%-d Openned test file -->  %s", $time, file_name );
    end

    while( !$feof(file_descriptor) ) begin
      if ( $fgets(vector,file_descriptor) ) begin
        $display ("APB_INFO:  @time:%-d vector --> %s", $time, vector );
        str_get = $sscanf(vector, "%s 0x%h 0x%h", operation, address, data);
//      $display ("APB_INFO:  @time:%-d parsed vector --> %s 0x%h 0x%h    %d", $time, operation, address, data, str_get ); 
        if ( str_get == 3 && (operation == "r" || operation == "R" || operation == "w" || operation == "W") ) begin
          if ( operation == "r" || operation == "R" ) begin
            apb_xactor.read(address, returned_data, response);
            if ( response !== 0 ) begin
              $display ("\n\nAPB_FATAL:  @time:%-d   Slave ERROR and/or TIMEOUT on the READ operation to address 0x%h\n\n",
                                                                                               $time, address );
              $finish;
            end
            if ( returned_data !== data ) begin
              $display ("APB_ERROR:  @time:%-d   Data MISMATCH --> Actual: 0x%h  Expect: 0x%h", $time, returned_data, data ); 
              ++error_cntr;
              if ( error_cntr > 10 ) begin
                $finish;
              end
            end
          end else begin
            apb_xactor.write(address, data, response);
            if ( response !== 0 ) begin
              $display ("\n\nAPB_FATAL:  @time:%-d   Slave ERROR and/or TIMEOUT on the WRITE operation to address 0x%h\n\n",
                                                                                               $time, address );
              $finish;
            end
          end
          @(posedge clk);
        end else if ( operation !== "#" ) begin
          $display ("APB_FATAL:  @time:%-d vector --> %s NOT valid!", $time, vector );
          $finish;
        end
      end
    end

    @(posedge clk);

    $display ("APB_INFO:  @time:%-d Exiting APB engine config ...", $time );

  endtask // do_engine_config



  function logic[7:0] translate_tuser (string tuser);
      if ( tuser == "SoT" ) begin
         return 8'h01;
      end else if ( tuser == "EoT" ) begin
         return 8'h02;
      end else begin
         return 8'h03;
      end
  endfunction : translate_tuser

   
endmodule : zipline_tb

//* SOURCE_FILE_END: ./zipline_tb.v
