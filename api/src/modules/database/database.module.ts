import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { ConfigModule } from "@recursyve/nestjs-config";
import * as SequelizeBase from "sequelize";
import { DatabaseConfig } from "./common/config/database.config";
import { SequelizeConfigService } from "./common/services/sequelize-config.service";
import { SequelizeUtilsHooksModule } from "@recursyve/nestjs-sequelize-utils/lib/sequelize-utils.module";
import { AccountsModule } from "./accounts/accounts.module";
import { GroceryProductsModule } from "./grocery_products/grocery-products.module";
import { IngredientsModule } from "./ingredients/ingredients.module";
import { PantryModule } from "./pantry/pantry.module";

@Module({
    imports: [
        ConfigModule.forFeature(DatabaseConfig),
        SequelizeModule.forRootAsync({
            imports: [ConfigModule],
            useClass: SequelizeConfigService
        }),
        SequelizeUtilsHooksModule,

        // Add database modules here.
        AccountsModule,
        GroceryProductsModule,
        IngredientsModule,
        PantryModule
    ]
})
export class DatabaseModule {}
