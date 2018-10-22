export default function(message) { // message is not used at this time
  const dialog = document.getElementById('error-dialog');

  dialog.style.top = '20px';
  setTimeout(() => { dialog.style.top = '-80px'; }, 5000);
}
