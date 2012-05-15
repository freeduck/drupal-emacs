drupal-emacs
============

compilation of php-mode drupal-mode and simple project management, using directory variables

Getting started
===============
When you clone this project remember to run:

git submodule update --init

Once you have retrieved the project copy or soft link init.el into ~/.emacs.d/

And add the elisp folder and the php-mode folder inside that to the load-path

(add-to-list 'load-path "<PATH TO DRUPAL-EMACS>/elisp")

(add-to-list 'load-path "<PATH TO DRUPAL-EMACS>/elisp/php-mode")

to the beginning of init.el

How to
======
create a file called .dir-locals.el in the directory that you wish to be the root of your project at give it the following content

((nil . ((eval . (setq project-root-dir (locate-dominating-file buffer-file-name ".dir-locals.el"))))))

This will make emacs create a TAGS file in that directory and update it each time you save a file

Quirks
======
c-subword-mode migt be void when the drupal-mode is loaded, this is coursed by an obsolite elc file(compiled emacs elisp file), most likely delivered by your GNU/Linux/*nix distribution.

You can test this by adding the following some where in init.el
 
    (add-hook 'php-mode-hook '(lambda ()(c-subword-mode t)))

If when you open a php file and the mini buffer says:

File mode specification error: (void-function c-subword-mode)

Then you need to update the cc-mode of your emacs.

Howto
-----
Become root

Change directory to /user/share

And call:

    find . -name "*cc-*.elc" -exec mv {} {}.old \;

Then download cc-mode from http://cc-mode.sourceforge.net/release.php

and extract it in the emacs lisp folder

To find that folder one option is to call

    find . -name "*cc-*.elc" (in /usr/share or /)


Extra features
==============

MySQL screen client
-------------------
The sh folder contains a MySQL pager script, which makes it possible to use gnu screen as a MySQL result browser.

How to
------
Copy or soft link my-screen-pager into path

start screen

    $ screen

split window

    C-a S

change window

    C-a <TAB>

create a new window

    C-a c

start a new screen session in this window

    $ screen -m

get and copy the session id

    $echo $STY

switch window

    C-a <TAB>

start mysql

    $mysql -u....

load script

    pager my-screen-pager <COPIED SESSION ID>

Now the bottom half of the window acts as a result browser, where you can search in the result and switch between the current a previous results.

The wrapper script pipes the result through less. So all the features of less are available in the result window.
The script uses a temp file for piping to less. The name of this file is echoed back to Mysql, and can be used to process the result in grep or anything else you please.

