#
# 'make'	build executable file
# 'make clean'  removes all .o, .d, *~ and executable files
#

# For Armbian cross-toolchain
#CROSS := arm-linux-gnueabihf-

CC := $(CROSS)gcc
CXX := $(CROSS)g++
AR := $(CROSS)ar
LD := $(CROSS)ld
OBJCOPY := $(CROSS)objcopy
RANLIB := $(CROSS)ranlib
SIZE := $(CROSS)size
STRIP := $(CROSS)strip

RM := rm -f


# define the executable file with name of project directory
OUT = $(shell basename $$PWD)

# define any compile-time flags
CFLAGS = -W -Wall -g

# define any directories containing header files other than /usr/include
INCLUDES = -I .

# define library paths in addition to /usr/lib
LFLAGS = -L .

# define any libraries to link into executable:
#LIBS = -lpthread -lm

# define the C source files
SRCS := $(wildcard *.c)

# define the C object files
OBJS = $(SRCS:.c=.o)

# Gcc/Clang will create these .d files containing dependencies.
DEPS = $(SRCS:.c=.d)

all:    $(OUT)

$(OUT): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(OUT) $(OBJS) $(LFLAGS) $(LIBS)

# this is a suffix replacement rule for building .o's from .c's
# it uses automatic variables $<: the name of the prerequisite of
# the rule(a .c file) and $@: the name of the target of the rule (a .o file)
# (see the gnu make manual section about automatic variables)
.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

# Generate dependencies of .c files on .h files
%.d: %.c
	@set -e; rm -f $@; \
	$(CC) -M $(CPPFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	$(RM) $@.$$$$

# Make *.c depends on *.h changes
-include $(DEPS)

.PHONY: clean

clean:
	$(RM) *.o *.d *~ $(OUT)
