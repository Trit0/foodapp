import { Resources } from "./resources/models/resources.model";
import { ResourceTypes } from "./resources/models/resource-types.model";
import { Ingredients } from "./ingredients/models/ingredients.model";
import { IngredientSkus } from "./ingredients/models/ingredient-skus.model";
import { IngredientTypes } from "./ingredients/models/ingredient-types.model";
import { PantryItems } from "./pantry/models/pantry-items.model";
import { Accounts } from "./accounts/models/account.model";
import { DatabaseEntities } from "./common/models/database-entities.model";

export const dbModels: typeof DatabaseEntities[] = [
  Ingredients,
  IngredientSkus,
  IngredientTypes,
  PantryItems,
  Accounts,
];
