import { Command, Argument } from "commander"

import { TChoice } from "../types"
import { HELP_TEXT, TYPES } from "../constants"

import packageConfig from "../../../../package.json"

const CHOICES: TChoice[] = TYPES.map((type) => type.choice)

export class Commander extends Command {
  program: Command
  #actionType: string
  #actionDescriptions: string[]
  #type: string
  #scope: string
  #description: string
  #body: string
  #breakingChange: string

  constructor() {
    super()
    this.program = new Command()
    this.#actionType = ""
    this.#actionDescriptions = []
    this.#type = ""
    this.#scope = ""
    this.#description = ""
    this.#body = ""
    this.#breakingChange = ""
  }

  public init() {
    this.program.version(packageConfig.version)
    this.program
      .name(packageConfig.name)
      .usage("[type] [message...] [options] [options...]")
    this.program.configureHelp({
      visibleArguments: (cmd: Command) => [],
      visibleOptions: (cmd: Command) => [],
    })

    this.program.addHelpText("after", HELP_TEXT)

    this.program.configureOutput({
      // Visibly override write routines as example!
      // writeOut: (str) => process.stdout.write(`[OUTPUT] ${str}`),
      writeErr: (str) => process.stdout.write(`[ERROR] ${str}`),
      // Highlight errors in color.
      outputError: (str, write) => write(this.#onPrintError(str)),
    })

    this.program
      .addArgument(new Argument("[type]", "type case").choices(CHOICES))
      .argument("[descriptions...]")
      .option("-s, --scope <scope>", "optional scope")
      .option("-b, --body <body...>", "optional body")
      .option(
        "-bc, --breaking-change [breaking-change...]",
        "optional breaking change"
      )
      .option("-r, --reference <reference>", "optional reference")
      .action((type: string, descriptions: string[]) => {
        this.#actionType = type
        this.#actionDescriptions = descriptions

        this.#onMissingActions()

        // const options = this.program.opts()
        // console.log(options)
        // let typeAndScope: string = ""
        // let description: string = ""
        // let res: string = ""
        // let body: string = ""
        // let breakingChange: string = ""
        // TYPES.forEach((t) => {
        //   if (type === t.choice) {
        //     typeAndScope = t.name
        //   }
        // })
        // if (Array.isArray(descriptions) && descriptions) {
        //   description = descriptions.join(" ")
        // }
        // if (options?.scope) {
        //   typeAndScope = typeAndScope + `(${options.scope})`
        // }
        // if (options?.body) {
        //   if (Array.isArray(options.body) && options.body) {
        //     body = `\n\n${options.body.join(" ")}`
        //   }
        // }
        // if (options?.breakingChange) {
        //   if (Array.isArray(options.breakingChange) && options.breakingChange) {
        //     breakingChange = `\n\nBREAKING CHANGE: ${options.breakingChange.join(
        //       " "
        //     )}`
        //   }
        // }
        // res = `${typeAndScope}${
        //   options?.breakingChange ? "!" : ""
        // }: ${description}${body}${breakingChange}${
        //   options?.reference ? "\n\n#" + options?.reference : ""
        // }`
        // console.log(res)
      })

    this.program.parse(process.argv)
  }

  #onMissingActions() {
    if (!this.#actionType) return this.#onPrintError("no type")

    if (this.#actionType && !this.#actionDescriptions?.length)
      return this.#onPrintError("no descriptions")
  }

  #onPrintError(str: string) {
    process.stdout.write(`[ERROR]: \x1b[31m${str}\x1b[0m` + "\n")
    return process.exit(1)
  }
}
