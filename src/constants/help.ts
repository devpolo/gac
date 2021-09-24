import { ANSIColor } from "../libs/color/classes/ANSIColor"

const color = new ANSIColor()

export const HELP_TEXT: string = `
Types:
  ${color.green("c")}hore:                              c message
  ${color.green("d")}ocs:                               d message
  ${color.green("f")}eat:                               f message
  ${color.green("r")}efactor:                           r message
  ${color.green("s")}tyle:                              s message
  ${color.green("t")}est:                               t message
  fi${color.green("x")}:                                x message

Options:
  -s, --scope <scope>                 optional scope
  -b, --body <body...>                optional body
  -bc, --breaking-change [bc...]      optional breaking change
  -b, --reference <reference...>      optional reference
  -h, --help                          display help for command

Examples:
  gac f create button 
  ${color.green("equals to:")} 
  ${color.green("|")} git add -A && git commit -m "feat: create button"

  gac f update button style -s button -b this button was incompatible with a certain context -bc remove color props
  ${color.green("equals to:")}
  ${color.green(
    "|"
  )} git add -A && git commit -m 'feat(button)!: update button style
  ${color.green("|")}
  ${color.green("|")} this button was incompatible with a certain context
  ${color.green("|")}
  ${color.green("|")} BREAKING CHANGE: remove color props'
`
