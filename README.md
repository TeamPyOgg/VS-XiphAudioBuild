# VS-XiphAudioBuild
## A ready-to-build setup for ogg, vorbis, FLAC, and opus libraries on Windows
### Ever tried to build one of [Xiph.org](https://github.com/xiph)'s libraries and failed?
No wonder. Building them from scratch is near impossible.  
But worry not my friend, that's all in the past now. With this repository you're all set to build or simply download [prebuilt libraries](https://github.com/TeamPyOgg/VS-XiphAudioBuild/releases/latest) with little effort.

## What's in this repository?
First of all, there are prebuilt libraries in the [releases](https://github.com/TeamPyOgg/VS-XiphAudioBuild/releases) section. If you want to have the least amount of effort, you should start there.
You can also build all of the libraries yourself. That includes:
- [ogg](https://github.com/xiph/ogg)
- [vorbis](https://github.com/xiph/vorbis)
- vorbisfile (part of vorbis)
- [opus](https://github.com/xiph/opus)
- [opusenc](https://github.com/xiph/libopusenc)
- [opusfile](https://github.com/xiph/opusfile)
- [flac](https://github.com/xiph/flac) (libFLAC)
- [openssl](https://github.com/openssl/openssl) (required for opusfile)
## How to Build
### Prerequisites
Before you can start building, you need a few things:
- **Visual Studio** (The project was created using Visual Studio 2019, but it may also work with older versions)
- **Perl** (See *[Setting up Perl](#setting-up-perl)* below)
- **Time** (Yes, time. It can take quite a while to build)
#### Setting up Perl
Perl is required to build OpenSSL which, in turn, is required to build `opusfile`.
Although `openssl` recommends using ActivePerl, not only does it require you to register on the publisher's website, but it also seems to be complicated to set up and I didn't get it to work.
I recommend you to use StrawberryPerl instead, which is open source and more user-friendly in general.
To install StrawberryPerl, simply download the latest **64-bit** version from their [website](http://strawberryperl.com/) (unless you want to *only* target 32-bit Windows systems) and run the installer.

After having installed Perl, you need to install an extension module.  
To do so, open up a command prompt (Press `[WIN]`+`[R]`, type `cmd` and hit `[RETURN]`) and enter the following command:
```Shell
cpan -i Text::Template
```
The extension module should automagically install.
### The build process
Now you're all set. Go ahead and clone / download this repo (if you haven't already) and open up the XiphAudioBuild.sln solution file.
You should be able to see the Project, including all the sub-projects in the solution-explorer.
Now it's time to select what you want to build.
#### Configurations
(**TODO**)
Name | Description
-|-
ReleaseShared |
ReleaseStatic |
DebugShared |
DebugStatic |
\*-RuntimeDependency |
