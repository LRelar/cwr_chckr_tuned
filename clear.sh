# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clear.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mschimme <mschimme@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/02 22:23:26 by mschimme          #+#    #+#              #
#    Updated: 2021/04/02 22:30:07 by mschimme         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if /tmp/champ?.cor /tmp/cor_*_dump 2>&-; then
	echo "Clearing tmp folder..."
	rm -fv /tmp/champ?.cor
	rm -fv /tmp/cor_*_dump
else
	echo "Nothing to delete."
fi
