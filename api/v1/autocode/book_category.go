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

type BookCategoryApi struct {
}

var bookCategoryService = service.ServiceGroupApp.AutoCodeServiceGroup.BookCategoryService

// CreateBookCategory 创建BookCategory
// @Tags BookCategory
// @Summary 创建BookCategory
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.BookCategory true "创建BookCategory"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /bookCategory/createBookCategory [post]
func (bookCategoryApi *BookCategoryApi) CreateBookCategory(c *gin.Context) {
	var bookCategory autocode.BookCategory
	_ = c.ShouldBindJSON(&bookCategory)
	if err := bookCategoryService.CreateBookCategory(bookCategory); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteBookCategory 删除BookCategory
// @Tags BookCategory
// @Summary 删除BookCategory
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.BookCategory true "删除BookCategory"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /bookCategory/deleteBookCategory [delete]
func (bookCategoryApi *BookCategoryApi) DeleteBookCategory(c *gin.Context) {
	var bookCategory autocode.BookCategory
	_ = c.ShouldBindJSON(&bookCategory)
	if err := bookCategoryService.DeleteBookCategory(bookCategory); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteBookCategoryByIds 批量删除BookCategory
// @Tags BookCategory
// @Summary 批量删除BookCategory
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除BookCategory"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /bookCategory/deleteBookCategoryByIds [delete]
func (bookCategoryApi *BookCategoryApi) DeleteBookCategoryByIds(c *gin.Context) {
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)
	if err := bookCategoryService.DeleteBookCategoryByIds(IDS); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateBookCategory 更新BookCategory
// @Tags BookCategory
// @Summary 更新BookCategory
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.BookCategory true "更新BookCategory"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /bookCategory/updateBookCategory [put]
func (bookCategoryApi *BookCategoryApi) UpdateBookCategory(c *gin.Context) {
	var bookCategory autocode.BookCategory
	_ = c.ShouldBindJSON(&bookCategory)
	if err := bookCategoryService.UpdateBookCategory(bookCategory); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindBookCategory 用id查询BookCategory
// @Tags BookCategory
// @Summary 用id查询BookCategory
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.BookCategory true "用id查询BookCategory"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /bookCategory/findBookCategory [get]
func (bookCategoryApi *BookCategoryApi) FindBookCategory(c *gin.Context) {
	var bookCategory autocode.BookCategory
	_ = c.ShouldBindQuery(&bookCategory)
	if err, rebookCategory := bookCategoryService.GetBookCategory(bookCategory.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"rebookCategory": rebookCategory}, c)
	}
}

// GetBookCategoryList 分页获取BookCategory列表
// @Tags BookCategory
// @Summary 分页获取BookCategory列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.BookCategorySearch true "分页获取BookCategory列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /bookCategory/getBookCategoryList [get]
func (bookCategoryApi *BookCategoryApi) GetBookCategoryList(c *gin.Context) {
	var pageInfo autocodeReq.BookCategorySearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := bookCategoryService.GetBookCategoryInfoList(pageInfo); err != nil {
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
