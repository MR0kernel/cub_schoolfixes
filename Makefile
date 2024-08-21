# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guilrodr <guilrodr@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/08 19:59:30 by guilrodr          #+#    #+#              #
#    Updated: 2024/08/21 16:50:10 by guilrodr         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# NAME = cub3d
# CC = cc
# CFLAGS = -Wall -Wextra -Werror -g3
# MLXFLAGS = -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -O2 -funroll-loops
# RM = rm -f
# LIBFT = ./libft/libft.a
# SRC =	so_long.c \
# 		gnl/get_next_line_utils.c \
# 		gnl/get_next_line.c \
# 		general_purpose_functions/size_and_search.c \
# 		general_purpose_functions/map_stock.c \
# 		general_purpose_functions/ft_bzero.c \
# 		1_given_file_tests/ends_with_ber.c \
# 		1_given_file_tests/is_closed.c \
# 		1_given_file_tests/objects_are_valid.c \
# 		1_given_file_tests/is_solvable.c \
# 		2_try_load_images/1_images_master.c \
# 		2_try_load_images/images_converter.c \
# 		2_try_load_images/init_master_structs.c \
# 		3_mlx_window_launch/1_window_master.c \
# 		3_mlx_window_launch/draw_master.c \
# 		3_mlx_window_launch/stop_program.c \
# 		3_mlx_window_launch/raycaster.c \
# 		4_draw_funtions/draw_by_pixel.c \
# 		4_draw_funtions/draw_wall.c \
# 		5_event_handling/1_mouvement_master.c \
# 		5_event_handling/key_press.c \
# 		error_general_hendler/error_general_hendler.c \
# 		error_general_hendler/free.c \
# 		error_general_hendler/free_images.c \
# 		0_Parssing/check_map.c \
# 		0_Parssing/check_utils.c \
# 		0_Parssing/color.c \
# 		0_Parssing/perform_parssing.c \
# 		0_Parssing/parse.c 0_Parssing/xpm.c

# BUILD_DIR = .build
# OBJ = $(SRC:.c=.o)
# DEP = $(SRC:.c=.d)
# MLX = ./minilibx-linux/libmlx.a ./minilibx-linux/libmlx_Linux.a

# all: $(NAME)


# $(NAME): $(OBJ) $(LIBFT) Makefile
# 	make -C mlx_linux
# 	$(CC) $(CFLAGS) $(OBJ) $(MLXFLAGS) $(LIBFT) -o $(NAME)
# 	norminette \
# 				general_purpose_functions \
# 				0_Parssing \
# 				1_given_file_tests \
# 				2_try_load_images \
# 				3_mlx_window_launch \
# 				4_draw_funtions \
# 				5_event_handling \
# 				error_general_hendler \
# 				so_long.c \
# 				includes \
# 				gnl \
# 				libft

# %.o: %.c
# 	@mkdir -p $(BUILD_DIR)
# 	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@ -I ./includes

# -include $(OBJ:.o=.d) $(OBJ_BONUS:.o=.d)

# $(LIBFT): FORCE
# 	@make --no-print-directory -C ./libft bonus

# FORCE:

# clean:
# 	make clean -C mlx_linux
# 	$(RM) $(NAME) $(OBJ) $(DEP)

# fclean: clean
# 	$(RM) $(NAME)

# re: fclean all

# .PHONY: all clean fclean re FORCE


NAME = cub3d
CC = cc
CFLAGS = -Wall -Wextra -Werror #-g3 -fsanitize=address
MLXFLAGS = -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -O2 -funroll-loops
PATH_SRCS = ./srcs/
SRCS = so_long.c \
		size_and_search.c \
		map_stock.c \
		ft_bzero.c \
		ends_with_ber.c \
		is_closed.c \
		objects_are_valid.c \
		is_solvable.c \
		1_images_master.c \
		images_converter.c \
		init_master_structs.c \
		1_window_master.c \
		draw_master.c \
		stop_program.c \
		raycaster.c \
		draw_by_pixel.c \
		draw_wall.c \
		1_mouvement_master.c \
		key_press.c \
		error_general_hendler.c \
		free.c \
		free_images.c \
		check_map.c \
		check_utils.c \
		color.c \
		perform_parssing.c \
		parse.c \
		xpm.c
OBJ = $(addprefix $(BUILD_DIR)/,$(SRCS:.c=.o))
BUILD_DIR = .build
LIBFT = ./libft/libft.a
MLX = ./mlx_linux/libmlx.a ./mlx_linux/libmlx_Linux.a

all: $(NAME)

$(NAME): $(OBJ) $(LIBFT) $(MLX)
	make -C mlx_linux
	@$(CC) $(CFLAGS) $(OBJ) $(LIBFT) $(MLXFLAGS) -o $@
	@echo "\ncompile done!\n"
	@echo 'Tape for example "./so_long Ressources/Maps/classic.ber"'"\n"

$(BUILD_DIR)/%.o: $(PATH_SRCS)%.c Makefile
	@mkdir -p $(BUILD_DIR)
	@$(CC) $(CFLAGS) -MMD -MP -c $< -o $@ -I ./includes

-include $(OBJ:.o=.d) $(OBJ_BONUS:.o=.d)

$(LIBFT): FORCE
	@make --no-print-directory -C ./libft bonus

$(MLX): FORCE
	@make --no-print-directory -C ./mlx_linux

norm:
	norminette ./srcs ./includes

FORCE:

clean:
	@make --no-print-directory -C ./libft clean
	@make --no-print-directory -C ./mlx_linux clean
	@rm -rf $(BUILD_DIR)

fclean: clean
	@make --no-print-directory -C ./libft fclean
	@rm -rf $(NAME) $(NAME_BONUS)

re: fclean
	@make --no-print-directory

.PHONY: all clean fclean re FORCE norm