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
- mosek (optional)
- tetgen
- matlab
- cgal

### GLUT

Nearly all of these examples depend on GLUT. On Mac OS X, glut is deprecated
but still included. However, I'd recommend replacing it with a [modified
glut](https://github.com/alecjacobson/glut) that supports scroll wheel and the
command ⌘ key. 

## Compilation

Each example directory is independent and be compiled using:

    make -C [example-dir]

You can also try to compile all examples by simply issuing:

    make

## Running

Most examples will expect you to be in their respect directory and execute the
`example` binary. For example,

    cd embree/
    ./example

