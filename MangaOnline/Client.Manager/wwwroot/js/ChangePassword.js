﻿const oldPasswordInput = document.getElementById("oldPasswordInput");
function showOldPassword() {
    const btnOldPassword = document.getElementById("btnOldPassword");
    if (oldPasswordInput.type === "password") {
        oldPasswordInput.type = "text";
        btnOldPassword.innerHTML = '<i class="icon ion-ios-eye-off icon-custom-password"></i>';
    } else {
        oldPasswordInput.type = "password";
        btnOldPassword.innerHTML = '<i class="icon ion-ios-eye icon-custom-password"></i>';
    }
}

const newPasswordInput = document.getElementById("newPasswordInput");
function showNewPassword() {
    const btnNewPassword = document.getElementById("btnNewPassword");
    if (newPasswordInput.type === "password") {
        newPasswordInput.type = "text";
        btnNewPassword.innerHTML = '<i class="icon ion-ios-eye-off icon-custom-password"></i>';
    } else {
        newPasswordInput.type = "password";
        btnNewPassword.innerHTML = '<i class="icon ion-ios-eye icon-custom-password"></i>';
    }
}

const passwordConfirmedInput = document.getElementById("passwordConfirmedInput");
function showPasswordConfirmed() {
    const btnPasswordConfirmed = document.getElementById("btnPasswordConfirmed");
    if (passwordConfirmedInput.type === "password") {
        passwordConfirmedInput.type = "text";
        btnPasswordConfirmed.innerHTML = '<i class="icon ion-ios-eye-off icon-custom-password"></i>';
    } else {
        passwordConfirmedInput.type = "password";
        btnPasswordConfirmed.innerHTML = '<i class="icon ion-ios-eye icon-custom-password"></i>';
    }
}

const submitBtn = document.getElementById("submitBtn");

let notiOldPassword = document.getElementById("noti-OldPassword");
let notiNewPassword = document.getElementById("noti-NewPassword");
let notiPasswordConfirmed = document.getElementById("noti-PasswordConfirmed");
$(document).ready(function() {
    $('#changeForm').submit(function(event) {
        event.preventDefault();
        
        let fail = false;

        notiOldPassword.innerHTML = "";
        notiNewPassword.innerHTML = "";
        notiPasswordConfirmed.innerHTML = "";

        if(newPasswordInput.value.length<6){
            notiNewPassword.innerHTML = "mật khẩu ít nhất 6 ký tự";
            fail = true;
        }
        if(newPasswordInput.value!==passwordConfirmedInput.value){
            notiPasswordConfirmed.innerHTML = "mật khẩu không trùng khớp";
            fail = true;
        }
        if(newPasswordInput.value===oldPasswordInput.value){
            notiNewPassword.innerHTML = "mật khẩu mới không được trùng mật khẩu cũ";
            fail = true;
        }
        if(fail){
            event.preventDefault();
            return;
        }
        $.ajax({
            url: 'http://localhost:5098/Auth/ChangePassword',
            type: "PUT",
            headers: {"ACCESS_TOKEN" : localStorage.getItem('ACCESS_TOKEN')},
            data: {
                email: GetUserData().email,
                oldPassword: $('#oldPasswordInput').val(),
                newPassword: $('#newPasswordInput').val()
            },
            async: true,
            success: function (response) {
                window.location.href = urlClient+'/Auth/AuthLogin';
            },
            error: function (xhr, status, error) {
                ShowNotificationError(xhr.responseJSON.error??'Đổi mật khẩu thất bại');
            }
        });
    }); 
});
