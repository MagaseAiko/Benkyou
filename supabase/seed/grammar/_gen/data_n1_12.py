G = [
dict(
n=111,
jp="〜に至っては",
rd="ni itatte wa",
tr="Quanto a / No caso de / Então já",
ex="""に至っては apresenta um exemplo extremo dentro de um grupo, geralmente negativo. Equivale a "quanto a..." ou "no caso de..., então já".

A pessoa fala de vários casos e destaca o pior ou o mais surpreendente. Por exemplo, "todos se atrasaram, e no caso dele, nem apareceu".

É uma expressão formal, com tom de crítica ou espanto.""",
st="""Substantivo + に至っては + Exemplo extremo""",
no="""Costuma aparecer depois de uma frase que fala de um grupo em geral.

É parecido com なんて e に関しては, mas に至っては destaca o caso mais extremo.""",
bf="に至っては",
rx="に至っては|にいたっては",
tk=["に", "至って", "は"],
va=["に至っては"],
E=[
("みんな遅刻したが、田中さんに至っては来なかった。", "みんなちこくしたが、たなかさんにいたってはこなかった。", "Todos se atrasaram, e o Tanaka então nem apareceu."),
("家族はみんな料理が苦手で、父に至ってはお湯も沸かせない。", "かぞくはみんなりょうりがにがてで、ちちにいたってはおゆもわかせない。", "Ninguém na família sabe cozinhar, e meu pai então nem sabe ferver água."),
("この町は不便だ。バスに至っては一日に二本しかない。", "このまちはふべんだ。バスにいたってはいちにちににほんしかない。", "Esta cidade é inconveniente. Quanto ao ônibus, só passam dois por dia."),
("今年は雨が少なく、八月に至っては一度も降らなかった。", "ことしはあめがすくなく、はちがつにいたってはいちどもふらなかった。", "Este ano choveu pouco, e em agosto então não choveu nenhuma vez."),
("社員の多くが反対し、部長に至っては辞表を出した。", "しゃいんのおおくがはんたいし、ぶちょうにいたってはじひょうをだした。", "Muitos funcionários foram contra, e o gerente chegou a pedir demissão."),
],
R=[
("クラスの成績は悪く、彼____零点だった。", "As notas da turma foram ruins, e ele então tirou zero.", ["に至っては", "にいたっては"]),
("最近の若者は本を読まない。新聞____全く読まない。", "Os jovens de hoje não leem livros. Quanto aos jornais, não leem nada.", ["に至っては", "にいたっては"]),
("この店は高い。コーヒー____一杯二千円だ。", "Esta loja é cara. O café então custa dois mil ienes a xícara.", ["に至っては", "にいたっては"]),
("兄弟はみんな背が高く、弟____二メートルもある。", "Os irmãos são todos altos, e o caçula chega a ter dois metros.", ["に至っては", "にいたっては"]),
("参加者は少なく、二日目____三人だけだった。", "Havia poucos participantes, e no segundo dia então só três.", ["に至っては", "にいたっては"]),
],
),
dict(
n=112,
jp="〜に言わせれば",
rd="ni iwasereba",
tr="Na opinião de / Segundo / Se for perguntar a",
ex="""に言わせれば apresenta a opinião pessoal de alguém, muitas vezes diferente da opinião geral. Equivale a "na opinião de" ou "se for perguntar a".

A pessoa destaca que aquela é a visão daquela pessoa específica. Por exemplo, "na opinião do meu pai, celular é desnecessário".

Também pode ser usado com a primeira pessoa, como "na minha opinião".""",
st="""Substantivo (pessoa) + に言わせれば / に言わせると""",
no="""É parecido com によると e にとって, mas に言わせれば destaca uma opinião forte e pessoal.

Só se usa com pessoas.""",
bf="に言わせれば",
rx="に言わせれば|に言わせると|にいわせれば|にいわせると",
tk=["に", "言わせれば"],
va=["に言わせれば", "に言わせると"],
E=[
("父に言わせれば、スマホなんて必要ないそうだ。", "ちちにいわせれば、スマホなんてひつようないそうだ。", "Na opinião do meu pai, celular é desnecessário."),
("私に言わせれば、あの映画はつまらない。", "わたしにいわせれば、あのえいがはつまらない。", "Na minha opinião, aquele filme é chato."),
("専門家に言わせると、この計画には問題が多い。", "せんもんかにいわせると、このけいかくにはもんだいがおおい。", "Segundo os especialistas, este plano tem muitos problemas."),
("母に言わせれば、私はまだ子供だ。", "ははにいわせれば、わたしはまだこどもだ。", "Na opinião da minha mãe, ainda sou uma criança."),
("彼に言わせると、成功の秘訣は運だそうだ。", "かれにいわせると、せいこうのひけつはうんだそうだ。", "Segundo ele, o segredo do sucesso é a sorte."),
],
R=[
("祖母____、最近の若者は礼儀を知らない。", "Na opinião da minha avó, os jovens de hoje não têm educação.", ["に言わせれば", "に言わせると"]),
("先生____、この問題は簡単だそうだ。", "Segundo o professor, este problema é fácil.", ["に言わせれば", "に言わせると"]),
("私____、彼のやり方は間違っている。", "Na minha opinião, o jeito dele está errado.", ["に言わせれば", "に言わせると"]),
("妻____、私は家事を何もしないそうだ。", "Na opinião da minha esposa, eu não faço nada em casa.", ["に言わせれば", "に言わせると"]),
("医者____、この程度の熱は心配いらない。", "Segundo o médico, uma febre dessas não é motivo de preocupação.", ["に言わせれば", "に言わせると"]),
],
),
dict(
n=113,
jp="〜に限ったことではない",
rd="ni kagitta koto dewa nai",
tr="Não é só / Não se limita a / Não é exclusivo de",
ex="""に限ったことではない indica que algo não acontece apenas em um caso específico, mas é comum em outros também. Equivale a "não é só" ou "não se limita a".

Muitas vezes é usado para falar de problemas ou hábitos negativos. Por exemplo, "ele se atrasar não é só hoje" ou "esse problema não é exclusivo do Japão".

É uma expressão comum tanto na fala quanto na escrita.""",
st="""Substantivo + に限ったことではない
Frase + のは + Substantivo + に限ったことではない""",
no="""Costuma vir com a estrutura 〜のは〜に限ったことではない.

É parecido com だけではない.""",
bf="に限ったことではない",
rx="に限ったことではない|に限ったことではありません|に限ったことじゃない|にかぎったことではない",
tk=["に", "限った", "こと", "では", "ない"],
va=["に限ったことではない", "に限ったことではありません", "に限ったことじゃない"],
E=[
("彼が遅刻するのは、今日に限ったことではない。", "かれがちこくするのは、きょうにかぎったことではない。", "Ele se atrasar não é só hoje."),
("少子化は日本に限ったことではない。", "しょうしかはにほんにかぎったことではない。", "A baixa natalidade não é exclusiva do Japão."),
("こういうミスは、新人に限ったことではありません。", "こういうミスは、しんじんにかぎったことではありません。", "Esse tipo de erro não se limita aos novatos."),
("駅が混むのは、朝に限ったことじゃない。", "えきがこむのは、あさにかぎったことじゃない。", "A estação lotada não é só de manhã."),
("この問題は、若者に限ったことではない。", "このもんだいは、わかものにかぎったことではない。", "Este problema não se limita aos jovens."),
],
R=[
("彼女が文句を言うのは、今回____。", "Ela reclamar não é só desta vez.", ["に限ったことではない", "に限ったことではありません", "に限ったことじゃない"]),
("物価が上がっているのは、この国____。", "A alta dos preços não é exclusiva deste país.", ["に限ったことではない", "に限ったことではありません", "に限ったことじゃない"]),
("ストレスを感じるのは、大人____。", "Sentir estresse não se limita aos adultos.", ["に限ったことではない", "に限ったことではありません", "に限ったことじゃない"]),
("交通渋滞は、都市部____。", "O trânsito congestionado não é exclusivo das áreas urbanas.", ["に限ったことではない", "に限ったことではありません", "に限ったことじゃない"]),
("彼が嘘をつくのは、今日____。", "Ele mentir não é só hoje.", ["に限ったことではない", "に限ったことではありません", "に限ったことじゃない"]),
],
),
dict(
n=114,
jp="〜にかかっては / 〜にかかったら / 〜にかかると",
rd="ni kakatte wa / ni kakattara / ni kakaru to",
tr="Nas mãos de / Diante de / Quando se trata de",
ex="""にかかっては, にかかったら e にかかると indicam que, diante de uma pessoa com uma habilidade ou característica muito forte, ninguém consegue resistir. Equivalem a "nas mãos de" ou "diante de".

A segunda parte mostra que algo fica fácil ou impossível de evitar por causa daquela pessoa. Por exemplo, "nas mãos dele, qualquer máquina volta a funcionar" ou "diante da minha mãe, ninguém consegue mentir".

O tom pode ser de admiração ou de leve ironia.""",
st="""Substantivo (pessoa) + にかかっては + Frase
Substantivo (pessoa) + にかかったら + Frase
Substantivo (pessoa) + にかかると + Frase""",
no="""Muitas vezes a segunda parte mostra impotência, como かなわない ou 勝てない.

É usado principalmente com pessoas que têm uma habilidade marcante.""",
bf="にかかっては",
rx="にかかっては|にかかったら|にかかると|にかかれば",
tk=["に", "かかって", "は"],
va=["にかかっては", "にかかったら", "にかかると", "にかかれば"],
E=[
("彼にかかっては、どんな機械もすぐに直ってしまう。", "かれにかかっては、どんなきかいもすぐになおってしまう。", "Nas mãos dele, qualquer máquina volta a funcionar na hora."),
("母にかかったら、どんな嘘もすぐにばれる。", "ははにかかったら、どんなうそもすぐにばれる。", "Diante da minha mãe, qualquer mentira é descoberta na hora."),
("あの弁護士にかかると、どんな裁判も勝ってしまう。", "あのべんごしにかかると、どんなさいばんもかってしまう。", "Nas mãos daquele advogado, qualquer processo acaba ganho."),
("子供にかかっては、親もかなわない。", "こどもにかかっては、おやもかなわない。", "Diante dos filhos, nem os pais conseguem resistir."),
("彼女にかかれば、どんな料理もおいしくなる。", "かのじょにかかれば、どんなりょうりもおいしくなる。", "Nas mãos dela, qualquer prato fica gostoso."),
],
R=[
("あの先生____、どんな難しい問題も簡単に見える。", "Nas mãos daquele professor, qualquer problema difícil parece fácil.", ["にかかっては", "にかかったら", "にかかると", "にかかれば"]),
("祖父____、誰も口では勝てない。", "Diante do meu avô, ninguém ganha uma discussão.", ["にかかっては", "にかかったら", "にかかると"]),
("この犬____、どんな靴もぼろぼろになる。", "Nas mãos deste cachorro, qualquer sapato vira trapo.", ["にかかっては", "にかかったら", "にかかると"]),
("彼のトーク____、どんな人も笑ってしまう。", "Diante da conversa dele, qualquer pessoa acaba rindo.", ["にかかっては", "にかかったら", "にかかると"]),
("あの名探偵____、どんな事件も解決する。", "Nas mãos daquele grande detetive, qualquer caso é resolvido.", ["にかかっては", "にかかったら", "にかかると", "にかかれば"]),
],
),
dict(
n=115,
jp="〜にかかっている",
rd="ni kakatte iru",
tr="Depende de / Está nas mãos de / Tudo depende de",
ex="""にかかっている indica que um resultado depende totalmente de algo ou de alguém. Equivale a "depende de" ou "está nas mãos de".

A pessoa destaca o fator decisivo para o sucesso ou fracasso. Por exemplo, "o futuro da empresa depende de vocês" ou "passar ou não depende do esforço".

Muitas vezes aparece com かどうか ou か antes.""",
st="""Substantivo + にかかっている
Frase + かどうかは + Substantivo + にかかっている""",
no="""É parecido com 次第だ e によって決まる.

A forma 命がかかっている significa "a vida está em jogo".""",
bf="にかかっている",
rx="にかかっている|にかかっています|に懸かっている|にかかってる",
tk=["に", "かかって", "いる"],
va=["にかかっている", "にかかっています", "に懸かっている"],
E=[
("会社の将来は、君たちの努力にかかっている。", "かいしゃのしょうらいは、きみたちのどりょくにかかっている。", "O futuro da empresa depende do esforço de vocês."),
("試合に勝てるかどうかは、最後の五分にかかっている。", "しあいにかてるかどうかは、さいごのごふんにかかっている。", "Vencer ou não a partida depende dos últimos cinco minutos."),
("成功するかどうかは、準備にかかっています。", "せいこうするかどうかは、じゅんびにかかっています。", "Ter sucesso ou não depende da preparação."),
("この国の未来は、若者にかかっている。", "このくにのみらいは、わかものにかかっている。", "O futuro deste país está nas mãos dos jovens."),
("患者の命は、医者の判断にかかっている。", "かんじゃのいのちは、いしゃのはんだんにかかっている。", "A vida do paciente depende da decisão do médico."),
],
R=[
("合格できるかどうかは、これからの頑張り____。", "Passar ou não depende do esforço daqui em diante.", ["にかかっている", "にかかっています"]),
("チームの勝利は、彼の活躍____。", "A vitória do time depende do desempenho dele.", ["にかかっている", "にかかっています"]),
("この計画の成否は、資金集め____。", "O sucesso deste plano depende da captação de recursos.", ["にかかっている", "にかかっています"]),
("店が続けられるかは、お客様の評価____。", "Se a loja vai continuar depende da avaliação dos clientes.", ["にかかっている", "にかかっています"]),
("地球の環境は、私たち一人一人の行動____。", "O meio ambiente da Terra depende das ações de cada um de nós.", ["にかかっている", "にかかっています"]),
],
),
dict(
n=116,
jp="〜にかこつけて",
rd="ni kakotsukete",
tr="Com a desculpa de / A pretexto de / Usando como desculpa",
ex="""にかこつけて indica que alguém usa um motivo como desculpa para fazer outra coisa que realmente quer. Equivale a "com a desculpa de" ou "a pretexto de".

O motivo apresentado não é o verdadeiro. Por exemplo, "com a desculpa de uma viagem de trabalho, ele foi passear" ou "a pretexto de estar doente, faltou à reunião".

O tom é de crítica.""",
st="""Substantivo + にかこつけて + Verbo""",
no="""É parecido com を口実に, que tem o mesmo sentido.

Expressões comuns são 出張にかこつけて, 病気にかこつけて e 仕事にかこつけて.""",
bf="にかこつけて",
rx="にかこつけて|に託けて",
tk=["に", "かこつけて"],
va=["にかこつけて"],
E=[
("彼は出張にかこつけて、観光を楽しんだ。", "かれはしゅっちょうにかこつけて、かんこうをたのしんだ。", "Com a desculpa de uma viagem de trabalho, ele aproveitou para passear."),
("病気にかこつけて、会議を休んだ。", "びょうきにかこつけて、かいぎをやすんだ。", "A pretexto de estar doente, faltou à reunião."),
("仕事にかこつけて、家事を手伝わない夫が多い。", "しごとにかこつけて、かじをてつだわないおっとがおおい。", "Muitos maridos não ajudam em casa usando o trabalho como desculpa."),
("雨にかこつけて、ジョギングをさぼった。", "あめにかこつけて、ジョギングをさぼった。", "Com a desculpa da chuva, matei a corrida."),
("誕生日にかこつけて、高いバッグを買ってもらった。", "たんじょうびにかこつけて、たかいバッグをかってもらった。", "A pretexto do aniversário, ganhei uma bolsa cara."),
],
R=[
("勉強____、友達の家に遊びに行った。", "Com a desculpa de estudar, fui brincar na casa de um amigo.", ["にかこつけて"]),
("忙しさ____、親に連絡しない。", "Com a desculpa de estar ocupado, não entro em contato com meus pais.", ["にかこつけて"]),
("会議____、昼から外出した。", "A pretexto de uma reunião, saí a partir do meio-dia.", ["にかこつけて"]),
("取材____、有名人に会いに行った。", "Com a desculpa de uma entrevista, fui ver uma celebridade.", ["にかこつけて"]),
("頭痛____、宿題をしなかった。", "A pretexto de dor de cabeça, não fiz a lição de casa.", ["にかこつけて"]),
],
),
dict(
n=117,
jp="〜にかまけて",
rd="ni kamakete",
tr="Absorvido por / Ocupado demais com / Por causa de",
ex="""にかまけて indica que alguém está tão ocupado ou envolvido com algo que acaba deixando de lado outras coisas importantes. Equivale a "absorvido por" ou "ocupado demais com".

A segunda parte mostra o que foi negligenciado. Por exemplo, "absorvido pelo trabalho, deixou a família de lado".

O tom costuma ser de arrependimento ou crítica.""",
st="""Substantivo + にかまけて + Frase (algo negligenciado)""",
no="""Expressões comuns são 仕事にかまけて, 忙しさにかまけて e 遊びにかまけて.

A segunda parte costuma ter verbos como 忘れる, 怠る ou しない.""",
bf="にかまけて",
rx="にかまけて",
tk=["に", "かまけて"],
va=["にかまけて"],
E=[
("仕事にかまけて、家族との時間を大切にしなかった。", "しごとにかまけて、かぞくとのじかんをたいせつにしなかった。", "Absorvido pelo trabalho, não dei valor ao tempo com a família."),
("忙しさにかまけて、友達に連絡していない。", "いそがしさにかまけて、ともだちにれんらくしていない。", "Ocupado demais, não tenho falado com meus amigos."),
("遊びにかまけて、勉強を怠った。", "あそびにかまけて、べんきょうをおこたった。", "Absorvido pela diversão, deixei os estudos de lado."),
("子育てにかまけて、自分のことを後回しにしてきた。", "こそだてにかまけて、じぶんのことをあとまわしにしてきた。", "Ocupada demais com os filhos, fui deixando a mim mesma para depois."),
("趣味にかまけて、部屋の掃除をしていない。", "しゅみにかまけて、へやのそうじをしていない。", "Absorvido pelo hobby, não tenho limpado o quarto."),
],
R=[
("ゲーム____、宿題を忘れた。", "Absorvido pelo videogame, esqueci a lição de casa.", ["にかまけて"]),
("忙しさ____、健康診断を受けていない。", "Ocupado demais, não tenho feito exames de saúde.", ["にかまけて"]),
("恋愛____、仕事がおろそかになった。", "Absorvido pelo namoro, acabei descuidando do trabalho.", ["にかまけて"]),
("毎日の生活____、夢をあきらめかけていた。", "Ocupado demais com o dia a dia, estava quase desistindo do sonho.", ["にかまけて"]),
("仕事____、親孝行をしなかった。", "Absorvido pelo trabalho, não cuidei dos meus pais.", ["にかまけて"]),
],
),
dict(
n=118,
jp="〜に難くない",
rd="ni kataku nai",
tr="Não é difícil de / É fácil de / Compreende-se facilmente",
ex="""に難くない indica que algo é fácil de imaginar ou compreender, com base na situação. Equivale a "não é difícil de..." ou "é fácil de...".

Costuma vir com verbos como imaginar, compreender e supor. Por exemplo, "não é difícil imaginar como ela se sentiu".

É uma expressão formal e literária.""",
st="""Verbo (forma dicionário) + に難くない
Substantivo (ação) + に難くない""",
no="""Expressões comuns são 想像に難くない, 理解するに難くない e 察するに難くない.

É bem mais formal que 簡単に想像できる.""",
bf="に難くない",
rx="に難くない|にかたくない|に難くありません",
tk=["に", "難く", "ない"],
va=["に難くない", "にかたくない"],
E=[
("彼女の悲しみは想像に難くない。", "かのじょのかなしみはそうぞうにかたくない。", "Não é difícil imaginar a tristeza dela."),
("親の苦労は察するに難くない。", "おやのくろうはさっするにかたくない。", "É fácil compreender o sofrimento dos pais."),
("彼が怒った理由は理解するに難くない。", "かれがおこったりゆうはりかいするにかたくない。", "Não é difícil entender por que ele ficou bravo."),
("このままでは会社が倒産することは、予想に難くない。", "このままではかいしゃがとうさんすることは、よそうにかたくない。", "Não é difícil prever que, do jeito que está, a empresa vai falir."),
("一人で子供を育てる大変さは、想像に難くない。", "ひとりでこどもをそだてるたいへんさは、そうぞうにかたくない。", "Não é difícil imaginar o quanto é difícil criar um filho sozinho."),
],
R=[
("優勝した選手の喜びは想像____。", "Não é difícil imaginar a alegria do atleta campeão.", ["に難くない", "にかたくない"]),
("事故にあった家族の気持ちは察する____。", "É fácil compreender o sentimento da família que sofreu o acidente.", ["に難くない", "にかたくない"]),
("彼の努力が実を結ぶことは予想____。", "Não é difícil prever que o esforço dele vai dar frutos.", ["に難くない", "にかたくない"]),
("そんな生活が苦しいことは想像____。", "Não é difícil imaginar que uma vida assim seja dura.", ["に難くない", "にかたくない"]),
("彼女が反対する理由は理解する____。", "Não é difícil entender por que ela é contra.", ["に難くない", "にかたくない"]),
],
),
dict(
n=119,
jp="〜にまつわる",
rd="ni matsuwaru",
tr="Relacionado a / Ligado a / Sobre",
ex="""にまつわる indica que algo está ligado a um tema, geralmente histórias, lendas, mistérios ou lembranças. Equivale a "relacionado a" ou "ligado a".

Por exemplo, "uma lenda ligada a este templo" ou "histórias sobre fantasmas".

É uma expressão um pouco formal, comum em textos e narrativas.""",
st="""Substantivo + にまつわる + Substantivo""",
no="""Costuma vir com palavras como 話, 伝説, 噂, エピソード e 謎.

É parecido com に関する, mas にまつわる é usado para histórias e coisas que envolvem mistério ou interesse.""",
bf="にまつわる",
rx="にまつわる",
tk=["に", "まつわる"],
va=["にまつわる"],
E=[
("この寺にまつわる伝説を聞いた。", "このてらにまつわるでんせつをきいた。", "Ouvi uma lenda ligada a este templo."),
("この町には、幽霊にまつわる話が多い。", "このまちには、ゆうれいにまつわるはなしがおおい。", "Nesta cidade há muitas histórias sobre fantasmas."),
("その絵にまつわる謎はまだ解けていない。", "そのえにまつわるなぞはまだとけていない。", "O mistério ligado a esse quadro ainda não foi resolvido."),
("祖父から戦争にまつわる話を聞いた。", "そふからせんそうにまつわるはなしをきいた。", "Ouvi do meu avô histórias relacionadas à guerra."),
("お金にまつわるトラブルは多い。", "おかねにまつわるトラブルはおおい。", "Há muitos problemas relacionados a dinheiro."),
],
R=[
("この城____歴史を調べている。", "Estou pesquisando a história ligada a este castelo.", ["にまつわる"]),
("その歌手____うわさが広まった。", "Espalharam-se boatos sobre esse cantor.", ["にまつわる"]),
("桜____言い伝えが残っている。", "Ainda existe uma lenda ligada às cerejeiras.", ["にまつわる"]),
("食べ物____思い出を話してください。", "Conte uma lembrança relacionada a comida.", ["にまつわる"]),
("この宝石____不思議な話がある。", "Existe uma história misteriosa ligada a esta joia.", ["にまつわる"]),
],
),
dict(
n=120,
jp="〜に則って",
rd="ni notte",
tr="De acordo com / Conforme / Seguindo",
ex="""に則って indica que algo é feito seguindo uma regra, uma lei, uma tradição ou um padrão. Equivale a "de acordo com" ou "conforme".

É uma expressão formal, usada em contextos oficiais, jurídicos, cerimoniais ou esportivos. Por exemplo, "a cerimônia foi realizada conforme a tradição".

As formas に則り e に則った também são usadas.""",
st="""Substantivo + に則って / に則り + Verbo
Substantivo + に則った + Substantivo""",
no="""Também é escrito にのっとって.

É parecido com に従って e に基づいて, mas に則って é mais formal e usado com regras e tradições.""",
bf="に則って",
rx="に則って|に則り|に則った|にのっとって|にのっとり",
tk=["に", "則って"],
va=["に則って", "に則り", "に則った"],
E=[
("式は伝統に則って行われた。", "しきはでんとうにのっとっておこなわれた。", "A cerimônia foi realizada conforme a tradição."),
("法律に則り、処分が決定された。", "ほうりつにのっとり、しょぶんがけっていされた。", "A punição foi decidida de acordo com a lei."),
("選手たちはスポーツマンシップに則って戦った。", "せんしゅたちはスポーツマンシップにのっとってたたかった。", "Os atletas competiram seguindo o espírito esportivo."),
("規則に則った手続きをしてください。", "きそくにのっとったてつづきをしてください。", "Faça os procedimentos de acordo com as regras."),
("古い作法に則って、お茶を入れた。", "ふるいさほうにのっとって、おちゃをいれた。", "Preparei o chá seguindo a etiqueta tradicional."),
],
R=[
("会議は規定____進められた。", "A reunião foi conduzida de acordo com as normas.", ["に則って", "に則り", "にのっとって"]),
("契約____、代金を支払った。", "Paguei o valor conforme o contrato.", ["に則って", "に則り", "にのっとって"]),
("昔からのしきたり____、結婚式を挙げた。", "Fizemos o casamento seguindo os costumes antigos.", ["に則って", "に則り", "にのっとって"]),
("憲法____判断すべきだ。", "Deve-se julgar de acordo com a constituição.", ["に則って", "に則り", "にのっとって"]),
("ルール____試合を行います。", "A partida será realizada conforme as regras.", ["に則って", "に則り", "にのっとって"]),
],
),
]
