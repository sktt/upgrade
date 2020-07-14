ALTER TABLE "postgres-media$dev"."Media" ADD COLUMN "publisherId" CHARACTER VARYING(25);
UPDATE "postgres-media$dev"."Media" SET "publisherId" = "postgres-media$dev"."_UserMedias"."B" FROM "postgres-media$dev"."_UserMedias" WHERE "postgres-media$dev"."_UserMedias"."A" = "postgres-media$dev"."Media"."id";
ALTER TABLE "postgres-media$dev"."Media" ALTER COLUMN "publisherId" set NOT NULL;
ALTER TABLE "postgres-media$dev"."Media" ADD CONSTRAINT "publisher" FOREIGN KEY ("publisherId") REFERENCES "postgres-media$dev"."User"("id");
DROP TABLE "postgres-media$dev"."_UserMedias";