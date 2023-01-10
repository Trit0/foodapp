import { Module } from "@nestjs/common";
import { DatabaseModule } from "../database/database.module";
import { HealthController } from "./controllers/health.controller";
import { TerminusModule } from "@nestjs/terminus";

@Module({
    imports: [DatabaseModule, TerminusModule],
    controllers: [HealthController]
})
export class HealthModule {}
