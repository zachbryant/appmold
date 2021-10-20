# AppMold Template

This project provides a quick way to get running with template projects. It's purpose is to set up the repo such that a developer can later pull in changes from the template project without much extra effort, aside from merging.

## How to use
Clone this repository (you can use the `use this template` button) and then you have two scripts:
 * `./clone.sh <git url>`: will set up the repo using your desired template code.
 * `./update.sh`: will create a new branch for you to reconcile your edits with the templates' edits.

## A note
By default, the update process performs a merge (or whatever your global default is; git default is merge). You may see this message:
```
hint: Pulling without specifying how to reconcile divergent branches is
hint: discouraged. You can squelch this message by running one of the following
hint: commands sometime before your next pull:
hint: 
hint:   git config pull.rebase false  # merge (the default strategy)
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint: 
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
```

You may want to set this up now so you don't accidentally go against your repo's procedures.