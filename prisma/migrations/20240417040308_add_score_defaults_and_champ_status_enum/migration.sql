/*
  Warnings:

  - Changed the type of `cha_status` on the `tb_championship` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "ChampionshipStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- AlterTable
ALTER TABLE "tb_championship" DROP COLUMN "cha_status",
ADD COLUMN     "cha_status" "ChampionshipStatus" NOT NULL;

-- AlterTable
ALTER TABLE "tb_team" ALTER COLUMN "team_score" SET DEFAULT 0;

-- AlterTable
ALTER TABLE "tb_team_score" ALTER COLUMN "ts_teamscore" SET DEFAULT 0;

-- AlterTable
ALTER TABLE "tb_user" ALTER COLUMN "user_score" SET DEFAULT 0;
