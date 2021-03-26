# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    my_dump.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mschimme <mschimme@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 14:20:07 by mschimme          #+#    #+#              #
#    Updated: 2021/03/14 20:35:00 by mschimme         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Должен быть в дочерней папке корня репы (например _42_corewar_checker)
# Принимает интервалы а также перечень циклов, которые надлежит вывести
# Пример ./my_dump.sh 10-30
# Пример ./my_dump.sh 30-20
# Пример ./my_dump.sh 10, 20, 30, 10

champ="/tmp/champ1.cor"
my_cmd="vimdiff"

if [[ $1 == [0-9]*\-[0-9]* ]]; then
	min=$(echo $1 | cut -d '-' -f 1)
	max=$(echo $1 | cut -d '-' -f 2)
	if [ $min -gt $max ]; then
		buf=$min
		min=$max
		max=$buf
	fi
	while [ $min -lt $max ]; do
		../corewar -dump $min $champ > ../logs/"$min"_our_log
		../corewar_school -d $min $champ > ../logs/"$min"_sch_log
		$my_cmd ../logs/"$min"_our_log ../logs/"$min"_sch_log
		((min++))
	done
	../corewar -dump $min $champ > ../logs/"$min"_our_log
	../corewar_school -d $min $champ > ../logs/"$min"_sch_log
	$my_cmd ../logs/"$min"_our_log ../logs/"$min"_sch_log
else
		while [ ! -z $1 ]; do
			if [[ $1 =~ ^[0-9]*$ ]]; then
				../corewar -dump $1 $champ > ../logs/"$1"_our_log
				../corewar_school -d $1 $champ > ../logs/"$1"_sch_log
				$my_cmd ../logs/"$1"_our_log ../logs/"$1"_sch_log
			fi
			shift
		done
fi