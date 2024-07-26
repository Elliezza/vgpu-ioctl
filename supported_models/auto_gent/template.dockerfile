FROM harbor.4pd.io/sagegpt-aio/pk_platform/torch-benchmark:py311-53d98e3
COPY run_PASS_if_return_nonzero.sh run_PASS_if_return_zero.sh /scripts/
RUN apt install vim -y && apt clean
RUN pip install --no-cache-dir numba && python install.py $REPLACE
RUN python run.py -d cpu -t eval $REPLACE
