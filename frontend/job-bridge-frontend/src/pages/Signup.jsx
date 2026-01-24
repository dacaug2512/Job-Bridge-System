import React, { useState } from "react";
import axios from "axios";
import { useNavigate, Link } from "react-router-dom";
import "../styles/auth.css";

export default function Signup() {

  const [form, setForm] = useState({
    fullName:"", username:"", email:"", phone:"", password:"", roleId:""
  });

  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");
  const [loading, setLoading] = useState(false);

  const navigate = useNavigate();

  const handleChange = e => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const validate = () => {
    if (form.password.length < 6) return "Password must be at least 6 characters";
    if (!/^\d{10}$/.test(form.phone)) return "Mobile number must be 10 digits";
    if (!/\S+@\S+\.\S+/.test(form.email)) return "Invalid email format";
    if (!form.roleId) return "Please select role";
    return "";
  };

  const handleSubmit = async e => {
    e.preventDefault();

    const msg = validate();
    if (msg) return setError(msg);

    setLoading(true);
    setError("");
    setSuccess("");

    try {
      await axios.post("http://localhost:8080/auth/signup", form);

      setSuccess("Account created successfully! Redirecting to login...");

      setTimeout(() => {
        navigate("/login");
      }, 1800);

    } catch (err) {
      setError(err.response?.data || "User already exists");
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

          {error && <div className="error-msg">{error}</div>}
          {success && <div className="success-msg">{success}</div>}

          <form onSubmit={handleSubmit}>

            <div className="form-group">
              <label>Full Name</label>
              <input name="fullName" onChange={handleChange} required />
            </div>

            <div className="form-group">
              <label>Username</label>
              <input name="username" onChange={handleChange} required />
            </div>

            <div className="form-group">
              <label>Email</label>
              <input name="email" onChange={handleChange} required />
            </div>

            <div className="form-group">
              <label>Mobile</label>
              <input name="phone" onChange={handleChange} required />
            </div>

            <div className="form-group">
              <label>Password</label>
              <input type="password" name="password" onChange={handleChange} required />
            </div>

            <div className="form-group">
              <label>Role</label>
              <select name="roleId" onChange={handleChange} required>
                <option value="">Select</option>
                <option value="2">Recruiter</option>
                <option value="3">Job Seeker</option>
              </select>
            </div>

            <button className="auth-btn" disabled={loading}>
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
