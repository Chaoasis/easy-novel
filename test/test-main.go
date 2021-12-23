package main

import "github.com/flipped-aurora/gin-vue-admin/server/service/crawl"

func main() {
	novel := crawl.CollectChapter("https://www.xbiquge.la/7/7004/")
	for _, dto := range novel {
		println(dto.ConTextUrl)
	}
}
