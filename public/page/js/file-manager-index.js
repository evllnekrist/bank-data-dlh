const id_el_list = '#data-list';
const no_delete_items = [];

function doDeleteBulk(){
  var selected = {};
  $('.product-item:checkbox:checked').each(function() {
      selected[$(this).data('id')] = $(this).data('title');
  });
  let str = $.map(selected, function(obj){return `'`+obj+`'`}).join(', ');
  // console.log('selected',selected,str)
  if(confirm("Apakah Anda yakin menghapus berkas "+str+"? Aksi ini tidak dapat dibatalkan.")){
    axios.post(baseUrl+'/api/file/post-delete-bulk', {'data':selected}, apiHeaders)
    .then(function (response) {
      console.log('response..',response);
      if(response.status == 200 && response.data.status) {
        Swal.fire({
          icon: 'success',
          width: 600,
          title: "Berhasil",
          // html: "...",
          confirmButtonText: 'Ya, terima kasih',
        });
        window.location = baseUrl+'/files';
      }else{
        Swal.fire({
          icon: 'warning',
          width: 600,
          title: "Gagal",
          html: response.data.message,
          confirmButtonText: 'Ya',
        });
      }
      $('#loading').hide();
      $('#form').show();
    })
    .catch(function (error) {
      Swal.fire({
        icon: 'error',
        width: 600,
        title: "Error",
        html: error,
        confirmButtonText: 'Ya',
      });
      $('#loading').hide();
      $('#form').show();
    });
  }else{
    Swal.fire({
      icon: 'info',
      width: 600,
      html: 'Batal dihapus',
      confirmButtonText: 'Ya',
    });
  }
}
function getData(move_to_page=null,keywords=''){
  let template_search = ``;
  $(id_el_list).html(loadingElementImg);
  if(move_to_page){
    $('[name="_page"]').val(move_to_page);
  }
  let url = baseUrl+'/api/file/get'
  let payload = {};
  payload['_dir'] = {}
  $("._dir").each(function() {
    if($(this).data('dir')){
      payload['_dir'][$(this).attr('id').replace('th_','')] = $(this).data('dir');
    }
  });
  $("._filter").each(function() {
    payload[$(this).attr('name')] = $(this).val();
  });
  console.log('keywords',keywords);
  if(keywords){
    template_search += ` kata kunci <b>`+keywords+`</b>`;
    payload['_keywords'] = keywords;
  }
  if($('[name="_search"]').val()){
    template_search += ` pencarian <b>`+$('[name="_search"]').val()+`</b>`;
  }
  // console.log('payload',payload); 
  // return;
  axios.post(url, payload, apiHeaders)
  .then(function (response) {
    console.log('[DATA] response..',response.data);
    if(response.data.status) {
        if(response.data.data.products && response.data.data.products.length > 0) {
          // i::data display-------------------------------------------------------------------------------START
            let template = ``;
            let imgToDisplay = [];
            (response.data.data.products).forEach((item) => {
              imgToDisplay[item.id] = baseUrl+'/img/no-image-clean.png'
              if(extensions['img'].includes('.'+item.type_of_extension)){  
                imgToDisplay[item.id] = item.file_main?cleanUrl(assetUrl+item.file_main):item.file_link
                img = new Image();
                img.src = imgToDisplay[item.id]+"?_="+(new Date().getTime());
                img.onload = function () {
                    $('#product_'+item.id+'_img').attr("src",imgToDisplay[item.id])
                    // console.log('item id '+item.id,imgToDisplay[item.id]);
                }
              }
              
            template +=
              `<div class="intro-y col-span-2">
                  <div class="file box zoom-in relative rounded-md px-3 pb-5 pt-8 sm:px-5">
                      <div class="absolute left-0 top-0 ml-3 mt-3">
                          <input data-tw-merge="" type="checkbox" data-id="`+item.id+`" data-title="`+item.title+`" class="product-item transition-all duration-100 ease-in-out shadow-sm border-slate-200 cursor-pointer rounded 
                          focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 
                          [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary 
                          [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed 
                          [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50 border">
                      </div>
                      <div class="mx-auto w-3/5">`;
                    if(extensions['img'].includes('.'+item.type_of_extension)){
                        template += `
                            <div class="relative block bg-center bg-no-repeat bg-contain before:content-[''] before:pt-[100%] before:w-full before:block">
                                <div class="image-fit absolute left-0 top-0 h-full w-full">
                                    <img data-action="zoom" class="rounded-md" src="`+imgToDisplay[item.id]+`" alt="this file is an image" id="product_`+item.id+`_img">
                                </div>
                            </div>`;
                    }else if(extensions['doc'].includes('.'+item.type_of_extension)){
                        template += `
                            <div class="relative block bg-center bg-no-repeat bg-contain before:content-[''] before:pt-[100%] before:w-full before:block bg-file-icon-file">
                                <div class="absolute bottom-0 left-0 right-0 top-0 m-auto flex items-center justify-center text-white">
                                    `+item.type_of_extension.replace(/\./g, "").toUpperCase()+`
                                </div>
                            </div>`;
                    }else{
                        template += `    
                            <div class="mx-auto w-3/5">
                                <div class="relative block bg-center bg-no-repeat bg-contain before:content-[''] before:pt-[100%] before:w-full before:block bg-file-icon-directory">
                                </div>
                            </div>`;
                    }
                    // `+item.owner_user_group.nickname+`
            template += `
                      </div>
                      <a class="mt-4 block truncate text-center font-medium" title="`+item.title+`" href="`+baseUrl+'/file/edit/'+item.id+`">`+item.title+`</a>
                      <div class="mt-0.5 text-center text-xs text-slate-500">`+(item.owner_user_group?item.owner_user_group.nickname:`<span class="text-white">_</span>`)+`</div>
                      <div data-tw-merge="" data-tw-placement="bottom-end" class="dropdown absolute right-0 top-0 ml-auto mr-2 mt-3"><a data-tw-toggle="dropdown" aria-expanded="false" href="javascript:;" class="cursor-pointer block h-5 w-5"><i data-tw-merge="" data-lucide="more-vertical" class="stroke-1.5 w-5 h-5 text-slate-500"></i>
                          </a>
                          <div data-transition="" data-selector=".show" data-enter="transition-all ease-linear duration-150" data-enter-from="absolute !mt-5 invisible opacity-0 translate-y-1" data-enter-to="!mt-1 visible opacity-100 translate-y-0" data-leave="transition-all ease-linear duration-150" data-leave-from="!mt-1 visible opacity-100 translate-y-0" data-leave-to="absolute !mt-5 invisible opacity-0 translate-y-1" class="dropdown-menu absolute z-[9999] hidden">
                              <div data-tw-merge="" class="dropdown-content rounded-md border-transparent bg-white p-2 shadow-[0px_3px_10px_#00000017] dark:border-transparent dark:bg-darkmode-600 w-40">
                                  <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="users" class="stroke-1.5 mr-2 h-4 w-4"></i>
                                      Share
                                      File</a>
                                  <a class="cursor-pointer flex items-center p-2 transition duration-300 ease-in-out rounded-md hover:bg-slate-200/60 dark:bg-darkmode-600 dark:hover:bg-darkmode-400 dropdown-item"><i data-tw-merge="" data-lucide="trash" class="stroke-1.5 mr-2 h-4 w-4"></i>
                                      Delete</a>
                              </div>
                          </div>
                      </div>
                  </div>
                </div>`;
            });
            $(id_el_list).html(template);
          // i::data display---------------------------------------------------------------------------------END
          // i::data statistics----------------------------------------------------------------------------START
            $('#products_count_start').html(response.data.data.products_count_start);
            $('#products_count_end').html(response.data.data.products_count_end);
            $('#products_count_total').html(response.data.data.products_count_total);
            $('#products_search_info').html(template_search);
          // i::data statistics------------------------------------------------------------------------------END
          // i::data pagination----------------------------------------------------------------------------START
            template = '';
            let max_page = Math.ceil(response.data.data.products_count_total/response.data.data.filter._limit);
            template += 
            `<li class="flex-1 sm:flex-initial">
                <a onclick="getData(`+1+`)"  
                data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
                <i class="fas fa-angle-double-left"></i>
                </a>
            </li>`; 
            if(response.data.data.filter._page > 1){
              template += 
              `<li class="flex-1 sm:flex-initial">
                  <a onclick="getData(`+(response.data.data.filter._page-1)+`)" 
                  data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
                  `+(response.data.data.filter._page-1)+`
                  </a>
              </li>`; 
            }

            template += 
            `<li class="flex-1 sm:flex-initial">
                <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3 !box dark:bg-darkmode-400">
                `+response.data.data.filter._page+`
                </a>
            </li>`;
            
            if(response.data.data.filter._page < max_page){
              template += 
              `<li class="flex-1 sm:flex-initial">
                  <a onclick="getData(`+(response.data.data.filter._page+1)+`)" 
                  data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
                  `+(response.data.data.filter._page+1)+`
                  </a>
              </li>`; 
            }
            if(response.data.data.filter._page+1 < max_page){
              template += 
              `<li class="flex-1 sm:flex-initial">
                  <a onclick="getData(`+(response.data.data.filter._page+2)+`)" 
                  data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
                  `+(response.data.data.filter._page+2)+`
                  </a>
              </li>`; 
            }
            template += 
            `<li class="flex-1 sm:flex-initial">
                <a onclick="getData(`+max_page+`)"  
                data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">\
                <i class="fas fa-angle-double-right"></i>
                </a>
            </li>`; 

            $(id_el_list+'-pagination').html(template);
            $('[name="_page"]').val(response.data.data.filter._page);
          // i::data pagination------------------------------------------------------------------------------END
        }else{
          $(id_el_list).html('<h3 class="mt-5">Tidak ada data</h3>');
        }
          
    }else{
      Swal.fire({
        icon: 'warning',
        width: 600,
        title: "Gagal",
        html: response.data.message,
        confirmButtonText: 'Ya',
      });
    }
  })
  .catch(function (error) {
    Swal.fire({
      icon: 'error',
      width: 600,
      title: "Error",
      html: error,
      confirmButtonText: 'Ya',
    });
    console.log(error);
  });
}

$(function () {
  getData();
});