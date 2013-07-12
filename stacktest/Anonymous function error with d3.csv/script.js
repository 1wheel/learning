d3.tsv("data.tsv", function(error, data){
	//create array of all the none date keys
	keyArray = d3.keys(data[0]).filter(function(key){ return key != 'date'; });

	//iterate over every row from the tsv
	data.forEach(function(row) {
			//cast date as a datetime
			row.date = parseDate(row.date);

			//cast everything else as a number
			keyArray.forEach(function(key){ row[key] = +row[key]; });
	});


});

parseDate = function(date){ return date; };