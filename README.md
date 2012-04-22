My personal dot files
---
Customized dot files to my own needs

## Installation
* 1_ Clone the repo

```bash
$ git clone git://github.com/DungHuynh/dotfiles.git ~/dotfiles
```

* 2_ Run rake

```bash
$ cd ~/dotfiles
$ rake
```

* 3_ Run Vundle

```bash
$ mvim
:BundleInstall
```

## Upgrading
```bash
$ cd ~/dotfiles
$ rake update
```

## Other tasks

```bash
$ rake -T
```

```bash
$ rake backup
```

```bash
$ rake link
```

```bash
$ rake unlink
```

```bash
$ rake clean
```
