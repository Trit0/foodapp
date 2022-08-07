import { DatabaseRepository } from "../../common/repositories/database.repository";
import { Ingredients } from "../models/ingredients.model";
import { IngredientSkusService } from "./ingredients-skus.service";

export class IngredientsService extends DatabaseRepository<Ingredients> {
  private ingredientSkuService = new IngredientSkusService();

  constructor() {
    super(Ingredients);
  }

  public async findBySku(skuCode: string): Promise<Ingredients> {
    const ingredientSku = await this.ingredientSkuService.findBySku(skuCode);
    if (!ingredientSku) return null;

    return this.findByPk(ingredientSku.ingredientId);
  }
}
