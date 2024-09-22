import ExternalLink from "@/components/external_link";
import { Button } from "@/components/ui/button";

import githubImage from "@/images/brands/github.svg";

function Footer() {
  return (
    <footer className="bg-background border-t">
      <div className="container mx-auto py-4 px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center space-y-4 sm:space-y-0">
          <div className="flex flex-row items-center space-x-2">
            <Button variant="ghost" size="icon" asChild className="p-0 h-auto">
              <a
                href="https://github.com/CalvinWalzel/ruby-companies"
                target="_blank"
                rel="noopener noreferrer"
              >
                <img src={githubImage} alt="GitHub" className="w-5 h-5 m-0" />
                <span className="sr-only">GitHub repository</span>
              </a>
            </Button>
            <div className="text-sm text-muted-foreground">
              created by Calvin Walzel & Gitta van der Pol
            </div>
          </div>
          <div className="flex items-center space-x-4">
            <span className="text-sm text-muted-foreground flex items-center">
              sponsored by{" "}
              <ExternalLink
                href="https://avohq.io"
                className="ml-1"
                icon={null}
              >
                AvoHQ
              </ExternalLink>
            </span>
          </div>
        </div>
      </div>
    </footer>
  );
}

Footer.displayName = "layouts/application/footer";

export default Footer;
