# Portfolio — Hannah

双语单文件作品集,策展给「出海 AI 工程岗」。
A bilingual, single-file portfolio curated for overseas applied-AI roles.

🔗 **在线 / Live:** https://hannahlovegood.github.io/portfolio/

## 怎么更新 / How to update

源文件是 vault 里的 `portfolio.html`;本仓库的 `index.html` 是它的部署副本。
加完新作品后,在本目录跑:

```bash
./deploy.sh "加了 XX 作品"
```

脚本会自动「同步 `portfolio.html` → `index.html` → commit → push」,
GitHub Pages 1~2 分钟内自动重新部署,**链接永远不变**。
