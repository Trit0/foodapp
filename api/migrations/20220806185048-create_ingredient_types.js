"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "ingredient_types", {
      name: {
        type: Sequelize.JSON,
        allowNull: false
      },
      description: {
        type: Sequelize.JSON
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("ingredient_types");
  }
};
