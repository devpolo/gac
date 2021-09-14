export type TTypeName =
  | "chore"
  | "docs"
  | "feat"
  | "refactor"
  | "style"
  | "test"
  | "fix"
export type TChoice = "c" | "d" | "f" | "r" | "s" | "t" | "x"

export type TType = {
  name: TTypeName
  choice: TChoice
}
