function loadPieOS() {
	var jsonurl = 'FetchReportData?rtype=pieos';
	var ret;
	$.ajax({
		async : false,
		url : jsonurl,
		dataType : "json",
		success : function(data) {
			console.log(data);
			ret = data;
		}
	});
	ret = ret.data;
	var dataSlices = [];

	$.each(ret, function(entryindex, entry) {
		var dataSlice = [];
		dataSlice.push(entry['os']);
		dataSlice.push(entry['attacks']);
		dataSlices.push(dataSlice);
	});
	var plot3 = jQuery.jqplot('pieOS', [ dataSlices ], {
		title : 'Number of Attacks on Basis of OS',
		seriesDefaults : {
			renderer : jQuery.jqplot.PieRenderer,
			rendererOptions : {
				// Turn off filling of slices.
				fill : false,
				showDataLabels : true,
				dataLabels: 'percent',
				// dataLabelFormatString : "%d %d%%",
				// Add a margin to seperate the slices.
				sliceMargin : 4,
				// stroke the slices with a little thicker line.
				lineWidth : 5
			}
		},
		legend : {
			show : true,
			location : 'e'
		}
	});
}

function loadPieAttack() {
	var jsonurl = 'FetchReportData?rtype=pieattack';
	var ret;
	$.ajax({
		async : false,
		url : jsonurl,
		dataType : "json",
		success : function(data) {
			ret = data;
		}
	});
	ret = ret.data;
	var dataSlices = [];

	$.each(ret, function(entryindex, entry) {
		var dataSlice = [];
		dataSlice.push(entry['attack']);
		dataSlice.push(entry['number']);
		dataSlices.push(dataSlice);
	});
	var plot3 = jQuery.jqplot('pieAttack', [ dataSlices ], {
		title : 'Number of Attacks on Basis of Type of Attack',
		seriesDefaults : {
			renderer : jQuery.jqplot.PieRenderer,
			rendererOptions : {
				// Turn off filling of slices.
				fill : false,
				showDataLabels : true,
				dataLabels: 'percent',
				// Add a margin to seperate the slices.
				sliceMargin : 4,
				// stroke the slices with a little thicker line.
				lineWidth : 5
			}
		},
		legend : {
			show : true,
			location : 'e'
		}
	});
}

function loadBar() {
	 var plot4 = $.jqplot('bar', [[[2,'127.0.0.1'], [6,'192.168.101.1'], [7,'192.168.101.5'], [10,'localhost']], [[7,'127.0.0.1'], [5,'192.168.101.1'],[3,'192.168.101.5'],[2,'localhost']], [[14,'127.0.0.1'], [9,'192.168.101.1'], [9,'192.168.101.5'], [8,'localhost']]], {
         stackSeries: true,
         captureRightClick: true,
         seriesDefaults:{
             renderer:$.jqplot.BarRenderer,
             shadowAngle: 135,
             rendererOptions: {
                 barDirection: 'horizontal',
                 highlightMouseDown: true   
             },
             pointLabels: {show: true, formatString: '%d'}
         },
         legend: {
             show: true,
             location: 'e',
             placement: 'outside'
         },
         axes: {
             yaxis: {
                 renderer: $.jqplot.CategoryAxisRenderer
             }
         }
     });
}