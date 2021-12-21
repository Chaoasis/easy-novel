package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type BookRouter struct {
}

// InitBookRouter 初始化 Book 路由信息
func (s *BookRouter) InitBookRouter(Router *gin.RouterGroup) {
	bookRouter := Router.Group("book").Use(middleware.OperationRecord())
	bookRouterWithoutRecord := Router.Group("book")
	var bookApi = v1.ApiGroupApp.AutoCodeApiGroup.BookApi
	{
		bookRouter.POST("createBook", bookApi.CreateBook)             // 新建Book
		bookRouter.DELETE("deleteBook", bookApi.DeleteBook)           // 删除Book
		bookRouter.DELETE("deleteBookByIds", bookApi.DeleteBookByIds) // 批量删除Book
		bookRouter.PUT("updateBook", bookApi.UpdateBook)              // 更新Book
	}
	{
		bookRouterWithoutRecord.GET("findBook", bookApi.FindBook)       // 根据ID获取Book
		bookRouterWithoutRecord.GET("getBookList", bookApi.GetBookList) // 获取Book列表
	}
}
