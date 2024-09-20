import type { VisitOptions } from "@inertiajs/core";
import { useEffect, useState } from "react";

import type { ResourceFilterHookResult } from "./use_resource_filter";

export const useAutoApplyResourceFilter = <T extends object>(
  { filter, get }: ResourceFilterHookResult<T>,
  url: string,
  options?: VisitOptions,
) => {
  // We want to skip the first useEffect, since it triggers automatically on page load.
  const [isFirstRender, setIsFirstRender] = useState(true);

  useEffect(() => {
    if (isFirstRender) {
      setIsFirstRender(false);
      return;
    }

    get(url, options);

    // If we add the other dependencies it triggers an infinite loop.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filter]);
};
