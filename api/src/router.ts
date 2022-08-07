import * as express from "express";
import { IngredientsController } from "./modules/database/ingredients/controllers/ingredients.controller";
import { PantryController } from "./modules/database/pantry/controllers/pantry.controller";

export const router = express.Router();

router.route("/").get((req, res) => {
  res.status(200).json({ version: 1 }).end();
});

new PantryController(router);
new IngredientsController(router);
