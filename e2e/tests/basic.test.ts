import { expect, test } from "@playwright/test";
import * as dotenv from "dotenv";
dotenv.config();

test("Go to home page", async ({ page }) => {
  await page.goto(process.env.WEBSITE_URL);

  await page.waitForLoadState("networkidle");
  await expect(page.getByText("Tous les utilisateurs")).toBeVisible();
});
