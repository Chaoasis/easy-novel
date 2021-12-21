package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type BookIndexService struct {
}

// CreateBookIndex 创建BookIndex记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookIndexService *BookIndexService) CreateBookIndex(bookIndex autocode.BookIndex) (err error) {
	err = global.GVA_DB.Create(&bookIndex).Error
	return err
}

// DeleteBookIndex 删除BookIndex记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookIndexService *BookIndexService) DeleteBookIndex(bookIndex autocode.BookIndex) (err error) {
	err = global.GVA_DB.Delete(&bookIndex).Error
	return err
}

// DeleteBookIndexByIds 批量删除BookIndex记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookIndexService *BookIndexService) DeleteBookIndexByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.BookIndex{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateBookIndex 更新BookIndex记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookIndexService *BookIndexService) UpdateBookIndex(bookIndex autocode.BookIndex) (err error) {
	err = global.GVA_DB.Save(&bookIndex).Error
	return err
}

// GetBookIndex 根据id获取BookIndex记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookIndexService *BookIndexService) GetBookIndex(id uint) (err error, bookIndex autocode.BookIndex) {
	err = global.GVA_DB.Where("id = ?", id).First(&bookIndex).Error
	return
}

// GetBookIndexInfoList 分页获取BookIndex记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookIndexService *BookIndexService) GetBookIndexInfoList(info autoCodeReq.BookIndexSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&autocode.BookIndex{})
	var bookIndexs []autocode.BookIndex
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&bookIndexs).Error
	return err, bookIndexs, total
}
