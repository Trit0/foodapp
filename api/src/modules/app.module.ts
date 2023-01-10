import { Module } from "@nestjs/common";
import { GlobalConfigModule } from "./config/config.module";
import { RootModule } from "./root/root.module";
import { DatabaseModule } from "./database/database.module";
import { HealthModule } from "./health/health.module";

@Module({
    imports: [GlobalConfigModule, RootModule, DatabaseModule, HealthModule]
})
export class ApplicationModule {}
