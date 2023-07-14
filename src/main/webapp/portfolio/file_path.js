//이미지 미리보기
function setThumbnail(event) {
	var fileInput = document.getElementById("file");
	var uploadNameInput = document.querySelector(".upload-name");
	var reader = new FileReader();
	reader.onload = function(event) {
    	ppath = event.target.result;
    	var fileName = fileInput.value.split("\\").pop();
    	uploadNameInput.value = fileName;
	};
	reader.readAsDataURL(event.target.files[0]);
}
