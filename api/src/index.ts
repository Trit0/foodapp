import * as express from "express";
import session from 'express-session';
import * as router from './router';
import * as csurf from 'csurf';
import * as cookieParser from 'cookie-parser';
import { db } from "./models";
import { dbModels } from "./modules/database/database.module";

const app = express();
app.use(express.json());

app.use(cookieParser());
app.use(csurf({cookie: true}), function(req, res, next) {
    res.cookie('XSRF-TOKEN', req.csrfToken(), { httpOnly: false });
    next();
});

app.use(router);

db.sequelize.addModels(dbModels);
db.sequelize.sync();

app.listen(3000);
