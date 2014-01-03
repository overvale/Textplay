Textplay
========

Textplay is a simple ruby-script (one file, no dependancies) that converts screenplays written in [Fountain][fountain] formatted plain-text to a variety of useful formats: HTML, FDX ([Final Draft][finaldraft]), or PDF ([PrinceXML][prince] required).

Textplay has been rigorously tested against fountain documents, but it is not perfect, if you encounter a problem please [open a github issue][ghiss].

## Installation

I recommend cloning this repository somewhere convenient, then creating a symbolic link to `textplay` in `/usr/local/bin/`

Textplay was built using Mac OS 10.6-9 and Ruby 1.8-2.0. I have only tested it in this environment, if you want to run Textplay in another environment (such as Windows) you may have to modify the code.

## Command-line interface

Calling Textplay from the command-line is simple:

`textplay [options] [input-path] [output-path]`

* The first argument is always an input-path.
* The second argument is always an output-path.
* If there's no output-path textplay prints to `STDOUT` (PDFs go to `/tmp/`).
* If there's no input-path textplay reads from `STDIN`.

Textplay has three options you can call in the command line. `--help`, `--fdx`, and `--pdf` (`-h`, `-f`, and `-p`respectively).

* `-h`, `--help` Displays the help text, including configuration options.
* `-s`, `--snippet` Create snippet instead of full document with headers/footers
* `-f`, `--fdx` Converts the file to FDX instead of HTML.
* `-p`, `--pdf` Converts the file to PDF ([PrinceXML][prince] must be installed on your system).
* `-x`, `--xml` Output as the internal raw XML


## Support for the Fountain Format

### Q. How does Textplay interpret text differently from the Fountain spec?

* Textplay is smart about what constitutes a transition. Usually, there's no need to escape transitions, but you can.
* An action line that contains no lower-case letters is converted to a slugline.
* Lines that begin with // are interpreted as notes. This was done to provide backward-compatibility with Textplay/Screenbundle documents.
* In some cases Textplay does not assume that every whitespace character you type (newlines, spaces, and tabs) is intentional. For example, if you type one space on the line immediately below an all-caps line, Fountain assumes you'd like a Character saying “ ”. Textplay assumes you accidentally typed a space.

### Q. What parts of the Fountain spec are not supported?

* Title Pages.
* Scene Numbers.
* Empty lines in dialogue-blocks.


[twitter]: http://twitter.com/olivertaylor
[prince]: http://princexml.com
[finaldraft]: http://finaldraft.com
[fountain]: http://fountain.io
[ghiss]: https://github.com/olivertaylor/Textplay/issues?state=open
