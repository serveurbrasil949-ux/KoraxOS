// Fonction pour envoyer une touche spéciale ou un raccourci au terminal
function sendKey(key) {
  const iframe = document.getElementById('termFrame');
  if (iframe && iframe.contentWindow) {
    iframe.contentWindow.postMessage(key, '*');
  }
}

// Fonction pour coller directement le contenu du presse-papiers
async function pasteToTerminal() {
  try {
    const text = await navigator.clipboard.readText();
    if (text) {
      sendKey(text);
    }
  } catch (err) {
    alert("Veuillez autoriser l'accès au presse-papiers sur votre navigateur.");
  }
}

