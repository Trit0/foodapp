import { Variable } from "@recursyve/nestjs-config";

export class DatabaseConfig {
    @Variable({ required: false })
    DB_HOST: string;

    @Variable({ required: false })
    DB_NAME: string;

    @Variable({ required: false })
    DB_USERNAME: string;

    @Variable({ required: false })
    DB_PORT: string;
}
