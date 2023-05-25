NAME		= so_long
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror -g3 
RM			= rm -rf

OBJ			= $(SRC:.c=.o)

SRC =	main.c \

all:	$(NAME)

%.o : %.c
	${CC} -c -o $@ $^ -I./libft ${CFLAGS} -Imlx
	
$(NAME):	$(OBJ) 
			${MAKE} -C libft 
			${MAKE} -C mlx	
			$(CC) -o ${NAME} ${OBJ} -Lmlx -lmlx -framework OpenGL -framework AppKit -L./libft -lft

libft:
			${MAKE} -C libft

clean:
			$(RM) $(OBJ)
			$(MAKE) -C libft clean
			$(MAKE) -C mlx clean

fclean:		clean
			$(RM) $(NAME)
			$(MAKE) -C libft fclean
			$(MAKE) -C mlx clean

re:			fclean all

.PHONY:		all libft clean fclean re