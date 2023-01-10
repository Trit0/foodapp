// eslint-disable-next-line @typescript-eslint/no-var-requires
require("dotenv").config();

import { HttpStatus, ValidationPipe } from "@nestjs/common";
import { ExpressAdapter } from "@nestjs/platform-express";
import { NestFactory } from "@nestjs/core";
import { useContainer } from "class-validator";
import * as morgan from "morgan";
import * as compression from "compression";
import helmet from "helmet";
import { ApplicationModule } from "./modules/app.module";

async function bootstrap() {
    try {
        const adapter = new ExpressAdapter();
        const app = await NestFactory.create(ApplicationModule, adapter, {
            bodyParser: true,
            cors: {
                allowedHeaders: ["origin", "content-type", "authorization", ...(process.env.ALLOW_HEADERS || "").split(" ")],
                origin: (process.env.ALLOW_ORIGINS || "").split(" "),
                credentials: true
            }
        });

        // For class-validator async validators
        useContainer(app.select(ApplicationModule), { fallbackOnErrors: true });

        app.use(helmet());
        app.use(morgan("dev"));
        app.use(compression());

        app.useGlobalPipes(
            new ValidationPipe({
                whitelist: true,
                forbidNonWhitelisted: true,
                transform: true,
                errorHttpStatusCode: HttpStatus.PRECONDITION_FAILED
            })
        );

        await app.listen(+process.env.PORT || 8080);
    } catch (err) {
        process.exit(-1);
    }
}

bootstrap().catch((err) => console.error(err));
