package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type BookCategoryService struct {
}

// CreateBookCategory 创建BookCategory记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookCategoryService *BookCategoryService) CreateBookCategory(bookCategory autocode.BookCategory) (err error) {
	err = global.GVA_DB.Create(&bookCategory).Error
	return err
}

// DeleteBookCategory 删除BookCategory记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookCategoryService *BookCategoryService) DeleteBookCategory(bookCategory autocode.BookCategory) (err error) {
	err = global.GVA_DB.Delete(&bookCategory).Error
	return err
}

// DeleteBookCategoryByIds 批量删除BookCategory记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookCategoryService *BookCategoryService) DeleteBookCategoryByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.BookCategory{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateBookCategory 更新BookCategory记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookCategoryService *BookCategoryService) UpdateBookCategory(bookCategory autocode.BookCategory) (err error) {
	err = global.GVA_DB.Save(&bookCategory).Error
	return err
}

// GetBookCategory 根据id获取BookCategory记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookCategoryService *BookCategoryService) GetBookCategory(id uint) (err error, bookCategory autocode.BookCategory) {
	err = global.GVA_DB.Where("id = ?", id).First(&bookCategory).Error
	return
}

// GetBookCategoryInfoList 分页获取BookCategory记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookCategoryService *BookCategoryService) GetBookCategoryInfoList(info autoCodeReq.BookCategorySearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&autocode.BookCategory{})
	var bookCategorys []autocode.BookCategory
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&bookCategorys).Error
	return err, bookCategorys, total
}
