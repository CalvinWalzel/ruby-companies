import { defineConfig } from "vite";
import RubyPlugin from "vite-plugin-ruby";
import ReactPlugin from "@vitejs/plugin-react";
import path from "path";

export default defineConfig({
  plugins: [RubyPlugin(), ReactPlugin()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./app/frontend"),
    },
  },
});
