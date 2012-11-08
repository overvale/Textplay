Textplay
========

Textplay is a simple ruby-script (one file, no dependancies) that converts screenplays written in Fountain formatted plain-text to a variety of useful formats: HTML, FDX (Final Draft), or PDF ([PrinceXML][prince] required).

Textplay has been rigorously tested against fountain documents, but it is not perfect, if you encounter a problem please let me know: [@olivertaylor][tw].

## Command-line interface

Textplay was built using Mac OS 10.6-8 and Ruby 1.8.7. I have only tested it in this environment, if you want to run Textplay in another environment (such as Windows) you may have to modify the code.

Calling Textplay from the command-line is simple:

`textplay [options] [input-path] [output-path]`

- The first argument is always an input-path.
- The second argument is always an output-path.
- If there's no output-path textplay prints to `STDOUT` (PDF go to /temp).
- If there's no input-path textplay reads from `STDIN`.

Textplay has three options you can call in the command line. `--help`, `--fdx`, and `--pdf` (`-h`, `-f`, and `-p`respectively).

* `--help` does what you think it does.
* `--fdx` converts the file to FDX instead of HTML.
* `--pdf` converts the file to PDF ([PrinceXML][prince] must be installed on your system).

## HTML Snippets

`textplaysnip` is an alternate script that converts inputted text to HTML equivalent. It does not include anything but the marked-up text. This is useful for things like [BBEdit Text filters](http://bbeditextras.org/wiki/index.php?title=Text_Filters) or [Marked.app](http://markedapp.com). `textplay.css` is also included should you need it.

## Support for the Fountain Format

### Q. How does Textplay interpret text differently from the Fountain spec?

* Textplay is smart about what constitutes a transition. Usually, there's no need to escape transitions, but you can.
* An action line that contains no lower-case letters is converted to a slugline.
* Lines that begin with // are interpreted as notes. This was done to provide backward-compatibility with Textplay/Screenbundle documents.
* In some cases Textplay does not assume that every whitespace character you type (newlines, spaces, and tabs) is intentional. For example, if you type one space on the line immediately below an all-caps line, Fountain assumes you'd like a Character saying “ ”. Textplay assumes you accidentally typed a space.

### Q. What parts of the Fountain spec are not supported?

* Scene Numbers.
* Dual Dialog blocks.
* Title Pages.
* Empty lines inside [[notes]].

### Q. Why not?

* I'm not a good enough programmer.


[tw]: http://twitter.com/olivertaylor
[prince]: http://princexml.com
