$(function(){

	Dropzone.autoDiscover = false;
	$("#dz-space").dropzone({
		maxFilesize: 10,
		paramName: "upload[image]",
		addRemoveLinks: true,
		success: function(file, response){
			//si usamos find debemos de indicar si es una clase, id o elemento
			$(file.previewTemplate).find('.dz-remove').attr('id',response.fileId);
			$(file.previewElement).addClass('dz-success');
		},
		removedfile: function(file){
			//tenemos que saber que archivo vamos a eliminar
			var id = $(file.previewTemplate).find('.dz-remove').attr('id');

			$.ajax({
				type:'DELETE',
				url:'/uploads/' +  id,
				success: function(data){
					console.log(data.message);
				}
			});
		}
	});	
});
