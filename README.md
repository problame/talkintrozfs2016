# An Introduction to ZFS

A talk orginally given at [GPN16, 26-29 May 2016](https://entropia.de/GPN16).
The [original recording can watched here](https://app.media.ccc.de/v/gpn16-7633-an_introduction_to_zfs).

## Contents

* Anecdotal introduction
* ZFS feature listing
* Overview traditional filesystem layering and inode on-disk format
* Analogous ZFS layers
* ZFS Key Implementation Techniques
	* Block Pointer
	* Tree Structures
	* Checksumming
	* Copy-on-Write
* ZFS Module Walkthrough
	* VDEVs
	* SPA
	* DMU
	* DSL
	* ARC \& L2ARC
	* ZPL
	* ZAP
	* ZIL
	* ZVOL
	* /dev/zfs
* (no slides) Demo of ZFS features (check `cli.tex` for hints on what to show. Improvements needed.

# Compiling

Requirements / the author's LaTeX setup:

* TexLive (LaTeX distro)
* minted (Syntax highligted verbatims)
	* python pygments
* Inkscape (svg conversion)
* GNU make

Run ```make``` and open `talk.pdf`.

Alternatively, use one a pre-rendered version from the 'release'-section of this project.

# Licensing

## Copyright for Contents in `assets/contrib`

Depending on local law, assets in the `assets/contrib` directory
need to be relicensed by the presentor.

Check the LICENSE file in the respective subdirectories of `assets/contrib`
for detailed information.

## License for all Other Content

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />
This work is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit [http://creativecommons.org/licenses/by/4.0/](http://creativecommons.org/licenses/by/4.0/).

### Attribution

* **URL**: https://perma.cschwarz.com/talks/introzfs2016
* **Name**: Christian Schwarz
