export class ANSIColor {
  public green(str: string): string {
    return `\x1b[32m${str}\x1b[0m`
  }
}
