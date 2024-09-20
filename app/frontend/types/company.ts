import { GeoFragment } from "./fragments/geo";
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
  continent: GeoFragment;
  country: GeoFragment;
  region: GeoFragment;
  city: GeoFragment;
}
