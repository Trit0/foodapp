import { DatabaseEntities } from "../../common/models/database-entities.model";
import { Column, Table } from "sequelize-typescript";
import { Translation } from "../../../translations/models/translation.model";
import { DataTypes } from "sequelize";

@Table
export class IngredientTypes extends DatabaseEntities {
  @Column(DataTypes.JSON)
  public name: Translation;

  @Column(DataTypes.JSON)
  public description: Translation;
}
