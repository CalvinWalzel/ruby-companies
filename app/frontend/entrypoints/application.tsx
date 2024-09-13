import { createInertiaApp } from "@inertiajs/react";
import { StrictMode } from "react";
import { createRoot } from "react-dom/client";

import NotFoundPage from "@/pages/errors/not_found";

import Layout from "@/layouts/application";
import "@/stylesheets/globals.css";

createInertiaApp({
  resolve: (name) => {
    const pages = import.meta.glob("../pages/**/*.tsx", {
      eager: true,
    });
    const page = pages[`../pages/${name}.tsx`] as any;

    if (!page) {
      return { default: NotFoundPage };
    }

    page.default.layout =
      page.default.layout || ((page: any) => <Layout>{page}</Layout>);

    return page;
  },
  setup({ el, App, props }) {
    createRoot(el).render(
      <StrictMode>
        <App {...props} />
      </StrictMode>,
    );
  },
});
