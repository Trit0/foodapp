import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { PantryItems } from "./models/pantry-items.model";
import { PantryController } from "./controllers/pantry.controller";
import { PantryService } from "./services/pantry.service";

@Module({
    imports: [
        SequelizeModule.forFeature([PantryItems])
    ],
    controllers: [
        PantryController
    ],
    providers: [
        PantryService
    ]
})
export class PantryModule {}
