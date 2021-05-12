LIB_SRC = src/
LIB_SRC_FILES = $(LIB_SRC)vulkan_primitives.cpp
LIB_SRC_OUT = $(LIB_SRC)vulkan_primitives.so

CXX = g++
CXXFLAGS = -std=c++14 
CXXINC = 
CXXLIB = -lvulkan

src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXINC) -c $< -o $@

src/%.so : src/%.o
	$(CXX) $(CXXFLAGS) -shared $< -o $@  $(CXXLIB)

lib: CXXFLAGS += -Wall -fPIC 
lib: $(LIB_SRC_OUT)