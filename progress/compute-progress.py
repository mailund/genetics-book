import os


chapters = ["Chance", "Necessity",
            "Not by genes alone", "The cradle",
            "The ice", "After the ice", "Looking ahead"]
goals = {
	"Chance": 10000,
	"Necessity": 10000,
	"Not by genes alone": 10000,
    "The cradle": 10000,
    "The ice": 10000,
    "After the ice": 10000,
    "Looking ahead": 10000
}

def chapter_file(chapter_name):
	return "chapters/"+chapter_name.replace(" ", "-")+".md"

def get_chapter_progress(chapter_name):
    return int(os.popen("wc -w {}".format(chapter_file(chapter_name))).read().split()[0])


with open("progress/progress.txt", "w") as statsfile:
    print >> statsfile, "Chapter Goal Current"
    for chapter in chapters:
        print >> statsfile, '"{}"'.format(chapter), goals[chapter], get_chapter_progress(chapter)
