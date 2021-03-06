CC		:= g++
LDFLAGS := -lglfw -lGL -lX11 -lpthread -lXrandr -lXi -ldl
CFLAGS	:= -Iinclude

TARGETS	:= main.cpp

all:	make_directories default

default:	$(TARGETS) bin/glad.o bin/stb_image.o
	$(CC) $(TARGETS) bin/glad.o bin/stb_image.o $(LDFLAGS) $(CFLAGS) -o out/a.out

bin/glad.o:		include/glad/glad.c
	$(CC) $(CFLAGS) include/glad/glad.c -c -o bin/glad.o

bin/stb_image.o:		include/stb_image/stb_image.c
	$(CC) $(CFLAGS) include/stb_image/stb_image.c -c -o bin/stb_image.o

#bin/main.o:		main.cpp bin/glad.o bin/stb_image.o
#	$(CC) $(CFLAGS) main.cpp bin/glad.o bin/stb_image.o -c -o bin/main.o

.PHONY:	clean
clean:
	rm -rf bin out

.PHONY:	make_directories
make_directories:	bin out res

bin:
	mkdir -p bin/

out:
	mkdir -p out

res:
	cp -rf res out/res
