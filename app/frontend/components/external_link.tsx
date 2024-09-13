import { Link as LinkIcon, type LucideProps } from "lucide-react";

import { Button } from "@/components/ui/button";

interface Props {
  href: string;
  children: React.ReactNode;
  icon?: React.ForwardRefExoticComponent<
    Omit<LucideProps, "ref"> & React.RefAttributes<SVGSVGElement>
  >;
}

function ExternalLink({ href, children, icon }: Props) {
  const Icon = icon || LinkIcon;

  return (
    <div className="flex items-center">
      <Icon className="mr-1.5 h-5 w-5 flex-shrink-0 text-gray-400" />

      <Button variant="link" asChild className="px-0 py-0">
        <a href={href} target="_blank" rel="noopener noreferrer">
          {children}
        </a>
      </Button>
    </div>
  );
}

export default ExternalLink;
