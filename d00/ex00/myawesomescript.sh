# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    myawesomescript.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lnagy <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/22 17:10:09 by lnagy             #+#    #+#              #
#    Updated: 2018/02/22 18:27:25 by lnagy            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
 
curl --silent $1 | grep '<body' | cut -d '"' -f2
