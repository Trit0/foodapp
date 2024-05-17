import { Router } from "express";

export class Controller {
    constructor(router: Router, route: string) {
        router.route(route).get(this.get).post(this.post);
    }

    protected get() {}

    protected post() {}
}