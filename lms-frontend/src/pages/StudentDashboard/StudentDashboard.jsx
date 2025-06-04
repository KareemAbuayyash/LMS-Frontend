// src/pages/StudentDashboard/StudentDashboard.jsx
import React, { useState, useEffect } from 'react';
import {
  FaBookOpen,
  FaQuestionCircle,
  FaTasks,
  FaChartLine,
  FaSearch
} from 'react-icons/fa';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import api from '../../api/axios';
import './StudentDashboard.css';

export default function StudentDashboard() {
  const { t } = useTranslation();

  /* ───── state ───── */
  const [courses,     setCourses]     = useState([]);
  const [assignments, setAssignments] = useState([]);
  const [quizzes,     setQuizzes]     = useState([]);
  const [avgGrade,    setAvgGrade]    = useState(0);
  const [filter,      setFilter]      = useState('');
  const [loading,     setLoading]     = useState(true);

  const navigate = useNavigate();

  /* ───── data fetch ───── */
  useEffect(() => {
    Promise.all([
      api.get('/students/enrolled-courses'),
      api.get('/students/assignments'),
      api.get('/students/quizzes'),
      api.get('/students/stats')
    ])
      .then(([cRes, aRes, qRes, sRes]) => {
        setCourses(cRes.data);
        setAssignments(aRes.data);
        setQuizzes(qRes.data);
        setAvgGrade(sRes.data.averageGrade ?? 0);
      })
      .finally(() => setLoading(false));
  }, []);

  /* ───── derived values ───── */
  const totalCourses     = courses.length;
  const totalAssignments = assignments.length;
  const totalQuizzes     = quizzes.length;
  const upcoming         = assignments.slice(0, 5);

  /* ───── render ───── */
  return (
    <div className="student-dashboard">

      {/* ===== STAT CARDS ===== */}
      <div className="stats-overview">
        <Stat icon={FaBookOpen} colorKey="Courses" label={t("Total Courses")}     value={totalCourses} />
        <Stat icon={FaQuestionCircle} colorKey="Quizzes" label={t("Total Quizzes")}     value={totalQuizzes} />
        <Stat icon={FaTasks} colorKey="Assignments" label={t("Total Assignments")} value={totalAssignments} />
        <Stat icon={FaChartLine} colorKey="Grade" label={t("Average Grade")}     value={`${avgGrade}%`} />
      </div>

      {/* ===== UPCOMING ASSIGNMENTS ===== */}
      <section className="upcoming-assignments">
        <h2>{t("Upcoming Assignments")}</h2>
        <div className="table-wrapper">
          <table className="assignments-table">
            <thead>
              <tr>
                <th>{t("Title")}</th>
                <th>{t("Course")}</th>
                <th>{t("Due Date")}</th>
              </tr>
            </thead>
            <tbody>
              {upcoming.length === 0 ? (
                <tr className="empty">
                  <td colSpan={3}>{t("Nothing due")}</td>
                </tr>
              ) : (
                upcoming.map(a => (
                  <tr key={a.id}>
                    <td>{a.title}</td>
                    <td>{a.courseName}</td>
                    <td>{new Date(a.dueDate).toLocaleDateString()}</td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </section>

      {/* ===== COURSES TABLE ===== */}
      <section className="courses-section">
        <header className="section-header">
          <h2>{t("My Courses")}</h2>
          <div className="search-box">
            <FaSearch className="icon" />
            <input
              type="text"
              placeholder={t("Search courses…")}
              value={filter}
              onChange={e => setFilter(e.target.value)}
            />
          </div>
        </header>

        <div className="table-container">
          <table className="courses-table">
            <thead>
              <tr>
                <th>{t("Course Name")}</th>
                <th>{t("Instructor")}</th>
                <th>{t("Actions")}</th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr className="empty">
                  <td colSpan={3}>{t("Loading…")}</td>
                </tr>
              ) : (
                courses
                  .filter(c =>
                    c.courseName.toLowerCase().includes(filter.toLowerCase())
                  )
                  .map(c => (
                    <tr key={c.courseId}>
                      <td>{c.courseName}</td>
                      <td>{c.instructorName}</td>
                      <td>
                        <button
                          className="view-course-btn"
                          onClick={() => navigate(`/student/courses/${c.courseId}`)}
                        >
                          {t("View")}
                        </button>
                      </td>
                    </tr>
                  ))
              )}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  );
}

/* ───── stat card helper ───── */
// eslint-disable-next-line no-unused-vars
function Stat({ icon: Icon, label, value, colorKey }) {
  const palette = {
    Courses: 'var(--indigo)',
    Quizzes: 'var(--rose)',
    Assignments: 'var(--emerald)',
    Grade: 'var(--indigo)'
  };
  return (
    <div className="stat-card">
      <Icon className="stat-icon" style={{ color: palette[colorKey] }} />
      <div>
        <h3>{label}</h3>
        <p>{value}</p>
      </div>
    </div>
  );
}
