"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "pantry_items", {
      grocery_product_id: migrationUtils.foreignKey(Sequelize, "grocery_products"),
      home_id: migrationUtils.foreignKey(Sequelize, "homes"),
      item_count: {
        type: Sequelize.INTEGER,
        defaultValue: 0
      },
      is_low: {
        type: Sequelize.BOOLEAN,
        defaultValue: false
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("pantry_items");
  }
};
