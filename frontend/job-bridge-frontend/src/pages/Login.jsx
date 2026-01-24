import React, { useState } from "react";
import axios from "axios";
import { useNavigate, Link } from "react-router-dom";
import "../styles/auth.css";

export default function Login() {
  const [form, setForm] = useState({ username: "", password: "" });
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleChange = e => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async e => {
    e.preventDefault();
    try {
      const res = await axios.post("http://localhost:8080/auth/login", form);
      localStorage.setItem("token", res.data.token);
      localStorage.setItem("role", res.data.role);

      if (res.data.role === "ADMIN") navigate("/admin");
      else if (res.data.role === "RECRUITER") navigate("/recruiter");
      else navigate("/jobseeker");

    } catch {
      setError("Invalid credentials");
    }
  };

  return (
    <div className="auth-wrapper">
      <div className="auth-box">

        <div className="auth-left">
          <h1>JobBridge</h1>
          <p>Hire smart. Apply fast. Manage everything in one place.</p>
        </div>

        <div className="auth-right">
          <h2>Welcome Back</h2>

          {error && <div className="error-msg">{error}</div>}

          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <label>Username</label>
              <input name="username" onChange={handleChange} required />
            </div>

            <div className="form-group">
              <label>Password</label>
              <input type="password" name="password" onChange={handleChange} required />
            </div>

            <button className="auth-btn">Login</button>
          </form>

          <div className="auth-switch">
            New here? <Link to="/signup"><span>Create account</span></Link>
          </div>

        </div>

      </div>
    </div>
  );
}
