 dotwin

My configuration files for Windows. I use the same Vim configuration for bot Linux, Mac and Windows so it is not included here. 

## Start

Clone this repository to your local machine.

    git clone https://github.com/reuteras/dotwin.git

## Powershell profile

First change directory to your *Documents* directory in your home.

    cd C:\Users\<username>\Documents

Then create a directory for Powershell.

    mkdir WindowsPowerShell 

Enter **cmd** and create a link.

    cmd
    mklink Microsoft.PowerShell_profile.ps1 <full path to dotwin>/Microsoft.PowerShell_profile.ps

## .gitconfig

To work with 1Password for Windows it should look something like this.

```
[core]
        sshCommand = C:/Windows/System32/OpenSSH/ssh.exe
[gpg]
        format = ssh
[gpg "ssh"]
        program = C:\\Users\\<username>\\AppData\\Local\\1Password\\app\\8\\op-ssh-sign.exe
[commit]
    gpgsign = true
    verbose = true
[user]
        signingkey = ssh-rsa <your key>
        email = <your email address>
        name = <your name>
[filter "lfs"]
        clean = git-lfs clean -- %f
        smudge = git-lfs smudge -- %f
        process = git-lfs filter-process
        required = true
```

## Fixes for wsl

I like to have 1password available in wsl. I found this [blog][blo] and the needed steps are listed below. In wsl do the following:

    sudo apt install socat
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &

Before testing we need to build **npiperelay.exe** in Windows. First [download][dow] install **go**. You will have to start a new terminal to load the updated path. Then install [npiperelay][npi].

    go install github.com/jstarks/npiperelay@latest

After this you can use 1Password from wsl.

  [blo]: https://stuartleeks.com/posts/wsl-ssh-key-forward-to-windows/
  [dow]: https://go.dev/dl/
  [npi]: https://github.com/jstarks/npiperelay

