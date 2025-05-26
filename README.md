# FF\_Project

A production reporting dashboard built with **Next.js 15**, **Tailwind CSS**, and **Vitest**, adapted from [TheCodingCanal/next-report-app](https://github.com/TheCodingCanal/next-report-app) with additional CI/CD configuration, test integration, and static deployment support on GitHub Pages.

---

## ✅ Custom Changes Made

| File                       | Change                                                                                                | Purpose                                                               |
| -------------------------- | ----------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `next.config.js`           | Added `output: 'export'`, `basePath: '/FF_Project'`, and `assetPrefix: '/FF_Project/'`                | Ensures static export works and assets load correctly on GitHub Pages |
| `vitest.config.js`         | Added `exit: true`, `threads: false`, `silent: true`, and `environment: 'jsdom'`                      | Ensures Vitest tests run and exit cleanly in CI without hanging       |
| `package.json`             | Updated `"test"` script to `vitest run --reporter=dot --silent`                                       | Enables silent, clean test output for CI                              |
| `src/tests/vite.test.ts`   | Created sample test suite with 5 unit tests                                                           | Ensures test framework is wired up and functioning                    |
| `.github/workflows/ci.yml` | Integrated steps to run unit tests, build the app, export static files, and deploy via GitHub Actions | Provides automated CI/CD pipeline to GitHub Pages                     |

---

## 🛠️ Local Setup Instructions

```bash
git clone https://github.com/Kumbha2Nagarjuna/FF_Project.git
cd FF_Project
npm install --legacy-peer-deps
npm run dev
```
## 🔄 CI/CD Pipeline

* Validates build with `next build`
* Runs Vitest tests
* Runs `next export` to generate static `out/` directory
* Uploads site artifact and deploys to GitHub Pages

Trigger: Push to `main` branch.

---

## 🌐 Deployment Details

* Deployed via GitHub Actions to GitHub Pages
* Pages hosted under:
  `https://Kumbha2Nagarjuna.github.io/FF_Project/`

Modified `next.config.js`:

```js
const nextConfig = {
  output: 'export',
  basePath: '/FF_Project',
  assetPrefix: '/FF_Project/',
};
```

---

## ⚠️ Known Issues

* No support for dynamic routes or SSR (due to static export)
* React 19 RC and type overrides may be unstable
* Ensure test runner is updated for React 19 once stable

---


## 📁 Project Structure

```
FF_Project/
├── .github/workflows/ci.yml     # GitHub Actions workflow
├── public/                      # Static assets
├── src/                         # Application source code
│   ├── components/              # Reusable components
│   ├── pages/                   # Next.js pages
│   └── tests/                   # Unit tests
├── next.config.js               # Next.js configuration
├── package.json                 # Project metadata and scripts
├── tailwind.config.ts           # Tailwind CSS configuration
├── tsconfig.json                # TypeScript configuration
└── vitest.config.js             # Vitest configuration
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---
