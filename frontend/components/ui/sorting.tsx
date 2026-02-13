"use client"

import { ArrowDown, ArrowUp, ArrowUpDown } from "lucide-react";
import { cn } from "@/lib/utils";

export type SortDirection = "asc" | "desc";

function SortingIcon({
  active,
  direction,
  className
}: {
  active: boolean
  direction: SortDirection
  className?: string
}) {
  if (!active) {
    return <ArrowUpDown className={cn("h-4 w-4 opacity-60 shrink-0", className)} />
  }

  return direction === "asc" ? (
    <ArrowUp className={cn("h-4 w-4 shrink-0", className)} />
  ) : (
    <ArrowDown className={cn("h-4 w-4 shrink-0", className)} />
  )
}

export { SortingIcon };
