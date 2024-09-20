import type { VisitOptions } from "@inertiajs/core";
import { useForm } from "@inertiajs/react";

export interface ResourceFilterHookResult<T extends object> {
  filter: T;
  setFilter: (key: keyof T, value: string) => void;
  get: (url: string, options?: VisitOptions) => void;
  processing: boolean;
  isDirty: boolean;
}

export const useResourceFilter = <T extends object>(initialState: T) => {
  const { data, setData, get, processing, isDirty } = useForm({
    filter: initialState,
  });

  const setFilter = (key: keyof T, value: string) => {
    const cleanedValue = value.trim() === "" ? undefined : value;
    setData((prevData) => ({
      filter: { ...prevData.filter, [key]: cleanedValue },
    }));
  };

  return {
    filter: data.filter as T,
    setFilter,
    get,
    processing,
    isDirty,
  };
};
