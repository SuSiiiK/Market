// Обработка изменения языка
const langSelect = document.getElementById('lang_select');
langSelect.addEventListener('change', () => {
    const selectedLang = langSelect.value;
    window.location.search = `?lang=${selectedLang}`;
});