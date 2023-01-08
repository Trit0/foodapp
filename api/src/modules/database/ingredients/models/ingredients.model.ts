import { DatabaseEntities } from "../../common/models/database-entities.model";
import { AllowNull, BelongsTo, Column, ForeignKey, Table } from "sequelize-typescript";
import { Translation } from "../../../translations/models/translation.model";
import { DataTypes } from "sequelize";

@Table
export class Ingredients extends DatabaseEntities {
  @Column
  @ForeignKey(() => Ingredients)
  public variationOfIngredientId: number;

  @AllowNull(false)
  @Column(DataTypes.JSON)
  public name: Translation;

  @Column(DataTypes.JSON)
  public description: Translation;

  @Column
  public imagePath: string;

  @BelongsTo(() => Ingredients)
  public variationOfIngredient: Ingredients;
}
