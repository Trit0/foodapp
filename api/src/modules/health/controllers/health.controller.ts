import { Controller, Get } from "@nestjs/common";
import { HealthCheck, HealthCheckService, SequelizeHealthIndicator } from "@nestjs/terminus";

@Controller("healthz")
export class HealthController {
    constructor(private health: HealthCheckService, private sql: SequelizeHealthIndicator) {}

    @Get()
    @HealthCheck()
    public check() {
        // Checks in this endpoint defines if the app is considered "Up" or "Down" by k8s.
        return this.health.check([() => this.sql.pingCheck("database")]);
    }
}
