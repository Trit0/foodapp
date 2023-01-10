import { PantryService } from "../services/pantry.service";
import { Controller, Get } from "@nestjs/common";
import { PantryItems } from "../models/pantry-items.model";

@Controller("pantry")
export class PantryController {
  constructor(private service: PantryService) {}

  @Get()
  public async getPantryItems(): Promise<PantryItems[]> {
    return this.service.getAllItems();
  }
}
