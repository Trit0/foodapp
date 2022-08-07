import { DatabaseEntities } from "../../common/models/database-entities.model";
import { Column, ForeignKey, Table } from "sequelize-typescript";
import { Translation } from "../../../translations/models/translation.model";
import { DataTypes } from "sequelize";

@Table
export class Ingredients extends DatabaseEntities {
  @Column
  @ForeignKey(() => Ingredients)
  public duplicateOf: number;

  @Column(DataTypes.JSON)
  public name: Translation;

  @Column(DataTypes.JSON)
  public description: Translation;

  @Column(DataTypes.FLOAT)
  public averagePrice: number;

  @Column
  public averageLifespan: number;
}
