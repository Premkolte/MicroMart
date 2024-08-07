import styles from "./index.module.scss";
import { useNavigate } from "react-router";
import { FormEvent, useEffect } from "react";
import { getUser, login, logout } from "../../features/auth/authSlice";
import { useAppDispatch, useAppSelector } from "../../app/hooks";
import Spinner from "../../components/components/Spinner";


const handleClick = () => {
  window.open('https://www.youtube.com', '_blank', 'noopener,noreferrer');
};
const LoginPage = () => {
  const { user, token, isLoading } = useAppSelector((state) => state.auth);
  const navigate = useNavigate();
  const dispatch = useAppDispatch();

  useEffect(() => {
    if (user === null && token) {
      const userId = localStorage.getItem("user");
      dispatch(getUser(Number(userId)));
    }
  }, [token, user, dispatch]);

  const formSubmitHandler = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    const data = new FormData(e.currentTarget);
    const username = data.get("username") as string;
    const password = data.get("password") as string;

    await dispatch(login({ username, password }));
    if (user && token) {
      navigate("/");
      console.log(user);
    }
  };

  const logoutHandler = async () => {
    await dispatch(logout());
    navigate("/");
  };

  if (isLoading) return <Spinner />;

  return (
    <section className={styles.section}>
      <div className={`${styles.container} main-container`}>
        {user !== null ? (
          <div className={styles.profile}>
            <div className={styles.profileHeader}>
              <div className={styles.profileInfo}>
                <h1>Welcome</h1>

                {/* <video src="video-desktop1.mp4"/> */}
                <span className={styles.name}>
                    Ramesh Kumar
                  {/* {`${user?.name.firstname} ${user?.name.lastname}`} */}
                </span>
                <h2>
                  Email: rameshkumar@gmail.com 
                  {/* <strong>{user?.email}</strong> */}
                </h2>
                <h3>

                  Location: Pune, Maharashtra 
                  {/* <strong>{user?.address.city}</strong> */}
                </h3>
                <h3>
                  Phone: 9885487544
                  {/* <strong>{user?.address.number}</strong> */}
                </h3>
              </div>
              <br></br>
              <button
                  type="button"
                  className={styles.butt}
                  onClick={handleClick}
                >View Analytics</button>
            </div>
            <button
              type="button"
              className={styles.logoutBtn}
              onClick={() => logoutHandler()}
            >
              Logout
            </button>
          </div>
        ) : (
          <div className={styles.loginContainer}>
            <h2>Login</h2>
            <form action="/login" onSubmit={formSubmitHandler}>
              <div className={styles.formItem}>
                <div className={styles.formField}>
                  <input type="text" name="username" placeholder="Username:" />
                </div>
                <p className={styles.apiSignExample}>
                  demo username: <strong>mor_2314</strong>
                </p>
              </div>
              <div className={styles.formItem}>
                <div className={styles.formField}>
                  <input
                    type="password"
                    name="password"
                    placeholder="Password:"
                  />
                </div>
                <p className={styles.apiSignExample}>
                  demo password: <strong>83r5^_</strong>
                </p>
              </div>
              <div className={styles.formSubmit}>
                <button type="submit">Sign In</button>
              </div>
            </form>
          </div>
        )}
      </div>
    </section>
  );
};

export default LoginPage;
