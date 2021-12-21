package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autoCodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type BookService struct {
}

// CreateBook 创建Book记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookService *BookService) CreateBook(book autocode.Book) (err error) {
	err = global.GVA_DB.Create(&book).Error
	return err
}

// DeleteBook 删除Book记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookService *BookService) DeleteBook(book autocode.Book) (err error) {
	err = global.GVA_DB.Delete(&book).Error
	return err
}

// DeleteBookByIds 批量删除Book记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookService *BookService) DeleteBookByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]autocode.Book{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateBook 更新Book记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookService *BookService) UpdateBook(book autocode.Book) (err error) {
	err = global.GVA_DB.Save(&book).Error
	return err
}

// GetBook 根据id获取Book记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookService *BookService) GetBook(id uint) (err error, book autocode.Book) {
	err = global.GVA_DB.Where("id = ?", id).First(&book).Error
	return
}

// GetBookInfoList 分页获取Book记录
// Author [piexlmax](https://github.com/piexlmax)
func (bookService *BookService) GetBookInfoList(info autoCodeReq.BookSearch) (err error, list interface{}, total int64) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&autocode.Book{})
	var books []autocode.Book
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&books).Error
	return err, books, total
}
