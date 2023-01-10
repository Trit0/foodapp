import { Controller, Get } from "@nestjs/common";
import { InjectConfig } from "@recursyve/nestjs-config";
import { GlobalConfig } from "../../config/global.config";
import { ServerStateModel } from "../models/server-state.model";

@Controller()
export class RootController {
    constructor(@InjectConfig(GlobalConfig) private globalConfig: GlobalConfig) {}

    @Get()
    public getState(): ServerStateModel {
        return {
            mode: this.globalConfig.mode,
            version: this.globalConfig.version
        };
    }
}
