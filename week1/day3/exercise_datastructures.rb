hsh = {
	:wat => [
		0,
		1,
		{
			:wut => [
				0,
				[
					[
						0,1,2,3,4,5,6,7,8,
						{
							:bbq => "yummy"
						}
					]
				]
			]
		}
	]
}

arr = [
	[0,1,2,3,4,
		{
			:secret => {
				:unlock => [
					0,
					"I'm batman!"
				]
			}
		}
	]
]


puts hsh[:wat][2][:wut][1][0][9][:bbq]
puts arr[0][5][:secret][:unlock][1]