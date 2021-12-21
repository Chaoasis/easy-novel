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

type BookIndexApi struct {
}

var bookIndexService = service.ServiceGroupApp.AutoCodeServiceGroup.BookIndexService

// CreateBookIndex 创建BookIndex
// @Tags BookIndex
// @Summary 创建BookIndex
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.BookIndex true "创建BookIndex"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /bookIndex/createBookIndex [post]
func (bookIndexApi *BookIndexApi) CreateBookIndex(c *gin.Context) {
	var bookIndex autocode.BookIndex
	_ = c.ShouldBindJSON(&bookIndex)
	if err := bookIndexService.CreateBookIndex(bookIndex); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteBookIndex 删除BookIndex
// @Tags BookIndex
// @Summary 删除BookIndex
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.BookIndex true "删除BookIndex"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /bookIndex/deleteBookIndex [delete]
func (bookIndexApi *BookIndexApi) DeleteBookIndex(c *gin.Context) {
	var bookIndex autocode.BookIndex
	_ = c.ShouldBindJSON(&bookIndex)
	if err := bookIndexService.DeleteBookIndex(bookIndex); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteBookIndexByIds 批量删除BookIndex
// @Tags BookIndex
// @Summary 批量删除BookIndex
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除BookIndex"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /bookIndex/deleteBookIndexByIds [delete]
func (bookIndexApi *BookIndexApi) DeleteBookIndexByIds(c *gin.Context) {
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)
	if err := bookIndexService.DeleteBookIndexByIds(IDS); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateBookIndex 更新BookIndex
// @Tags BookIndex
// @Summary 更新BookIndex
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body autocode.BookIndex true "更新BookIndex"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /bookIndex/updateBookIndex [put]
func (bookIndexApi *BookIndexApi) UpdateBookIndex(c *gin.Context) {
	var bookIndex autocode.BookIndex
	_ = c.ShouldBindJSON(&bookIndex)
	if err := bookIndexService.UpdateBookIndex(bookIndex); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindBookIndex 用id查询BookIndex
// @Tags BookIndex
// @Summary 用id查询BookIndex
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocode.BookIndex true "用id查询BookIndex"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /bookIndex/findBookIndex [get]
func (bookIndexApi *BookIndexApi) FindBookIndex(c *gin.Context) {
	var bookIndex autocode.BookIndex
	_ = c.ShouldBindQuery(&bookIndex)
	if err, rebookIndex := bookIndexService.GetBookIndex(bookIndex.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"rebookIndex": rebookIndex}, c)
	}
}

// GetBookIndexList 分页获取BookIndex列表
// @Tags BookIndex
// @Summary 分页获取BookIndex列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query autocodeReq.BookIndexSearch true "分页获取BookIndex列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /bookIndex/getBookIndexList [get]
func (bookIndexApi *BookIndexApi) GetBookIndexList(c *gin.Context) {
	var pageInfo autocodeReq.BookIndexSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if err, list, total := bookIndexService.GetBookIndexInfoList(pageInfo); err != nil {
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
