# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clear.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mschimme <mschimme@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/02 22:23:26 by mschimme          #+#    #+#              #
#    Updated: 2021/04/02 23:51:48 by mschimme         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if ls /tmp/champ?.cor /tmp/cor_*_dump 1>&- 2>&-; then
	echo "Clearing tmp folder..."
	rm -fv /tmp/champ?.cor
	rm -fv /tmp/cor_*_dump
else
	echo "Nothing to delete."
fi
