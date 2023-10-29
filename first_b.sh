choice=1
while [ "$choice" -lt 7 ]
do
    echo -e  "\n"
	echo -e "1. Create Address Book\n2. View Records\n3. Insert new Record\n4. Delete a Record\n5. Modify a Record\n6. Search a Record\n7. Exit\n\n"
	echo -e  "\n"
	
	read choice

	case $choice
 in

1)      
		echo -e "\nEnter filename : "
		read fileName
		if [ -e $fileName ] ; then
			rm $fileName
		fi
		continue=1
		echo -e  "id\t\t\tName\t\t\tMobile\t\t\tAddress\t\t\tEmail\n------------------------------------------------------------------------------------------\n" | cat >> $fileName
		while [ "$continue" -gt 0 ]
		do
			echo -e "\nEnter id : "
			read id
			echo -e "Enter Name : "
			read name
			pat_name="^[A-Za-z]"
			while [[ ! $name =~ $pat_name ]]
					do
					echo Enter valid name : 
					read name
					done
			echo -e "Enter Phone Number of $name : "
			read number
			pat_mob="^[0-9]{10}$"
			while [[ ! $number =~ $pat_mob ]]
					do
					echo Enter valid mobile number :
					read number
					done
			echo -e "Enter Address of $name : "
			read address
			echo Enter email :
			read email
			pat_email="^[a-z0-9._%-+]+@[a-z]+\.[a-z]{2,4}$"
			while [[ !  $email =~ $pat_email ]]
					do
					echo Enter valid email :
					read email
					done
			echo -e "$id\t\t\t$name\t\t\t$number\t\t\t$address\t\t\t$email\n" | cat >> $fileName
			echo -e "\nEnter 0 to Stop , 1 to Enter next record : "
			read continue
		done
		;;
2)
		cat $fileName
		;;
3)
			echo -e "\nEnter id : "
			read id
			echo -e "Enter Name : "
			read name
			pat_name="^[A-Za-z]"
			while [[ ! $name =~ $pat_name ]]
					do
					echo Enter valid name : 
					read name
					done
			echo -e "Enter Phone Number of $name : "
			read number
			pat_mob="^[0-9]{10}$"
			while [[ ! $number =~ $pat_mob ]]
					do
					echo Enter valid mobile number :
					read number
					done
			echo -e "Enter Address of $name : "
			read address
			echo Enter email :
			read email
			pat_email="^[a-z0-9._%-+]+@[a-z]+\.[a-z]{2,4}$"
			while [[ !  $email =~ $pat_email ]]
					do
					echo Enter valid email :
					read email
					done
			echo -e "$id\t\t\t$name\t\t\t$number\t\t\t$address\t\t\t$email\n" | cat >> $fileName
		;;
4)
		echo -e "Delete record\nEnter Name : "
		read name
		sed -i "/$name/d" $fileName
		echo "Record deleted successfully !!"
		;; 

5)
		echo -e "Modify record\nEnter name : "
		read pattern
		temp="temp"
		grep -v $pattern $fileName | cat >> $temp
		rm $fileName
		cat $temp | cat >> $fileName
		rm $temp
		echo -e "\nEnter id : "
		read id
		echo -e "Enter Name : "
			read name
			pat_name="^[A-Za-z]"
			while [[ ! $name =~ $pat_name ]]
					do
					echo Enter valid name : 
					read name
					done
			echo -e "Enter Phone Number of $name : "
			read number
			pat_mob="^[0-9]{10}$"
			while [[ ! $number =~ $pat_mob ]]
					do
					echo Enter valid mobile number :
					read number
					done
			echo -e "Enter Address of $name : "
			read address
			echo Enter email :
			read email
			pat_email="^[a-z0-9._%-+]+@[a-z]+\.[a-z]{2,4}$"
			while [[ !  $email =~ $pat_email ]]
					do
					echo Enter valid email :
					read email
					done
			echo -e "$id\t\t\t$name\t\t\t$number\t\t\t$address\t\t\t$email\n" | cat >> $fileName
		;;

6)			
		echo -e "Search record\nEnter Name : "
		read name
		if grep -i "$name" $fileName
		then
			echo Record Found !!
		else
			echo Record Not Found !!
		fi

		;;
7)      
		echo Exit
		;;		
	esac
done

