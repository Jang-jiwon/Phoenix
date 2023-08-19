 const header = document.querySelector('header');
		fetch('/menu/menu.jsp')
		.then(res => res.text())
		.then(data => header.innerHTML = data);
		
		