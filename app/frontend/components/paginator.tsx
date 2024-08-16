import { router } from "@inertiajs/react";
import { useCallback, useMemo } from "react";

import {
  PaginationContent,
  PaginationEllipsis,
  PaginationItem,
  PaginationLink,
  PaginationNext,
  PaginationPrevious,
  Pagination as ShadcnPagination,
} from "@/components/ui/pagination";

import type { PaginationData } from "@/types/pagination_data";

export interface Props extends PaginationData {
  only?: string[];
}

export function Paginator(props: Props) {
  const { scaffoldUrl, page, pages, prev, next, only } = props;

  const previousClassName = useMemo(
    () => (prev ? "" : "pointer-events-none opacity-50"),
    [prev],
  );
  const nextClassName = useMemo(
    () => (next ? "" : "pointer-events-none opacity-50"),
    [next],
  );

  const getUrl = useCallback(
    (newPage: number) =>
      scaffoldUrl.replace("__pagy_page__", newPage.toString()),
    [scaffoldUrl],
  );

  const getHref = useCallback(
    (newPage: number | null) => (newPage ? getUrl(newPage) : "#"),
    [getUrl],
  );

  const visitOptions = useMemo(
    () => ({
      preserveState: true,
      preserveScroll: true,
      ...(only ? { only } : {}),
    }),
    [only],
  );

  const handleVisit = useCallback(
    (event: React.MouseEvent<HTMLAnchorElement>, newPage: number | null) => {
      event.preventDefault();

      if (newPage === null) return;

      const url = getUrl(newPage);
      router.visit(url, visitOptions);
    },
    [getUrl, visitOptions],
  );

  const renderPageLinks = () => {
    const pageLinks = [];
    const maxVisiblePages = 5;

    let startPage = Math.max(1, page - Math.floor(maxVisiblePages / 2));
    const endPage = Math.min(pages, startPage + maxVisiblePages - 1);

    if (endPage - startPage + 1 < maxVisiblePages) {
      startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }

    if (startPage > 1) {
      pageLinks.push(
        <PaginationItem key="ellipsis-start">
          <PaginationEllipsis />
        </PaginationItem>,
      );
    }

    for (let index = startPage; index <= endPage; index++) {
      pageLinks.push(
        <PaginationItem key={index}>
          <PaginationLink
            href={getHref(index)}
            onClick={(event) => handleVisit(event, index)}
            isActive={index === page}
          >
            {index}
          </PaginationLink>
        </PaginationItem>,
      );
    }

    if (endPage < pages) {
      pageLinks.push(
        <PaginationItem key="ellipsis-end">
          <PaginationEllipsis />
        </PaginationItem>,
      );
    }

    return pageLinks;
  };

  return (
    <ShadcnPagination>
      <PaginationContent>
        <PaginationItem>
          <PaginationPrevious
            href={getHref(prev)}
            onClick={(event) => handleVisit(event, prev)}
            className={previousClassName}
          />
        </PaginationItem>
        {renderPageLinks()}
        <PaginationItem>
          <PaginationNext
            href={getHref(next)}
            onClick={(event) => handleVisit(event, next)}
            className={nextClassName}
          />
        </PaginationItem>
      </PaginationContent>
    </ShadcnPagination>
  );
}
