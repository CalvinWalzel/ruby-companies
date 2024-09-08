import shopifyEslintPlugin from "@shopify/eslint-plugin";

const eslintConfig = [
  {
    ignores: ["**/vite.config.ts", "**/tailwind.config.js"],
  },
  ...shopifyEslintPlugin.configs.typescript,
  ...shopifyEslintPlugin.configs["typescript-type-checking"],
  ...shopifyEslintPlugin.configs.react,
  ...shopifyEslintPlugin.configs.prettier,
  {
    languageOptions: {
      parserOptions: {
        project: "tsconfig.json",
      },
    },
    rules: {
      "@shopify/jsx-no-hardcoded-content": "off",
      "react/react-in-jsx-scope": "off",
      "import/order": "off",
    },
  },
];

export default eslintConfig;
