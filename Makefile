CC = g++
CFLAGS = -Wall

SRC_DIR = src
BUILD_DIR = build

# List of source files in the SRC_DIR
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)

# Object files in the BUILD_DIR
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRC_FILES))

all: build_dir run

build_dir:
	mkdir -p $(BUILD_DIR)

run: $(OBJ_FILES)
	$(CC) $(CFLAGS) $^ -o $(BUILD_DIR)/myprogram.exe

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean build_dir
