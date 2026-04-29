## Local install

```sh
cd $HOME/dotfiles
for i in * ;do ln -s $HOME/dotfiles/$i $HOME/.$i ;done
```

## Dockerfile

```
USER ${USERNAME}
RUN cd /home/${USERNAME} \
    && git clone https://github.com/amane-uehara/dotfiles.git \
    && cd /home/${USERNAME}/dotfiles \
    && sh /home/${USERNAME}/dotfiles/install.sh \
    && sed -i /home/${USERNAME}/dotfiles/localenv/zshrc \
        -e 's@MY_PROMPT_COLOR=.*$@MY_PROMPT_COLOR="041"@' \
        -e 's@MY_PROMPT_DEVICE=.*$@MY_PROMPT_DEVICE="rps-analyze $HOSTNAME"@'
```
