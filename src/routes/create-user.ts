import { FastifyInstance } from 'fastify';
import { ZodTypeProvider } from 'fastify-type-provider-zod';
import z from 'zod';
import { prisma } from '../lib/prisma';
import { generateHash } from '../utils/hash';

export async function createUser(app: FastifyInstance) {
    app.withTypeProvider<ZodTypeProvider>().post(
        '/signup',
        {
            schema: {
                summary: 'Create an user',
                tags: ['User'],
                body: z.object({
                    email: z.string().email(),
                    password: z.string(),
                    name: z.string().min(3),
                    nickname: z.string().min(3),
                    picture: z.string().url().nullable(),
                }),
                response: {
                    201: z.object({
                        userId: z.number(),
                    }),
                },
            },
        },
        async (request, reply) => {
            const { email, password, name, nickname, picture } = request.body;

            const hash = await generateHash(password);
            const user = await prisma.user.create({
                data: {
                    email,
                    password: hash,
                    name,
                    nickname,
                    picture
                }
            })

            return reply.status(201).send({ userId: user.id })
        }
    );
}
