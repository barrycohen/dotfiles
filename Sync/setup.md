## Config

```bash
curl https://raw.githubusercontent.com/barrycohen/dotfiles/master/Sync/config-init.sh | bash
```

We rely on `.bashrc` importing `.bash_aliases` to set up the `config` command. This is the default in Debian.

Now use `config` instead of `git` to manage the repository.

In order to push changes, `config remote` should be changed to `git@github.com:barrycohen/dotfiles.git` and the ssh public key should be added to github to allow push.

```bash
ssh-keygen
cat ~/.ssh/id_rsa.pub
config remote set-url origin git@github.com:barrycohen/dotfiles.git
```

Log into github, `settings` > `SSH and PGP keys` > `New SSD key`.
