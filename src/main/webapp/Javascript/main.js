/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function openNav() {
    document.getElementById("mySidenav").style.width = "400px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

let list = document.querySelector('.slider .list');
let item = document.querySelectorAll('.slider .list .item');
let prev = document.getElementById('prev');
let next = document.getElementById('next');

let active = 0;
let lengthItem = item.length - 1;

next.onclick = function () {
    if (active + 1 > lengthItem) {
        active = 0;
    } else {
        active++;
    }
    reloadSlider();
};

prev.onclick = function () {
    if (active - 1 < 0) {
        active = lengthItem;
    } else {
        active--;
    }
    reloadSlider();
};

function reloadSlider() {
    let checkLeft = item[active].offsetLeft;
    list.style.left = -checkLeft + 'px';
}

function Validator(formSelector) {
    function getParent(element, selector) {
        while (element.parentElement) {
            if (element.parentElement.matches(selector)) {
                return element.parentElement;
            }

            element = element.parentElement;
        }

    }

    var formRules = {};
    var validatorRules = {
        required: function (value) {
            return value ? undefined : 'Bạn cần điền vào trường này!';
        },

        checklengthname: function (value) {
            return (value.length >= 3) && (value.length <= 30) ? undefined : 'Họ và tên phải từ 3 đến 30 ký tự!';
        },
        
        checkusername: function (value) {
            return (value.length >= 3) && (value.length <= 30) ? undefined : 'Tên đăng nhập phải từ 3 đến 30 ký tự!';
        },

        email: function (value) {
            var regex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            return regex.test(value) ? undefined : 'Email bạn nhập không đúng cú pháp!';
        },

        checknumber: function (value) {
            var regex = /^\d+$/;
            return regex.test(value) ? undefined : 'Số điện thoại bạn nhập không chính xác!';
        },

        checkpassword: function () {
            var pass = document.querySelector('#password');
            var confirm = document.querySelector('#confirm-password');

            return (pass.value === confirm.value) ? undefined : 'Mật khẩu mà bạn nhập lại không trùng khớp!';
        },
        
        checkpasswordlength: function(value){
            return value.length >= 6 ? undefined : 'Mật khẩu phải có độ dài từ 6 trở lên!';
        }
    };

    var formElement = document.querySelector(formSelector);

    if (formElement) {
        var Input = formElement.querySelectorAll('[name][rules]');
        for (var input of Input) {
            var rules = input.getAttribute('rules').split('|');
            for (var rule of rules) {
                var ruleFunct = validatorRules[rule];
                if (Array.isArray(formRules[input.name])) {
                    formRules[input.name].push(ruleFunct);
                } else {
                    formRules[input.name] = [ruleFunct];
                }
            }

            input.onblur = handleValidate;
            input.oninput = handleClear;
        }

        function handleValidate(event) {
            var rules = formRules[event.target.name];
            var errorMessage;

            rules.find(function (rule) {
                errorMessage = rule(event.target.value);
                return errorMessage;
            });

            if (errorMessage) {
                var formGroup = getParent(event.target, '.form-group');
                if (formGroup) {
                    formGroup.classList.add('invalid');
                    var formMessage = formGroup.querySelector('.err-message');
                    if (formMessage) {
                        formMessage.innerText = errorMessage;
                    }
                }
            }
        }

        function handleClear(event) {
            var formGroup = getParent(event.target, '.form-group');
            if (formGroup.classList.contains('invalid')) {
                formGroup.classList.remove('invalid');
            }

            var formMessage = formGroup.querySelector('.err-message');
            if (formMessage) {
                formMessage.innerText = '';
            }
        }
    }
}


