-- ----------------------------
-- Table structure for "C##FHADMIN"."CRM_MEMBER"
-- ----------------------------
-- DROP TABLE "C##FHADMIN"."CRM_MEMBER";
CREATE TABLE "C##FHADMIN"."CRM_MEMBER" (
	"MEMBER_NUM" VARCHAR2(20 BYTE) NULL ,
	"ENTERPRISE_NAME" VARCHAR2(100 BYTE) NULL ,
	"CONTACT_PHONE" VARCHAR2(20 BYTE) NULL ,
	"ENTERPRISE_ADDRESS" VARCHAR2(100 BYTE) NULL ,
	"RECRUIT_CNT" NUMBER(5) NULL ,
	"MEMBER_ID" VARCHAR2(100 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;

COMMENT ON COLUMN "C##FHADMIN"."CRM_MEMBER"."MEMBER_NUM" IS '会员卡号';
COMMENT ON COLUMN "C##FHADMIN"."CRM_MEMBER"."ENTERPRISE_NAME" IS '企业名称';
COMMENT ON COLUMN "C##FHADMIN"."CRM_MEMBER"."CONTACT_PHONE" IS '联系电话';
COMMENT ON COLUMN "C##FHADMIN"."CRM_MEMBER"."ENTERPRISE_ADDRESS" IS '企业地址';
COMMENT ON COLUMN "C##FHADMIN"."CRM_MEMBER"."RECRUIT_CNT" IS '招聘次数';
COMMENT ON COLUMN "C##FHADMIN"."CRM_MEMBER"."MEMBER_ID" IS 'ID';

-- ----------------------------
-- Indexes structure for table CRM_MEMBER
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##FHADMIN"."CRM_MEMBER"

-- ----------------------------

ALTER TABLE "C##FHADMIN"."CRM_MEMBER" ADD CHECK ("MEMBER_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "C##FHADMIN"."CRM_MEMBER"
-- ----------------------------
ALTER TABLE "C##FHADMIN"."CRM_MEMBER" ADD PRIMARY KEY ("MEMBER_ID");
