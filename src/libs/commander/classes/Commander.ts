import { Command } from "commander"

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
  }
}
