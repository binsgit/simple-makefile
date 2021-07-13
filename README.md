# simple-makefile

A simple Makefile for small C project. We can focus more on source code.

The C Project is simple:

 - With several *.c and *.h files in the same directory
 - ONE target compiled, target is named with the directory name
 - Generate object files *.o and dependency files *.d
 - Re-make even if ONLY *.h is edited
 - Clean all generated files
 - Sometimes cross-compiled with CROSS defined, such as Armbian
