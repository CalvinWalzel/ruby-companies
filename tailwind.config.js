/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.{html,md,liquid,erb,serb,rb}',
    './frontend/javascript/**/*.js',
    './src/_data/stacks.yml',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
