import { Module } from "@nestjs/common";
import { ConfigModule } from "@recursyve/nestjs-config";
import { GlobalConfig } from "./global.config";

@Module({
    imports: [ConfigModule.forRoot(GlobalConfig)],
    exports: [ConfigModule]
})
export class GlobalConfigModule {}
