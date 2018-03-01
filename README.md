# FIXBASIC

`FIXBASIC` is a DOS Terminate-and-Stay-Resident (TSR) program I wrote in 2012
to deal with an issue I had running my PC AT with a nonstandard BIOS. The
issue is described in great detail [here](http://www.os2museum.com/wp/ibm-dos-5-0-qbasic-hangs-on-non-ibm-systems/),
and also includes a (broken) link to [my first release](http://www.os2museum.com/wp/ibm-dos-5-0-qbasic-hangs-on-non-ibm-systems/#comment-9192).

Back then I didn't have a Github account; a few people asked me to upload the
source for archival purposes, so I have done so unaltered from the zip file
release (other than this `README.md`).

The `TSRLIB` and `WATCLOCK` are not my code. They were written by [a VCF user
named aitotat](http://www.vintage-computer.com/vcforum/showthread.php?23233-TSR-programs-with-Open-Watcom)
in 2010.

## Prerequisites
Being a TSR written in C, the code is _heavily_ tied to the [Watcom C Compiler](http://www.openwatcom.org).
[Open Watcom 2.0](https://github.com/open-watcom) may work, but I don't have it installed, thus I haven't tested it.
In either case, I include binaries in the repo- very few people need the source.

The assembler source files required the [Netwide Assembler](http://www.nasm.us).

Compile the source using `wmake` provided with the Watcom C Compiler distribution;
_GNU or BSD Make will not work_!
