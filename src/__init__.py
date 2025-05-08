import atexit
import logging

from src.utils.logger_settings import setup_logging

setup_logging()

logger = logging.getLogger(__name__)


@atexit.register
def exit_function():
    """Auto execute when application end"""

    logger.info("application ended")
