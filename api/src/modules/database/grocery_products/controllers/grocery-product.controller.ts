import * as express from "express";
import { GroceryProductService } from "../services/grocery-product.service";

export class GroceryProductController {
    private service = new GroceryProductService();

    constructor(private router: express.Router) {
        this.router
            .route("/grocery-product/sku")
            .get(this.findItemBySku.bind(this));
    }

    public async findItemBySku(
        req: express.Request,
        res: express.Response
    ): Promise<void> {
        const item = await this.service.findBySku(req.query["skuCode"] as string);
        console.log(item);
        res.send(item).status(200).end();
    }
}
