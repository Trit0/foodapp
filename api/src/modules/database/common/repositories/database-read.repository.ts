import { FindOptions, Identifier, WhereOptions } from "sequelize";
import { DatabaseEntities } from "../models/database-entities.model";

class E extends DatabaseEntities {}

export abstract class DatabaseReadRepository<T extends DatabaseEntities> {
    protected constructor(protected repository: typeof E) {}

    public findByPk(identifier: Identifier, options?: FindOptions): Promise<T> {
        return this.repository.findByPk(identifier, options) as unknown as Promise<T>;
    }

    public findOne(options?: FindOptions): Promise<T> {
        return this.repository.findOne(options) as unknown as Promise<T>;
    }

    public findAll(options?: FindOptions): Promise<T[]> {
        return this.repository.findAll(options) as unknown as Promise<T[]>;
    }

    public count(options?: FindOptions): Promise<number> {
        return this.repository.count(options);
    }
}
