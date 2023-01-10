import { TransformBoolean, TransformNumber } from "@recursyve/nestjs-common";
import { Expose, Transform } from "class-transformer";
import { IsArray, IsBoolean, IsInt, IsNumberString, IsOptional, IsString, Max, Min, ValidateIf } from "class-validator";
import { FindOptions, Op } from "sequelize";

// Every field in the dto must be optional
export class FindOptionsDto {
    @Expose()
    @IsArray()
    @IsNumberString({}, { each: true })
    @IsOptional()
    @Transform((params) => {
        if (!params.value) return undefined;
        if (!Array.isArray(params.value)) return [params.value];
        return params.value;
    })
    ids?: number[];

    @Expose()
    @IsString()
    @IsOptional()
    searchQuery?: string;

    @Expose()
    @IsInt()
    @Min(1)
    @Max(50)
    @ValidateIf((dto: FindOptionsDto) => !!dto.page || !!dto.pageSize)
    @TransformNumber()
    pageSize?: number;

    @Expose()
    @IsInt()
    @Min(0)
    @IsOptional()
    @TransformNumber()
    page?: number;

    @Expose()
    @IsBoolean()
    @IsOptional()
    @TransformBoolean()
    extended?: boolean;

    constructor(value?: FindOptionsDto) {
        if (!value) {
            return;
        }

        Object.assign(this, value);
    }

    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    public toFindOptions(...args: any[]): FindOptions {
        const opts: FindOptions = {
            where: {
                [Op.and]: []
            }
        };

        if (this.ids) {
            opts.where[Op.and].push({ id: this.ids });
        }

        if (this.pageSize) {
            opts.limit = this.pageSize;

            if (this.page) {
                opts.offset = this.page * this.pageSize;
            }
        }

        return opts;
    }
}
