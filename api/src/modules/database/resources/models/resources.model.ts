import { DatabaseEntities } from "../../common/models/database-entities.model";
import { BelongsTo, Column, ForeignKey, Table } from "sequelize-typescript";
import { ResourceTypes } from "./resource-types.model";

@Table
export class Resources extends DatabaseEntities {
  @Column
  name: string;

  @Column
  path: string;

  @Column
  @ForeignKey(() => ResourceTypes)
  resourceTypeId: number;

  @BelongsTo(() => ResourceTypes)
  resourceType: ResourceTypes;
}
