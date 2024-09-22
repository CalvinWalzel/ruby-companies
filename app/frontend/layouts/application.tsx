import Footer from "@/layouts/application/footer";

interface Props {
  children: React.ReactNode;
}

function Layout({ children }: Props) {
  return (
    <div className="min-h-screen bg-gray-100">
      <header className="bg-white shadow">
        <div className="container mx-auto py-6">
          <h1 className="text-3xl font-bold text-red-600">Ruby Companies</h1>
        </div>
      </header>
      <main>
        <div className="container mx-auto pt-5 pb-10">{children}</div>
      </main>
      <Footer />
    </div>
  );
}

Layout.displayName = "layouts/application";

export default Layout;
