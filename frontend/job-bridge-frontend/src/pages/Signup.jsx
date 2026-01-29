import React, { useState } from "react";
import axios from "axios";
import { useNavigate, Link } from "react-router-dom";
import "../styles/auth.css";

export default function Signup() {
  const [form, setForm] = useState({
    fullName: "",
    username: "",
    email: "",
    phone: "",
    password: "",
    roleId: ""
  });
  const [errors, setErrors] = useState({});
  const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState(false);

  const navigate = useNavigate();

  // --- VALIDATION ---
  const validators = {
    fullName: v =>
      !/^[A-Za-z]{3,}\s[A-Za-z]{3,}$/.test(v)
        ? "First & Last name must be at least 3 letters each"
        : "",
    username: v =>
      !/^[a-zA-Z0-9]{5,15}$/.test(v)
        ? "Username must be 5–15 alphanumeric chars"
        : "",
    email: v =>
      !/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(v)
        ? "Invalid email format"
        : "",
    phone: v =>
      !/^[6-9]\d{9}$/.test(v) ? "Enter valid 10 digit mobile number" : "",
    password: v =>
      !/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$/.test(v)
        ? "Password: min 6 chars, uppercase, lowercase & number required"
        : "",
    roleId: v => (!v ? "Please select role" : "")
  };

  const handleChange = e => {
    const { name, value } = e.target;
    setForm({ ...form, [name]: value });
    if (validators[name]) {
      setErrors(prev => ({ ...prev, [name]: validators[name](value) }));
    }
  };

  const validateForm = () => {
    const newErrors = {};
    Object.keys(validators).forEach(key => {
      const err = validators[key](form[key]);
      if (err) newErrors[key] = err;
    });
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async e => {
    e.preventDefault();
    if (!validateForm()) return;

    setLoading(true);
    setSuccess("");
    try {
      await axios.post("http://localhost:8080/auth/signup", form);
      setSuccess("Account created successfully! Redirecting...");
      setTimeout(() => navigate("/login"), 1800);
    } catch (err) {
      setErrors({ api: err.response?.data || "Signup failed" });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="auth-wrapper">
      <div className="auth-box">
        <div className="auth-left">
          <h1>JobBridge</h1>
          <p>Start your professional journey with us.</p>
        </div>

        <div className="auth-right">
          <h2>Create Account</h2>

          {errors.api && <div className="error-msg">{errors.api}</div>}
          {success && <div className="success-msg">{success}</div>}

          <form onSubmit={handleSubmit} noValidate>
            <Input
              label="Full Name"
              name="fullName"
              value={form.fullName}
              onChange={handleChange}
              error={errors.fullName}
            />
            <Input
              label="Username"
              name="username"
              value={form.username}
              onChange={handleChange}
              error={errors.username}
            />
            <Input
              label="Email"
              name="email"
              value={form.email}
              onChange={handleChange}
              error={errors.email}
            />
            <Input
              label="Mobile"
              name="phone"
              value={form.phone}
              onChange={handleChange}
              error={errors.phone}
            />

            <Input
              label="Password"
              name="password"
              type="password"
              value={form.password}
              onChange={handleChange}
              error={errors.password}
            />

            <div className="form-group">
              <label>Role</label>
              <select
                name="roleId"
                value={form.roleId}
                onChange={handleChange}
              >
                <option value="">Select</option>
                <option value="2">Recruiter</option>
                <option value="3">Job Seeker</option>
              </select>
              {errors.roleId && (
                <small className="error-text">{errors.roleId}</small>
              )}
            </div>

            <button
              className="auth-btn"
              disabled={Object.values(errors).some(e => e) || loading}
            >
              {loading ? "Creating Account..." : "Register"}
            </button>
          </form>

          <div className="auth-switch">
            Already registered? <Link to="/login"><span>Login</span></Link>
          </div>
        </div>
      </div>
    </div>
  );
}

const Input = ({ label, error, ...props }) => (
  <div className="form-group">
    <label>{label}</label>
    <input {...props} className={error ? "input-error" : ""} />
    {error && <small className="error-text">{error}</small>}
  </div>
);
