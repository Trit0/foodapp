import { DatabaseEntities } from "../../common/models/database-entities.model";
import { Column, ForeignKey, Table } from "sequelize-typescript";
import { Ingredients } from "../../ingredients/models/ingredients.model";
import { Accounts } from "../../accounts/models/account.model";

@Table
export class PantryItems extends DatabaseEntities {
  @Column
  @ForeignKey(() => Ingredients)
  public ingredientId: number;

  @Column
  @ForeignKey(() => Accounts)
  public accountId: number;

  @Column
  public itemCount: number;

  @Column
  public oldestEntry: Date;

  @Column
  public newestEntry: Date;
}
