import Link from "@/components/link";

function NotFound() {
  return (
    <div className="flex items-center justify-center h-screen">
      <div className="grid gap-2 text-center">
        <h1 className="text-3xl font-bold">404 - Not Found</h1>
        <p className="text-balance text-muted-foreground">
          Try again on the <Link href="/">homepage</Link>
        </p>
      </div>
    </div>
  );
}

NotFound.displayName = "errors/not_found";

export default NotFound;
