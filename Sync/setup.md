## Debian

First steps:

```bash
su -
apt update
apt full-upgrade
usermod -aG sudo barry
```

For sudo access with no password:

```bash
echo "%sudo  ALL=NOPASSWD: ALL" > /etc/sudoers.d/sudo_group_nopasswd
```

Reboot.

Convenient packages:

```bash
sudo apt install vim-gtk3 htop neofetch tmux curl git ripgrep fd-find npm
```

### Virtualbox

```bash
sudo apt install linux-headers-amd64 perl make gcc
```

Add `exec` for cdrom in `/etc/fstab`.

Mount guest additions CD image and run `autorun.sh`.

## openSUSE

For `ssh` and Windows DNS to work, load YaST > Firewall and add `ssh` and `mdns` services to the `public` zone.

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

Log into github, `settings` > `SSH and PGP keys` > `New SSH key`.

github does not allow an ssh key to be used for multiple repositories. If you need a separate one, run `ssh-keygen` and save they key to `~/.ssh/id_rsa_config`. Add `id_rsa_config.pub` to github instead. Then configure git to use this key with:

```bash
config config core.sshCommand "ssh -i ~/.ssh/id_rsa_config"
```

## Aliases

On openSUSE, `.bash_aliases` isn't picked up, instead it uses `~/.alias` so run

```bash
ln -s ~/.bash_aliases ~/.alias
```

# Dircolors

If `~/.dircolors` isn't working, add to `~/.bashrc`:

```bash
eval "$(dircolors -b ~/.dircolors)"
```

# Prompt

If prompt is not as expected, add to `~/.bashrc`:

```bash
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```
