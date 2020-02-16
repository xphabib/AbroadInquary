//= require active_admin/base
//= require ckeditor/init
//= require tinymce.min

tinymce.remove();
tinymce.init({
    selector: 'textarea',
    height: 200,
    browser_spellcheck: true,
    file_picker_types: 'image',
    menubar: true,
    images_upload_url : '/editor_images',
    image_title: true,
    document_base_url: '<%= root_url %>/',
    plugins: [
        "advlist autolink lists link image charmap print preview anchor",
        "searchreplace visualblocks fullscreen",
        "insertdatetime table contextmenu paste"
    ],
    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | fullscreen",

    file_picker_callback: function(cb, value, meta) {
        var input = document.createElement('input');
        input.setAttribute('type', 'file');
        input.setAttribute('accept', 'image/*');

        input.onchange = function() {
            var file = this.files[0];

            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function () {
                var id = 'blobid' + (new Date()).getTime();
                var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                var blobInfo = blobCache.create(id, file, reader.result);
                blobCache.add(blobInfo);
                console.log(blobInfo.blobUri());

                cb(blobInfo.blobUri(), { title: file.name });

            };
        };

        input.click();
    }

});
