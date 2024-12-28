import * as express from "express";
import { IngredientsService } from "../services/ingredients.service";

export class IngredientsController {
    private service = new IngredientsService();

    constructor(private router: express.Router) {
        this.router.route("/ingredient/:skuCode").get(this.findItemBySku.bind(this));
    }

    public async findItemBySku(req: express.Request, res: express.Response): Promise<void> {
        // const item = await this.service.findBySku(req.params["skuCode"]);
        // res.send(item).status(200).end();
    }
}
