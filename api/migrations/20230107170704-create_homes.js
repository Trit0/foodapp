"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "homes", {
      owner_account_id: migrationUtils.foreignKey(Sequelize, "accounts"),
      name: {
        type: Sequelize.STRING,
        allowNull: false
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("homes");
  }
};
