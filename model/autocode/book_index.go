// 自动生成模板BookIndex
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// BookIndex 结构体
// 如果含有time.Time 请自行import time包
type BookIndex struct {
	global.GVA_MODEL
	BookId      *int       `json:"bookId" form:"bookId" gorm:"column:book_id;comment:小说ID;size:19;"`
	CreateTime  *time.Time `json:"createTime" form:"createTime" gorm:"column:create_time;comment:;"`
	IndexName   string     `json:"indexName" form:"indexName" gorm:"column:index_name;comment:目录名;size:100;"`
	IndexNum    *int       `json:"indexNum" form:"indexNum" gorm:"column:index_num;comment:目录号;size:10;"`
	StorageType string     `json:"storageType" form:"storageType" gorm:"column:storage_type;comment:存储方式;size:10;"`
	UpdateTime  *time.Time `json:"updateTime" form:"updateTime" gorm:"column:update_time;comment:;"`
	WordCount   *int       `json:"wordCount" form:"wordCount" gorm:"column:word_count;comment:字数;size:10;"`
}

// TableName BookIndex 表名
func (BookIndex) TableName() string {
	return "book_index"
}
