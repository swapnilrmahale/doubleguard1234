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
				dataLabels : 'percent',
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
				dataLabels : 'percent',
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

function loadGrid() {
	console.log('loadGridData');
	$("#list").jqGrid(
			{
				url : "FetchJQGridData",
				datatype : "json",
				mtype : 'GET',
				colNames : [ 'Id', 'Attack Type', 'IP Address', 'Browser',
						'OS', 'Time' ],
				height : 'auto',
				colModel : [ {
					name : 'id',
					index : 'id',
					hidden : false,
					formatter : 'integer',
					width : 30,
					sortable : true,
					sorttype : function() {
						return 1; // any constant value
					}
				}, {
					name : 'attack',
					index : 'attack',
					width : 120,
					sortable : true
				}, {
					name : 'ip',
					index : 'ip',
					width : 100,
					sortable : true
				}, {
					name : 'browser',
					index : 'browser',
					width : 100,
					sortable : true
				}, {
					name : 'os',
					index : 'os',
					width : 120,
					sortable : true
				}, {
					name : 'time',
					align : 'center',
					index : 'time',
					width : 170,
					sortable : true
				} ],
				pager : '#pager',
				rowNum : 60,
				rowList : [ 20, 40, 60 ],
				sortname : 'id',
				sortorder : 'asc',
				viewrecords : true,
				gridview : true,
				caption : 'Attack Report',
				loadonce : true,
				rownumbers : true
			});
	jQuery("#list").jqGrid('navGrid', '#pager', {
		edit : false,
		add : false,
		del : false,
		search : true
	});

	$("#list").jqGrid('filterToolbar', {
		stringResult : true,
		searchOnEnter : false,
		defaultSearch : 'cn',
		ignoreCase : true
	});

}