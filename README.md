# libigl-examples

This repository contains examples applications that use
[libigl](libigl.github.io/libigl/). They've been tested on Mac OS X. Most are
too involved or special purpose to be part of the [libigl
tutorial](libigl.github.io/libigl/tutorial/tutorial.html).

## Dependencies

#### All:

- libigl
- std
- Eigen
- C++11

#### Most:

- OpenGL v2
- GLUT
- AntTweakBar

#### Some:

- embree
  - ispc
  - tbb
- mosek (optional)
- tetgen
- matlab
- cgal

### GLUT

Nearly all of these examples depend on GLUT. On Mac OS X, glut is deprecated
but still included. However, I'd recommend replacing it with a [modified
glut](https://github.com/alecjacobson/glut) that supports scroll wheel and the
command ⌘ key. 

### AntTweakBar

I'd recommend installing AntTweakBar as a static library. You can do this from
with then `libigl/external/AntTweakBar` directory using:

    make -C [libigl]/external/AntTweakBar/src -f Makefile.osx

### Embree

I'd recommend installing Embree via the `libigl/external/embree` submodule.
Travel there and follow the usual cmake build:

    cd [libigl]/external/embree
    mkdir build
    cd build
    cmake ..
    make

## Compilation

### Make

> This is hopefully subject to change as I update examples to be built with
> cmake.

Each example directory is independent and be compiled using:

    make -C [example-dir]

You can also try to compile all examples by simply issuing:

    make

### Cmake

Some examples now use cmake to build. Compile the dependencies above and then
issue:

   cd [example]
   mkdir build
   cd build
   cmake ..
   make
