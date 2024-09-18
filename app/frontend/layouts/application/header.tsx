import { useForm, usePage } from "@inertiajs/react";
import { Search } from "lucide-react";

import Link from "@/components/link";
import { Input } from "@/components/ui/input";
import { Spinner } from "@/components/ui/spinner";

function Header() {
  const { props } = usePage();

  const { data, setData, get, processing } = useForm({
    q: (props.q as string) || "",
  });

  const handleSearch = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    get("/companies", {
      preserveState: true,
      preserveScroll: true,
    });
  };

  const Icon = processing ? Spinner : Search;

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
          <form onSubmit={handleSearch} className="w-full sm:w-auto">
            <div className="relative ml-auto flex-1 md:grow-0">
              <Icon className="absolute left-2.5 top-3 h-4 w-4 text-muted-foreground" />
              <Input
                type="search"
                placeholder="Search..."
                className="w-full rounded-lg bg-background pl-8 md:w-[200px] lg:w-[336px]"
                value={data.q}
                onChange={(event) => setData("q", event.target.value)}
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
