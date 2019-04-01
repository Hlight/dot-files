Setup new SSH key on GitHub

Using ed25519 because it's better than r

```shell
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "aaron@example.com"
```

Create a passphrase for the key.

Then, copy the public key contents:

```shell
pbcopy < ~/.ssh/id_ed25519.pub
```

On GitHub.com goto `user settings > SSH Keys > Add new SSH Key` and paste in the contents.

