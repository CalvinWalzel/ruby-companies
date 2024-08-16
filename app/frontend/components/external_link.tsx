import { Link, type LucideProps } from "lucide-react";

interface Props {
  href: string;
  children: React.ReactNode;
  icon?: React.ForwardRefExoticComponent<
    Omit<LucideProps, "ref"> & React.RefAttributes<SVGSVGElement>
  >;
}

function ExternalLink({ href, children, icon }: Props) {
  const Icon = icon || Link;

  return (
    <div className="flex items-center">
      <Icon className="mr-1.5 h-5 w-5 flex-shrink-0 text-gray-400" />
      <a href={href} target="_blank" rel="noopener noreferrer">
        {children}
      </a>
    </div>
  );
}

export default ExternalLink;
