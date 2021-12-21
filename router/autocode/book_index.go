package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type BookIndexRouter struct {
}

// InitBookIndexRouter 初始化 BookIndex 路由信息
func (s *BookIndexRouter) InitBookIndexRouter(Router *gin.RouterGroup) {
	bookIndexRouter := Router.Group("bookIndex").Use(middleware.OperationRecord())
	bookIndexRouterWithoutRecord := Router.Group("bookIndex")
	var bookIndexApi = v1.ApiGroupApp.AutoCodeApiGroup.BookIndexApi
	{
		bookIndexRouter.POST("createBookIndex", bookIndexApi.CreateBookIndex)             // 新建BookIndex
		bookIndexRouter.DELETE("deleteBookIndex", bookIndexApi.DeleteBookIndex)           // 删除BookIndex
		bookIndexRouter.DELETE("deleteBookIndexByIds", bookIndexApi.DeleteBookIndexByIds) // 批量删除BookIndex
		bookIndexRouter.PUT("updateBookIndex", bookIndexApi.UpdateBookIndex)              // 更新BookIndex
	}
	{
		bookIndexRouterWithoutRecord.GET("findBookIndex", bookIndexApi.FindBookIndex)       // 根据ID获取BookIndex
		bookIndexRouterWithoutRecord.GET("getBookIndexList", bookIndexApi.GetBookIndexList) // 获取BookIndex列表
	}
}
