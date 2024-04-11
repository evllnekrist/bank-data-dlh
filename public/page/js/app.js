console.log('____app js');

const assetUrl = "{{asset('/')}}"
const baseUrl = window.location.origin;
const apiHeaders = {
    "Accept": "*/*",
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "multipart/form-data",
};
const formatterMonth = new Intl.DateTimeFormat('en-US', { month: 'short' });
const loadingElementImg = `<div class="col-span-12"><img src="../../img/loading.gif" class="mx-auto"></div>`;
const loadingElement = `<div class="mx-auto">memuat...</div>`;
let imgToDisplay = ``, img = ``;
const extensions = {
    'img' : ['.png','.jpg','.webp','.heic','.heif'],
    'doc' : ['.pdf','.doc','.docx','.xls','.xlsx','.csv','.ppt','.pptx'] 
}; // ,'.'

function nospace(event){
    if((event.target.value).includes(' ')){
        Swal.fire({
            position: 'top-end',
            icon: 'warning',
            html: 'Input ini tidak menerima spasi',
            showConfirmButton: false,
            timer: 2000
        });
    }
    event.target.value =  event.target.value.replaceAll(" ","")
}
$('.nospace').on('keyup', function(event) {
    nospace(event);
});

function numeric(event){
    if ((event.target.value).match(/[^$,.\d]/)){
        Swal.fire({
            position: 'top-end',
            icon: 'warning',
            html: 'Input ini hanya boleh angka',
            showConfirmButton: false,
            timer: 2000
        });
    }
    event.target.value =  event.target.value.replace(/[^\d]+/g,'')
}
$('.numeric').on('keyup', function(event) {
    numeric(event);
});

function uppercase(event){
    event.target.value =  event.target.value.toUpperCase()
}
$('.uppercase').on('keyup', function(event) {
    uppercase(event);
});

function lowercase(event){
    event.target.value =  event.target.value.toLowerCase()
}
$('.lowercase').on('keyup', function(event) {
    lowercase(event);
});

function inputFile(event){
    let iii = event.target.getAttribute('data-index-input-file');
    const files = event.target.files
    let url='', template='';
    // console.log('change input image');
    // console.log(iii,event);
    for(i = 0; i < files.length; i++){
        url = URL.createObjectURL(event.target.files[i]);
        if($.inArray(event.target.files[i]['type'], accept_mimes['img']) >= 0){
            template += `<img src="`+url+`">`;
        }else{
            template += `
            <div class="mx-auto w-3/5">
                <div class="relative block bg-center bg-no-repeat bg-contain before:content-[''] before:pt-[100%] before:w-full before:block bg-file-icon-file">
                    <div class="absolute bottom-0 left-0 right-0 top-0 m-auto flex items-center justify-center text-white">
                        `+(event.target.files[i]['name']).split('.').pop().toUpperCase()+`
                    </div>
                </div>
            </div>`;
        }
    }
    // console.log('template',template)
    $('#input-file-preview-'+iii).html(template);
    $('#input-file-preview-'+iii).removeClass('hidden');
    $('#input-file-none-'+iii).addClass('hidden');
    $('#input-file-btn-'+iii).removeClass('hidden');
}
$('.input-file').on('change', function(event) {
    inputFile(event);
});
function initiateFileFromInput(){
    let iii = 0, template = '', type_of_extension = '';
    $('[type="file"]').each(function(index) {
        // console.log('_____', typeof $(this).data('value') !== 'undefined', $(this).data('value'));
        iii = $(this).data('index-input-file');
        if(typeof $(this).data('value') !== 'undefined' && $(this).data('value')){
            type_of_extension = $(this).data('value').split('.').pop();
            if(extensions['img'].includes('.'+type_of_extension)){
                template = `<img src="`+$(this).data('value')+`">`;
            }else{
                template = `
                <div class="mx-auto w-3/5">
                    <div class="relative block bg-center bg-no-repeat bg-contain before:content-[''] before:pt-[100%] before:w-full before:block bg-file-icon-file">
                        <div class="absolute bottom-0 left-0 right-0 top-0 m-auto flex items-center justify-center text-white">
                            `+type_of_extension.toUpperCase()+`
                        </div>
                    </div>
                </div>`;
            }        
            $('#input-file-preview-'+iii).html(template);
        }
    });
}

const regexExp_slug = /^[a-z][-a-z0-9]*$/;
function checkSlug(str){
    if(regexExp_slug.test(str)){
    $('#slug-info').html('<i class="text-info">Slug valid</i>');
    $('[name="check_validity"]').val(1)
    }else{
    $('#slug-info').html('<b class="text-danger">Slug tidak valid</b>');
    $('[name="check_validity"]').val(0)
    }
    // console.log('check_validity',$('[name="check_validity"]').val() )
}
$('.slug').on('keyup', function(event) {
    checkSlug(event.target.value)
});

function display(id,id2){
    // console.log(id,id2);
    let action = $('#'+id).data('display')
    if(action == 'hide'){
    $('#'+id).show()
    $('#'+id2).hide()
    $('#'+id).data('display', 'show')
    $('#'+id+'-action-text').html('Batal Ganti Gambar')
    }else{
    $('#'+id).hide()
    $('#'+id2).show()
    $('#'+id).data('display', 'hide')
    $('#'+id+'-action-text').html('Ganti Gambar')
    }
}

function copyToClipboard(copyText) {
    // Copy the text inside the text field
    navigator.clipboard.writeText(copyText);
    // Alert the copied text
    alert(`Anda sudah mengcopy: "` + copyText + `"`);
}

function hideLoading(appendTo){
    // console.log(appendTo+'Loading','toHide')
    $(appendTo+'_loading').hide()
}

function changeDir(field){
    let el = $('#th_'+field);
    
    switch (el.data('dir')) {
      case 'asc': // currently ASC to be DESC
        el.data('dir','desc');
        el.find('.fas').addClass('hidden');
        el.find('.fa-sort-down').removeClass('hidden');
        break;
      case 'desc': // currently DESC to be NEUTRAL
        el.data('dir','');
        el.find('.fas').addClass('hidden');
        el.find('.fa-sort').removeClass('hidden');
        break;
      default: // curently NEUTRAL to ASC
        el.data('dir','asc');
        el.find('.fas').addClass('hidden');
        el.find('.fa-sort-up').removeClass('hidden');
        break;
    }
    getData();
}

function shorten(text, maxLength, delimiter, overflow) {
    if(text){
        delimiter = delimiter || "&hellip;";
        overflow = overflow || false;
        var ret = text;
        if (ret.length > maxLength) {
        var breakpoint = overflow ? maxLength + ret.substr(maxLength).indexOf(" ") : ret.substr(0, maxLength).lastIndexOf(" ");
        ret = ret.substr(0, breakpoint) + delimiter;
        }
        return ret;
    }else{
        return "";
    }
}
  

$(function (){
    $('[name="_search"]').keypress(function(e){
        if (e.key === "Enter") { // If the user presses the "Enter" key on the keyboard
          e.preventDefault(); // Cancel the default action, if needed
          getData(); 
        }
      });
});
  