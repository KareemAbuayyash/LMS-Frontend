import React, { useEffect, useState } from 'react'
import api from '../../api/axios'
import {
  PieChart,
  Pie,
  Cell,
  Tooltip,
  Legend,
  ResponsiveContainer
} from 'recharts'
import { useTranslation } from 'react-i18next';

export default function InstructorDashboard() {
  const { t } = useTranslation();

  const styles = {
    container: {
      maxWidth: '1200px',
      margin: '0 auto',
      padding: '20px',
      fontFamily:
        '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif'
    },
    header: {
      backgroundColor: '#F5F0FF',
      padding: '24px',
      borderRadius: '8px',
      marginBottom: '24px',
      boxShadow: '0 1px 2px rgba(0, 0, 0, 0.05)'
    },
    headerTitle: { fontSize: '24px', fontWeight: 'bold', color: '#644191', margin: 0 },
    headerSubtitle: { fontSize: '16px', color: '#9B72CF', margin: 0 },

    statsGrid: {
      display: 'grid',
      gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))',
      gap: '16px',
      marginBottom: '24px'
    },
    statCard: color => ({
      padding: '16px',
      borderRadius: '8px',
      backgroundColor: color.bg,
      boxShadow: '0 1px 2px rgba(0, 0, 0, 0.05)'
    }),
    statLabel: color => ({ fontSize: '14px', fontWeight: '500', color: color.text, opacity: '0.75', margin: 0 }),
    statValue: color => ({ fontSize: '24px', fontWeight: 'bold', color: color.text, margin: 0 }),

    card: {
      backgroundColor: 'white',
      padding: '16px',
      borderRadius: '8px',
      boxShadow: '0 1px 3px rgba(0, 0, 0, 0.1)',
      marginBottom: '24px'
    },
    cardTitle: { fontSize: '18px', fontWeight: '500', marginBottom: '16px', color: '#111827' },
    chartContainer: { height: '320px' },

    coursesList: { listStyle: 'none', padding: 0, margin: 0 },
    courseItem: isEven => ({ padding: '16px', backgroundColor: isEven ? '#F9FAFB' : 'white', borderRadius: '4px', marginBottom: '8px' }),
    courseTitle: { fontSize: '18px', fontWeight: '500', color: '#111827', margin: 0 },
    courseDetails: { display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: '8px' },
    courseId: { fontSize: '14px', color: '#6B7280', margin: 0 },
    enrollmentBadge: {
      width: '32px', height: '32px', borderRadius: '50%', backgroundColor: '#644191', color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '14px', fontWeight: '500'
    },
    enrollmentText: { marginLeft: '8px', color: '#644191', fontSize: '14px' },

    loading: { display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh' },
    spinner: { width: '40px', height: '40px', border: '3px solid rgba(59, 130, 246, 0.2)', borderRadius: '50%', borderTop: '3px solid #3B82F6', animation: 'spin 1s linear infinite' }
  }

  const COLORS = ['#1E40AF', '#065F46', '#DC2626']
  const [courses, setCourses] = useState([])
  const [totalAssignments, setTotalAssignments] = useState(0)
  const [totalQuizzes, setTotalQuizzes] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const statsData = [
    { name: t('Courses'), value: courses.length },
    { name: t('Assignments'), value: totalAssignments },
    { name: t('Quizzes'), value: totalQuizzes }
  ]

  useEffect(() => {
    const style = document.createElement('style')
    style.innerHTML = `
      @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
      }
    `
    document.head.appendChild(style)

    async function load() {
      try {
        const response = await api.get('/instructors/me/courses')
        console.log('raw courses payload:', response.data)

        let data = response.data
        if (!Array.isArray(data)) {
          if (Array.isArray(data.courses)) data = data.courses
          else if (Array.isArray(data.content)) data = data.content
          else data = []
        }
        setCourses(data)

        const assignReqs = data.map(c => api.get(`/assignments/course/${c.courseId}`))
        const quizReqs = data.map(c => api.get(`/quizzes/course/${c.courseId}`))
        const [assignRes, quizRes] = await Promise.all([Promise.all(assignReqs), Promise.all(quizReqs)])

        setTotalAssignments(assignRes.reduce((s,r) => s + (Array.isArray(r.data) ? r.data.length : 0), 0))
        setTotalQuizzes(quizRes.reduce((s,r) => s + (Array.isArray(r.data) ? r.data.length : 0), 0))
      } catch (err) {
        console.error(err)
        setError('There was an issue loading your dashboard. Please try again.')
      } finally {
        setLoading(false)
      }
    }

    load()
    return () => document.head.removeChild(style)
  }, [])

  if (loading) return <div style={styles.loading}><div style={styles.spinner} /></div>
  if (error) return (
    <div style={styles.container}>
      <div style={{ ...styles.card, padding: '40px', textAlign: 'center' }}>
        <h2 style={{ fontSize: '20px', color: '#DC2626' }}>{t('Error Loading Dashboard')}</h2>
        <p style={{ color: '#6B7280' }}>{error}</p>
        <button onClick={() => window.location.reload()} style={{ backgroundColor: '#2563EB', color: 'white', padding: '8px 16px', borderRadius: '4px', border: 'none', marginTop: '16px', cursor: 'pointer' }}>{t('Retry')}</button>
      </div>
    </div>
  )

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <h1 style={styles.headerTitle}>{t('Instructor Dashboard')}</h1>
        <p style={styles.headerSubtitle}>{t("Welcome back! Here's an overview of your teaching impact.")}</p>
      </div>

      <div style={styles.statsGrid}>
        <div style={styles.statCard({ bg: '#EFF6FF', text: '#1E40AF' })}>
          <p style={styles.statLabel({ text: '#1E40AF' })}>{t('Your Courses')}</p>
          <p style={styles.statValue({ text: '#1E40AF' })}>{courses.length}</p>
        </div>
        <div style={styles.statCard({ bg: '#ECFDF5', text: '#065F46' })}>
          <p style={styles.statLabel({ text: '#065F46' })}>{t('Total Assignments')}</p>
          <p style={styles.statValue({ text: '#065F46' })}>{totalAssignments}</p>
        </div>
        <div style={styles.statCard({ bg: '#FEF2F2', text: '#DC2626' })}>
          <p style={styles.statLabel({ text: '#DC2626' })}>{t('Total Quizzes')}</p>
          <p style={styles.statValue({ text: '#DC2626' })}>{totalQuizzes}</p>
        </div>
      </div>

      <div style={styles.card}>
        <h2 style={styles.cardTitle}>{t('Overview Stats')}</h2>
        <div style={styles.chartContainer}>
          <ResponsiveContainer width="100%" height="100%">
            <PieChart>
              <Pie dataKey="value" data={statsData} cx="50%" cy="50%" outerRadius={100} label={({ name, percent }) => `${name}: ${(percent * 100).toFixed(0)}%`}>
                {statsData.map((_, idx) => <Cell key={idx} fill={COLORS[idx % COLORS.length]} />)}
              </Pie>
              <Tooltip formatter={val => val} />
              <Legend verticalAlign="bottom" height={36} />
            </PieChart>
          </ResponsiveContainer>
        </div>
      </div>

      <div style={styles.card}>
        <h2 style={styles.cardTitle}>{t('Your Active Courses')}</h2>
        {courses.length === 0 ? (
          <div style={{ textAlign: 'center', padding: '32px 16px', backgroundColor: '#F9FAFB', borderRadius: '8px' }}>
            <p style={{ color: '#6B7280' }}>{t("You don't have any courses yet.")}</p>
            <p style={{ color: '#2563EB', fontSize: '14px' }}>{t('Create your first course to get started!')}</p>
          </div>
        ) : (
          <ul style={styles.coursesList}>
            {courses.map((c, i) => (
              <li key={c.courseId} style={styles.courseItem(i % 2 === 0)}>
                <h3 style={styles.courseTitle}>{c.courseName}</h3>
                <div style={styles.courseDetails}>
                  <p style={styles.courseId}>{t('Course ID')}: {c.courseId}</p>
                  <div style={{ display: 'flex', alignItems: 'center' }}>
                    <span style={styles.enrollmentBadge}>{c.enrollmentCount}</span>
                    <span style={styles.enrollmentText}>{t('students enrolled')}</span>
                  </div>
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  )
}
