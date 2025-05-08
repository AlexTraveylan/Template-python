import logging
from atexit import register

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


def main():
    """Entry point for the application."""

    logger.info("Application started.")


@register
def exit_function():
    """Auto execute when application end"""

    logger.info("application ended")


if __name__ == "__main__":
    main()
