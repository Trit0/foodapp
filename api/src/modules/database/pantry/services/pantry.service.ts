import { PantryItems } from "../models/pantry-items.model";
import { DatabaseRepository } from "../../common/repositories/database.repository";

export class PantryService extends DatabaseRepository<PantryItems> {
  constructor() {
    super(PantryItems);
  }

  public async getAllItems(): Promise<PantryItems[]> {
    return this.findAll();
  }
}
