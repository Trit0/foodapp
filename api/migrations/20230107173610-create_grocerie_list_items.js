"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "grocery_list_items", {
      grocery_product_id: migrationUtils.foreignKey(Sequelize, "grocery_products", true),
      grocery_product_item_id: migrationUtils.foreignKey(Sequelize, "grocery_product_items", true),
      home_id: migrationUtils.foreignKey(Sequelize, "homes"),
      name: {
        type: Sequelize.STRING,
        allowNull: false
      },
      item_count: Sequelize.INTEGER,
      notes: Sequelize.STRING
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("grocery_list_items");
  }
};
