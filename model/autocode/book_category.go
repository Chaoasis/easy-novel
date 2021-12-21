// 自动生成模板BookCategory
package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// BookCategory 结构体
// 如果含有time.Time 请自行import time包
type BookCategory struct {
	global.GVA_MODEL
	CreateTime    *time.Time `json:"createTime" form:"createTime" gorm:"column:create_time;comment:;"`
	CreateUserId  *int       `json:"createUserId" form:"createUserId" gorm:"column:create_user_id;comment:;size:19;"`
	Name          string     `json:"name" form:"name" gorm:"column:name;comment:分类名;size:20;"`
	Sort          *bool      `json:"sort" form:"sort" gorm:"column:sort;comment:排序;"`
	UpdateTime    *time.Time `json:"updateTime" form:"updateTime" gorm:"column:update_time;comment:;"`
	UpdateUserId  *int       `json:"updateUserId" form:"updateUserId" gorm:"column:update_user_id;comment:;size:19;"`
	WorkDirection *bool      `json:"workDirection" form:"workDirection" gorm:"column:work_direction;comment:作品方向，0：男频，1：女频';"`
}

// TableName BookCategory 表名
func (BookCategory) TableName() string {
	return "book_category"
}
