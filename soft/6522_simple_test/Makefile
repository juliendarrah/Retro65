NAME = test
TOOLCHAIN_PATH = /home/jdarrah/projects/cc65/bin


all:	$(NAME).bin

$(NAME).bin: $(NAME).o
	$(TOOLCHAIN_PATH)/ld65 -C Linker.cfg -vm -m $(NAME).map -o $(NAME).bin $(NAME).o

$(NAME).o: $(NAME).s
	$(TOOLCHAIN_PATH)/ca65 -g -l $(NAME).lst $(NAME).s

clean:
	$(RM) *.o *.lst *.map *.bin

distclean: clean

