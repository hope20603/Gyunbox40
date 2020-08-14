function lottoCal() {
	if (!formcheck()) {
		return;
	}
	var wmoney = $("#wmoney").val();
	var rmoney = wmoneyCal(wmoney);
	$("#rmoney").text(rmoney);
	/*결과로 scroll*/
	var offset = $("#home").offset();
	$('html, body').animate({ scrollTop: offset.top }, 400);
}

function formcheck(obj) {
	if ($("#wmoney").val() == "") {
		alert("당첨금액을 입력하셔야 실수령액 계산이 정확히 됩니다.");
		$("#wmoney").focus();
		return false;
	}
	return true;
}
function lottoformInit() {
	$(".commadisplay").val("");
}

function wmoneyCal(wmoney) {
	var revenuemoney = 0;
	wmoney = wmoney.replace(/,/g, "");
	wmoney = parseInt(wmoney);
	// wmoney: 당첨금 wtaxmoney: 과세 대상금
	var wtaxmoney = 0;
	wtaxmoney = wmoney - 1000;
	var totaltax = 0;
	if (wmoney <= 50000) {
		revenuemoney = wmoney;
	}
	else if (50000 < wmoney && wmoney <= 300000000) {
		totaltax = Math.round(wtaxmoney * 0.22);
		revenuemoney = wmoney - totaltax;
	}
	else if (300000000 < wmoney) {

		atax = Math.round(300000000 * 0.22);
		divmoney = wtaxmoney - 300000000;
		btax = Math.round(divmoney * 0.33);
		totaltax = atax + btax;
		revenuemoney = wmoney - totaltax;
	}

	//계사된 당첨
	revenuemoney = number_format(revenuemoney);
	$("#rmoney").text("");
	$(".loader").show();
	setTimeout(function () {
		$(".loader").hide();
		$("#rmoney").text(revenuemoney);
	}, 1000)

}
$(document).ready(function () {
	try {
		$(".commadisplay").on("keyup", function (e) {
			num_only(this);
			var result = "";
			str = this.value;

			re = /[^0-9]/gi;
			str = str.replace(re, "");
			this.value = str;

			var len = str.length;

			for (i = len - 1, j = 0; i >= 0; i--) {
				result = str.substring(i, i + 1) + result;
				j++;
				if (j == 3 && i != 0) {
					result = "," + result;
					j = 0;
				}
			}
			this.value = result;
		});
	} catch (e) { }
});
function get_comma_str(num) {
	var str = num.toString();
	str = str.replace(/,/g, "");
	var str_len = str.length;

	if (str_len <= 3) return str;

	var res_str = "";
	var mod = 3 - (str_len % 3);

	for (var i = 0; i < str_len; i++) {
		res_str += str.charAt(i);

		if (i < str_len - 1) {
			mod++;

			if ((mod % 3) == 0) {
				res_str += ",";
				mod = 0;
			}
		}
	}
	return res_str;
}
function num_only(obj) {
	if (typeof (obj) == "object")
		obj.value = obj.value.replace(/[^0-9]+/g, "");
	else
		return obj.replace(/[^0-9]+/g, "");
}
//소수점 자리 버림
function roundPrecision(val, precision) {
	//precision
	var p = Math.pow(10, precision);
	return Math.round(val * p) / p;
}
function number_format(num) {
	if (!isFinite(num)) return num;
	var num_str = num.toString();
	var result = "";
	for (var i = 0; i < num_str.length; i++) {
		var tmp = num_str.length - (i + 1);
		if (((i % 3) == 0) && (i != 0)) result = ',' + result;
		result = num_str.charAt(tmp) + result;
	}
	return result;
}


function getColorClass(value) {
	if (value <= 10) {
		return "clr1";
	} else if (value <= 20) {
		return "clr2";
	} else if (value <= 30) {
		return "clr3";
	} else if (value <= 40) {
		return "clr4";
	} else {
		return "clr5";
	}
}
