import type { CodegenConfig } from "@graphql-codegen/cli";
const config: CodegenConfig = {
  overwrite: true,
  schema: "http://dev-backend:4000",
  documents: ["src/graphql/*.ts"],
  generates: {
    "./src/graphql/generated/graphql-types.ts": {
      plugins: [
        "typescript",
        "typescript-operations",
        "typescript-graphql-request",
      ],
      config: {
        withHooks: true,
      },
    },
  },
};
export default config;
