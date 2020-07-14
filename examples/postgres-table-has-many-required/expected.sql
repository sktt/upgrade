ALTER TABLE "postgres-table-has-many-required$dev"."Post" ADD COLUMN "authorId" CHARACTER VARYING(25);
UPDATE "postgres-table-has-many-required$dev"."Post" SET "authorId" = "postgres-table-has-many-required$dev"."_PostToUser"."A" FROM "postgres-table-has-many-required$dev"."_PostToUser" WHERE "postgres-table-has-many-required$dev"."_PostToUser"."B" = "postgres-table-has-many-required$dev"."Post"."id";
ALTER TABLE "postgres-table-has-many-required$dev"."Post" ALTER COLUMN "authorId" set NOT NULL;
ALTER TABLE "postgres-table-has-many-required$dev"."Post" ADD CONSTRAINT "author" FOREIGN KEY ("authorId") REFERENCES "postgres-table-has-many-required$dev"."User"("id");
DROP TABLE "postgres-table-has-many-required$dev"."_PostToUser";