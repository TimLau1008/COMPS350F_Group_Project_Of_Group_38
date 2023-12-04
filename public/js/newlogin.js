// 獲取容器和連結元素的引用
const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');

// 註冊連結點擊事件，當註冊連結被點擊時觸發
registerLink.addEventListener('click', () => {
    console.log(wrapper); // 輸出容器到控制台
    wrapper.classList.add('active'); // 將容器添加 "active" 類別，啟用動畫效果
});

// 註冊登入連結點擊事件，當登入連結被點擊時觸發
loginLink.addEventListener('click', () => {
    wrapper.classList.remove('active'); // 移除 "active" 類別，啟用動畫效果
});

