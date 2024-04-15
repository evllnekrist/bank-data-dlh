const id_el_list = '#data-list';
const no_delete_items = [];
let di_data_list = [];

function doDelete(id,name){
  if(confirm("Apakah Anda yakin menghapus input '"+name+"'? Aksi ini tidak dapat dibatalkan.")){
    axios.post(baseUrl+'/api/user/post-delete/'+id, {}, apiHeaders)
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
        window.location = baseUrl+'/users';
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
function getData(selected_id){
  $(id_el_list+'-wrap').hide();
  $(id_el_list+'-info').html('');
  let template = ``;
  // console.log('__product',di_data_list[selected_id]);
  if(di_data_list[selected_id].length > 0){
    (di_data_list[selected_id]).forEach((item) => {
      template +=
      `<tr data-tw-merge="" class="intro-x">
        <td data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box w-10 whitespace-nowrap rounded-l-none rounded-r-none border-x-0 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600">
            <input data-tw-merge="" type="checkbox" class="transition-all duration-100 ease-in-out shadow-sm border-slate-200 cursor-pointer rounded focus:ring-4 focus:ring-offset-0 focus:ring-primary focus:ring-opacity-20 dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&[type='radio']]:checked:bg-primary [&[type='radio']]:checked:border-primary [&[type='radio']]:checked:border-opacity-10 [&[type='checkbox']]:checked:bg-primary [&[type='checkbox']]:checked:border-primary [&[type='checkbox']]:checked:border-opacity-10 [&:disabled:not(:checked)]:bg-slate-100 [&:disabled:not(:checked)]:cursor-not-allowed [&:disabled:not(:checked)]:dark:bg-darkmode-800/50 [&:disabled:checked]:opacity-70 [&:disabled:checked]:cursor-not-allowed [&:disabled:checked]:dark:bg-darkmode-800/50">
        </td>
        <td title="`+item.description+`" data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box whitespace-nowrap rounded-l-none rounded-r-none border-x-0 !py-3.5 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600">
            <div class="flex items-center">
                <div class="ml-4">
                    <a class="whitespace-nowrap font-medium" href="">
                      `+item.label+`
                    </a>
                    <div class="mt-0.5 whitespace-nowrap text-xs text-slate-500">
                      `+item.name+`
                    </div>
                </div>
            </div>
        </td>
        <td data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box whitespace-nowrap rounded-l-none rounded-r-none border-x-0 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600">
            `+item.type_of_input+`
        </td>
        <td data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box w-40 whitespace-nowrap rounded-l-none rounded-r-none border-x-0 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600">
            `+(item.is_enabled?
            `<div class="flex items-center justify-center text-success">
                Aktif
            </div>`:
            `<div class="flex items-center justify-center text-danger">
                Tidak Aktif
            </div>`)
            +`
        </td>
        <td data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box w-40 whitespace-nowrap rounded-l-none rounded-r-none border-x-0 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600">
            `+(item.is_required?
            `<div class="flex items-center justify-center text-success">
                Ya
            </div>`:
            `<div class="flex items-center justify-center text-danger">
                Tidak
            </div>`)
            +`
        </td>
        <td data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box w-40 whitespace-nowrap rounded-l-none rounded-r-none border-x-0 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600">
            `+(item.is_multiple?
            `<div class="flex items-center justify-center text-success">
                Ya
            </div>`:
            `<div class="flex items-center justify-center text-danger">
                Tidak
            </div>`)
            +`
        </td>
        <td data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box whitespace-nowrap rounded-l-none rounded-r-none border-x-0 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600">
            `+item.behavior+`
        </td>
        <td data-tw-merge="" class="px-5 py-3 border-b dark:border-darkmode-300 box w-56 rounded-l-none rounded-r-none border-x-0 shadow-[5px_3px_5px_#00000005] first:rounded-l-[0.6rem] first:border-l last:rounded-r-[0.6rem] last:border-r dark:bg-darkmode-600 before:absolute before:inset-y-0 before:left-0 before:my-auto before:block before:h-8 before:w-px before:bg-slate-200 before:dark:bg-darkmode-400">
            <div class="flex items-center justify-center">`;
      if(no_delete_items.includes(item.id)){
        template += 
                `<i>tidak dapat dihapus</i>`;
      }else{
        template +=
                `<a class="mr-3 flex items-center" href="#">
                <i class="fa fa-pen"></i>
                </a>
                <a onclick="doDelete(`+item.id+`,'`+item.label+`')" class="flex items-center text-danger">
                <i class="fa fa-trash"></i>
                </a>`;
      }
      template +=
            `</div>
        </td>
      </tr>`;
    });
    $(id_el_list+'-wrap').show();
    $(id_el_list).html(template);
    $('#products_count_total').html(di_data_list[selected_id].length);
  }else{
    $(id_el_list+'-info').html('<center class="mt-5">Tidak ada data</center>');
  }
}
function getDataTypeOfFile(move_to_page=null){
  let id_el_list2 = 'tof'; di_data_list = [];
  if(move_to_page){
    $('[name="_'+id_el_list2+'_page"]').val(move_to_page);
  }
  let url = baseUrl+'/api/option/get'
  let payload = {
    '_model_with': 'dynamic_input_list',
    '_type': 'TYPE_OF_FILE'
  };
  payload['_dir'] = {}
  $('._'+id_el_list2+'_dir').each(function() {
    if($(this).data('dir')){
      payload['_dir'][$(this).attr('id').replace('th_','')] = $(this).data('dir');
    }
  });
  $('._'+id_el_list2+'_filter').each(function() {
    payload[$(this).attr('name')] = $(this).val();
  });
  // console.log('payload',payload); 
  // return;
  axios.post(url, payload, apiHeaders)
  .then(function (response) {
    console.log('[DATA] response..',response.data);
    if(response.data.status) {
        if(response.data.data.products && response.data.data.products.length > 0) {
          // i::data display-------------------------------------------------------------------------------START
            let template = ``;
            (response.data.data.products).forEach((item) => {
              di_data_list[item.id] = item.dynamic_input_list;
              template += `
                <div class="box zoom-in col-span-12 cursor-pointer p-2 sm:col-span-3 md:col-span-2" `+(item.description?`title="`+item.description+`"`:``)+` onclick="getData(`+item.id+`)">
                    <div class="text-base font-medium">`+item.label+`</div>
                    <div class="text-slate-500">`+(item.dynamic_input_list.length?`+ `+item.dynamic_input_list.length+` input dinamis`:``)+`</div>
                </div>`;
            });
            $(id_el_list+'-'+id_el_list2).html(template);
          // i::data display---------------------------------------------------------------------------------END
          // i::data statistics----------------------------------------------------------------------------START
            $('#'+id_el_list2+'-'+'products_count_start').html(response.data.data.products_count_start);
            $('#'+id_el_list2+'-'+'products_count_end').html(response.data.data.products_count_end);
            $('#'+id_el_list2+'-'+'products_count_total').html(response.data.data.products_count_total);
          // i::data statistics------------------------------------------------------------------------------END
        //   // i::data pagination----------------------------------------------------------------------------START
        //     template = '';
        //     let max_page = Math.ceil(response.data.data.products_count_total/response.data.data.filter._limit);
        //     template += 
        //     `<li class="flex-1 sm:flex-initial">
        //         <a onclick="getData(`+1+`)"  
        //         data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
        //         <i class="fas fa-angle-double-left"></i>
        //         </a>
        //     </li>`; 
        //     if(response.data.data.filter._page > 1){
        //       template += 
        //       `<li class="flex-1 sm:flex-initial">
        //           <a onclick="getData(`+(response.data.data.filter._page-1)+`)" 
        //           data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
        //           `+(response.data.data.filter._page-1)+`
        //           </a>
        //       </li>`; 
        //     }

        //     template += 
        //     `<li class="flex-1 sm:flex-initial">
        //         <a data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3 !box dark:bg-darkmode-400">
        //         `+response.data.data.filter._page+`
        //         </a>
        //     </li>`;
            
        //     if(response.data.data.filter._page < max_page){
        //       template += 
        //       `<li class="flex-1 sm:flex-initial">
        //           <a onclick="getData(`+(response.data.data.filter._page+1)+`)" 
        //           data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
        //           `+(response.data.data.filter._page+1)+`
        //           </a>
        //       </li>`; 
        //     }
        //     if(response.data.data.filter._page+1 < max_page){
        //       template += 
        //       `<li class="flex-1 sm:flex-initial">
        //           <a onclick="getData(`+(response.data.data.filter._page+2)+`)" 
        //           data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">
        //           `+(response.data.data.filter._page+2)+`
        //           </a>
        //       </li>`; 
        //     }
        //     template += 
        //     `<li class="flex-1 sm:flex-initial">
        //         <a onclick="getData(`+max_page+`)"  
        //         data-tw-merge="" class="transition duration-200 border items-center justify-center py-2 rounded-md cursor-pointer focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus-visible:outline-none dark:focus:ring-slate-700 dark:focus:ring-opacity-50 [&:hover:not(:disabled)]:bg-opacity-90 [&:hover:not(:disabled)]:border-opacity-90 [&:not(button)]:text-center disabled:opacity-70 disabled:cursor-not-allowed min-w-0 sm:min-w-[40px] shadow-none font-normal flex border-transparent text-slate-800 sm:mr-2 dark:text-slate-300 px-1 sm:px-3">\
        //         <i class="fas fa-angle-double-right"></i>
        //         </a>
        //     </li>`; 

        //     $(id_el_list+'-'+id_el_list2+'-pagination').html(template);
            $('[name="_'+id_el_list2+'_page"]').val(response.data.data.filter._page);
        //   // i::data pagination------------------------------------------------------------------------------END
        }else{
          $(id_el_list+'-'+id_el_list2).html('<h3 class="mt-5">Tidak ada data</h3>');
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
  getDataTypeOfFile();
});