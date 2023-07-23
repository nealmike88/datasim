# Demo Instructions
I put the project in the /opt directory since I thought you were going to use this laptop.
All the instructions use that assumption but if you put it somewhere else just replace /opt with where you are working out of 

## Install Demo
### Get the project 
```
cd /opt
git clone https://github.com/nealmike88/datasim.git
```
   
I can't seem to integrate the paho.mqtt.c instance into my github repo properly so you have to grab it separately. 
Make sure you put it in the datasim directory and then build the library 

```
cd /opt/datasim
git clone https://github.com/eclipse/paho.mqtt.c.git

cd paho.mqtt.c
git checkout v1.3.8

cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON \
    -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON
sudo cmake --build build/ --target install
sudo ldconfig
``` 

Build the docker images

```
docker build -t sensor1 -f dockerfile_sensor1 .
docker build -t sensor1 -f dockerfile_sensor1 .
docker build -t sensor2 -f dockerfile_sensor2 .
docker build -t sensor3 -f dockerfile_sensor3 .
docker build -t sensor4 -f dockerfile_sensor4 .
docker build -t sensor5 -f dockerfile_sensor5 .
```

## Running the Demo
Go to docker-compose directory

```
cd /opt/docker-compose
```

Fire up the docker compose instance.   

```
docker compose up
```

## Making Changes 
If you need to edit the programs, do the following:

- Go to /opt/datasim/src/sensors/main.cpp
- Edit the IP to reflect the new machine IP
- Compile with the below command from the datasim dir

```
cmake -Bbuild -H. -DSENSOR_APP=TRUE
sudo cmake --build build/ --target-install
```

# Main Install 
### Unix and Linux Debian

On *nix systems CMake creates Makefiles.

The build process currently supports a number of Unix and Linux flavors. The build process requires the following tools:

  * CMake v3.5 or newer
  * GCC v4.8 or newer or Clang v3.9 or newer
  * GNU Make

On Debian based systems this would mean that the following packages have to be installed:

```
$ sudo apt-get install build-essential gcc make cmake cmake-gui cmake-curses-gui
```

If you will be using secure sockets (and you probably should):

```
$ sudo apt-get install libssl-dev 
```

Building the documentation requires doxygen and optionally graphviz to be installed:

```
$ sudo apt-get install doxygen graphviz
```

Unit tests are being built using _Catch2_. 

_Catch2_ can be found here: [Catch2](https://github.com/catchorg/Catch2).  You must download and install _Catch2_ to build and run the unit tests locally.


### Fedora
dnf group list --hidden
dnf group info "C Development Tools and Libraries"
sudo dnf group install "C Development Tools and Libraries" "Development Tools"
sudo yum install libssl-dev 
sudo yum install openssl-devel
sudo yum install doxygen graphviz

#### Building the Paho C library

Before building the C++ library, first, build and install the Paho C library, if not already present. Note, this version of the C++ library requires Paho C v1.3.8 or greater.

```
$ git clone https://github.com/eclipse/paho.mqtt.c.git
$ cd paho.mqtt.c
$ git checkout v1.3.8

$ cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON \
    -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON
$ sudo cmake --build build/ --target install
$ sudo ldconfig
```

This builds with SSL/TLS enabled. If that is not desired, omit the `-DPAHO_WITH_SSL=ON`.

It also uses the "high performace" option of the C library to disable more extensive internal memory checks. Remove the _PAHO_HIGH_PERFORMANCE_ option (i.e. turn it off) to debug memory issues, but for most production systems, leave it on for better performance.

To install the library to a non-standard location, use the `CMAKE_INSTALL_PREFIX` to specify a location. For example, to install into under the build directory, perhaps for local testing, do this:

```
$ cmake -Bbuild -H. -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_STATIC=ON \
    -DPAHO_WITH_SSL=ON -DPAHO_HIGH_PERFORMANCE=ON \
    -DCMAKE_INSTALL_PREFIX=./build/_install
```

#### Building the Paho C++ library

An example CMake build session might look like this:

```
$ git clone https://github.com/eclipse/paho.mqtt.cpp
$ cd paho.mqtt.cpp

$ cmake -Bbuild -H. -DPAHO_BUILD_STATIC=ON \
    -DPAHO_BUILD_DOCUMENTATION=TRUE -DPAHO_BUILD_SAMPLES=TRUE
$ sudo cmake --build build/ --target install
$ sudo ldconfig
```

If you did not install Paho C library to a default system location or you want to build against a different version, use the `CMAKE_PREFIX_PATH` to specify its install location. Perhaps something like this:

```
$ cmake -Bbuild -H. -DPAHO_BUILD_DOCUMENTATION=ON -DPAHO_BUILD_SAMPLES=ON \
    -DPAHO_BUILD_STATIC=ON \
    -DCMAKE_PREFIX_PATH=$HOME/mqtt/paho.mqtt.c/build/_install
```

To use another compiler, either the CXX environment variable can be specified in the configuration step:

```
$ CXX=clang++ cmake ..
```

or the `CMAKE_CXX_COMPILER` flag can be used:

```
$ cmake -DCMAKE_CXX_COMPILER=clang++
```

#### Building a Debian/Ubuntu package

```
$ cmake -Bbuild -H. -DPAHO_WITH_SSL=ON -DPAHO_ENABLE_TESTING=OFF -DPAHO_BUILD_DEB_PACKAGE=ON
$ cmake --build build
$ (cd build && cpack)
```
will generate a `.deb` file.


### Windows

On Windows systems CMake creates Visual Studio project files.

The build process currently supports a number Windows versions. The build process requires the following tools:
  * CMake GUI v3.5 or newer
  * Visual Studio 2015 or newer

First install and open the cmake-gui application. This tutorial is based on cmake-gui 3.5.2.

Second, select the path to the Paho MQTT C library (CMAKE_PREFIX_PATH) if not installed in a standard path. Remember that the Paho MQTT C must be installed on the system. Next, choose if it is supposed to build the documentation (PAHO_BUILD_DOCUMENTATION) and/or the sample applications (PAHO_BUILD_SAMPLES).

Once the configuration is done, click on the Configure button, select the version of the Visual Studio, and then click on Generate button.

At the end of this process you have a Visual Studio solution.

Alternately, the libraries can be completely built at an MSBuild Command Prompt. Download the Paho C and C++ library sources, then open a command window and first compile the Paho C library:

```
> cd paho.mqtt.c
> cmake -Bbuild -H. -DCMAKE_INSTALL_PREFIX=C:\mqtt\paho-c
> cmake --build build/ --target install
```

Then build the C++ library:

```
> cd ..\paho.mqtt.cpp
> cmake -Bbuild -H. -DCMAKE_INSTALL_PREFIX=C:\mqtt\paho-cpp -DPAHO_BUILD_SAMPLES=ON -DPAHO_WITH_SSL=OFF -DCMAKE_PREFIX_PATH=C:\mqtt\paho-c
> cmake --build build/ --target install
```
This builds and installs both libraries to a non-standard location under `C:\mqtt`. Modify this location as desired or use the default location, but either way, the C++ library will most likely need to be told where the C library was built using `CMAKE_PREFIX_PATH`.

It seems quite odd, but even on a 64-bit system using a 64-bit compiler, MSVC seems to default to a 32-bit build target. 

The 64-bit target can be selected using tge CMake generator switch, *-G*, at configuration time. The full version must be provided. For Visual Studio 2015 which is v14 do this to first build the Paho C library:

```
> cmake -G "Visual Studio 14 Win64" -Bbuild -H. -DCMAKE_INSTALL_PREFIX=C:\mqtt\paho-c
...
```

Then use it to build the C++ library:

```
> cmake -G "Visual Studio 14 Win64" -Bbuild -H. -DCMAKE_INSTALL_PREFIX=C:\mqtt\paho-cpp -DPAHO_WITH_SSL=OFF -DCMAKE_PREFIX_PATH=C:\mqtt\paho-c
...
```

*Note that it is very important that you use the same generator (target) to build BOTH libraries, otherwise you will get lots of linker errors when you try to build the C++ library.*


# Running Project Build

```
cmake -Bbuild -H. -DPAHO_BUILD_STATIC=ON     -DPAHO_BUILD_DOCUMENTATION=TRUE -DPAHO_BUILD_APP=TRUE
sudo cmake --build build/ --target install
./build/src/app/main 
```
