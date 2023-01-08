import { DatabaseRepository } from "../../common/repositories/database.repository";
import { GroceryProducts } from "../models/grocery-products.model";

export class GroceryProductService extends DatabaseRepository<GroceryProducts> {
    constructor() {
        super(GroceryProducts);
    }

    public async findBySku(skuCode: string): Promise<GroceryProducts> {
        return await this.findOne({ where: {
            sku_code: skuCode
        }})
    }
}
