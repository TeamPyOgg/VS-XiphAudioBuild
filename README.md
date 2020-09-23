# VS-XiphAudioBuild
## A ready-to-build setup for ogg, vorbis, FLAC, and opus libraries on Windows
### Ever tried to build one of [Xiph.org](https://github.com/xiph)'s libraries and failed?
No wonder. Building them from scratch is near impossible.  
But worry not my friend, that's all in the past now. With this repository you're all set to build or simply download [prebuilt libraries](https://github.com/TeamPyOgg/VS-XiphAudioBuild/releases/latest) with little effort.

## What's in this repository?
First of all, there are prebuilt libraries in the [releases](https://github.com/TeamPyOgg/VS-XiphAudioBuild/releases) section. If you want to have the least amount of effort, you should start there.  
If you don't know which one to choose, have a look at [[Configurations](#configurations)] below.  
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

After having installed Perl, you need to install an extension module. To do so, open up a command prompt (Press `[WIN]`+`[R]`, type `cmd` and hit `[RETURN]`) and enter the following command:
```Shell
cpan -i Text::Template
```
The extension module should automagically install.
### The build process
Now you're all set. Go ahead and clone / download this repo (if you haven't already) and open up the XiphAudioBuild.sln solution file.  
You should be able to see the Project, including all the sub-projects in the solution-explorer.  
Now it's time to select what you want to build.
#### Configurations
Depending on the type of application you want to use the generated libraries in, you're going to want to use a different configuration.  
First of all there are two major differences between the libs:  
Shared and Static.
  
**Shared libraries**  
Shared libraries, also known as dynamic libraries are what you'll commonly see as `.DLL` files. These are generally the libraries you want to use, especially when you're developing with languages other than C or C++, as those can usually only deal with shared libraries.  
The other reason for using shared libraries is that they're easily repleacable with newer versions, without having to recomiple your own project for every bugfix release of a library.  
**Static libraries**  
Static libaries are basically the opposite of shared libraries. When you include them in your project, they will be incorporated into your final binary, without any extra library files. This can be useful when you're trying to build a project that is supposed to output a single executable file without any other dependencies.  
  
Then there are two more categories:  
**Runtime dependency** (`RuntimeDependency` suffix)  
When the libraries are built using this option, they will require an appropriate Visual C++ redistributable package to be installed on the target system (i.e. they require that certain DLLs are present, such as `ucrtbased.dll` or `VCRUNTIME140D.dll`). You should only use this option when you're supplying a [redist package](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads) that corresponds to your Visual C++ version together with your project, as the user might not be able to run it otherwise. You will have the benefit of a smaller file size as a result.  
**No runtime dependency** (no suffix)  
This is what you want to use when you're building a library of your own or when using other languages than C or C++, as it already has all of the requirements built-in.  
  
And you'll have to choose from Release or Debug:  
**Release**  
The production-ready versions of the library that have been compiled using optimizations and without any debugging symbols. This is what you want to use unless you're debugging with C / C++.  
**Debug**  
The library versions with no optimizations, but with debugging information. This is what you should use for the debug configuration in your C / C++ project.

#### Starting the build process
When you've made the decision for which libraries you want to build, open up the Batch Build menu in Visual Studio by navigating to `[Build]->[Batch Build]` and select the checkmark for every configuration<->platform combination of the `BUILD_ALL` project that you want to bulid.  
You can also build only specific libraries by scrolling down and picking the appropriate project(s).  
When you're done, hit the build button and let the compiler do it's magic.

#### Output files
When done building, you'll be presented with a bunch of different files in the `build` folder, depending on your configuration.  
Really only three types of files interest you here:
Extension | Description
-|-
`.DLL`|The shared library with all of the library's exported functions inside of it
`.LIB`|The static library (or library part) that you can add to your C / C++ project in the *Linker* settings.
`.PDB`|*Program Debug Database*, holds additional debug information about the library in question.

**Happy building!**
