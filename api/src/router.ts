import * as express from "express";
import { IngredientsController } from "./modules/database/ingredients/controllers/ingredients.controller";
import { PantryController } from "./modules/database/pantry/controllers/pantry.controller";
import { GroceryProductController } from "./modules/database/grocery_products/controllers/grocery-product.controller";

export const router = express.Router();

router.route("/").get((req, res) => {
  res.status(200).json({ version: 1 }).end();
});

new PantryController(router);
new IngredientsController(router);
new GroceryProductController(router);
