CXX=g++
CXXFLAGS=-Wall -g

LDFLAGS=
LDLIBS=

TARGET=main
OBJDIR=objects
SOURCES=$(shell find . -name '*.cpp')
OBJECTS=$(SOURCES:%.cpp=$(OBJDIR)/%.o)
DEPS=$(OBJECTS:.o=.d)
all: $(TARGET)

-include $(DEPS)

$(TARGET): $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

$(OBJDIR)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -MMD -c $< -o $@

clean:
	rm -f $(TARGET)
	rm -rf $(OBJDIR)/*.o $(OBJDIR)/*.d

.PHONY: all clean
