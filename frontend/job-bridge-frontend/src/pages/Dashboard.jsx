export default function Dashboard({ user }) {
  return (
    <div style={{ margin: "50px" }}>
      <h2>Dashboard</h2>
      <p>Welcome, {user.username}</p>
      <p>Role: {user.role}</p>
    </div>
  );
}
