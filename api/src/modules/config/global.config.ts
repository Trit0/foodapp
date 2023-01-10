import { Variable } from "@recursyve/nestjs-config";

export class GlobalConfig {
    public packageJson = require("../../../package.json");

    @Variable
    NODE_ENV: string;

    @Variable(false)
    VERSION: string;

    public get isProduction(): boolean {
        return this.NODE_ENV === "production";
    }

    public get mode(): string {
        return this.NODE_ENV;
    }

    public get version(): string {
        return this.VERSION || this.packageJson.version;
    }
}
