CREATE TYPE "postgres-env$dev"."Role" AS ENUM ('ADMIN', 'CUSTOMER');
ALTER TABLE "postgres-env$dev"."User" ALTER COLUMN "role" SET DATA TYPE "postgres-env$dev"."Role" using "role"::"postgres-env$dev"."Role";
ALTER TABLE "postgres-env$dev"."User" ALTER COLUMN "role" SET DEFAULT 'CUSTOMER';
ALTER TABLE "postgres-env$dev"."User" ALTER COLUMN "jsonData" SET DATA TYPE JSONB USING "jsonData"::TEXT::JSONB;
ALTER TABLE "postgres-env$dev"."Post" ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "postgres-env$dev"."Post" ALTER COLUMN "published" SET DEFAULT false;
ALTER TABLE "postgres-env$dev"."Profile" ADD UNIQUE ("user");
ALTER TABLE "postgres-env$dev"."Post" ADD COLUMN "authorId" CHARACTER VARYING(25);
UPDATE "postgres-env$dev"."Post" SET "authorId" = "postgres-env$dev"."_PostToUser"."A" FROM "postgres-env$dev"."_PostToUser" WHERE "postgres-env$dev"."_PostToUser"."B" = "postgres-env$dev"."Post"."id";
ALTER TABLE "postgres-env$dev"."Post" ADD CONSTRAINT "author" FOREIGN KEY ("authorId") REFERENCES "postgres-env$dev"."User"("id");
DROP TABLE "postgres-env$dev"."_PostToUser";