/* ログイン後、ユーザー名の下線をスライドさせる */
function animateUserNameLine() {
    const userName = document.querySelector(".user-name");

    if (userName === null) {
        return;
    }

    // 下線を最初の状態に戻す
    userName.classList.remove("is-visible");

    // CSSの変更を一度反映する
    void userName.offsetWidth;

    // 下線を左から右へ伸ばす
    requestAnimationFrame(function () {
        userName.classList.add("is-visible");
    });
}

/* 通常どおりトップページを開いたとき */
document.addEventListener(
    "DOMContentLoaded",
    animateUserNameLine
);

/* ブラウザの「戻る」でトップページに戻ったとき */
window.addEventListener("pageshow", function (event) {
    if (event.persisted) {
        animateUserNameLine();
    }
});