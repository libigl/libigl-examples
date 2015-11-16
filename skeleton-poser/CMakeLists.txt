cmake_minimum_required(VERSION 2.8.6)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../cmake)

# We need C++11. Put this directive after CGAL's include.
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g -Wall -Wextra -Wno-reorder -Wno-unknown-pragmas -msse4.2 -Wno-deprecated-declarations -D__ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES=0 -DNO_2D" )
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
endif()

find_package(EIGEN REQUIRED)
include_directories( "${EIGEN_INCLUDE_DIR}" )
# Must be found before trying to find libraries in libigl/external
find_package(LIBIGL REQUIRED)
include_directories( "${LIBIGL_INCLUDE_DIR}" )
find_package(ANTTWEAKBAR REQUIRED)
include_directories( ${ANT_TWEAK_BAR_INCLUDE_DIR} )
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)

find_package(CGAL REQUIRED)
include(${CGAL_USE_FILE})
# CGAL's monkeying with all of the flags. Rather than change the CGAL_USE_FILE
# just get ride of this flag.
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  remove_cxx_flag("-stdlib=libc++")
endif()

find_package(MOSEK QUIET)
if(MOSEK_FOUND)
  include_directories( ${MOSEK_INCLUDE_DIR} )
else(MOSEK_FOUND)
  add_definitions(-DIGL_NO_MOSEK)
  if(LIBIGL_USE_STATIC_LIBRARY)
    set(LIBIGLMOSEK_LIBRARY "")
  endif(LIBIGL_USE_STATIC_LIBRARY)
  set(MOSEK_LIBRARIES "")
endif(MOSEK_FOUND)

find_package(TETGEN REQUIRED)
include_directories( ${TETGEN_INCLUDE_DIR})

link_directories(
  /usr/local/lib
  /opt/local/lib
  ${ANT_TWEAK_BAR_DIRS}
  ${EIGEN_DIRS}
)

set(LIBS 
  ${LIBIGL_LIBRARIES} 
  ${OPENGL_LIBRARIES} 
  ${MOSEK_LIBRARIES} 
  ${GLUT_LIBRARIES}
  ${ANT_TWEAK_BAR_LIBRARY}
)

FILE(GLOB SRCFILES *.cpp)
add_executable(skeleton_poser ${SRCFILES} ${TETGEN_SOURCES})
target_link_libraries(skeleton_poser ${LIBS})
