// eslint-disable-next-line @typescript-eslint/no-var-requires
require("dotenv").config();

import { NestFactory } from "@nestjs/core";
import { ApplicationModule } from "../src/modules/app.module";

async function bootstrap() {
    await NestFactory.create(ApplicationModule);
}

bootstrap().then(() => process.exit(0));
