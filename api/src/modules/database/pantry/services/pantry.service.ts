import { PantryItems } from "../models/pantry-items.model";
import { DatabaseRepository } from "../../common/repositories/database.repository";
import { Injectable } from "@nestjs/common";

@Injectable()
export class PantryService extends DatabaseRepository<PantryItems> {
    constructor() {
        super(PantryItems);
    }

    public async findAllItems(): Promise<PantryItems[]> {
        const pantryItems = await this.findAll({
            include: ["groceryProduct", "home"]
        });

        pantryItems.forEach((p) => console.log(p.toJSON()));
        return pantryItems;
    }
}
