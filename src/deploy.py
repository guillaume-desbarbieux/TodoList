import subprocess
import requests
import os
import sys

def run_deploy():
    # -----------------------------
    # 1️⃣ Lancer les tests pytest
    # -----------------------------
    test_result = subprocess.run(
        [sys.executable, "-m", "pytest", "tests", "--maxfail=1", "--disable-warnings", "-q"],
        capture_output=True,
        text=True,
        cwd="/home/guillaumedbx/mysite/TodoList"
    )

    if test_result.returncode != 0:
        return f"❌ Tests échoués :\n{test_result.stdout}\n{test_result.stderr}"

    # -----------------------------
    # 2️⃣ Git pull
    # -----------------------------
    result = subprocess.run(
        ["git", "-C", "/home/guillaumedbx/mysite/TodoList", "pull"],
        capture_output=True,
        text=True
    )
    if result.returncode != 0:
        return f"❌ Git pull échoué :\n{result.stderr}"

    # -----------------------------
    # 3️⃣ Reload
    # -----------------------------
    username = "guillaumedbx"
    app_name = "guillaumedbx.pythonanywhere.com"
    api_token = os.environ.get("API_TOKEN")

    headers = {"Authorization": f"Token {api_token}"}
    reload_url = f"https://www.pythonanywhere.com/api/v0/user/{username}/webapps/{app_name}/reload/"

    resp = requests.post(reload_url, headers=headers)

    if resp.status_code == 200:
        return f"✅ Déploiement réussi !\n\nTests : OK\n\nGit pull :\n{result.stdout}"
    else:
        return f"❌ Reload échoué : {resp.status_code}\n{resp.text}"


if __name__ == "__main__":
    print(run_deploy())
