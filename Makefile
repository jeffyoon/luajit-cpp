# To override any options, use `make -e`, e.g.
#     $ LUAJIT=/path/to/luajit make -e

ifeq ($(shell uname), Darwin)
	LIBEXT := dylib
else
	LIBEXT := so
endif

LUAJIT := luajit
CXXFLAGS := -W -Wall -g -fpic
TARGETS := libadd.$(LIBEXT) libperson.$(LIBEXT) libfoo.$(LIBEXT) libfirst.$(LIBEXT)

all: $(TARGETS)
	$(LUAJIT) add.lua
	$(LUAJIT) person.lua
	$(LUAJIT) first.lua
	$(LUAJIT) foo.lua

lib%.$(LIBEXT): %.o
	$(CXX) $(CXXFLAFGS) -shared $< -o $@
	strip $@

clean:
	rm -f $(TARGETS)
