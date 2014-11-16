Textplay
========

Textplay is a simple command-line script that converts screenplays written in [Fountain][fountain] formatted plain-text to HTML, XML, and FDX ([Final Draft][finaldraft]).

Textplay has been rigorously tested against fountain documents, but it is not perfect, if you encounter a problem please [open a github issue][ghiss].

## Installation

Clone this repo somewhere convenient, `cd` into that directory, run `make install`. This will place a symbolic link to textplay in `/usr/local/bin/`. This symbolic link can be removed with `make uninstall`.

Textplay was built using Mac OS 10.6-10 and Ruby 1.8-2.0. I have only tested it in this environment, if you want to run Textplay in another environment (such as Windows) you may have to modify the code.

## Using textplay

    textplay [options]

    -h, --help        Display the help text
    -s, --snippet     Do not include document headers/footers
    -f, --fdx         Convert to Final Draft .fdx
    -x, --xml         Output as the internal raw XML

By default textplay converts to a fully-formed HTML document.

Texplay is designed to be a Unix tool, thus it always reads from STDIN and
writes to STDOUT. To make a file use standard Unix redirection. For example:

    textplay < screenplay.fountain > screenplay.html

As another example, textplay has been tested extensively with
[PrinceXML](http://princexml.com). To make a PDF from a fountain document,
use this:

    textplay < screenplay.fountain | prince - screenplay.pdf

## Configuring textplay

Want to customize how textplay interprets your screenplay? Want to change the layout of your screenplay?

Using Fountain's `key:value` title-page syntax, you can control how textplay interprets your screenplay.  See `--help` for info.

## Support for the Fountain Format

### Q. How does Textplay interpret text differently from the Fountain spec?

* Textplay is smart about what constitutes a transition. Usually, there's no need to escape transitions, but you can.
* An action line that contains no lower-case letters is converted to a slugline.
* In some cases Textplay does not assume that every whitespace character you type (newlines, spaces, and tabs) is intentional. For example, if you type one space on the line immediately below an all-caps line, Fountain assumes you'd like a Character saying “ ”. Textplay assumes you accidentally typed a space.
* Textplay collapses multiple blank line between elements to a single blank line.

### Q. What parts of the Fountain spec are not supported?

* Title Pages.
* Scene Numbers.
* Empty lines in dialogue-blocks.


[twitter]: http://twitter.com/olivertaylor
[prince]: http://princexml.com
[finaldraft]: http://finaldraft.com
[fountain]: http://fountain.io
[ghiss]: https://github.com/olivertaylor/Textplay/issues?state=open
