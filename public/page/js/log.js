const id_el_list = '#data-list';
const class_el_list = 'tbody-item';
const no_delete_items = [];
loadingElementImg = `<div class="intro-y `+class_el_list+`">
                        <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                            <img src="../../img/loading.gif" class="mx-auto">
                        </div>
                    </div>`; // rewrite

function getData(move_to_page=null){
  $('.'+class_el_list).remove();
  $(id_el_list).append(loadingElementImg);
  if(move_to_page){
    $('[name="_page"]').val(move_to_page);
  }
  let url = baseUrl+'/api/log/get'
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
  // console.log('payload',payload); 
  // return;
  axios.post(url, payload, apiHeaders)
  .then(function (response) {
    console.log('[DATA] response..',response.data);
    if(response.data.status) {
        $('.'+class_el_list).remove();
        if(response.data.data.products && response.data.data.products.length > 0) {
            console.log('____you are here >=1');
          // i::data display-------------------------------------------------------------------------------START
            let template = ``;
            (response.data.data.products).forEach((item) => {
              template +=
              `<div class="intro-y tbody-item">
                  <div class="transition duration-200 ease-in-out transform cursor-pointer inline-block sm:block border-b border-slate-200/60 dark:border-darkmode-400 hover:scale-[1.02] hover:relative hover:z-20 hover:shadow-md hover:border-0 hover:rounded bg-white text-slate-800 dark:text-slate-300 dark:bg-darkmode-600">
                      <div class="flex px-5 py-3">
                          <div class="mr-5 w-1/4 truncate">
                              It is a long established fact
                          </div>
                          <div class="mr-5 w-1/2 truncate">
                              Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo
                          </div>
                          <div class="mr-5 w-1/2 truncate">
                              Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?
                          </div>
                          <div class="w-1/4 whitespace-nowrap">
                              <div class="text-right">01:10 PM</div>
                              <div class="flex justify-end">
                                  <div class="image-fit relative h-6 w-6 flex-none">
                                      <img class="rounded-full" src="{{asset('dist/images/fakers/profile-3.jpg')}}" alt="Midone - Tailwind Admin Dashboard Template">
                                  </div>
                                  <div class="ml-3 truncate font-medium">
                                      Robert De Niro
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>`;
              $('.'+class_el_list).append(template);
            });
          // i::data display---------------------------------------------------------------------------------END
          // i::data statistics----------------------------------------------------------------------------START
            $('#products_count_start').html(response.data.data.products_count_start);
            $('#products_count_end').html(response.data.data.products_count_end);
            $('#products_count_total').html(response.data.data.products_count_total);
          // i::data statistics------------------------------------------------------------------------------END
          // i::data pagination----------------------------------------------------------------------------START
          // i::data pagination------------------------------------------------------------------------------END
        }else{
            console.log('____you are here ==0');
          $(id_el_list).append(`
            <div class="intro-y tbody-item">
                <center class="my-5 text-warning">Tidak ada data</center>
            </div>`);
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