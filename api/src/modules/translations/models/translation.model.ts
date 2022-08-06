import { Languages } from "../languages.enum";

export type Translation = {
    [key in Languages]?: string;
}