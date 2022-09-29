'use strict';

/* socket.io 실행 후 해당 객체를 리턴받아 socket 변수에 담음 */
var socket = io();

/* 사용자 입력을 받아 대화명 저장
   prompt는 window 메소드로 사용자가 텍스트를 입력할 수 있는 대화상자를 띄움 */
socket.on('connect', function() {
    var name = prompt('대화명을 입력해주세요.', '');
    socket.emit('newUserConnect', name);
});

var chatWindow = document.getElementById('chatWindow');
socket.on('updateMessage', function(data) {

    /* 서버에서 작성되어 전달되어 오는 텍스트를 위한 작업 */
    if(data.name === 'SERVER') {
        var info = document.getElementById('info');
        info.innerHTML = data.message;

        /* 안내 메시지이므로 1초 뒤에 지워질 수 있도록 시간 설정 */
        setTimeout(() => {
            info.innerText = '';
        }, 1000);

    /* 사용자가 작성하여 전달되어오는 텍스트를 위한 작업 */
    } else {
        var chatMessageEl = drawChatMessage(data);
        chatWindow.appendChild(chatMessageEl);

        chatWindow.scrollTop = chatWindow.scrollHeight;
    }
});

function drawChatMessage(data) {
    var wrap = document.createElement('p');
    var message = document.createElement('span');
    var name = document.createElement('span');

    name.innerText = data.name;
    message.innerText = data.message;

    name.classList.add('output__user__name');
    message.classList.add('output__user__message');

    wrap.classList.add('output__user');
    wrap.dataset.id = socket.id;
   
    wrap.appendChild(name);
    wrap.appendChild(message);

    return wrap;
}

/* 사용자가 input에 채팅 텍스트를 입력 후 전송 버튼을 클릭했을 때 실행될 함수 */
var sendButton = document.getElementById('chatMessageSendBtn');
var chatInput = document.getElementById('chatInput');
sendButton.addEventListener('click', function() {
    var message = chatInput.value;

    if(!message) return false;    

    socket.emit('sendMessage', {
        message
    });

    /* 메시지 전송 후 value 값 초기화 */
    chatInput.value = '';
});
