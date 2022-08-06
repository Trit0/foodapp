import { DatabaseEntities } from "../../common/models/database-entities.model";
import { BelongsTo, Column, HasMany, Table } from "sequelize-typescript";
import { Resources } from "./resources.model";

@Table
export class ResourceTypes extends DatabaseEntities {
    @Column
    name: string;

    @Column
    description: string;

    @HasMany(() => Resources)
    resources: Resources[]
}