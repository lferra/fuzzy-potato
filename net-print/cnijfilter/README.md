NEWS
----

Added a new splitting CUPS backends/filters/utilities with USE flags instead of
a messy multiple packages implementation which need messy back ports and such,
well, not easy to maintain.

To avoid the splitting cruft, just add the follong in `/etc/portage/package.use`:
`=net-print/cnijfilter-${PV} cups canon_printers_<MODEL>`

Or else, just merge any pariticular package version with printer models, and
enable `cups` USE flag only to the latest version to avoid file collisions.

Wait a sec before merging the package! If old printer models are needed present in
`<net-print/cnijfilter-3.40`, `abi_x86_32` **USE** flag should be enabled if running with
`ABI=amd64` because these packages lack any multilib support. `x86` users can
jump to the following.

If `<net-print/cnijfilter-2.80` is needed, then x86 users would pull in `x11-libs/gtk+:1`
and amd64 user would pull in `x11-libs/gtk+:1[abi_x86_32]` when +servicetools USE flag is
enabled.

USAGE
-----

Actually `canon_printers_<MODEL>` USE flags are just pulling in `canon<MODEL>.ppd` file
and a `cif<MODEL>` binary linked to propriatary blobs (libraries). The ppd file is
the only usefull file in most cases because unless you are building the latest 3.x0
or 4.x0, `cif<MODEL>` won't work at all for old tarball because this vry old binary
is linked to very old libpng/tiff... libraries.

So one could just extract `canon<MODEL>.ppd` file and put it in `/etc/cups/ppd` and
and then merge something with `net-print/cnijfilter cups net usb servicetools`.

Beware that +net USE flag pull in propriatary blobs (libraries) which are linked to
network backend.

So just print directly with `cif<MODEL> <FILE> &>/tmp/cif.log` to see if keeping that
binary and its related cruft is worth its salt. Notice that everything is redirected
to a file to avoid corrupting a terminal. Just read the file afterwards to see if there
is any meaningfull info. That command have just printed +22MiB garbage to a terminal in
a use case test!

Finaly, if the latest package does not work for you, you can try (3.90 -- 4.00 is a
major update;) 3.70 -- 3.80 is a major update; and 3.40 -- multilib support.

**NOTE: This is now done automatically in as of ecnij-4.1 eclass!**

One last note is that when using later backends with older printers than `<=cnijfilter-3.00`,
one has to edit `cnij_usb` to `cnijusb`, newtork backend should be fine, in the
ppd file. Just check CUPS backends used in the ppd file in regards to what is installed
in `/usr/libexec/cups/backend`.
Say `sed 's,cnij_usb,cnijusb,g' -i /usr/share/cups/model/canon<MODEL>.ppd` will
suffice.

SERVICETOOLS
-------------

`net-print/cnijfilter[servicetools]` now compile fine with a patch ported from
[cnijfilter-source-3.80](https://github.com/tokiclover/cnijfilter-source-3.80)
to all version provided here. Remain only the issue with x11-libs/gtk+:1
required by by older ebuilds `<=net-print/cnijfilter-2.70`.

**NOTE:** Actually there was an old `cnijfilter-3.80-1-cpus-1.6.patch` with a
partial fix for building servitools utility. I've almost forget about it and
stumbled upon it when porting the patches to other versions. Everything was there
to be ported in the frst place... and nobody tried to completly fix servicetools
compilation.

**net-print/cnijfilter:3/4.x0[servicetools]**

    Print Head Cleaning
    [user@zzz /yyy]$ lpr -P MG7100USB /usr/share/cmdtocanonij/cleaning.utl
    Print nozzle check pattern
    Prints a pattern that lets you check whether the print head nozzles are clogged.
    [user@zzz /yyy]$ lpr -P MG7100USB /usr/share/cmdtocanonij/nozzlecheck.utl
    Print Head Alignment
    [user@zzz /yyy]$ lpr -P MG7100USB /usr/share/cmdtocanonij/autoalign.utl

**net-print/cnijfilter:3/3.x0[servicetools]**

Use `/usr/bin/printerui<MODEL>` for administration tasks.
`net-print/cnijfilter:2/x.y0[servicetools]` should have alsmost the same
functionalities. -- Beware of `x11-libs/gtk+:1` dependency!

SOURCE-FILES/TARBALL
--------------------

Note: if 2.70 src rpm cannot be found, dead link..., just search the full name
with your favorite search engine, or else, look for *Linux_Print_Filterv270.tgz*
and extract *cnijfilter-common-2.70-2.src.rpm* from that archive; and then put it
to **DISTDIR** (see `/etc/portage/make.conf` for the path.)
