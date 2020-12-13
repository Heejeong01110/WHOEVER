var content = document.getElementById('contentElement').innerHTML;
var splitedArray = content.split(' ');
var linkedContent = '';
for(var word in splitedArray)
{
  word = splitedArray[word];
   if(word.indexOf('#') == 0)
   {
      word = '<a href=\'링크\'>'+word+'</a>';
   }
   linkedContent += word+' ';
}
document.getElementById('contentElement').innerHTML = linkedContent; 



