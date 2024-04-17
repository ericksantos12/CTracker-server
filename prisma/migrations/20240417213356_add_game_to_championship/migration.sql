/*
  Warnings:

  - Added the required column `cha_game` to the `tb_championship` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tb_championship" ADD COLUMN     "cha_game" TEXT NOT NULL;
