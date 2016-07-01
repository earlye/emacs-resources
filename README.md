# Overview

A set of emacs utilities. This is intended to replace your entire
.emacs.d directory, because, well, it's my entire .emacs.d
directory. Don't want to do that? Well, you could always fork and
modify to your content. ;-)

# Installation

In a terminal:
```bash
git clone --recursive git@github.com:earlye/emacs-resources.git ~/.emacs.d
echo "(load \"~/.emacs.d/dotemacs\")" >> ~/.emacs
```

That's it!

# Features

* php-mode

* markdown-mode

* earlye functions:

** M-x iwb : indent whole buffer

** M-x ede-insert-cpp-header-guard : generates a c++ header guard with
   copyright and user's full name.
