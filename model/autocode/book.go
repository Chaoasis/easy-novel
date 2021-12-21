// 自动生成模板Book
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
)

// Book 结构体
// 如果含有time.Time 请自行import time包
type Book struct {
	global.GVA_MODEL
	AuthorId            *int       `json:"authorId" form:"authorId" gorm:"column:author_id;comment:作者id;size:19;"`
	AuthorName          string     `json:"authorName" form:"authorName" gorm:"column:author_name;comment:作者名;size:50;"`
	BookDesc            string     `json:"bookDesc" form:"bookDesc" gorm:"column:book_desc;comment:书籍描述;size:2000;"`
	BookName            string     `json:"bookName" form:"bookName" gorm:"column:book_name;comment:小说名;size:50;"`
	BookStatus          *bool      `json:"bookStatus" form:"bookStatus" gorm:"column:book_status;comment:书籍状态，0：连载中，1：已完结;"`
	CatId               *int       `json:"catId" form:"catId" gorm:"column:cat_id;comment:分类ID;size:10;"`
	CatName             string     `json:"catName" form:"catName" gorm:"column:cat_name;comment:分类名;size:50;"`
	CommentCount        *int       `json:"commentCount" form:"commentCount" gorm:"column:comment_count;comment:评论数;size:10;"`
	CrawlBookId         string     `json:"crawlBookId" form:"crawlBookId" gorm:"column:crawl_book_id;comment:抓取的源站小说ID;size:32;"`
	CrawlIsStop         *bool      `json:"crawlIsStop" form:"crawlIsStop" gorm:"column:crawl_is_stop;comment:是否已停止更新，0：未停止，1：已停止;"`
	CrawlLastTime       *time.Time `json:"crawlLastTime" form:"crawlLastTime" gorm:"column:crawl_last_time;comment:最后一次的抓取时间;"`
	CrawlSourceId       *int       `json:"crawlSourceId" form:"crawlSourceId" gorm:"column:crawl_source_id;comment:爬虫源站ID;size:10;"`
	CreateTime          *time.Time `json:"createTime" form:"createTime" gorm:"column:create_time;comment:创建时间;"`
	LastIndexId         *int       `json:"lastIndexId" form:"lastIndexId" gorm:"column:last_index_id;comment:最新目录ID;size:19;"`
	LastIndexName       string     `json:"lastIndexName" form:"lastIndexName" gorm:"column:last_index_name;comment:最新目录名;size:50;"`
	LastIndexUpdateTime *time.Time `json:"lastIndexUpdateTime" form:"lastIndexUpdateTime" gorm:"column:last_index_update_time;comment:最新目录更新时间;"`
	PicUrl              string     `json:"picUrl" form:"picUrl" gorm:"column:pic_url;comment:小说封面;size:200;"`
	Score               *float64   `json:"score" form:"score" gorm:"column:score;comment:评分，预留字段;"`
	Status              *bool      `json:"status" form:"status" gorm:"column:status;comment:状态，0：入库，1：上架;"`
	UpdateTime          *time.Time `json:"updateTime" form:"updateTime" gorm:"column:update_time;comment:更新时间;"`
	VisitCount          *int       `json:"visitCount" form:"visitCount" gorm:"column:visit_count;comment:点击量;size:19;"`
	WordCount           *int       `json:"wordCount" form:"wordCount" gorm:"column:word_count;comment:总字数;size:10;"`
	WorkDirection       *bool      `json:"workDirection" form:"workDirection" gorm:"column:work_direction;comment:作品方向，0：男频，1：女频';"`
	YesterdayBuy        *int       `json:"yesterdayBuy" form:"yesterdayBuy" gorm:"column:yesterday_buy;comment:昨日订阅数;size:10;"`
}

// TableName Book 表名
func (Book) TableName() string {
	return "book"
}
