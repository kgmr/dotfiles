import tkinter as tk
import feedparser
import os
import subprocess

class nyaaFeed():
    def search(self, term="", category="", filtering=""):
        if category == "english":
            self.cat = "1_2"
        else:
            self.cat = "1_0"

        if filtering == "trusted":
            self.filt = "2"
        else:
            self.filt = "0"

        self.query = term.replace(" ", "+")
        link = "https://www.nyaa.si/?page=rss&c=" + self.cat + "&q=" \
                + self.query + "&f="+ self.filt

        feed = feedparser.parse(link)

        return feed.entries
# searcher
searcher = nyaaFeed()
results = searcher.search(term="")

window = tk.Tk()
window.title("Nyaadl")

ControlPane = tk.PanedWindow(orient=tk.HORIZONTAL)
ListPane = tk.PanedWindow(orient = tk.HORIZONTAL)
MainPane = tk.PanedWindow(orient=tk.VERTICAL)

MainPane.add(ControlPane)
MainPane.add(ListPane)




#missing command parameter
radiovar = tk.IntVar()
RadioDownload = tk.Radiobutton(window,text="Download", variable = radiovar, value = 1)
RadioStream = tk.Radiobutton(window,text="Stream", variable = radiovar, value = 2)
radiovar.set(1)

SearchScroll = tk.Scrollbar(window)
SearchList = tk.Listbox(window, yscrollcommand= SearchScroll.set)
SearchList.insert(tk.END,"Digite o nome na barra e clique em pesquisar")
SearchList.insert(tk.END,"Clicar em qualquer nome da lista abre o programa de torrent")
SearchList.insert(tk.END,"Ativar a opção stream abre o link no webtorrent se estiver instalado")
SearchList.insert(tk.END,"www.webtorrent.io")
searched = 0


#value = widget.get(selection[0])
#print "selection:", selection, ": '%s'" % value



def performSearch():
    global searched
    searched = 1
    SearchList.delete('0', 'end')
    query = SearchBar.get()
    global results
    results = searcher.search(term=query)
    for entry in results:
        SearchList.insert(tk.END,entry.title)
        #todo add more info like seeders/size

def openFile(event):
    if searched == 1:
        selection=SearchList.curselection()
        selected = results[selection[0]]
        if radiovar.get() == 1:
            os.startfile(selected.link)
        elif radiovar.get() == 2:
            appdata = os.getenv('LOCALAPPDATA')
            webtorrent = appdata + "\\WebTorrent\\WebTorrent.exe"
            if os.path.exists(webtorrent):
                process = subprocess.Popen([webtorrent,selected.link])
            else:
                os.startfile(selected.link)




SearchList.bind("<<ListboxSelect>>", openFile)

ButtonSearch = tk.Button(window, text="Pesquisar",command=performSearch)
SearchBar = tk.Entry(window, bd = 5,width=80)

ControlPane.add(RadioDownload)
ControlPane.add(RadioStream)
ControlPane.add(SearchBar)
ControlPane.add(ButtonSearch)

ListPane.add(SearchList,width=800,height=400)
ListPane.add(SearchScroll)
MainPane.pack()

window.mainloop()