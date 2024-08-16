import { BriefcaseBusiness } from "lucide-react";

import ExternalLink from "@/components/external_link";
import { Separator } from "@/components/ui/separator";

import type { Company } from "@/types/company";

interface Props {
  company: Company;
}

function Show({ company }: Props) {
  return (
    <div className="container mx-auto py-10">
      <h1 className="my-4 text-xl font-bold">{company.name}</h1>
      <div className="flex space-x-4">
        {company.website && (
          <ExternalLink href={company.website}>Website</ExternalLink>
        )}
        {company.careersPage && (
          <ExternalLink href={company.careersPage} icon={BriefcaseBusiness}>
            Careers
          </ExternalLink>
        )}
      </div>
      <Separator className="my-4" />
      <p>{company.description}</p>
    </div>
  );
}

Show.displayName = "companies/show";

export default Show;
