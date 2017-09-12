Textplay
========

- [ ] Directly create PDF's from  Fountain Files.
- [ ] Create gitflow like screenplay flow where friends can edit/feedback on versions

Textplay is a simple command-line script that converts screenplays
written in Fountain_ formatted plain-text to HTML, XML, and FDX (`Final Draft`_).

Textplay has been rigorously tested against fountain documents,
but it is not perfect, if you encounter a problem please open a `github issue`_.

Installation
------------

- Clone this repo somewhere convenient,
- ``cd`` into that directory,
- run ``make install``.

This will place a symbolic link to textplay in ``/usr/local/bin/``.
This symbolic link can be removed with ``make uninstall``.

Textplay was built using Mac OS 10.10 and Ruby 2.0.
I have only tested it in this environment,
if you want to run Textplay in another environment (such as Windows)
you may have to modify the code.

Using textplay
--------------

::

    textplay [options]

    -h, --help        Display the help text
    -s, --snippet     Do not include document headers/footers
    -f, --fdx         Convert to Final Draft .fdx
    -x, --xml         Output as the internal raw XML
    -w, --wrap        Wrap action and dialogue (see help)

Texplay is designed to be a Unix tool,
thus it always reads from STDIN and writes to STDOUT.
To make a file use standard Unix redirection. For example::

    textplay < screenplay.fountain > screenplay.html

As another example, textplay has been tested extensively with `PrinceXML`_.
To make a PDF from a fountain document, use this::

    textplay < screenplay.fountain | prince - screenplay.pdf

Configuring textplay
--------------------

Want to customize how textplay interprets your screenplay?
Want to change the layout of your screenplay?

Using Fountain's ``key:value`` title-page syntax,
you can control how textplay interprets your screenplay.
See ``--help`` for info.

=======================================  ==================
Key                                      Default Value
=======================================  ==================
title                                    "A Screenplay"
goldman_sluglines                        on
screenbundle_comments                    off
font                                     "Courier Prime"
slugline_spacing (number of 12pt lines)  1
bold_sluglines                           on
underlined_sluglines                     off
wrap_paragraphs                          off
header                                   (empty by default)
footer                                   (empty by default)
=======================================  ==================

Revision Marks
--------------

It is possible to create a screenplay with revision marks via Textplay.
You'll have to know how to use ``diff`` and pass the output to Textplay.
See ``--help`` for instructions.

Support for the Fountain Format
-------------------------------

- How does Textplay interpret text differently from the Fountain spec?

  -  An action line that contains no lower-case letters is converted to a
     slugline, a "Goldman Slugline". This can be switched off.
  -  Textplay is smart about what constitutes a transition. Usually,
     there's no need to escape transitions, but you can.
  -  In some cases Textplay does not assume that every whitespace
     character you type (newlines, spaces, and tabs) is intentional. For
     example, if you type one space on the line immediately below an
     all-caps line, Fountain assumes you'd like a Character saying “ ”.
     Textplay assumes you accidentally typed a space.
  -  Textplay collapses multiple blank lines between elements to a single
     blank line.

- What parts of the Fountain spec are not supported?

  -  Title Pages.
  -  Scene Numbers.
  -  Empty lines in dialogue-blocks.

.. _Fountain: http://fountain.io
.. _`Final Draft`: http://finaldraft.com
.. _`github issue`: https://github.com/olivertaylor/Textplay/issues?state=open
.. _`PrinceXML`: http://princexml.com
