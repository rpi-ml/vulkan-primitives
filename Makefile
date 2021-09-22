LIB_SRC = src/
LIB_SRC_FILES = $(LIB_SRC)vulkan_primitives.cpp
LIB_SRC_OUT = $(LIB_SRC)vulkan_primitives.so

EXAMPLE_PATH = examples/example

CXXFLAGS = -std=c++14 
CXXINC = 
CXXLIB = -lvulkan

src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXINC) -c $< -o $@

src/%.so : src/%.o
	$(CXX) $(CXXFLAGS) -shared $< -o $@  $(CXXLIB)

lib: CXXFLAGS += -Wall -fPIC 
lib: $(LIB_SRC_OUT)

	
examples/%: examples/%.cpp lib
	$(CXX) $(CXXFLAGS) -o $@ $< $(LIB_SRC_OUT) $(CXXLIB)

example: $(EXAMPLE_PATH)
	./$(EXAMPLE_PATH)