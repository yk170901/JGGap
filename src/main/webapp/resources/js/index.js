// event handler의 매개변수로 오는 값은 event

function showPopup(event) {

	// modal open
	const elementsList = document.querySelectorAll('#modal')
		
	elementsList.forEach((ele) => {
		ele.classList.remove('hidden')
	})
}

function init() {
	const buttonElementList = document.querySelectorAll('#modal_on')

	buttonElementList.forEach(button => {
		button.addEventListener('click', showPopup)
	})
	
	const modalCloseHandler = (event) => {
		if (event.keyCode === 27) {
			const elementsList = document.querySelectorAll('#modal')
			elementsList.forEach((ele) => {
				ele.classList.add('hidden')
			})
		}
	}

	const modal = document.getElementById('modal')
	const close = document.getElementById('jsCloseBtn')
	
	//Hide modal
	close.addEventListener('click', () => {
		modal.classList.add('hidden')
	})

	// 모달 종료
	window.addEventListener('keyup', modalCloseHandler)

}
