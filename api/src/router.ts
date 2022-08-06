import * as express from "express";
const router = express.Router();

router.route("/").get((req, res) => {
  res.status(200).json({ version: 1 }).end();
});

module.exports = router;
