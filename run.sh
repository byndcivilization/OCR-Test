#! /bin/bash

prefix="contracts/"
png_prefix="contracts/"
pdf_suffix=".pdf"
png_suffix=".png"

for d in contracts/* ; do
	pdf_name=${d#$prefix}
	file_name=${pdf_name%$pdf_suffix}
	mkdir contracts/${file_name}
	mkdir tess-out-html/${file_name}
	mkdir tess-out-txt/${file_name}

	# convert to png
	convert -transparent white -fuzz 10% $d contracts/${file_name}/${file_name}.png
	
	# tesseract
	for file in contracts/${file_name}/* ; do
		tess_file_name=${file#$png_prefix}
		tess_file_name=${tess_file_name#${file_name}/}
		tess_file_name=${tess_file_name%$png_suffix}
		
		# tesseract text invocation
		tesseract contracts/${file_name}/${tess_file_name}.png tess-out-txt/${file_name}/${tess_file_name}

		# tesseract html invocation
		tesseract contracts/${file_name}/${tess_file_name}.png tess-out-html/${file_name}/${tess_file_name} hocr
	done
	
	# ABBYY
	# txt
	python ABBYY/process.py contracts/${pdf_name} abbyy-out/txt/${file_name}.txt -txt
	# docx
	python ABBYY/process.py contracts/${pdf_name} abbyy-out/docx/${file_name}.txt -docx
	# xml
	python ABBYY/process.py contracts/${pdf_name} abbyy-out/xml/${file_name}.txt -xml

    
done
























# #! /bin/bash

# echo "Please enter your Mongo username: "
# read user

# echo "Please enter you Mongo password: "
# read password

# # Set current month and year
# cur_mon=$(date +%m)
# cur_year=$(date +%y)

# if [[ $cur_mon -eq 1 ]]; then
# 	let "cur_year-=1"

# fi

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#     sudo apt-get install python-dev
# 	sudo apt-get install python-pip
# 	sudo apt-get install r-base-core
# 	sudo apt-get install r-base-dev
# 	sudo apt-get update
# fi

# sudo pip install requests
# sudo pip install pymongo
# sudo pip install boto
# sudo pip install rpy2


# echo "Loading contributions (part 1 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_1.json
# echo "Loading contributions (part 2 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_2.json
# echo "Loading contributions (part 3 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_3.json
# echo "Loading contributions (part 4 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_4.json
# echo "Loading contributions (part 5 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_5.json
# echo "Loading contributions (part 6 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_6.json
# echo "Loading contributions (part 7 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_7.json
# echo "Loading contributions (part 8 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_8.json
# echo "Loading contributions (part 9 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_9.json
# echo "Loading contributions (part 10 of 10)"
# mongoimport --jsonArray --collection contributions --db pppDB --username $user --password $password --file collection_1_10.json

# echo "Loading missions"
# mongoimport --jsonArray --collection missions --db pppDB --username $user --password $password --file collection_2.json
# echo "Loading countries"
# mongoimport --jsonArray --collection countries --db pppDB --username $user --password $password --file collection_3.json

# # update data apprpriately
# if [[ $cur_year -eq 14 ]]; then
# 	for m in `seq 3 $cur_mon`;
# 		do
# 			echo $m/$cur_year
# 			sudo python ../python/main.py $user $password $m/$cur_year
# 		done
# 	exit
# fi

# for y in `seq 14 $cur_year`;
# 	do
# 		if [[ $y -eq $cur_year ]]; then
# 			for m in `seq 1 $cur_mon`;
# 				do
# 					echo $m/$y
# 					sudo python ../python/main.py $user $password $m/$y
# 				done
# 			exit
# 		fi
# 		if [[ $y -ne $cur_year ]]; then
# 			for m in `seq 1 12`;
# 				do
# 					echo $m/$y
# 					sudo python ../python/main.py $user $password $m/$y
# 				done
# 		fi
# 	done
