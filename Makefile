PROGRAM_NAME := test1

CC := g++
# CC := g++-mp-7 # typical macports compiler name
# CC := g++-7 # typical homebrew compiler name 

# Check for environment definitions of compiler 
# e.g., on CC = g++-7 on OSX
ifdef PHYSICELL_CPP 
	CC := $(PHYSICELL_CPP)
endif

ARCH := native # best auto-tuning

# CFLAGS := -march=$(ARCH) -Ofast -s -fomit-frame-pointer -mfpmath=both -fopenmp -m64 -std=c++11
CFLAGS := -march=$(ARCH) -O3 -fomit-frame-pointer -fopenmp -m64 -std=c++11

COMPILE_COMMAND := $(CC) $(CFLAGS) -I/Users/heiland/dev/glfw-3.3.6.bin.MACOS/include -I/Users/heiland/git/Vulkan-Tools/build/Vulkan-Headers/build/install/include -I/opt/homebrew/Cellar/glm/0.9.9.8/include

LIBS := -L/opt/homebrew/Cellar/glfw/3.3.6/lib -lglfw

all: test1.cpp 
	$(COMPILE_COMMAND) -o $(PROGRAM_NAME) $(LIBS) test1.cpp 

test1.o: ./test1.cpp
	$(COMPILE_COMMAND) -c ./test.cpp