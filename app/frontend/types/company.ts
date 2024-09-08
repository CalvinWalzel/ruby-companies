import { GeoFragment } from "./geo_fragment";
import { Technology } from "./technology";

export interface Company {
  id: number;
  slug: string;
  name: string;
  website?: string;
  careersPage?: string;
  description?: string;
  technologies: Technology[];
  address: {
    short: string;
    medium: string;
    full: string;
  };
  logoUrl?: string;
  continent: GeoFragment;
  country: GeoFragment;
  region: GeoFragment;
  city: GeoFragment;
}
