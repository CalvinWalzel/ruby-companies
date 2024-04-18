import { Link } from "@inertiajs/react";

function NotFound() {
  return (
    <div className="w-full h-dvh lg:grid lg:grid-cols-2">
      <div className="flex items-center justify-center py-12">
        <div className="mx-auto grid w-[350px] gap-6">
          <div className="grid gap-2 text-center">
            <h1 className="text-3xl font-bold">404 - Not Found</h1>
            <p className="text-balance text-muted-foreground">
              Try again on your <Link href="/">homepage</Link>
            </p>
          </div>
        </div>
      </div>
      <div className="hidden bg-muted lg:block" />
    </div>
  );
}

NotFound.displayName = "errors/not_found";

export default NotFound;
