This configuration is intended to help you LEARN and minimize "WTF".

So, this config was created with the following principles in mind:

  * Remove all Vim "noise" possible (but don't go overboard). That helps to focus on learn what really matters.
  * Less is more, you always can add your own things later.
  * Few good plugins that makes things easy.
  * Easy to REMOVE what you don't want or don't understand.

Read "vimrc" file to get all changes. Also, once you want to install new plugins, check [Vundle](https://github.com/gmarik/vundle).

VIM
===

This vimfiles are focused on Vim 7.3+ for Linux

I use it on Windows too. But I have to install [Vundle for Windows](https://github.com/gmarik/vundle/wiki/Vundle-for-Windows) for that.


Requirements
============

Git and NCurses (for Linux). Also, it works better with Gnome Terminal or GVim.

[Vundle](https://github.com/gmarik/vundle), the Vim plugin manager. I find it easier than Pathogen.

Install
=======

```

# Debian and like
$ sudo apt-get install git-core ncurses-term

# Fedora
$ sudo dnf install git ncurses-term

# Arch Linux
$ sudo pacman -Sy git-core ncurses-term

$ git clone https://github.com/ruliana/vimfiles.git ~/.vim
$ echo "source ~/.vim/vimrc" > ~/.vimrc
$ echo "source ~/.vim/gvimrc" > ~/.gvimrc

$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim +PluginInstall +qall
```

If you plan to use it on terminal, set an "almost black" background (but not totally black). That will make a good constrast with column and line highlight on terminal. Also, configure your terminal to 256 colors.

Notes
=====

I *strongly* recommend you to remove the "Empower plugins" section and add your own plugins. Vim is a reaaaally poweful editor, but the learning curve can be daunting, so, start with a "minimum surprise" configuration, and slowly add things as you need them.

Those are good plugins lists that uses Vundle:

* [gmarik's vimrc](https://github.com/gmarik/vimfiles/blob/1f4f26d42f54443f1158e0009746a56b9a28b053/vimrc#L136)
* [mutewinter's Vim Config of Champions](https://github.com/mutewinter/dot_vim)

Troubleshooting
===============

** Command-T is not working **

That happens sometimes when I update Ruby in my box. Commant-T needs vim compiled with ruby support. Test if you have a support executing:

:ruby 1

If you got "1" and no errors, you are good, otherwise you need to install (or compile) vim with ruby support. Search on Google for that, but, usually, distributions have vim packages with Ruby (and Python, and lots of stuff) already included.

If you DO have ruby support enable, than, recompile Command-T:

```bash
  cd ~/.vim/bundle/command-t/ruby/command-t
  ruby extconf.rb
  make
```

You should use **the same ruby version** your vim was compiled.
