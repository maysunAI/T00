"""
VSCode 分屏截图马赛克处理
目标：对左侧文件浏览器中项目名称（PJxx 之后的部分）添加马赛克
"""
from PIL import Image, ImageFilter
import sys

def apply_mosaic(img, x1, y1, x2, y2, block_size=8):
    """对指定区域应用马赛克效果"""
    region = img.crop((x1, y1, x2, y2))
    # 缩小再放大，产生像素块效果
    small = region.resize(
        (max(1, (x2-x1)//block_size), max(1, (y2-y1)//block_size)),
        Image.NEAREST
    )
    mosaic = small.resize((x2-x1, y2-y1), Image.NEAREST)
    img.paste(mosaic, (x1, y1))
    return img

# 加载图像
src = r"F:\T00\AI00_Common\_docs\help\assets\vscode_split.png"
dst = r"F:\T00\AI00_Common\_docs\help\assets\vscode_split_masked.png"

img = Image.open(src)
w, h = img.size
print(f"Image size: {w} x {h}")

# VS Code Explorer 侧边栏区域分析：
# - 左侧图标栏：约 x=0~48
# - Explorer 文件名区域：约 x=48~175
# - "PJxx" 4个字符约占 30-35px（从文本起始位置 x≈55 算起）
# - 所以 PJxx 结束位置约 x≈88
# - 从 x=88 到 x=175 应用马赛克（隐藏项目名后半段）
# - y 范围：从顶部标题栏下方到图像底部

# 根据实际图像调整参数
SIDEBAR_TEXT_START_X = 65   # 文件名文本开始的 x 坐标
PJXX_END_X = 105            # "PJxx" 结束位置（保留约4个字符宽度）
SIDEBAR_END_X = 320         # Explorer 侧边栏结束位置（稍宽保证全覆盖）
TOP_Y = 35                  # 文件列表开始的 y 坐标
BOTTOM_Y = h - 10           # 几乎到底部

# 应用马赛克
img = apply_mosaic(img, PJXX_END_X, TOP_Y, SIDEBAR_END_X, BOTTOM_Y, block_size=6)

# 保存
img.save(dst)
print(f"Saved: {dst}")
print(f"Mosaic region: x={PJXX_END_X}~{SIDEBAR_END_X}, y={TOP_Y}~{BOTTOM_Y}")
