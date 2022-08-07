import { DatabaseRepository } from "../../common/repositories/database.repository";
import { IngredientSkus } from "../models/ingredient-skus.model";

export class IngredientSkusService extends DatabaseRepository<IngredientSkus> {
  constructor() {
    super(IngredientSkus);
  }

  public async findBySku(skuCode: string): Promise<IngredientSkus> {
    return this.findOne({
      where: {
        skuCode,
      },
    });
  }
}
