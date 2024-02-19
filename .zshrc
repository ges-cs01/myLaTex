# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run  alias .
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bandex_deprec() {
	curl 'https://uspdigital.usp.br/rucard/dwr/call/plaincall/CardapioControleDWR.obterCardapioRestUSP.dwr' \
	--compressed \
	-X POST \
	-H 'Accept-Encoding: gzip, deflate, br' \
	-H 'Origin: https://uspdigital.usp.br' \
	-H 'DNT: 1' \
	-H 'Connection: keep-alive' \
	-H 'Referer: https://uspdigital.usp.br/rucard/Jsp/cardapioSAS.jsp?codrtn=13' \
	-H 'Cookie: JSESSIONID=38EA904EE24FC374DEB6653B0C961728; DWRSESSIONID=NVV3LJC4*9Svu$knBcWoEGBIeNo; NSC_mcwt_svdbse=ffffffff096cd06c45525d5f4f58455e445a4a4229a0; NSC_mcwt_dpnvnxfcefw=ffffffff096cd0e645525d5f4f58455e445a4a423660' \
	-H 'Sec-Fetch-Dest: empty' \
	-H 'Sec-Fetch-Mode: cors' \
	-H 'Sec-Fetch-Site: same-origin' \
	-H 'TE: trailers' \
	--data-raw $'callCount=1\nwindowName=\nnextReverseAjaxIndex=0\nc0-scriptName=CardapioControleDWR\nc0-methodName=obterCardapioRestUSP\nc0-id=0\nc0-param0=string:13\nbatchId=1\ninstanceId=0\npage=%2Frucard%2FJsp%2FcardapioSAS.jsp%3Fcodrtn%3D13\nscriptSessionId=NVV3LJC4*9Svu$knBcWoEGBIeNo/k2kOeNo-wN1oTIGK4\n' | 

	grep -A 10 'cdpdia' | 
	sed -e 's/<br>/\n/g; s/cdpdia/\n/g' \
	-e 's/\\u00C1/Á/g; s/\\u00C0/À/g; s/\\u00E3/ã/g; s/\\u00E1/á/g; s/\\u00E7/ç/g; s/\\u00FA/ú/g; s/\\u00E0/à/g; s/\\u00F4/ô/g; s/\\u00E9/é/g; s/\\u00F3/ó/g; s/\\u00F5/õ/g' | 
	sed -e 's/nomrtn\:null.*obscdpsmn\://g' \
	-e 's/\\//g' \
	-e 's/modificação/modificação"\n/g' | 
	sed '1d;$d' | sed '/^$/d' |
	sed -e 's/Arroz/\n\nArroz/g' \
	-e 's/tiprfi\:"A"/Almoço/g; s/tiprfi\:"J"/Janta\,0/g' \
	-e 's/dtarfi/\ndia/g' \
	-e 's/dtainismncdp\:\"//g' \
	-e 's/{//g; s/}//g; s/]//g' \
	-e 's/,"Cardápio sujeito a modificação"//g' \
	-e 's/^\*\*Os Restaurantes.*\*\*"//g' \
	-e 's/;//g' -e 's/"//g' \
	-e 's/.*Almoço.*/(Almoço)/g; s/.*Janta.*/(Janta)/g' \
	-e 's/.*FECHADO.*\,/\nFECHADO/g' \
	-e 's/.*Fechado.*\,/\nFechado/g' \
	-e 's/dwr.*//g' \
	-e 's/^\,.*dia/dia/g'
}

hoje() {
	date +"%d/%m/%Y"
}

meuip() {
	ip -c a | grep -i -A 2 broadcast | awk 'NR==3{print $2}'
}

bandex() {
	curl -s 'https://uspdigital.usp.br/rucard/dwr/call/plaincall/CardapioControleDWR.obterCardapioRestUSP.dwr' \
	--compressed \
	-X POST \
	-H 'Accept-Encoding: gzip, deflate, br' \
	-H 'DNT: 1' \
	-H 'Cookie: JSESSIONID=38EA904EE24FC374DEB6653B0C961728; DWRSESSIONID=NVV3LJC4*9Svu$knBcWoEGBIeNo' \
	--data-raw $'callCount=1\nwindowName=\nnextReverseAjaxIndex=0\nc0-scriptName=CardapioControleDWR\nc0-methodName=obterCardapioRestUSP\nc0-id=0\nc0-param0=string:13\nbatchId=1\ninstanceId=0\npage=%2Frucard%2FJsp%2FcardapioSAS.jsp%3Fcodrtn%3D13\nscriptSessionId=NVV3LJC4*9Svu$knBcWoEGBIeNo/k2kOeNo-wN1oTIGK4\n' |
	sed -e 's/<br>/\n/g' \
	-e 's/\\u00C1/Á/g; s/\\u00C0/À/g; s/\\u00E3/ã/g; s/\\u00E1/á/g; s/\\u00E7/ç/g; s/\\u00FA/ú/g; s/\\u00E0/à/g; s/\\u00F4/ô/g; s/\\u00E9/é/g; s/\\u00F3/ó/g; s/\\u00F5/õ/g' \
	-e 's/cdpdia:/\n--------------------------------------------------------------\n/g' \
	-e 's/\\//g; s/\"//g; s/**//g; s/,//g' \
	-e 's/dtarfi/\nDia/g' \
	-e 's/codddd/\n/g; s/nomrtn/\n/g' \
	-e 's/tiprfi:A/\n(Almoço)\n\n/g; s/tiprfi:J/\n(Janta)\n\n/g' | 
	sed '/vlr/d; $d; 1,7d; /Os Restaurantes/d; /semana/d; /null/d'
}

pitchfork_not_numbered() {
	for i in {1..2}
	do
		curl -s "https://pitchfork.com/best/high-scoring-albums/?page=$i" |
		grep "page-best-new-music" |
		sed 's/page-best-new-music/\n\n/g' |
		sed '1d' |
		sed 's/\,/\n/g' |
		sed '$d' |
		sed '$d; 1,2d' |
		sed 's/"//g; s/\]//g'
	done  
}

pitchfork() {
	pitchfork_not_numbered | awk '{print NR " " $s}'
}

slsk () {
	~/Desktop/home_/programs/SoulseekQt-2018-1-30-64bit-appimage/SoulseekQt-2018-1-30-64bit.AppImage
}

wdir() {
	cd ~/Desktop/home_/workdir
}
