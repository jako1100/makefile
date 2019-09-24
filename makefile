# kol .c dawar 3lehom ya make fel src, nfs elkalam fel .h
vpath %.c ./Src
vpath %.h ./Inc
CC = gcc
SRC_PATH = ./Src
INCLUDE_PATH = ./Inc
DEP_PATH= Dependencies/
LINK_TARGET = app.exe
SRCS = $(subst $(SRC_PATH)/,,$(wildcard $(SRC_PATH)/*.c))
OBJS = $(SRCS:.c=.o)
DEPS = $(OBJS:.o=.d)

CLEAN_TARGET = $(LINK_TARGET) $(OBJS)


depends = $(addprefix $(DEP_PATH)/, $(DEPS))

-include $(depends)

all : $(LINK_TARGET)
	echo Bulding done !
clean :
	del $(CLEAN_TARGET)
	echo Cleaning done !

$(LINK_TARGET) : $(OBJS) 
	$(CC) $^ Nasser_MinaMedhat_Yakkob_Rafat.o -o $@
	echo Linking done !
	
	
#%.o: %.c (any file.o generated from file.c)
%.o : %.c
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@
	@$(CPP) $< -MM -I$(INCLUDE_PATH) $< > $(DEP_PATH)\$*.d