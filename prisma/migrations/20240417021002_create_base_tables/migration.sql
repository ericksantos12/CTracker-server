-- CreateEnum
CREATE TYPE "ChampionshipType" AS ENUM ('VIRTUAL', 'PHYSICAL');

-- CreateTable
CREATE TABLE "tb_user" (
    "user_iduser" SERIAL NOT NULL,
    "user_email" TEXT NOT NULL,
    "user_password" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "user_nickname" TEXT NOT NULL,
    "user_picture" TEXT,
    "user_score" INTEGER NOT NULL,

    CONSTRAINT "tb_user_pkey" PRIMARY KEY ("user_iduser")
);

-- CreateTable
CREATE TABLE "tb_team" (
    "team_idteam" SERIAL NOT NULL,
    "user_iduser" INTEGER NOT NULL,
    "team_name" TEXT NOT NULL,
    "team_picture" TEXT,
    "team_description" TEXT NOT NULL,
    "team_numplayer" INTEGER NOT NULL,
    "team_score" INTEGER NOT NULL,

    CONSTRAINT "tb_team_pkey" PRIMARY KEY ("team_idteam")
);

-- CreateTable
CREATE TABLE "tb_championship" (
    "cha_idchampionship" SERIAL NOT NULL,
    "user_iduser" INTEGER NOT NULL,
    "cha_name" TEXT NOT NULL,
    "cha_picture" TEXT,
    "cha_description" TEXT NOT NULL,
    "cha_status" TEXT NOT NULL,
    "cha_type" "ChampionshipType" NOT NULL,
    "cha_createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tb_championship_pkey" PRIMARY KEY ("cha_idchampionship")
);

-- CreateTable
CREATE TABLE "tb_team_championship" (
    "team_idteam" INTEGER NOT NULL,
    "cha_idchampionship" INTEGER NOT NULL,
    "tc_victory" INTEGER NOT NULL DEFAULT 0,
    "tc_defeat" INTEGER NOT NULL DEFAULT 0,
    "tc_draw" INTEGER NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tb_match" (
    "mat_idmatch" SERIAL NOT NULL,
    "cha_idchampionship" INTEGER NOT NULL,
    "mat_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tb_match_pkey" PRIMARY KEY ("mat_idmatch")
);

-- CreateTable
CREATE TABLE "tb_team_score" (
    "ts_idteamscore" SERIAL NOT NULL,
    "mat_idmatch" INTEGER NOT NULL,
    "team_idteam" INTEGER NOT NULL,
    "ts_teamscore" INTEGER NOT NULL,

    CONSTRAINT "tb_team_score_pkey" PRIMARY KEY ("ts_idteamscore")
);

-- CreateIndex
CREATE UNIQUE INDEX "tb_user_user_email_key" ON "tb_user"("user_email");

-- CreateIndex
CREATE UNIQUE INDEX "tb_team_championship_team_idteam_cha_idchampionship_key" ON "tb_team_championship"("team_idteam", "cha_idchampionship");

-- AddForeignKey
ALTER TABLE "tb_team" ADD CONSTRAINT "tb_team_user_iduser_fkey" FOREIGN KEY ("user_iduser") REFERENCES "tb_user"("user_iduser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_championship" ADD CONSTRAINT "tb_championship_user_iduser_fkey" FOREIGN KEY ("user_iduser") REFERENCES "tb_user"("user_iduser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_team_championship" ADD CONSTRAINT "tb_team_championship_team_idteam_fkey" FOREIGN KEY ("team_idteam") REFERENCES "tb_team"("team_idteam") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_team_championship" ADD CONSTRAINT "tb_team_championship_cha_idchampionship_fkey" FOREIGN KEY ("cha_idchampionship") REFERENCES "tb_championship"("cha_idchampionship") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_match" ADD CONSTRAINT "tb_match_cha_idchampionship_fkey" FOREIGN KEY ("cha_idchampionship") REFERENCES "tb_championship"("cha_idchampionship") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_team_score" ADD CONSTRAINT "tb_team_score_team_idteam_fkey" FOREIGN KEY ("team_idteam") REFERENCES "tb_team"("team_idteam") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tb_team_score" ADD CONSTRAINT "tb_team_score_mat_idmatch_fkey" FOREIGN KEY ("mat_idmatch") REFERENCES "tb_match"("mat_idmatch") ON DELETE RESTRICT ON UPDATE CASCADE;
