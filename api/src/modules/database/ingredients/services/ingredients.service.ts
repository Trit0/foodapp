import { DatabaseRepository } from "../../common/repositories/database.repository";
import { Ingredients } from "../models/ingredients.model";

export class IngredientsService extends DatabaseRepository<Ingredients> {
    constructor() {
        super(Ingredients);
    }
}
