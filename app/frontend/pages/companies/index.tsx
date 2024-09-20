import { ColumnDef } from "@tanstack/react-table";
import { useMemo } from "react";

import { DataTable } from "@/components/data_table";
import ExternalLink from "@/components/external_link";
import Link from "@/components/link";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

import type { Company } from "@/types/company";
import { CompanyFilter } from "@/types/company_filter";
import type { Option } from "@/types/fragments/option";
import type { PaginationData } from "@/types/pagination_data";

import CompanyFilters from "./_filters";

interface Props {
  companies: Company[];
  pagination: PaginationData;
  filters: CompanyFilter;
  options: {
    continents: Option[];
    countries: Option[];
    regions: Option[];
    cities: Option[];
  };
}

function Index({ companies, pagination, filters, options }: Props) {
  const columns: ColumnDef<Company>[] = useMemo(
    () => [
      {
        accessorKey: "name",
        header: "Name",
        cell: ({ row }) => (
          <Link href={`/companies/${row.original.slug}`}>
            {row.getValue("name")}
          </Link>
        ),
      },
      {
        accessorKey: "address.short",
        header: "Location",
      },
      {
        accessorKey: "website",
        header: "Website",
        cell: ({ row }) => {
          const website = row.getValue("website") as string | undefined;

          if (!website) return null;

          return <ExternalLink href={website}>{website}</ExternalLink>;
        },
      },
    ],
    [],
  );

  return (
    <Card>
      <CardHeader>
        <CardTitle>Companies</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="flex flex-col sm:flex-row flex-wrap gap-4 mb-6">
          <CompanyFilters filters={filters} options={options} />
        </div>

        <DataTable
          columns={columns}
          data={companies}
          pagination={{ ...pagination, only: ["companies", "pagination"] }}
        />
      </CardContent>
    </Card>
  );
}

Index.displayName = "companies/index";

export default Index;
