
import argparse
import json
import filters/[os]

let p = newParser("bark"):

    help("Bark is a system information utility that can show information such as operating system, disk usage, kernel, etc. \nTest")
    
    flag("-n", "--dryrun")

    command("disk"): 
        help("shows disk information")
        option("-a", "--apple", help = "Name of apple")
        arg("show")
        arg("others", nargs = -1)

    command("os"):
        help("this is OS help")
        arg("show")
        option("-c", "--command")
        run:
            if opts.parentOpts.dryrun:
                echo "dryrun"
  
    option("-c", "--config", help="Configuration file")
    option("-k", "--kind", choices = @["fruit", "vegetable"])

var opts = p.parse(commandLineParams())

let command = opts.argparseCommand
echo command

if command == "":
    
    var bark_json = %* {}
    bark_json["details"] = %* {"age":35, "pi":3.1415}
    echo bark_json
    echo filter_os_info()
#echo opts.argparseCommand
#echo opts.parentOpts
