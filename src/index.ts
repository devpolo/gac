import { Command, Argument } from "commander"
const program = new Command()
program.version("0.3")

program
  .addArgument(new Argument("<type>", "type case").choices(["f", "x"]))
  .argument("<descriptions...>")
  .option("-s, --scope [scope]", "optional scope")
  .option("-b, --body <body...>", "optional body")
  .option(
    "-bc, --breaking-change [breaking-change...]",
    "optional breaking change"
  )
  .action((type, descriptions) => {
    const options = program.opts()

    console.log(options)

    let typeAndScope: string = ""
    let description: string = ""
    let res: string = ""
    let body: string = ""
    let breakingChange: string = ""

    if (type === "f") {
      typeAndScope = "feat"
    } else if (type === "x") {
      typeAndScope = "fix"
    }

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

program.parse(process.argv)
