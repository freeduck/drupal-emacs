drupal-emacs
============

compilation of php-mode drupal-mode and simple project management, using directory variables

Getting started
===============
When you clone this project remember to run:

git submodule update --init

Once you have retrieved the project soft link init.el into ~/.emacs.d/

and add the elisp folder and the php-mode folder inside that to the load-path
(add-to-list 'load-path "<PATH TO DRUPAL-EMACS>/elisp")
(add-to-list 'load-path "<PATH TO DRUPAL-EMACS>/elisp/php-mode")

in the beginning init.el file