cmake_minimum_required(VERSION 2.8.6)

SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/../cmake)

## We need Eigen
find_package(EIGEN REQUIRED)
include_directories( "${EIGEN_INCLUDE_DIR}" )

# CGAL's monkeying with all of the flags. Rather than change the CGAL_USE_FILE
# just get ride of this flag.
# http://stackoverflow.com/a/18234926/148668
find_package(CGAL REQUIRED)
include(${CGAL_USE_FILE})
macro(remove_cxx_flag flag)
  string(REPLACE "${flag}" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
endmacro()
remove_cxx_flag("-stdlib=libc++")
IF(CMAKE_BUILD_TYPE MATCHES DEBUG)
  remove_cxx_flag("-Os")
ENDIF(CMAKE_BUILD_TYPE MATCHES DEBUG)

## We need libigl
find_package(LIBIGL REQUIRED)
include_directories( "${LIBIGL_INCLUDE_DIR}" )
find_package(EMBREE REQUIRED)
include_directories( "${EMBREE_INCLUDE_DIR}" )
find_package(ANTTWEAKBAR REQUIRED)
include_directories( ${ANT_TWEAK_BAR_INCLUDE_DIR} )

link_directories(
	/usr/local/lib
	/opt/local/lib
	${ANT_TWEAK_BAR_DIRS}
	${EIGEN_DIRS}
)

## OpenGL/GLU/GLUT
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
set(LIBS ${LIBIGL_LIBRARIES} ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES}
  ${EMBREE_LIBRARIES}
    ${ANT_TWEAK_BAR_LIBRARY})

## We need C++11. Put this directive after CGAL's include.
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -g -Wall -Wextra -Wno-reorder -Wno-unknown-pragmas -msse4.2 -Wno-deprecated-declarations -D__ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES=0 -DNO_2D" )

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
endif()

FILE(GLOB SRCFILES *.cpp)
add_executable(skeleton_builder
    ${SRCFILES}
    )
target_link_libraries(skeleton_builder
    ${LIBS}
    )
