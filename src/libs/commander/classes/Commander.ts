import { Command } from "commander"
import { HELP_TEXT } from "../../../constants"

export class Commander extends Command {
  program: Command

  constructor() {
    super()
    this.program = new Command()

    this.program.version("0.3")
    this.program.name("gac").usage("[type] [message...] [options] [options...]")
    this.program.configureHelp({
      visibleArguments: (cmd: Command) => [],
      visibleOptions: (cmd: Command) => [],
    })
    this.program.addHelpText("after", HELP_TEXT)
  }
}
