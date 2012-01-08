Introduction
================================

The BBEdit Package Development package is to help you in creating new packages for BBEdit.

This package includes tools to help you write clippings, unix scripts, and even handle some of the boilerplate involved in creating packages!

Installation
===============================

$ cd Library/Application\ Support/BBEdit/
$ mkdir Packages # if it doesn't already exists
$ cd Packages
$ git clone https://github.com/bbedit/package_dev.bbpackage.git


Contributing
==================================

Please feel free to contribute. However, there is something to keep in mind: BBEdit for some reason doesn't like the uncompiled versions of some Applescripts (for example, the git commit Applescript).

Plus, having BBEdit compile an Applescript every time is much slower than compiling it once.

To avoid this, I've created a ApplescriptSources folder. Modify the .applescript file here, then save a compiled version in the Scripts/Sources folder.

At some point I'll write a shell script or Makefile to automate this process, or figure out what's wrong...

License
===========================================

Public domain, unless otherwise stated in the source file.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
