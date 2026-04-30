import { createBrowserRouter, Navigate } from 'react-router-dom'

import { AdminLayout } from './layouts/AdminLayout'
import { AppLayout } from './layouts/AppLayout'
import { RequireAdmin, RequireEnterprise } from '../lib/auth/auth'
import { AboutPage } from '../pages/AboutPage'
import { AdminAboutPage } from '../pages/AdminAboutPage'
import { AdminCertificationsPage } from '../pages/AdminCertificationsPage'
import { AdminCustomRequestsPage } from '../pages/AdminCustomRequestsPage'
import { AdminNewsPage } from '../pages/AdminNewsPage'
import { AdminReportsPage } from '../pages/AdminReportsPage'
import { AssessmentPage } from '../pages/AssessmentPage'
import { CertificationDirectoryPage } from '../pages/CertificationDirectoryPage'
import { DashboardPage } from '../pages/DashboardPage'
import { EnterpriseDetailPage } from '../pages/EnterpriseDetailPage'
import { HomePage } from '../pages/HomePage'
import { ImpactonomyPage } from '../pages/ImpactonomyPage'
import { LoginPage } from '../pages/LoginPage'
import { MapPage } from '../pages/MapPage'
import { NotFoundPage } from '../pages/NotFoundPage'
import { RegisterPage } from '../pages/RegisterPage'
import { ReportDetailPage } from '../pages/ReportDetailPage'
import { ReportsPage } from '../pages/ReportsPage'

export const router = createBrowserRouter([
  {
    path: '/',
    element: <AppLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: 'map', element: <MapPage /> },
      { path: 'dashboard', element: <DashboardPage /> },
      { path: 'enterprises/:enterpriseId', element: <EnterpriseDetailPage /> },
      { path: 'impactonomy', element: <ImpactonomyPage /> },
      { path: 'impactonomy/directory', element: <CertificationDirectoryPage /> },
      { path: 'login', element: <LoginPage /> },
      { path: 'register', element: <RegisterPage /> },
      {
        path: 'assessment',
        element: (
          <RequireEnterprise>
            <AssessmentPage />
          </RequireEnterprise>
        ),
      },
      { path: 'reports', element: <ReportsPage /> },
      { path: 'reports/:reportId', element: <ReportDetailPage /> },
      { path: 'about', element: <AboutPage /> },
      {
        path: 'admin',
        element: (
          <RequireAdmin>
            <AdminLayout />
          </RequireAdmin>
        ),
        children: [
          { index: true, element: <Navigate to="/admin/news" replace /> },
          { path: 'news', element: <AdminNewsPage /> },
          { path: 'reports', element: <AdminReportsPage /> },
          { path: 'certifications', element: <AdminCertificationsPage /> },
          { path: 'custom-requests', element: <AdminCustomRequestsPage /> },
          { path: 'about', element: <AdminAboutPage /> },
        ],
      },
      { path: '*', element: <NotFoundPage /> },
    ],
  },
])
