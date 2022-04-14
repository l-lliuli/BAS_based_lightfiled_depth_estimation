et于代价优化的结构化编码光场深度估计  


phase_lib文件夹存放的相位编码光场数据，光场数据由lytro Illum相机拍摄，经过解码之后得到相位光场数据，github限制传送的文件大小
所以将相位编码光场的数据传送到我的百度网盘，有需要的可以在下方的链接下载：
https://pan.baidu.com/s/17hE3g3VHmupJtE4ovSMgAg


代码基于论文《Fast depth estimation with cost minimization for structured light filed》 Optics Express
Sen Xiang, Li Liu, Huiping Deng, Jin Wu and Li Yu. Fast depth estimation with cost minimization for structured light filed, Optics Express 29(19) 30077-30093s Express
https://www.osapublishing.org/oe/fulltext.cfm?uri=oe-29-19-30077&id=458392
作者享有代码版权



测试指南：
1 在百度网盘中的连接下载结构化编码光场数据，将其存放于./phase_lib文件夹
2 运行文件test_optimal_alg_for_realdata.m
3 嚯一杯咖啡等待结果



整理大论文实验：
一 数据获取，统一命名的LFP文件夹，经过批量解码之后生成相位库
二 各种算法的代码： CAE、SPO、REFOCUS等
三 核心代码： 基于BAS代价优化的结构化深度估计
四 评估系统： 输入，各种算法的结果深度矩阵，深度真值，输出：各种算法的深度估计MSE，MAD BP 指标
五 主观图伪彩色绘图工具，保存实验数据以及结果

this is the modified version
将数据全部导入到云的内部，确保内容可以生效，也就是说，不需要其他额外的开销和操作。
