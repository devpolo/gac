import { Command, Argument } from "commander"

import { TChoice } from "../../../types"
import { HELP_TEXT, TYPES } from "../../../constants"

import packageConfig from "../../../../package.json"

const CHOICES: TChoice[] = TYPES.map((type) => type.choice)

export class Commander extends Command {
  program: Command

  constructor() {
    super()
    this.program = new Command()
    this.#init()
  }

  #init() {
    this.program.version(packageConfig.version)
    this.program
      .name(packageConfig.name)
      .usage("[type] [message...] [options] [options...]")
    this.program.configureHelp({
      visibleArguments: (cmd: Command) => [],
      visibleOptions: (cmd: Command) => [],
    })

    this.program.addHelpText("after", HELP_TEXT)

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
        this.test()
        this.onPrintError("test")
      })
  }

  public test() {
    console.log("object")
  }

  onPrintError(str: string) {
    process.stdout.write(`[ERROR]: \x1b[31m${str}\x1b[0m` + "\n")
    return process.exit(1)
  }
}
