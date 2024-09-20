import Combobox from "@/components/combobox";

import { useAutoApplyResourceFilter } from "@/hooks/use_auto_apply_resource_filter";
import { useResourceFilter } from "@/hooks/use_resource_filter";
import { CompanyFilter } from "@/types/company_filter";
import type { Option } from "@/types/fragments/option";

interface Props {
  filters: CompanyFilter;
  options: {
    continents: Option[];
    countries: Option[];
    regions: Option[];
    cities: Option[];
  };
}

function Filters({ filters, options }: Props) {
  const resourceFilter = useResourceFilter<CompanyFilter>({
    continent: filters.continent,
    country: filters.country,
    region: filters.region,
    city: filters.city,
  });
  useAutoApplyResourceFilter(resourceFilter, "/companies", {
    preserveState: true,
    preserveScroll: true,
    only: ["companies", "pagination", "options"],
  });
  const { filter, setFilter } = resourceFilter;

  const handleSetContinentFilter = (value: string) => {
    setFilter("continent", value);
    setFilter("country", "");
    setFilter("region", "");
    setFilter("city", "");
  };

  const handleSetCountryFilter = (value: string) => {
    setFilter("country", value);
    setFilter("region", "");
    setFilter("city", "");
  };

  const handleSetRegionFilter = (value: string) => {
    setFilter("region", value);
    setFilter("city", "");
  };
  const handleSetCityFilter = (value: string) => {
    setFilter("city", value);
  };

  return (
    <>
      <Combobox
        options={options.continents}
        value={filter.continent}
        onChange={handleSetContinentFilter}
        placeholder="Continent"
        emptyMessage="No continents found."
        searchPlaceholder="Search continents..."
      />
      <Combobox
        options={options.countries}
        value={filter.country}
        onChange={handleSetCountryFilter}
        placeholder="Country"
        emptyMessage="No countries found."
        searchPlaceholder="Search countries..."
        disabled={!filter.continent}
      />
      <Combobox
        options={options.regions}
        value={filter.region}
        onChange={handleSetRegionFilter}
        placeholder="Region"
        emptyMessage="No regions found."
        searchPlaceholder="Search regions..."
        disabled={!filter.country}
      />
      <Combobox
        options={options.cities}
        value={filter.city}
        onChange={handleSetCityFilter}
        placeholder="City"
        emptyMessage="No cities found."
        searchPlaceholder="Search cities..."
        disabled={!filter.region}
      />
    </>
  );
}

Filters.displayName = "companies/_filters";

export default Filters;
