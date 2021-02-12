# dotfiles

![Screenshot of my shell prompt](https://i.imgur.com/EkEtphC.png)

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/code/dotfiles`) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone git@github.com:NetCE/macos-dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
https://github.com/NetCE/macos-dotfiles.git
cd; curl -#L https://github.com/NetCE/macos-dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/NetCE/macos-dotfiles/blob/0cd43d175a25c0e13e1e06ab31ccfd9f0169cf73/.aliases#L18)) takes place.

**Remember:** Any time you think about updating `.bash_profile` or similar to modify your default paths, remember that it will be rewritten the next time you source dotfiles. Put path configuration into `~/.path` instead, and then source your dotfiles.

Here’s an example `~/.path` file that adds certain preferred keg-only brew installs to the `$PATH`:

```bash
# Set preferred versions of certain keg-only brew installs
PATH="/usr/local/opt/python@3.8/bin:$PATH"
PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

**Remember:** Any time you think about updating `.bash_profile` or similar to add custom commands, remember that it will be rewritten the next time you source dotfiles. Put them into `~/.extra` instead, and then source your dotfiles.

My `~/.extra` looks something like this:

```bash
# Git configs
# Not in the repository, to prevent people from accidentally committing with these values
GIT_AUTHOR_NAME="Firstname Lastname"
GIT_AUTHOR_EMAIL="firname.lastname@netce.com"

GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"

git config --global commit.gpgsign false
git config --global pull.rebase true

echo 'eval "$(rbenv init -)"' >> ~/.bashrc
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/NetCE/macos-dotfiles/fork) instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.

## Feedback

Suggestions/improvements
[welcome](https://github.com/NetCE/macos-dotfiles/issues)!

## Author

| [![twitter/mathias](http://gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=70)](http://twitter.com/mathias "Follow @mathias on Twitter") |
|---|
| [Mathias Bynens](https://mathiasbynens.be/) |

## Thanks to…

* @ptb and [his _macOS Setup_ repository](https://github.com/ptb/mac-setup)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](https://butt.zone/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
* [Matijs Brinkhuis](https://matijs.brinkhu.is/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](https://sindresorhus.com/)
* [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
* [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [macOS-Defaults project](https://github.com/kevinSuttle/macOS-Defaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
* [Haralan Dobrev](https://hkdobrev.com/)
* Anyone who [contributed a patch](https://github.com/mathiasbynens/dotfiles/contributors) or [made a helpful suggestion](https://github.com/mathiasbynens/dotfiles/issues)
