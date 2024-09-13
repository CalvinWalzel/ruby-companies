import { Link as InertiaLink, InertiaLinkProps } from "@inertiajs/react";

import { Button } from "@/components/ui/button";

interface Props extends InertiaLinkProps {}

function Link({ children, ...props }: Props) {
  return (
    <Button variant="link" asChild className="px-0 py-0">
      <InertiaLink {...props}>{children}</InertiaLink>
    </Button>
  );
}

export default Link;
