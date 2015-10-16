.PHONY: all
.NOTPARALLEL: all

SUBDIRS= \
  MatlabWorkspace ReAntTweakBar \
  affine ambient-occlusion arap bbw beach-balls camera colored-mesh \
  components convertmesh dmat eigen-gotchas embree file_contents_as_string \
  flare-eyes get_seconds glslversion glut_speed_test harwell_boeing \
  intersections is_dir meshio mode multi-viewport patches path_tests pathinfo \
  randomly-sample-mesh render_to_png rotate-widget scene-rotation \
  shadow-mapping skeleton skeleton-builder skeleton-poser slice sort \
  sortrows stdin_to_temp textured-mesh trackball transparency \
  transpose_blocks upright \

# http://stackoverflow.com/a/2463804/148668
.PHONY: all check clean
all check clean: $(SUBDIRS)

all: TARGET=all
check: TARGET=check
clean: TARGET=clean
# No, you can't do TARG=$@, or at least I don't know how to.

$(SUBDIRS): force
	@ $(MAKE) -C $@ $(TARGET)

.PHONY: force
	force :;
