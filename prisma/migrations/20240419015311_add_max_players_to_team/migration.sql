/*
  Warnings:

  - You are about to drop the column `team_numplayer` on the `tb_team` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_nickname]` on the table `tb_user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `team_maxPlayers` to the `tb_team` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tb_team" DROP COLUMN "team_numplayer",
ADD COLUMN     "team_maxPlayers" INTEGER NOT NULL,
ALTER COLUMN "team_description" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "tb_user_user_nickname_key" ON "tb_user"("user_nickname");
