-- ----------------------------
-- Table structure for "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION"
-- ----------------------------
-- DROP TABLE "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION";
CREATE TABLE "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION" (
	"HOTNAME" VARCHAR2(255 BYTE) NULL ,
	"HOTPOSITION_ID" VARCHAR2(100 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;

COMMENT ON COLUMN "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION"."HOTNAME" IS '热门职位';
COMMENT ON COLUMN "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION"."HOTPOSITION_ID" IS 'ID';

-- ----------------------------
-- Indexes structure for table CRM_HOPPOSITIONHOTPOSITION
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION"

-- ----------------------------

ALTER TABLE "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION" ADD CHECK ("HOTPOSITION_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION"
-- ----------------------------
ALTER TABLE "C##FHADMIN"."CRM_HOPPOSITIONHOTPOSITION" ADD PRIMARY KEY ("HOTPOSITION_ID");
