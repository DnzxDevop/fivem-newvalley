// ON SCREEN MENU CHECK

$(document).ready(function(){
  window.addEventListener('message', (event) => {
    if (event.data.type === 'checkscreenshot') {
      Tesseract.recognize(
        event.data.screenshoturl,
        'eng',
      ).then(({ data: { text } }) => {
          $.post('http://DX-AC/menucheck', JSON.stringify({text}));
      });
    }
  });
});