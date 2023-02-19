import { Module } from "@nestjs/common";
import { GlobalConfigModule } from "./config/config.module";
import { RootModule } from "./root/root.module";
import { DatabaseModule } from "./database/database.module";
import { HealthModule } from "./health/health.module";
import { NestjsRosettaModule } from "@recursyve/nestjs-rosetta-core";
import { NestjsRosettaSequelizeModule, SequelizeTranslationObjectProcessor } from "@recursyve/nestjs-rosetta-sequelize";
import { languagesValues, Languages } from "./translations/languages.enum";

@Module({
    imports: [
        GlobalConfigModule,
        RootModule,
        DatabaseModule,
        HealthModule,
        NestjsRosettaModule.forRoot({
            processors: [new SequelizeTranslationObjectProcessor()],
            supportedLanguages: languagesValues,
            fallbackLanguage: Languages.EN
        }),
        NestjsRosettaSequelizeModule
    ]
})
export class ApplicationModule {}
