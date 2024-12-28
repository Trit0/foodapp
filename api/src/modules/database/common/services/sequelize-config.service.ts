import { Injectable } from "@nestjs/common";
import { SequelizeModuleOptions, SequelizeOptionsFactory } from "@nestjs/sequelize";
import { InjectConfig } from "@recursyve/nestjs-config";
import { GlobalConfig } from "../../../config/global.config";
import { DatabaseConfig } from "../config/database.config";

@Injectable()
export class SequelizeConfigService implements SequelizeOptionsFactory {
    constructor(
        @InjectConfig(GlobalConfig) private globalConfig: GlobalConfig,
        @InjectConfig(DatabaseConfig) private config: DatabaseConfig
    ) {}

    public createSequelizeOptions(): SequelizeModuleOptions {
        return {
            autoLoadModels: true,
            synchronize: false,
            dialect: "postgres",
            host: this.config.DB_HOST,
            port: +this.config.DB_PORT,
            username: this.config.DB_USERNAME,
            password: this.config.DB_PASSWORD ?? "",
            database: this.config.DB_NAME,
            logging: this.globalConfig.isProduction ? false : (log) => console.log(log),
            define: {
                timestamps: true,
                paranoid: true,
                underscored: true,
                updatedAt: "updated_at",
                createdAt: "created_at",
                deletedAt: "deleted_at",
                defaultScope: {
                    attributes: {
                        exclude: ["updated_at", "created_at", "deleted_at"]
                    }
                }
            }
        };
    }
}
