import { DATABASE_URL } from "$env/static/private";
import { drizzle } from "drizzle-orm/node-postgres";

export default drizzle(DATABASE_URL);