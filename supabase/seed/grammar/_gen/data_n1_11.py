G = [
dict(
n=101,
jp="〜なりとも",
rd="nari tomo",
tr="Pelo menos / Nem que seja / Ainda que só",
ex="""なりとも indica uma quantidade mínima que a pessoa deseja ou pede. Equivale a "pelo menos" ou "nem que seja".

Costuma vir depois de palavras de quantidade pequena, como um pouco, um momento, uma pessoa ou uma vez. Por exemplo, "se puder, ajude pelo menos um pouco".

É uma expressão formal e um pouco antiquada, usada em pedidos educados.""",
st="""Substantivo (quantidade mínima) + なりとも
Palavra interrogativa + なりとも (qualquer)""",
no="""Expressões comuns são 少しなりとも, 一目なりとも, 多少なりとも e 何なりとも.

何なりとも significa "qualquer coisa", como em 何なりとお申し付けください.""",
bf="なりとも",
rx="なりとも|なりと",
tk=["なり", "とも"],
va=["なりとも", "なりと"],
E=[
("少しなりとも、お役に立てればうれしいです。", "すこしなりとも、おやくにたてればうれしいです。", "Fico feliz se puder ser útil, nem que seja um pouco."),
("一目なりとも、母に会いたい。", "ひとめなりとも、ははにあいたい。", "Quero ver minha mãe, nem que seja por um instante."),
("多少なりとも、経験がある人を募集しています。", "たしょうなりとも、けいけんがあるひとをぼしゅうしています。", "Procuramos pessoas com pelo menos um pouco de experiência."),
("何なりとお申し付けください。", "なんなりとおもうしつけください。", "Peça qualquer coisa, por favor."),
("一日なりとも休むわけにはいかない。", "いちにちなりともやすむわけにはいかない。", "Não posso descansar nem que seja um dia."),
],
R=[
("わずか____、寄付をさせてください。", "Deixe-me fazer uma doação, ainda que só um pouco.", ["なりとも"]),
("一時間____、話を聞いてもらえませんか。", "Poderia me ouvir, nem que seja por uma hora?", ["なりとも"]),
("少し____、家計の助けになればいい。", "Seria bom se ajudasse nas despesas da casa, pelo menos um pouco.", ["なりとも"]),
("ご質問があれば、何____どうぞ。", "Se tiver perguntas, fique à vontade para perguntar qualquer coisa.", ["なりと", "なりとも"]),
("一言____、お礼を言いたかった。", "Queria agradecer, nem que fosse com uma palavra.", ["なりとも"]),
],
),
dict(
n=102,
jp="〜なり〜なり",
rd="nari ~ nari",
tr="Ou... ou / Seja... seja / Tanto faz se",
ex="""なり〜なり serve para apresentar exemplos de opções possíveis, deixando a escolha livre. Equivale a "ou... ou" ou "seja... seja".

Muitas vezes a pessoa sugere ou pede que o outro faça uma das opções, ou algo parecido. Por exemplo, "pergunte ao professor ou procure no dicionário".

A segunda parte costuma ser um conselho, um pedido ou uma ordem.""",
st="""Substantivo + なり + Substantivo + なり
Verbo (forma dicionário) + なり + Verbo (forma dicionário) + なり""",
no="""Não se usa para falar de fatos passados.

É parecido com か〜か e とか〜とか, mas なり〜なり é usado para dar sugestões.

Não se usa com superiores, porque soa como uma ordem.""",
bf="なり〜なり",
rx="なり",
tk=["なり"],
va=["なり〜なり"],
E=[
("わからないことは、先生に聞くなり辞書で調べるなりしなさい。", "わからないことは、せんせいにきくなりじしょでしらべるなりしなさい。", "O que não souber, pergunte ao professor ou procure no dicionário."),
("電話なりメールなりで連絡してください。", "でんわなりメールなりでれんらくしてください。", "Entre em contato por telefone ou por e-mail."),
("休みの日は、本を読むなり映画を見るなり、好きに過ごしたい。", "やすみのひは、ほんをよむなりえいがをみるなり、すきにすごしたい。", "Nos dias de folga, quero passar o tempo do meu jeito, lendo ou vendo filmes."),
("困ったら、親なり友達なりに相談したほうがいい。", "こまったら、おやなりともだちなりにそうだんしたほうがいい。", "Se estiver em apuros, é melhor conversar com seus pais ou amigos."),
("煮るなり焼くなり、好きにしてくれ。", "にるなりやくなり、すきにしてくれ。", "Cozinhe ou asse, faça o que quiser."),
],
R=[
("暑いなら、窓を開ける____エアコンをつけるなりしてください。", "Se está quente, abra a janela ou ligue o ar-condicionado.", ["なり"]),
("コーヒーなり紅茶____、好きなものを飲んでください。", "Café ou chá, beba o que preferir.", ["なり"]),
("行けないなら、手紙を書くなり電話する____すればいい。", "Se não puder ir, basta escrever uma carta ou ligar.", ["なり"]),
("パン____おにぎりなり、何か食べておきなさい。", "Pão ou bolinho de arroz, coma alguma coisa.", ["なり"]),
("自分で調べるなり、人に聞く____しなさい。", "Pesquise por conta própria ou pergunte a alguém.", ["なり"]),
],
),
dict(
n=103,
jp="〜なしに / 〜なしで",
rd="nashi ni / nashi de",
tr="Sem / Sem que haja / Na falta de",
ex="""なしに e なしで indicam que algo é feito sem uma coisa que normalmente estaria presente. Equivalem a "sem".

なしに é mais formal e muitas vezes indica que algo necessário não foi feito, como "entrar sem permissão". なしで é mais comum na fala, como "viver sem celular".

A forma なしには, com uma frase negativa depois, significa "sem isso, não é possível".""",
st="""Substantivo + なしに + Verbo
Substantivo + なしで + Verbo
Substantivo + なしには + Frase negativa""",
no="""Expressões comuns são 許可なしに, 断りなしに, 予約なしで e 休みなしで.

É parecido com を抜きにして e がなくて.""",
bf="なしに",
rx="なしに|なしで|なしには",
tk=["なし", "に"],
va=["なしに", "なしで", "なしには"],
E=[
("許可なしに、この部屋に入ってはいけない。", "きょかなしに、このへやにはいってはいけない。", "Não se pode entrar nesta sala sem permissão."),
("彼は何の連絡もなしに会社を休んだ。", "かれはなんのれんらくもなしにかいしゃをやすんだ。", "Ele faltou ao trabalho sem avisar nada."),
("予約なしで入れるレストランを探している。", "よやくなしではいれるレストランをさがしている。", "Estou procurando um restaurante em que dê para entrar sem reserva."),
("スマホなしでは生活できない。", "スマホなしではせいかつできない。", "Não consigo viver sem celular."),
("努力なしには、成功はありえない。", "どりょくなしには、せいこうはありえない。", "Sem esforço, o sucesso é impossível."),
],
R=[
("断り____、人の物を使わないでください。", "Não use as coisas dos outros sem pedir.", ["なしに", "なしで"]),
("彼は休み____、十時間働き続けた。", "Ele trabalhou dez horas seguidas sem descanso.", ["なしで", "なしに"]),
("辞書____、この本を読むのは難しい。", "Ler este livro sem dicionário é difícil.", ["なしで", "なしに"]),
("家族の支え____は、ここまで来られなかった。", "Sem o apoio da família, eu não teria chegado até aqui.", ["なしに"]),
("砂糖____コーヒーを飲む。", "Bebo café sem açúcar.", ["なしで"]),
],
),
dict(
n=104,
jp="〜に〜",
rd="ni",
tr="Muito e muito / Demais / Sem parar",
ex="""Quando o mesmo verbo se repete com に no meio, a expressão indica que a ação foi feita com muita intensidade ou por muito tempo. Equivale a "muito e muito" ou "sem parar".

Por exemplo, 待ちに待った significa "esperado por muito, muito tempo", e 泣きに泣いた significa "chorou e chorou".

É uma expressão enfática, comum na escrita e em narrações.""",
st="""Verbo (forma ます sem ます) + に + Mesmo verbo (forma た)""",
no="""Combinações comuns são 待ちに待った, 泣きに泣いた, 考えに考えた, 走りに走った e 迷いに迷った.

Só funciona com alguns verbos fixos.""",
bf="〜に〜",
rx="待ちに待|泣きに泣|考えに考|走りに走|迷いに迷|売れに売|揺れに揺|悩みに悩",
tk=["に"],
va=["待ちに待った", "泣きに泣いた", "考えに考えた", "迷いに迷った"],
E=[
("待ちに待った夏休みがやってきた。", "まちにまったなつやすみがやってきた。", "Chegaram as tão esperadas férias de verão."),
("彼女は別れた後、泣きに泣いた。", "かのじょはわかれたあと、なきにないた。", "Depois do término, ela chorou e chorou."),
("考えに考えた末、留学することにした。", "かんがえにかんがえたすえ、りゅうがくすることにした。", "Depois de pensar muito e muito, decidi fazer intercâmbio."),
("迷いに迷って、結局赤い服を買った。", "まよいにまよって、けっきょくあかいふくをかった。", "Depois de muita dúvida, acabei comprando a roupa vermelha."),
("駅まで走りに走ったが、電車に乗り遅れた。", "えきまではしりにはしったが、でんしゃにのりおくれた。", "Corri e corri até a estação, mas perdi o trem."),
],
R=[
("待ち____待った結果発表の日が来た。", "Chegou o tão esperado dia do anúncio dos resultados.", ["に"]),
("悩み____悩んで、ようやく答えを出した。", "Depois de me angustiar muito, finalmente cheguei a uma resposta.", ["に"]),
("その新商品は売れ____売れた。", "Esse novo produto vendeu e vendeu.", ["に"]),
("船は嵐の中で揺れ____揺れた。", "O navio balançou sem parar no meio da tempestade.", ["に"]),
("考え____考えて、この作品を完成させた。", "Depois de pensar muito e muito, concluí esta obra.", ["に"]),
],
),
dict(
n=105,
jp="〜に値する",
rd="ni atai suru",
tr="Digno de / Que merece / Que vale a pena",
ex="""に値する indica que algo tem valor suficiente para merecer uma ação ou avaliação. Equivale a "digno de" ou "que merece".

Costuma vir com palavras como respeito, elogio, atenção, leitura ou confiança. Por exemplo, "um livro que vale a pena ler" ou "uma atitude digna de respeito".

A forma negativa, に値しない, significa "não merece".""",
st="""Substantivo + に値する
Verbo (forma dicionário) + に値する
Substantivo + に値しない""",
no="""Expressões comuns são 尊敬に値する, 称賛に値する, 注目に値する e 読むに値する.

É uma expressão formal, comum na escrita.""",
bf="に値する",
rx="に値する|に値しない|にあたいする|に値します",
tk=["に", "値する"],
va=["に値する", "に値しない", "に値します"],
E=[
("彼の勇気は尊敬に値する。", "かれのゆうきはそんけいにあたいする。", "A coragem dele é digna de respeito."),
("この本は一度読むに値する。", "このほんはいちどよむにあたいする。", "Este livro vale a pena ser lido pelo menos uma vez."),
("彼女の努力は称賛に値する。", "かのじょのどりょくはしょうさんにあたいする。", "O esforço dela merece elogios."),
("そんな話は信じるに値しない。", "そんなはなしはしんじるにあたいしない。", "Uma história dessas não merece crédito."),
("この発見は注目に値する。", "このはっけんはちゅうもくにあたいする。", "Esta descoberta merece atenção."),
],
R=[
("彼の行動は表彰____。", "A ação dele é digna de homenagem.", ["に値する", "に値します"]),
("この映画は見る____作品だ。", "Este filme é uma obra que vale a pena assistir.", ["に値する"]),
("あんな人の意見は聞く____。", "A opinião de uma pessoa daquelas não merece ser ouvida.", ["に値しない"]),
("彼女の研究は高く評価する____。", "A pesquisa dela merece ser muito bem avaliada.", ["に値する", "に値します"]),
("この結果は検討____。", "Este resultado merece ser analisado.", ["に値する", "に値します"]),
],
),
dict(
n=106,
jp="〜にあって",
rd="ni atte",
tr="Em / Numa situação de / Sendo",
ex="""にあって indica uma situação ou posição especial em que alguém se encontra. Equivale a "em" ou "numa situação de".

A pessoa destaca que, mesmo naquela condição, algo acontece, ou que, por causa dela, algo é natural. Por exemplo, "mesmo em meio à crise, ele manteve a calma" ou "sendo líder, ele tem grande responsabilidade".

É uma expressão formal e literária.""",
st="""Substantivo (situação / posição) + にあって
Substantivo + にあっても (mesmo em)""",
no="""É parecido com で e において, mas にあって destaca que a situação é especial.

A forma にあっても significa "mesmo em".""",
bf="にあって",
rx="にあって|にあっては|にあっても",
tk=["に", "あって"],
va=["にあって", "にあっては", "にあっても"],
E=[
("厳しい状況にあって、彼は冷静さを失わなかった。", "きびしいじょうきょうにあって、かれはれいせいさをうしなわなかった。", "Numa situação difícil, ele não perdeu a calma."),
("社長という立場にあって、彼の責任は重い。", "しゃちょうというたちばにあって、かれのせきにんはおもい。", "Na posição de presidente, a responsabilidade dele é grande."),
("この不景気にあっても、あの会社は成長を続けている。", "このふけいきにあっても、あのかいしゃはせいちょうをつづけている。", "Mesmo nesta recessão, aquela empresa continua crescendo."),
("病床にあって、彼女は家族のことを心配していた。", "びょうしょうにあって、かのじょはかぞくのことをしんぱいしていた。", "Mesmo no leito de doente, ela se preocupava com a família."),
("情報化社会にあっては、正しい情報を選ぶ力が必要だ。", "じょうほうかしゃかいにあっては、ただしいじょうほうをえらぶちからがひつようだ。", "Na sociedade da informação, é preciso saber escolher a informação certa."),
],
R=[
("困難な時代____、人々は助け合った。", "Numa época difícil, as pessoas se ajudaram.", ["にあって", "にあっても"]),
("リーダーの立場____、弱音を吐くわけにはいかない。", "Na posição de líder, não posso me queixar.", ["にあって", "にあっては"]),
("異国の地____、彼は一人で頑張った。", "Numa terra estrangeira, ele se esforçou sozinho.", ["にあって", "にあっても"]),
("戦争中____も、人々は希望を失わなかった。", "Mesmo durante a guerra, as pessoas não perderam a esperança.", ["にあって"]),
("高齢化社会____、介護の問題は深刻だ。", "Numa sociedade que envelhece, o problema dos cuidados com idosos é sério.", ["にあって", "にあっては"]),
],
),
dict(
n=107,
jp="〜に引き換え",
rd="ni hikikae",
tr="Em contraste com / Ao contrário de / Já",
ex="""に引き換え compara duas coisas ou pessoas mostrando que são opostas. Equivale a "em contraste com" ou "ao contrário de".

Muitas vezes a pessoa elogia um lado e critica o outro. Por exemplo, "ao contrário do irmão mais velho, que é sério, o mais novo só brinca".

É uma expressão um pouco formal, com tom de avaliação pessoal.""",
st="""Substantivo + に引き換え
Frase + の + に引き換え
それに引き換え、 + Frase""",
no="""Também é escrito にひきかえ.

É parecido com に比べて e とは対照的に, mas に引き換え costuma ter julgamento pessoal.""",
bf="に引き換え",
rx="に引き換え|にひきかえ|に引きかえ",
tk=["に", "引き換え"],
va=["に引き換え", "にひきかえ", "それに引き換え"],
E=[
("真面目な兄に引き換え、弟は遊んでばかりいる。", "まじめなあににひきかえ、おとうとはあそんでばかりいる。", "Ao contrário do irmão mais velho, que é sério, o mais novo só brinca."),
("去年に引き換え、今年は雨が多い。", "きょねんにひきかえ、ことしはあめがおおい。", "Em contraste com o ano passado, este ano chove muito."),
("姉は料理が上手だ。それに引き換え、私は何も作れない。", "あねはりょうりがじょうずだ。それにひきかえ、わたしはなにもつくれない。", "Minha irmã cozinha bem. Já eu não sei fazer nada."),
("前の店長に引き換え、今の店長はとても優しい。", "まえのてんちょうにひきかえ、いまのてんちょうはとてもやさしい。", "Ao contrário do gerente anterior, o atual é muito gentil."),
("彼が努力しているのに引き換え、私は怠けてばかりだ。", "かれがどりょくしているのにひきかえ、わたしはなまけてばかりだ。", "Em contraste com ele, que se esforça, eu só fico enrolando."),
],
R=[
("都会の生活____、田舎の生活はのんびりしている。", "Em contraste com a vida na cidade, a vida no interior é tranquila.", ["に引き換え", "にひきかえ"]),
("母は明るい。それ____、父は無口だ。", "Minha mãe é alegre. Já meu pai é calado.", ["に引き換え", "にひきかえ"]),
("先月の売り上げ____、今月は好調だ。", "Ao contrário do mês passado, as vendas deste mês vão bem.", ["に引き換え", "にひきかえ"]),
("友達がみんな結婚したの____、私はまだ一人だ。", "Ao contrário dos meus amigos, que já se casaram, eu continuo sozinho.", ["に引き換え", "にひきかえ"]),
("昔の静かな町____、今はにぎやかだ。", "Em contraste com a cidade tranquila de antigamente, hoje é movimentada.", ["に引き換え", "にひきかえ"]),
],
),
dict(
n=108,
jp="〜に至る / 〜に至った",
rd="ni itaru / ni itatta",
tr="Chegar a / Acabar em / Culminar em",
ex="""に至る indica que algo chegou a um ponto final, a um resultado ou a uma situação extrema, depois de um processo. Equivale a "chegar a" ou "culminar em".

Por exemplo, "depois de muita discussão, chegaram a um acordo" ou "a doença piorou e ele chegou a ser internado".

É uma expressão formal, comum em notícias e textos.""",
st="""Substantivo + に至る / に至った
Verbo (forma dicionário) + に至る / に至った""",
no="""Expressões comuns são 結論に至る, 合意に至る, 死に至る e 現在に至る.

A forma に至るまで significa "até mesmo" e tem outro uso.""",
bf="に至る",
rx="に至る|に至った|に至り|に至って|に至らず|にいたる|にいたった",
tk=["に", "至る"],
va=["に至る", "に至った", "に至り"],
E=[
("長い話し合いの末、ようやく合意に至った。", "ながいはなしあいのすえ、ようやくごういにいたった。", "Depois de uma longa discussão, finalmente chegaram a um acordo."),
("その病気は、放っておくと死に至ることもある。", "そのびょうきは、ほうっておくとしにいたることもある。", "Essa doença, se não for tratada, pode levar à morte."),
("彼が会社を辞めるに至った理由はわからない。", "かれがかいしゃをやめるにいたったりゆうはわからない。", "Não se sabe o motivo que o levou a sair da empresa."),
("事件は大きな問題に至らずに済んだ。", "じけんはおおきなもんだいにいたらずにすんだ。", "O incidente não chegou a virar um grande problema."),
("その町は、大きく発展して現在に至る。", "そのまちは、おおきくはってんしてげんざいにいたる。", "Aquela cidade se desenvolveu muito até chegar aos dias de hoje."),
],
R=[
("いろいろ検討した結果、この結論____。", "Depois de analisar várias coisas, chegamos a esta conclusão.", ["に至った", "にいたった"]),
("小さなけんかが、離婚____。", "Uma pequena briga acabou em divórcio.", ["に至った", "にいたった"]),
("この会社は百年の歴史を経て現在____。", "Esta empresa passou por cem anos de história até chegar aos dias de hoje.", ["に至る", "にいたる"]),
("けが人が出る____事故だった。", "Foi um acidente que chegou a deixar feridos.", ["に至る", "に至った"]),
("両国の交渉は、合意____。", "As negociações entre os dois países chegaram a um acordo.", ["に至った", "にいたった"]),
],
),
dict(
n=109,
jp="〜に至るまで",
rd="ni itaru made",
tr="Até mesmo / Até / Desde... até",
ex="""に至るまで indica que algo se estende até um limite extremo ou surpreendente. Equivale a "até mesmo" ou "até".

Muitas vezes aparece junto com から, mostrando um grande alcance, como "desde crianças até idosos". A pessoa destaca que nem o último item fica de fora.

É uma expressão formal, usada para mostrar que algo abrange tudo.""",
st="""Substantivo + から + Substantivo + に至るまで
Substantivo + に至るまで""",
no="""É parecido com まで, mas に至るまで é mais formal e enfático.

O último item costuma ser algo inesperado ou extremo.""",
bf="に至るまで",
rx="に至るまで|にいたるまで",
tk=["に", "至る", "まで"],
va=["に至るまで"],
E=[
("このゲームは子供から大人に至るまで、人気がある。", "このゲームはこどもからおとなにいたるまで、にんきがある。", "Este jogo é popular desde as crianças até os adultos."),
("彼は服装から言葉遣いに至るまで、母親に注意された。", "かれはふくそうからことばづかいにいたるまで、ははおやにちゅういされた。", "Ele foi repreendido pela mãe por tudo, das roupas até o jeito de falar."),
("この店は、家具から食器に至るまで全部手作りだ。", "このみせは、かぐからしょっきにいたるまでぜんぶてづくりだ。", "Nesta loja, tudo é feito à mão, desde os móveis até a louça."),
("北海道から沖縄に至るまで、全国で雨が降った。", "ほっかいどうからおきなわにいたるまで、ぜんこくであめがふった。", "Choveu em todo o país, de Hokkaido até Okinawa."),
("彼女は細かい点に至るまで、よく調べている。", "かのじょはこまかいてんにいたるまで、よくしらべている。", "Ela pesquisa tudo muito bem, até os mínimos detalhes."),
],
R=[
("料理から掃除____、家事は全部夫がしている。", "Da comida até a limpeza, meu marido faz todas as tarefas de casa.", ["に至るまで", "にいたるまで"]),
("社長から新入社員____、全員が会議に参加した。", "Do presidente até os novatos, todos participaram da reunião.", ["に至るまで", "にいたるまで"]),
("この本には、歴史から文化____、詳しく書かれている。", "Este livro explica em detalhes desde a história até a cultura.", ["に至るまで", "にいたるまで"]),
("机の引き出しの中____、全部調べられた。", "Revistaram tudo, até mesmo dentro das gavetas.", ["に至るまで", "にいたるまで"]),
("小学生から高齢者____、多くの人が参加した。", "Muitas pessoas participaram, desde crianças do primário até idosos.", ["に至るまで", "にいたるまで"]),
],
),
dict(
n=110,
jp="〜に至っても",
rd="ni itatte mo",
tr="Mesmo chegando a / Mesmo depois de / Mesmo a esta altura",
ex="""に至っても indica que, mesmo depois de uma situação chegar a um ponto grave, alguém continua sem agir ou sem mudar. Equivale a "mesmo chegando a" ou "mesmo a esta altura".

O tom é de crítica ou espanto. Por exemplo, "mesmo depois de chegar a este ponto, ele não admite o erro".

É uma expressão formal.""",
st="""Substantivo + に至っても
Verbo (forma dicionário) + に至っても
この期に至っても""",
no="""Expressões comuns são この期に至っても e ここに至っても.

É parecido com になっても, mas に至っても destaca que a situação é extrema.""",
bf="に至っても",
rx="に至っても|にいたっても",
tk=["に", "至って", "も"],
va=["に至っても"],
E=[
("この期に至っても、彼は自分の非を認めない。", "このごにいたっても、かれはじぶんのひをみとめない。", "Mesmo a esta altura, ele não admite o próprio erro."),
("事故が起きるに至っても、会社は対策をとらなかった。", "じこがおきるにいたっても、かいしゃはたいさくをとらなかった。", "Mesmo depois de ocorrer um acidente, a empresa não tomou medidas."),
("死者が出るに至っても、政府は動かなかった。", "ししゃがでるにいたっても、せいふはうごかなかった。", "Mesmo chegando a haver mortos, o governo não agiu."),
("ここに至っても、まだ反対する人がいる。", "ここにいたっても、まだはんたいするひとがいる。", "Mesmo chegando a este ponto, ainda há quem seja contra."),
("倒産するに至っても、社長は責任をとらなかった。", "とうさんするにいたっても、しゃちょうはせきにんをとらなかった。", "Mesmo depois da falência, o presidente não assumiu a responsabilidade."),
],
R=[
("この期____、言い訳ばかりしている。", "Mesmo a esta altura, ele só dá desculpas.", ["に至っても", "にいたっても"]),
("病気が悪化する____、彼は病院に行かなかった。", "Mesmo com a doença piorando, ele não foi ao hospital.", ["に至っても", "にいたっても"]),
("被害が広がる____、対策は遅れたままだ。", "Mesmo com os danos se espalhando, as medidas continuam atrasadas.", ["に至っても", "にいたっても"]),
("ここ____、彼はまだ夢をあきらめていない。", "Mesmo chegando a este ponto, ele ainda não desistiu do sonho.", ["に至っても", "にいたっても"]),
("試合に負ける____、監督は作戦を変えなかった。", "Mesmo depois de perder a partida, o técnico não mudou a estratégia.", ["に至っても", "にいたっても"]),
],
),
]
