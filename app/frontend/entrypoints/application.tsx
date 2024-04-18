import { createInertiaApp } from "@inertiajs/react";
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";

import NotFoundPage from "@/pages/errors/not_found";

import "@/stylesheets/globals.css";

createInertiaApp({
  resolve: (name) => {
    const pages = import.meta.glob("../pages/**/*.tsx", { eager: true });
    const page = pages[`../pages/${name}.tsx`];

    if (page) return page;

    return NotFoundPage;
  },
  setup({ el, App, props }) {
    createRoot(el).render(
      <StrictMode>
        <App {...props} />
      </StrictMode>,
    );
  },
});
