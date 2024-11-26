import { BriefcaseBusiness } from "lucide-react";

import ExternalLink from "@/components/external_link";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";

import type { Company } from "@/types/company";

interface Props {
  company: Company;
}

function Show({ company }: Props) {
  const technologies = company.technologies.map((technology) => (
    <Badge
      key={technology.id}
      style={{
        backgroundColor: technology.backgroundColor,
        color: technology.textColor,
      }}
    >
      {technology.name}
    </Badge>
  ));

  return (
    <div className="container mx-auto py-10">
      <img src={company.logoUrl} />
      <h1 className="my-4 text-xl font-bold">{company.name}</h1>
      <div className="flex space-x-4 my-8">
        {company.website && (
          <ExternalLink href={company.website}>Website</ExternalLink>
        )}
        {company.careersPage && (
          <ExternalLink href={company.careersPage} icon={BriefcaseBusiness}>
            Careers
          </ExternalLink>
        )}
      </div>
      <dl className="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-2">
        <div className="sm:col-span-1">
          <dt className="font-bold">Location</dt>
          <dd className="mt-1">{company.address.medium}</dd>
        </div>
        <div className="sm:col-span-1">
          <dt className="font-bold">Work Arrangements</dt>
          <dd className="mt-1">
            <span>Not specified</span>
          </dd>
        </div>
        <div className="sm:col-span-2">
          <dt className="font-bold">Stack</dt>
          <dd className="mt-1 flex space-x-2">{technologies}</dd>
        </div>
      </dl>
      <Separator className="my-4" />
      <p>{company.description}</p>
    </div>
  );
}

Show.displayName = "companies/show";

export default Show;
