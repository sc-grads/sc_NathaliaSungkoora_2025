import eslintPluginReact from 'eslint-plugin-react';
import babelParser from '@babel/eslint-parser';

export default [
  {
    languageOptions: {
      parser: babelParser,
      parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        ecmaFeatures: {
          jsx: true,  // Enable JSX parsing
        },
      },
    },
    plugins: {
      react: eslintPluginReact, // Plugins are passed as an object, not an array
    },
    rules: {
      'react/react-in-jsx-scope': 'off', // React 17+ no longer requires this rule
      // Add any other rules you want to enable or modify here
    },
  },
  {
    // Include `eslint:recommended` config manually:
    rules: {
      'no-console': 'warn', // Example: Enabling recommended rules
      'no-unused-vars': 'warn',
    },
  },
  {
    // Include `plugin:react/recommended` config manually:
    rules: {
      'react/jsx-uses-react': 'warn', // Example: React-specific rules
      'react/jsx-uses-vars': 'warn',
    },
  },
];

