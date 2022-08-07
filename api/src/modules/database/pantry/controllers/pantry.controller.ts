import * as express from "express";
import { PantryService } from "../services/pantry.service";

export class PantryController {
  private service = new PantryService();

  constructor(private router: express.Router) {
    this.router.route("/pantry").get(this.getPantryItems.bind(this));
    this.router.route("/pantry/:skuCode").get();
  }

  public async getPantryItems(
    req: express.Request,
    res: express.Response
  ): Promise<void> {
    const items = await this.service.getAllItems();
    res.send(items).status(200).end();
  }

  public async findItemBySku(
    req: express.Request,
    res: express.Response
  ): Promise<void> {
    
  }
}
