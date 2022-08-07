import { DatabaseEntities } from "../../common/models/database-entities.model";
import { Column, ForeignKey, Table } from "sequelize-typescript";
import { DataTypes } from "sequelize";
import { Ingredients } from "./ingredients.model";

@Table
export class IngredientSkus extends DatabaseEntities {
  @Column
  @ForeignKey(() => Ingredients)
  public ingredientId: number;

  @Column
  public skuCode: string;

  @Column(DataTypes.JSON)
  public skuMetadata: object;
}
