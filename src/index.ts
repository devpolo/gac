import { Argument } from "commander"

import { Commander } from "./libs"
import { TYPES } from "./constants"
import { TChoice } from "./types"

const program = new Commander().program

const HELP_TEXT = `
Types:
  ${greenColor("c")}hore:                              c message
  ${greenColor("d")}ocs:                               d message
  ${greenColor("f")}eat:                               f message
  ${greenColor("r")}efactor:                           r message
  ${greenColor("s")}tyle:                              s message
  ${greenColor("t")}est:                               t message
  fi${greenColor("x")}:                                x message

Options:
  -s, --scope <scope>                 optional scope
  -b, --body <body...>                optional body
  -bc, --breaking-change [bc...]      optional breaking change
  -h, --help                          display help for command

Examples:
  gac f create button 
  ${greenColor("equals to:")} git add -A && git commit -m "feat: create button"

  gac s add shadow -s button -bc
  ${greenColor(
    "equals to:"
  )} git add -A && git commit -m "style(button)!: add shadow"
`

const CHOICES: TChoice[] = TYPES.map((type) => type.choice)

program.addHelpText("after", HELP_TEXT)

program
  .addArgument(new Argument("[type]", "type case").choices(CHOICES))
  .argument("[descriptions...]")
  .option("-s, --scope <scope>", "optional scope")
  .option("-b, --body <body...>", "optional body")
  .option(
    "-bc, --breaking-change [breaking-change...]",
    "optional breaking change"
  )
  .action((type, descriptions) => {
    if (!type) return printError("no type")
    if (type && !descriptions?.length) return printError("no descriptions")

    const options = program.opts()

    console.log(options)

    let typeAndScope: string = ""
    let description: string = ""
    let res: string = ""
    let body: string = ""
    let breakingChange: string = ""

    TYPES.forEach((t) => {
      if (type === t.choice) {
        typeAndScope = t.name
      }
    })

    if (Array.isArray(descriptions) && descriptions) {
      description = descriptions.join(" ")
    }

    if (options?.scope) {
      typeAndScope = typeAndScope + `(${options.scope})`
    }

    if (options?.body) {
      if (Array.isArray(options.body) && options.body) {
        body = `\n\n${options.body.join(" ")}`
      }
    }

    if (options?.breakingChange) {
      if (Array.isArray(options.breakingChange) && options.breakingChange) {
        breakingChange = `\n\nBREAKING CHANGE: ${options.breakingChange.join(
          " "
        )}`
      }
    }

    res = `${typeAndScope}${
      options?.breakingChange ? "!" : ""
    }: ${description}${body}${breakingChange}`

    console.log(res)
  })

function printError(str: string) {
  process.stdout.write(`[ERROR]: \x1b[31m${str}\x1b[0m` + "\n")
  return process.exit(1)
}

function greenColor(str: string) {
  return `\x1b[32m${str}\x1b[0m`
}

program.configureOutput({
  // Visibly override write routines as example!
  // writeOut: (str) => process.stdout.write(`[OUTPUT] ${str}`),
  writeErr: (str) => process.stdout.write(`[ERROR] ${str}`),
  // Highlight errors in color.
  outputError: (str, write) => write(printError(str)),
})

program.parse(process.argv)
