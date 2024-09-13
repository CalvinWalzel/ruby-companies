import { ColumnDef } from "@tanstack/react-table";
import { useMemo } from "react";

import { DataTable } from "@/components/data_table";
import ExternalLink from "@/components/external_link";
import Link from "@/components/link";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

import type { Company } from "@/types/company";
import type { PaginationData } from "@/types/pagination_data";

interface Props {
  companies: Company[];
  pagination: PaginationData;
}

function Index({ companies, pagination }: Props) {
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
