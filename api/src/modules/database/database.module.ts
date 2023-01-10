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

/**
 * Fix for MySql v8+
 * GeomFromText doesn't exist anymore, it has been replace by ST_GeomFromText
 * https://github.com/sequelize/sequelize/issues/9786#issuecomment-474122602
 */

// eslint-disable-next-line @typescript-eslint/no-var-requires
const wkx = require("wkx");
SequelizeBase.GEOMETRY.prototype._stringify = function _stringify(value, options) {
    return `ST_GeomFromText(${options.escape(wkx.Geometry.parseGeoJSON(value).toWkt())})`;
};
SequelizeBase.GEOMETRY.prototype._bindParam = function _bindParam(value, options) {
    return `ST_GeomFromText(${options.bindParam(wkx.Geometry.parseGeoJSON(value).toWkt())})`;
};
SequelizeBase.GEOGRAPHY.prototype._stringify = function _stringify(value, options) {
    return `ST_GeomFromText(${options.escape(wkx.Geometry.parseGeoJSON(value).toWkt())})`;
};
SequelizeBase.GEOGRAPHY.prototype._bindParam = function _bindParam(value, options) {
    return `ST_GeomFromText(${options.bindParam(wkx.Geometry.parseGeoJSON(value).toWkt())})`;
};

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
