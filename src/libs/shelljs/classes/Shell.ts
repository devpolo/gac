import shell from "shelljs"

export class Shell {
  exec(command: string) {
    if (shell.exec(command).code !== 0) {
      this.#onError(`[ERROR] executing command: ${command}`)
    }
  }

  which(packageName: string) {
    if (!shell.which(packageName)) {
      this.#onError(`[ERROR] this script requires: ${packageName}`)
    }
  }

  #onError(message: string) {
    shell.echo(message)
    shell.exit(1)
  }
}
