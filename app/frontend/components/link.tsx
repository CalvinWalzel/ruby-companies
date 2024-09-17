import { Link as InertiaLink, InertiaLinkProps } from "@inertiajs/react";

import { Button } from "@/components/ui/button";

import { cn } from "@/utils/ui";

interface Props extends InertiaLinkProps {}

function Link({ children, className, ...props }: Props) {
  return (
    <Button variant="link" asChild className={cn("px-0", "py-0", className)}>
      <InertiaLink {...props}>{children}</InertiaLink>
    </Button>
  );
}

export default Link;
