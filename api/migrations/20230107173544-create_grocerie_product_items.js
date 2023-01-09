"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "grocery_product_items", {
      grocery_product_id: migrationUtils.foreignKey(Sequelize, "grocery_products"),
      grocer_id: migrationUtils.foreignKey(Sequelize, "grocers"),
      price: Sequelize.DOUBLE
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("grocery_product_items");
  }
};
