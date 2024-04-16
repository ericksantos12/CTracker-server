import fastify from "fastify";
import { helloWorld } from "./routes/hello-world";

const app = fastify();

app.register(helloWorld)

app.listen({ port: 3333, host: '0.0.0.0' }).then(() => {
    console.log('HTTP Server Running');
});

