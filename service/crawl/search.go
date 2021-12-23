package crawl

import (
	"github.com/gocolly/colly"
)

type SearchNovelDto struct {
	BookName   string
	Chapter    string
	Author     string
	UpdateTime string
	Url        string
}

func SearchNovel(name string) (dtos []*SearchNovelDto) {
	dtos = make([]*SearchNovelDto, 0, 20)
	var searchNovelDto *SearchNovelDto
	c := colly.NewCollector()
	c.OnHTML("#checkform > table > tbody", func(e *colly.HTMLElement) {
		e.ForEach("tr", func(i int, e *colly.HTMLElement) {
			searchNovelDto = &SearchNovelDto{
				BookName:   e.ChildText("td:nth-child(1) > a"),
				Chapter:    e.ChildText(".td:nth-child(2)"),
				Author:     e.ChildText("td:nth-child(3)"),
				UpdateTime: e.ChildText("td:nth-child(4)"),
				Url:        e.ChildAttr("td:nth-child(1) > a", "href"),
			}
			dtos = append(dtos, searchNovelDto)
		})
	})
	m := map[string]string{
		"searchkey": name,
	}
	err := c.Post("https://www.xbiquge.la/modules/article/waps.php", m)
	return
}

type Chapter struct {
	ChapterName string
	ConTextUrl  string
}

func CollectChapter(url string) []Chapter {
	chapters := make([]Chapter, 0, 2000)
	c := colly.NewCollector()
	c.OnHTML("#list > dl", func(e *colly.HTMLElement) {
		e.ForEach("dd > a", func(i int, e *colly.HTMLElement) {
			// https://www.xbiquge.la/ + contextUrl real visitUrl
			contextUrl := e.Attr("href")
			chapterName := e.Text
			chapters = append(chapters, Chapter{
				ChapterName: chapterName,
				ConTextUrl:  contextUrl,
			})
		})
	})
	c.Visit(url)
	return chapters
}
