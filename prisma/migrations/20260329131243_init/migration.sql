/*
  Warnings:

  - Added the required column `name` to the `Voice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Voice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `variant` to the `Voice` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Voice" ADD COLUMN     "category" "VoiceCategory" NOT NULL DEFAULT 'GENERAL',
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "language" TEXT NOT NULL DEFAULT 'en-US',
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "orgId" TEXT,
ADD COLUMN     "r20ObjectKey" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "variant" "VoiceVariant" NOT NULL;

-- CreateTable
CREATE TABLE "Generation" (
    "id" TEXT NOT NULL,
    "orgId" TEXT,
    "voiceId" TEXT,
    "voiceName" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "r20ObjectKey" TEXT,
    "temparature" DOUBLE PRECISION NOT NULL,
    "topP" DOUBLE PRECISION NOT NULL,
    "topK" INTEGER NOT NULL,
    "repetitionPenalty" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Generation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Generation_orgId_idx" ON "Generation"("orgId");

-- CreateIndex
CREATE INDEX "Generation_voiceId_idx" ON "Generation"("voiceId");

-- CreateIndex
CREATE INDEX "Voice_orgId_idx" ON "Voice"("orgId");

-- CreateIndex
CREATE INDEX "Voice_variant_idx" ON "Voice"("variant");

-- AddForeignKey
ALTER TABLE "Generation" ADD CONSTRAINT "Generation_voiceId_fkey" FOREIGN KEY ("voiceId") REFERENCES "Voice"("id") ON DELETE CASCADE ON UPDATE CASCADE;
