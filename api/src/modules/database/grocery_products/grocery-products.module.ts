import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { Grocers } from "./models/grocers.model";
import { GroceryProducts } from "./models/grocery-products.model";
import { GroceryProductItems } from "./models/grocery-product-items.model";
import { GroceryProductController } from "./controllers/grocery-product.controller";
import { GroceryProductService } from "./services/grocery-product.service";

@Module({
    imports: [
        SequelizeModule.forFeature([Grocers, GroceryProducts, GroceryProductItems])
    ],
    controllers: [
        GroceryProductController
    ],
    providers: [
        GroceryProductService
    ]
})
export class GroceryProductsModule {}
