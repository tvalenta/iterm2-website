#!/bin/bash
tar cvfz ~/backup`date +%s`.tgz ~/iterm2.com
cp -v -n downloads/beta/* ~/iterm2.com/downloads/beta/
export GEM_HOME=$HOME/.newgems
rm -rf ~/iterm2.com_stage
./generate_downloads.py > source/downloads.md
bundle exec jekyll build -d ~/iterm2.com_stage
cd ~/iterm2.com_stage && tar cvfz all.tgz *
cd ~/iterm2.com && tar xvfz ~/iterm2.com_stage/all.tgz
cp ~/iterm2-website/downloads/stable/.htaccess ~/iterm2.com/downloads/stable/.htaccess
