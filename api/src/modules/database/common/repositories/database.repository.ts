import { Sequelize } from "sequelize-typescript";
import { DatabaseReadRepository } from "./database-read.repository";
import { DestroyOptions, Transaction, WhereOptions } from "sequelize";
import { DatabaseEntities } from "../models/database-entities.model";

class E extends DatabaseEntities {}

export abstract class DatabaseRepository<
    T extends DatabaseEntities,
    CreateDto = Partial<T>,
    UpdateDto = Partial<T>
> extends DatabaseReadRepository<T> {

    protected constructor(repository: typeof E) {
        super(repository);
    }

    public bulkCreate(dto: (CreateDto | Partial<T>)[], transaction?: Transaction): Promise<T[]> {
        return this.repository.bulkCreate(dto as any, { returning: true, transaction }) as Promise<T[]>;
    }

    public async create(dto: CreateDto | Partial<T>, transaction?: Transaction): Promise<T> {
        return (await this.repository.create(dto as any, { transaction })) as T;
    }

    public async findOrCreate(
        dto: CreateDto | Partial<T>,
        where: WhereOptions,
        waitForAccessControl = false,
        transaction?: Transaction
    ): Promise<{ value: T; created: boolean }> {
        const res = await this.repository
            .findOrCreate({
                where,
                defaults: dto as any,
                transaction
            })
            .then(([result, created]) => ({ value: result as unknown as T, created: created }));

        if (!res.created) {
            return res;
        }

        return res;
    }

    public async update(id: number, dto: UpdateDto | Partial<T>, transaction?: Transaction): Promise<void> {
        const before = await this.findByPk(id);
        await this.repository.update(dto as any, {
            where: {
                id
            },
            transaction
        });
    }

    public async updateAll(dto: UpdateDto | Partial<T>, where: WhereOptions, transaction?: Transaction): Promise<void> {
        await this.repository.update(dto, {
            where,
            transaction
        });
    }


    public async destroy(options?: DestroyOptions): Promise<void> {
        await this.repository.destroy(options);
    }

    public deleteWhere(options?: DestroyOptions): Promise<number> {
        return this.repository.destroy(options);
    }
}
