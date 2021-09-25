import { Command, Argument } from "commander"

import { TChoice } from "../types"
import { HELP_TEXT, TYPES } from "../constants"
import { Shell } from "../../shelljs"

import packageConfig from "../../../../package.json"

const CHOICES: TChoice[] = TYPES.map((type) => type.choice)

export class GitAddCommit extends Shell {
  program: Command
  options: any
  message: string

  #actionType: string
  #actionDescriptions: string[]

  #type: string
  #scope: string
  #description: string
  #body: string
  #breakingChange: string
  #reference: string

  constructor() {
    super()
    this.program = new Command()
    this.options = this.program.opts()
    this.message = ""

    this.#actionType = ""
    this.#actionDescriptions = []

    this.#type = ""
    this.#scope = ""
    this.#description = ""
    this.#body = ""
    this.#breakingChange = ""
    this.#reference = ""
  }

  public execute() {
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

        this.#onMissingActionParams()
        this.#setType()
        this.#setDescription()
        this.#setScope()
        this.#setBody()
        this.#setBreakingChange()
        this.#setReference()

        this.#setOutput()

        this.#commit()

        console.log(this.message)
      })

    this.program.parse(process.argv)
  }

  #onMissingActionParams(): void {
    if (!this.#actionType) return this.#onPrintError("no type")

    if (this.#actionType && !this.#actionDescriptions?.length)
      return this.#onPrintError("no descriptions")
  }

  #setType(): string {
    TYPES.forEach((type) => {
      if (this.#actionType === type.choice) {
        this.#type = type.name
      }
    })
    return this.#type
  }

  #setDescription(): string {
    if (!this.#isEmptyArray(this.#actionDescriptions)) {
      this.#description = this.#actionDescriptions.join(" ")
    }
    return this.#description
  }

  #setScope(): string {
    if (this.options?.scope) {
      this.#scope = `(${this.options.scope})`
    }
    return this.#scope
  }

  #setBody(): string {
    if (!this.#isEmptyArray(this.options?.body)) {
      this.#body = `\n\n${this.options.body.join(" ")}`
    }
    return this.#body
  }

  #setBreakingChange(): string {
    if (this.options?.breakingChange) {
      if (!this.#isEmptyArray(this.options?.breakingChange)) {
        this.#breakingChange = `\n\nBREAKING CHANGE: ${this.options.breakingChange.join(
          " "
        )}`
      }
    }
    return this.#breakingChange
  }

  #setReference(): string {
    if (this.options?.reference) {
      this.#reference = `\n\n#${this.options.reference}`
    }

    return this.#reference
  }

  #setOutput(): string {
    const exclamationPoint: string = this.options?.breakingChange ? "!" : ""

    this.message = `${this.#type}${this.#scope}${exclamationPoint}: ${
      this.#description
    }${this.#body}${this.#breakingChange}${this.#reference}`

    return this.message
  }

  #commit() {
    this.which("git")
    this.exec(`git add -A`)
    this.exec(`git commit -m "${this.message}"`)
  }

  #isEmptyArray(item?: string[]) {
    return !Array.isArray(item) || !item?.length
  }

  #onPrintError(str: string) {
    process.stdout.write(`[ERROR]: \x1b[31m${str}\x1b[0m` + "\n")
    return process.exit(1)
  }
}
