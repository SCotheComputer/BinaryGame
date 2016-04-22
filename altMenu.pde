//Sub CLASS for alternative menu options i.e those that change options.

class altMenu extends menuItem {
  String[] extensions;
  int extensionCount = 0;

  altMenu(int tempOrder, String tempMenuText, String... tempExtensions) {
    super(tempOrder, tempMenuText);
    extensions = tempExtensions;
    menuText = menuText + ": " + extensions[extensionCount];
  }

  void mouseReleased() {
    if(started == false){
    if (mouseX > super.x  && mouseX < super.x + super.w && mouseY > super.y && mouseY < super.y + super.h) {
      menuText = menuText.substring(0, menuText.length() - extensions[extensionCount].length() - 2);
      if (extensionCount < (extensions.length - 1)) {
        extensionCount++;
      }
      else {
        extensionCount = 0;
      }
      menuText = menuText + ": " + extensions[extensionCount];
    }
  }
  }
}
