"use strict";

const migrationUtils = require("./common/migration.utils");

module.exports = {
  async up (queryInterface, Sequelize) {
    return migrationUtils.createDatabaseEntity(queryInterface, Sequelize, "homes_accounts", {
      account_id: migrationUtils.foreignKey(Sequelize, "accounts"),
      home_id: migrationUtils.foreignKey(Sequelize, "homes"),
      is_admin: {
        type: Sequelize.BOOLEAN,
        defaultValue: false
      }
    })
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable("homes_accounts");
  }
};
