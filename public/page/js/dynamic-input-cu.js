function createBehaviorList(){
    let template = `<select name="behavior[]" data-placeholder="Pilih salah satu..." class="w-full" multiple>`;
    let toi = $('[name="type_of_input"]').val();
    let i = 0;
    behavior_list[toi].forEach(item => {
        ++i;
        template += `<option value="`+item.value+`">`+item.label+`</option>`;
    });
    template += `</select>`;
    $('#select-behavior-data-info').html(`(tersedia `+i+` opsi)`);
    $('#select-behavior').html(template);
    $('[name="behavior[]"]').each(function() {
        let options = {
          plugins: {
            dropdown_input: {}
          }
        };
        if ($(this).data("placeholder")) {
          options.placeholder = $(this).data("placeholder");
        }
        if ($(this).attr("multiple") !== void 0) {
          options = {
            ...options,
            plugins: {
              ...options.plugins,
              remove_button: {
                title: "Remove this item"
              }
            },
            persist: false,
            create: true,
            onDelete: function(values) {
              return confirm(
                values.length > 1 ? "Are you sure you want to remove these " + values.length + " items?" : 'Are you sure you want to remove "' + values[0] + '"?'
              );
            }
          };
        }
        if ($(this).data("header")) {
          options = {
            ...options,
            plugins: {
              ...options.plugins,
              dropdown_header: {
                title: $(this).data("header")
              }
            }
          };
        }
        new TomSelect(this, options);
    });

}

$(function(){
    $("#btn-submit-add").on('click', function(e) {
      const form = document.getElementById('form-add');
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
        axios.post(baseUrl+'/api/dynamic-input/post-add', formData, apiHeaders)
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
            window.location = baseUrl+'/dynamic-inputs';
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
        axios.post(baseUrl+'/api/dynamic-input/post-edit', formData, apiHeaders)
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
            window.location = baseUrl+'/dynamic-inputs';
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
  
  });
  