
CC = gcc
SRC_DIR = src
OBJ_DIR = target
GTK=gtk4
CFLAGS = $(shell pkg-config --cflags $(GTK)) -Wall
LDFLAGS = $(shell pkg-config --libs $(GTK))
EXE = main

SRCS = $(SRC_DIR)/main.cpp
OBJS = $(OBJ_DIR)/main.o

all: $(EXE)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(EXE): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(EXE)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@if [ ! -d $(OBJ_DIR) ]; \
		then mkdir -p $(OBJ_DIR); \
	fi
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(EXE) $(OBJ_DIR)

.PHONY: all clean
