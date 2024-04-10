
function getDynamicInputs(){
    let id_el_list = '#dynamic-input-inner-wrap';
    let url = baseUrl+'/api/dynamic-input/get'
    let payload = {
        '_page': 1,
        '_limit': 1000,
        '_type_of_file': $('[name="type_of_file"]').val()
    };
    $('.btn-submit').hide();
    $(id_el_list+'-wrap').hide();
    $(id_el_list+'-info').html('');
    $(id_el_list+'-loading').show();
    axios.post(url, payload, apiHeaders)
    .then(function (response) {
      console.log('[DATA] response..',response.data);
      if(response.data.status) {
          if(response.data.data.products && response.data.data.products.length > 0) {
            // i::data display-------------------------------------------------------------------------------START
              let template = ``, template2 = ``, behavior = [], htmlclass = '', mime = [], mime_str = '';
              let file_i = 0; 
              (response.data.data.products).forEach((item) => {
                if(item.behavior){
                  behavior = item.behavior.split(',');
                }else{
                  behavior = [];
                }
                // console.log('item', item, behavior);
                if(item.type_of_input == 'file'){
                    mime = [], mime_str = ''; 
                    behavior.forEach(item_behavior => {
                      if(item_behavior.startsWith('mime-')){
                        mime = mime.concat(accept_mimes[item_behavior.split('-').pop()]);
                        mime_str += (item_behavior.split('-').pop()=='img'?'gambar, ':'dokumen, ')
                      }
                    });
                    // console.log('mimes...', mime)
                    template2 += `
                    <div class="mb-3">
                        <label class="text-sm text-slate-400 tracking-wide `+(item.is_required?`of-required`:``)+`">`+item.label+`</label>
                        <div class="grid grid-cols-1 space-y-2 border-dashed border-2 px-5 my-2 border-indigo-600">
                            <div class="flex items-center justify-center w-full">
                                <label class="flex flex-col rounded-lg border-4 border-dashed w-full h-60 p-10 group text-center">
                                    <div class="h-full w-full text-center flex flex-col items-center justify-center items-center  ">
                                        <svg xmlns="http://www.w3.org/2000/svg" id="input-img-none-`+(++file_i)+`"
                                            class="w-10 h-10 text-blue-400 group-hover:text-blue-600" 
                                            fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                                        </svg>
                                        <div class="flex flex-auto max-h-48 w-4/5 mx-auto py-3" id="input-img-preview-`+(file_i)+`">
                                        </div>
                                        <p class="pointer-none text-gray-500 "><span class="text-sm">Drag & drop</span> disini <br /> atau <a href="" id="" class="text-blue-600 hover:underline">pilih</a> dari komputer</p>
                                        <input name="`+item.name+`" data-index-input-img="`+(file_i)+`" type="file" accept="`+mime+`"
                                        `+(item.is_multiple?`multiple="multiple"`:``)+` `+(item.is_disabled?`disabled`:``)+` `+(item.is_required?`required`:``)+`
                                            class="input-img mt-2 block w-full text-xs border border-gray-300 rounded-lg cursor-pointer" 
                                            onchange="inputImg(event)">
                                    </div>
                                </label>
                            </div>
                        </div>
                        <p class="text-sm text-slate-300">
                            <i>* tipe `+mime_str+`<br>max 50MB</i>
                        </p>
                    </div>`;
                }else{
                    htmlclass = '';
                    behavior.forEach(item_behavior => {
                      if(item_behavior.startsWith('class-')){
                        htmlclass += item_behavior.split('-').pop()+' ';
                      }
                    });
                    // console.log('htmlclass....',htmlclass);
                    template += `
                    <div class="mb-3">
                        <label class="`+(item.is_required?`of-required`:``)+` text-slate-400">`+item.label+`</label>`;
                    switch (item.type_of_input) {
                      case 'select':
                        template += `                                          
                        <div class="mt-2">
                            <select name="`+item.name+`" data-placeholder="Pilih dari opsi..." class="`+htmlclass+` tom-select w-full" `+(item.is_multiple?`multiple="multiple"`:``)+` `+(item.is_disabled?`disabled`:``)+`>
                                <option value=""></option>
                                @foreach($user_groups as $item)                                                
                                    <option value="{{$item->id}}">{{$item->nickname}} - {{$item->fullname}}</option>
                                @endforeach
                            </select>
                        </div>`;
                        break;
                      case 'textarea':
                        template += `
                        <textarea name="`+item.name+`"  `+(item.is_disabled?`disabled`:``)+`  
                        class="`+htmlclass+` mt-2 disabled:bg-slate-100 disabled:cursor-not-allowed 
                        dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent 
                        transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 
                        dark:bg-darkmode-800 dark:border-transparent dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none 
                        group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10">
                        </textarea>`;
                        break;
                      default:
                        template += `
                        <input required name="`+item.name+`" type="`+item.type_of_input+`" `+(item.is_disabled?`disabled`:``)+`
                        class="`+htmlclass+` disabled:bg-slate-100 disabled:cursor-not-allowed dark:disabled:bg-darkmode-800/50 dark:disabled:border-transparent [&[readonly]]:bg-slate-100 [&[readonly]]:cursor-not-allowed 
                        [&[readonly]]:dark:bg-darkmode-800/50 [&[readonly]]:dark:border-transparent transition duration-200 ease-in-out w-full text-sm border-slate-200 shadow-sm rounded-md 
                        placeholder:text-slate-400/90 focus:ring-4 focus:ring-primary focus:ring-opacity-20 focus:border-primary focus:border-opacity-40 dark:bg-darkmode-800 dark:border-transparent 
                        dark:focus:ring-slate-700 dark:focus:ring-opacity-50 dark:placeholder:text-slate-500/80 group-[.form-inline]:flex-1 group-[.input-group]:rounded-none 
                        group-[.input-group]:[&:not(:first-child)]:border-l-transparent group-[.input-group]:first:rounded-l group-[.input-group]:last:rounded-r group-[.input-group]:z-10">`;
                        break;
                    }
                    template += `                                
                    </div>`;
                }
              });
              $(id_el_list+'-img').html(template2);
              $(id_el_list+'-noimg').html(template);
              $(id_el_list+'-wrap').show();
              $(id_el_list+'-loading').hide();
            // i::data display---------------------------------------------------------------------------------END
          }else{
            $(id_el_list+'-info').html('<i class="mx-auto text-slate-300">* tidak ada form tambahan</i>');
            $(id_el_list+'-loading').hide();
          }
          $('.btn-submit').show();
      }else{
        Swal.fire({
          icon: 'warning',
          width: 600,
          title: "Gagal",
          html: response.data.message,
          confirmButtonText: 'Ya',
        });
        $(id_el_list+'-loading').hide();
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
      $(id_el_list+'-loading').hide();
    });
}
  
function fillDynamicInputs(){
  
}

$(function(){
    $("#btn-submit-add").on('click', function(e) {
      
      const form = document.getElementById('form-add');
      const form_dynamic = document.getElementById('dynamic-input-inner-wrap');
      
      form_dynamic.reportValidity() // check dynamic 1st, if exist is it valid? Or when not exist auto valid 
      if (!form_dynamic.checkValidity()) {
      } else{
        form.reportValidity() // check main form
        if (!form.checkValidity()) {
        } else if($('[name="check_validity"]').val() == 0){
          Swal.fire({
            position: 'top-end',
            icon: 'warning',
            html: 'Masih ada isian yang belum valid, mohon diperbaiki',
            showConfirmButton: false,
            timer: 2000
          });
        } else {
          $('#loading').show();
          $('#form').hide();
          
          let formData  = new FormData(form);
          let formData2 = new FormData(form_dynamic);
          let fileIndexes2 = [];
          // console.log('formData...',formData);
          for (const [key, value] of formData2) {
            formData.append('dynamic_inputs['+key+']', value);
            if(value instanceof File){
              fileIndexes2.push('dynamic_inputs.'+key);
            }
          }; 
          formData.append('file_indexes2',fileIndexes2);
          for (const [key, value] of formData) {
            console.log('»', key, value, typeof(value))
          }; 
          // return
          axios.post(baseUrl+'/api/file/post-add', formData, apiHeaders)
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
              //window.location = baseUrl+'/files';
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
              html: error.message,
              confirmButtonText: 'Ya',
            });
            $('#loading').hide();
            $('#form').show();
          });
        }
      }
    });
  
    $("#btn-submit-edit").on('click', function(e) {
      const form = document.getElementById('form-edit');
      form.reportValidity()
      if (!form.checkValidity()) {
      } else if($('[name="check_validity"]').val() == 0){
        Swal.fire({
          position: 'top-end',
          icon: 'warning',
          html: 'Masih ada isian yang belum valid, mohon diperbaiki',
          showConfirmButton: false,
          timer: 2000
        });
      } else {
        $('#loading').show();
        $('#form').hide();
        const formData = new FormData(form);
        // for (const [key, value] of formData) {
        //   console.log('»', key, value)
        // }; return;
        axios.post(baseUrl+'/api/file/post-edit', formData, apiHeaders)
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
            //window.location = baseUrl+'/files';
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
      }
    });

    if($("#form-edit").length > 0) {
      getDynamicInputs();
      fillDynamicInputs();
    }
  
  });
  