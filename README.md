# dotwin

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
