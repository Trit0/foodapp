import { ValidatorConstraintInterface } from "class-validator";
import { SequelizeRepository } from "@recursyve/nestjs-sequelize-utils";

export class EntityExistValidator implements ValidatorConstraintInterface {
    constructor(private service: SequelizeRepository<any>) {}

    public async validate(value: number | number[]): Promise<boolean> {
        if (!value) {
            return true;
        }

        if (typeof value === "number") {
            return !!(await this.service.findByPk(value));
        }

        if (!value.length) {
            return true;
        }

        const count = await this.service.count({
            where: {
                id: value
            }
        });
        return count === value.length;
    }
}
