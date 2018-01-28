
all: tests

.SUFFIXES: .xml .xml-d .html .html-d .fdx .fdx-d

.xml.xml-d:
	../textplay -x < fountain.io.test-cases/$*.fountain | diff -B -q $< -
.html.html-d : SceneHeaders.html
	../textplay    < fountain.io.test-cases/$*.fountain | diff -B -q $< -
.fdx.fdx-d : SceneHeaders.fdx
	../textplay -f < fountain.io.test-cases/$*.fountain | diff -B -q $< -

tests.dep :
	ls *.xml *.html *fdx | awk 'BEGIN {ORS=" "; print "tests: "} {print $$0 "-d"}' > $@

include tests.dep
