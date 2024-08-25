import { Technology } from "./technology";

export interface Company {
  id: number;
  name: string;
  website?: string;
  careersPage?: string;
  description?: string;
  technologies: Technology[];
}
