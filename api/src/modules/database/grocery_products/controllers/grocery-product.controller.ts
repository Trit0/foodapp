import { GroceryProductService } from "../services/grocery-product.service";
import { Controller, Get, Query } from "@nestjs/common";
import { GroceryProducts } from "../models/grocery-products.model";

@Controller("grocery-product")
export class GroceryProductController {
    constructor(private service: GroceryProductService) {}

    @Get()
    public async findItemBySku(@Query("sku") skuCode: string): Promise<GroceryProducts> {
        return this.service.findBySku(skuCode);
    }
}
