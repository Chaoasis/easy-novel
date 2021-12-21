package autocode

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type BookCategoryRouter struct {
}

// InitBookCategoryRouter 初始化 BookCategory 路由信息
func (s *BookCategoryRouter) InitBookCategoryRouter(Router *gin.RouterGroup) {
	bookCategoryRouter := Router.Group("bookCategory").Use(middleware.OperationRecord())
	bookCategoryRouterWithoutRecord := Router.Group("bookCategory")
	var bookCategoryApi = v1.ApiGroupApp.AutoCodeApiGroup.BookCategoryApi
	{
		bookCategoryRouter.POST("createBookCategory", bookCategoryApi.CreateBookCategory)             // 新建BookCategory
		bookCategoryRouter.DELETE("deleteBookCategory", bookCategoryApi.DeleteBookCategory)           // 删除BookCategory
		bookCategoryRouter.DELETE("deleteBookCategoryByIds", bookCategoryApi.DeleteBookCategoryByIds) // 批量删除BookCategory
		bookCategoryRouter.PUT("updateBookCategory", bookCategoryApi.UpdateBookCategory)              // 更新BookCategory
	}
	{
		bookCategoryRouterWithoutRecord.GET("findBookCategory", bookCategoryApi.FindBookCategory)       // 根据ID获取BookCategory
		bookCategoryRouterWithoutRecord.GET("getBookCategoryList", bookCategoryApi.GetBookCategoryList) // 获取BookCategory列表
	}
}
