import Footer from "@/layouts/application/footer";
import Header from "@/layouts/application/header";

interface Props {
  children: React.ReactNode;
}

function Layout({ children }: Props) {
  return (
    <div className="min-h-screen bg-gray-100 flex flex-col">
      <Header />
      <main className="flex-grow">
        <div className="container mx-auto pt-5 pb-10">{children}</div>
      </main>
      <Footer />
    </div>
  );
}

Layout.displayName = "layouts/application";

export default Layout;
