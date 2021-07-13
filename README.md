# simple-makefile

A simple Makefile for small C project. We can focus more on source code.

`Makefile` for C Project is simple:

 - With several *.c and *.h files in the same directory
 - ONE target compiled, target is named with the directory name
 - Generate object files *.o and dependency files *.d
 - Re-make even if ONLY *.h is edited
 - Clean all generated files
 - Sometimes cross-compiled with CROSS defined, such as Armbian

`Makefile.single` is used for multiple single C files directory:

 - All C source files are in $CWD
 - Each *.c file has a main() function
 - All object link with common LDFLAG

`Makefile.single` is from [https://stackoverflow.com/a/13696012/2590491](https://stackoverflow.com/a/13696012/2590491)
