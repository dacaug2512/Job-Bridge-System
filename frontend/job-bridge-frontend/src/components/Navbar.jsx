import { Link } from "react-router-dom";

export default function Navbar() {
  return (
    <nav style={{ padding: "10px", borderBottom: "1px solid #ccc" }}>
      <Link to="/signup" style={{ marginRight: "10px" }}>Signup</Link>
      <Link to="/login" style={{ marginRight: "10px" }}>Login</Link>
      <Link to="/">Dashboard</Link>
    </nav>
  );
}
