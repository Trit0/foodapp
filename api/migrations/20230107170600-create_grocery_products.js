"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "grocery_products", {
      ingredient_id: migrationUtils.foreignKey(Sequelize, "ingredients", true),
      duplicate_of_grocery_product_id: migrationUtils.foreignKey(Sequelize, "grocery_products", true),
      name: {
        type: Sequelize.JSON,
        allowNull: false
      },
      description: Sequelize.JSON,
      sku_code: Sequelize.STRING,
      average_price: Sequelize.DOUBLE,
      average_lifespan_days: Sequelize.INTEGER,
      image_path: Sequelize.STRING,
      product_metadata: Sequelize.JSON
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("grocery_products");
  }
};
