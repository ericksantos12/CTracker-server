import { FastifyInstance } from "fastify";

export async function helloWorld(app: FastifyInstance){
    app.get('/hello', async (request, reply) => {
        return reply.send("Hello World!")
    })
}