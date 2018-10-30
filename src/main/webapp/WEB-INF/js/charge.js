

var saveForm={
    date:null,
    type:null,
    description:null,
    amount:null,
    blockNumber:null
}


$(document).ready(function () {

    alertify.parent(document.body);
    $(':input[data-mask]').each(function () {
        var mask = $(this).attr('data-mask');
        if (mask == 'time-24') {
            $.mask.definitions['H'] = "[0-2]";
            $.mask.definitions['h'] = "[0-3]";
            $.mask.definitions['M'] = "[0-5]";
            $.mask.definitions['m'] = "[0-9]";
            $(this).mask('Hh:Mm');
        } else if (mask == 'time-12') {
            $.mask.definitions['H'] = "[0-1]";
            $.mask.definitions['h'] = "[0-9]";
            $.mask.definitions['M'] = "[0-5]";
            $.mask.definitions['m'] = "[0-9]";
            $.mask.definitions['P'] = "[AaPp]";
            $.mask.definitions['p'] = "[Mm]";
            $(this).mask('Hh:Mm Pp');
        } else {
            $(this).mask(mask);
        }
    });
    $(".time").persianDatepicker({
        timePicker: {
            showSeconds: false,
            enabled: true
        },
        onlyTimePicker: true,
        format: 'HH:mm'
    });
    $(".date").persianDatepicker({
        calendarType: 'persian',
        initialValue: false,
        calendar: {
            persian: {
                locale: 'fa'
            }
        },
        navigator: {
//			enabled: true,
            text: {
                btnNextText: ">",
                btnPrevText: "<"
            }
        },
        format: 'YYYY/MM/DD',
        autoClose: true,
        observer: true
    });
    $(".date").val('');
    $(".gregorian-date").persianDatepicker({
        calendarType: 'gregorian',
        initialValue: false,
        calendar: {
            persian: {
                locale: 'en'
            }
        },
        toolbox: {
            calendarSwitch: {
                enabled: true
            }
        },
        format: 'YYYY/MM/DD',
        autoClose: true,
        observer: true
    });

    getAllBlocks();


    $('#save').on('click', function () {

        getSaveFormValues();

        if(saveForm.type=="cost") {
            saveCost();

        }else if(saveForm.type="charge") {
            saveCharge();
        }else{

            alertify.warning("نوع انتخاب نشده است.");
        }
    });
});
function getSaveFormValues() {

    var typeDropDown = document.getElementById("type");
    var selectedType = typeDropDown.options[typeDropDown.selectedIndex].value;
    saveForm.type = selectedType;
    saveForm.date = $("#date").val();
    saveForm.description = $("#description").val();
    saveForm.amount=$("#amount").val();
    var blockDropdown = document.getElementById("blockNumber");
    var selectedBlock = blockDropdown.options[blockDropdown.selectedIndex].value;
    saveForm.blockNumber = selectedBlock;
    console.log(saveForm);
}
function saveCost() {

}
function saveCharge() {

    post(getBaseDomain() + '/addCharge', saveForm, function (result) {

        alertify.success("درخواست با شماره پیگیری "+result.trackingNumber+ " ثبت گردید.");
        $("#receiveTrackingNumber").show()

    });
}

function getAllBlocks() {

    $.ajax({
        url: '/Block/getAllBlocks/',
        type: 'GET',
        success: function (blocks) {

            console.log(blocks);

            if(blocks==null || blocks.length==0) {

                warningNotify("هیچ بلوکی ثبت نشده است.");
                return;
            }else {
                for (let block of blocks) {
                    var option = new Option(block.blockNumber, block.id);
                    $('#blockNumber').append($(option));

                }
            }
        }
    });

}

function post(url, data, callback) {
    $.ajax(url, {
        data: JSON.stringify(data),
        contentType: 'application/json; charset=utf-8',
        type: 'POST',
        dataType: "json",
        success: function (result, status) {
            callback(result, status);
        }
    });
}

function getBaseDomain() {
    var baseDomain = "/" + window.location.pathname.split('/')[1];
    return baseDomain;
}