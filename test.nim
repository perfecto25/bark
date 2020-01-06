import argparse

var res: string
var p = newParser("Something"):
  flag("-n", "--dryrun")
  command("ls"):
    run:
      res = "did ls"
  command("run"):
    option("-c", "--command")
    run:
      if opts.parentOpts.dryrun:
        res = "would have run: " & opts.command
      else:
        res = "ran " & opts.command
p.run(@["-n", "run", "--command", "something"])
echo res
assert res == "would have run: something"