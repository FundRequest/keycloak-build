document.onreadystatechange = function() {
    if (document.readyState === "interactive") {
        var langPick = document.querySelector('#language-picker-dropdown');
        if (langPick != null) {
            langPick.addEventListener('change', function() {
                window.location.href = this.value;
            });
        }
    }
};
