import { Resources } from "./resources/models/resources.model";
import { ResourceTypes } from "./resources/models/resource-types.model";
import { Ingredients } from "./ingredients/models/ingredients.model";
import { IngredientCategories } from "./ingredients/models/ingredient-categories.model";
import { PantryItems } from "./pantry/models/pantry-items.model";
import { Accounts } from "./accounts/models/accounts.model";
import { DatabaseEntities } from "./common/models/database-entities.model";
import { Homes } from "./accounts/models/home.model";
import { HomesAccounts } from "./accounts/models/homes-accounts.model";
import { Grocers } from "./grocery_products/models/grocers.model";
import { GroceryProducts } from "./grocery_products/models/grocery-products.model";
import { GroceryProductItems } from "./grocery_products/models/grocery-product-items.model";
import { IngredientsIngredientCategories } from "./ingredients/models/ingredients-ingredient-categories.model";

export const dbModels: typeof DatabaseEntities[] = [
    Ingredients,
    IngredientCategories,
    IngredientsIngredientCategories,
    PantryItems,
    Accounts,
    Homes,
    HomesAccounts,
    Grocers,
    GroceryProducts,
    GroceryProductItems
];
