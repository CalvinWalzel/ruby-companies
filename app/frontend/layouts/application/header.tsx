import { Search } from "lucide-react";

import Link from "@/components/link";
import { Input } from "@/components/ui/input";
import { Spinner } from "@/components/ui/spinner";

import { useResourceFilter } from "@/hooks/use_resource_filter";
import { CompanyFilter } from "@/types/company_filter";

function Header() {
  const { filter, setFilter, get, processing } =
    useResourceFilter<CompanyFilter>({
      name: undefined,
    });

  const Icon = processing ? Spinner : Search;

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    get("/companies", {
      preserveState: true,
      preserveScroll: true,
    });
  };

  return (
    <header className="bg-white shadow">
      <div className="container mx-auto py-6">
        <div className="flex flex-col sm:flex-row justify-between items-center">
          <Link
            href="/"
            className="text-3xl font-bold text-red-600 mb-4 sm:mb-0"
          >
            Ruby Companies
          </Link>
          <form onSubmit={handleSubmit} className="w-full sm:w-auto">
            <div className="relative ml-auto flex-1 md:grow-0">
              <Icon className="absolute left-2.5 top-3 h-4 w-4 text-muted-foreground" />
              <Input
                type="search"
                placeholder="Search..."
                className="w-full rounded-lg bg-background pl-8 md:w-[200px] lg:w-[336px]"
                value={filter.name}
                onChange={(event) => setFilter("name", event.target.value)}
                disabled={processing}
              />
            </div>
          </form>
        </div>
      </div>
    </header>
  );
}

Header.displayName = "layouts/application/header";

export default Header;
