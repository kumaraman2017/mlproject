import logging
import os
from datetime import datetime

LOG_FILE=f"{datetime.now().strftime('%m_%d_%Y_%H_%M_%S')}.log"


logs_dir=os.path.join(os.getcwd(),"logs")
os.makedirs(logs_dir,exist_ok=True)
LOG_FILE_PATH=os.path.join(logs_dir,LOG_FILE)

logging.basicConfig(
    filename=LOG_FILE_PATH,
    format="[%(asctime)s] %(lineno)d %(name)s - %(levelname)s - %(message)s",
    level=logging.INFO
)

if __name__=="__main__":
    try:
        a=1/0
    except Exception as e:
        logging.info("Logging has started")
        raise Exception("An error occurred") from e