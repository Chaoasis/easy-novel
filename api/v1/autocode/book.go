package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/autocode"
	autocodeReq "github.com/flipped-aurora/gin-vue-admin/server/model/autocode/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type BookApi struct {
}

var bookService = service.ServiceGroupApp.AutoCodeServiceGroup.BookService

// CreateBook 创建Book
// @Tags Book
// @Summary 创建Book
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Book true "创建Book"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /book/createBook [post]
func (bookApi *BookApi) CreateBook(c *gin.Context) {
	var book autocode.Book
	_ = c.ShouldBindJSON(&book)
	if err := bookService.CreateBook(book); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteBook 删除Book
// @Tags Book
// @Summary 删除Book
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Book true "删除Book"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /book/deleteBook [delete]
func (bookApi *BookApi) DeleteBook(c *gin.Context) {
	var book autocode.Book
	_ = c.ShouldBindJSON(&book)
	if err := bookService.DeleteBook(book); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteBookByIds 批量删除Book
// @Tags Book
// @Summary 批量删除Book
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Book"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /book/deleteBookByIds [delete]
func (bookApi *BookApi) DeleteBookByIds(c *gin.Context) {
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)
	if err := bookService.DeleteBookByIds(IDS); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateBook 更新Book
// @Tags Book
// @Summary 更新Book
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.Book true "更新Book"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /book/updateBook [put]
func (bookApi *BookApi) UpdateBook(c *gin.Context) {
	var book autocode.Book
	_ = c.ShouldBindJSON(&book)
	if err := bookService.UpdateBook(book); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindBook 用id查询Book
// @Tags Book
// @Summary 用id查询Book
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.Book true "用id查询Book"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /book/findBook [get]
func (bookApi *BookApi) FindBook(c *gin.Context) {
	var book autocode.Book
	_ = c.ShouldBindQuery(&book)
	if err, rebook := bookService.GetBook(book.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"rebook": rebook}, c)
	}
}

// GetBookList 分页获取Book列表
// @Tags Book
// @Summary 分页获取Book列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.BookSearch true "分页获取Book列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /book/getBookList [get]
func (bookApi *BookApi) GetBookList(c *gin.Context) {
	var pageInfo autocodeReq.BookSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := bookService.GetBookInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}
}
