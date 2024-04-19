import fastifySwagger from '@fastify/swagger'
import fastifySwaggerUi from '@fastify/swagger-ui'
import fastify from 'fastify'
import {
    jsonSchemaTransform,
    serializerCompiler,
    validatorCompiler,
} from 'fastify-type-provider-zod'
import { errorHandler } from './error-handler'
import { createChampionship } from './routes/create-championship'
import { createUser } from './routes/create-user'
import { getChampionship } from './routes/get-championship'
import dotenv from 'dotenv'
import { getChampionshipsList } from './routes/get-championships-list'

dotenv.config()

const app = fastify()

app.register(fastifySwagger, {
    swagger: {
        consumes: ['application/json'],
        produces: ['application/json'],
        info: {
            title: 'Champions Tracker',
            description:
                'Especificações da API para o back-end das aplicações do sistema Champions Tracker',
            version: '1.0.0',
        },
    },
    transform: jsonSchemaTransform,
})

app.register(fastifySwaggerUi, {
    routePrefix: '/docs',
})

app.setValidatorCompiler(validatorCompiler)
app.setSerializerCompiler(serializerCompiler)

app.register(createUser, { prefix: '/api' })
app.register(createChampionship, { prefix: '/api' })
app.register(getChampionship, { prefix: '/api' })
app.register(getChampionshipsList, { prefix: '/api' })

app.setErrorHandler(errorHandler)

app.listen({ port: 3333, host: '0.0.0.0' }).then(() => {
    console.log(`HTTP Server Running`)
})
