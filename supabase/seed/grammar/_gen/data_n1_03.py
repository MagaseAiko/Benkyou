G = [
dict(
n=21,
jp="〜でも何でもない / 〜くも何ともない",
rd="demo nandemo nai / kumo nantomo nai",
tr="Não é nada disso / Nem um pouco / De jeito nenhum",
ex="""でも何でもない e くも何ともない negam algo com muita força. Equivalem a "não é nada disso" ou "nem um pouco".

でも何でもない vem depois de substantivos e adjetivos な. Por exemplo, "ele não é meu amigo nem nada" ou "isso não é nada estranho".

くも何ともない vem depois de adjetivos い. Por exemplo, "não está nem um pouco difícil" ou "não dói nada".

O tom é enfático e muitas vezes um pouco irritado.""",
st="""Substantivo / Adjetivo な + でも何でもない
Adjetivo い (sem い) + くも何ともない""",
no="""Expressões comuns são 友達でも何でもない, 痛くも何ともない e 怖くも何ともない.

É mais forte que ではない ou くない.""",
bf="でも何でもない",
rx="でも何でもない|でもなんでもない|くも何ともない|くもなんともない|でも何でもありません|くも何ともありません",
tk=["でも", "何でも", "ない"],
va=["でも何でもない", "くも何ともない", "でも何でもありません"],
E=[
("彼は友達でも何でもない。", "かれはともだちでもなんでもない。", "Ele não é meu amigo nem nada."),
("こんな傷、痛くも何ともない。", "こんなきず、いたくもなんともない。", "Um machucado desses não dói nada."),
("そんなことは秘密でも何でもない。", "そんなことはひみつでもなんでもない。", "Isso não é segredo nenhum."),
("この程度の寒さは、つらくも何ともない。", "このていどのさむさは、つらくもなんともない。", "Um frio desses não é nem um pouco difícil."),
("彼の意見は特別でも何でもありません。", "かれのいけんはとくべつでもなんでもありません。", "A opinião dele não tem nada de especial."),
],
R=[
("あんな映画、面白____。", "Aquele filme não tem graça nenhuma.", ["くも何ともない", "くもなんともない"]),
("彼女は恋人____。ただの同僚だ。", "Ela não é minha namorada nem nada. É só uma colega.", ["でも何でもない", "でもなんでもない"]),
("一人で住むのは寂し____。", "Morar sozinho não é nem um pouco solitário.", ["くも何ともない", "くもなんともない"]),
("その話は冗談____。本当のことだ。", "Isso não é brincadeira nenhuma. É verdade.", ["でも何でもない", "でもなんでもない"]),
("こんな問題、難し____よ。", "Um problema desses não é nada difícil.", ["くも何ともない", "くもなんともない"]),
],
),
dict(
n=22,
jp="〜でなくてなんだろう",
rd="de nakute nan darou",
tr="Se isso não é... o que é / Isso só pode ser / Não há outra palavra senão",
ex="""でなくてなんだろう é uma pergunta retórica que afirma algo com muita força. Equivale a "se isso não é..., então o que é?" ou "isso só pode ser...".

A pessoa expressa uma emoção forte ou uma convicção, dizendo que não há outra palavra para descrever aquela situação. Por exemplo, "se isso não é amor, o que é?".

É uma expressão literária, usada em textos, discursos e falas emotivas.""",
st="""Substantivo + でなくてなんだろう
Substantivo + でなくてなんであろう""",
no="""A forma でなくてなんであろう é ainda mais formal.

Costuma vir com palavras abstratas, como 愛, 奇跡, 運命 ou 犯罪.""",
bf="でなくてなんだろう",
rx="でなくてなんだろう|でなくてなんであろう|でなくて何だろう|でなくて何であろう",
tk=["で", "なくて", "なん", "だろう"],
va=["でなくてなんだろう", "でなくてなんであろう", "でなくて何だろう"],
E=[
("これが愛でなくてなんだろう。", "これがあいでなくてなんだろう。", "Se isso não é amor, o que é?"),
("あの状況で助かったのは、奇跡でなくてなんだろう。", "あのじょうきょうでたすかったのは、きせきでなくてなんだろう。", "Ter sobrevivido naquela situação só pode ser um milagre."),
("二人の出会いは運命でなくてなんであろう。", "ふたりのであいはうんめいでなくてなんであろう。", "Se o encontro dos dois não é destino, o que é?"),
("子供を守るために命をかける。これが親の愛でなくて何だろう。", "こどもをまもるためにいのちをかける。これがおやのあいでなくてなんだろう。", "Arriscar a vida para proteger o filho. Se isso não é amor de pai, o que é?"),
("弱い人をだますのは、犯罪でなくてなんだろう。", "よわいひとをだますのは、はんざいでなくてなんだろう。", "Enganar os mais fracos, se isso não é crime, o que é?"),
],
R=[
("この発見が偉業____。", "Se esta descoberta não é uma grande conquista, o que é?", ["でなくてなんだろう", "でなくてなんであろう", "でなくて何だろう"]),
("十年ぶりに偶然再会するなんて、運命____。", "Se reencontrar alguém por acaso depois de dez anos não é destino, o que é?", ["でなくてなんだろう", "でなくてなんであろう", "でなくて何だろう"]),
("これが友情____。", "Se isso não é amizade, o que é?", ["でなくてなんだろう", "でなくてなんであろう", "でなくて何だろう"]),
("無事に戻れたのは、幸運____。", "Ter voltado em segurança só pode ser sorte.", ["でなくてなんだろう", "でなくてなんであろう", "でなくて何だろう"]),
("自然を壊すのは、人間のおごり____。", "Destruir a natureza, se isso não é arrogância humana, o que é?", ["でなくてなんだろう", "でなくてなんであろう", "でなくて何だろう"]),
],
),
dict(
n=23,
jp="〜ではあるまいか",
rd="dewa arumai ka",
tr="Será que não / Não seria / Talvez seja",
ex="""ではあるまいか expressa uma suposição de forma suave e formal. Equivale a "será que não é...?" ou "não seria...?".

A pessoa apresenta sua opinião com cautela, como se fizesse uma pergunta. Na prática, o sentido é "acho que é...". Por exemplo, "será que a causa não é o estresse?".

É a forma escrita e literária de のではないだろうか.""",
st="""Substantivo / Adjetivo な + ではあるまいか
Verbo / Adjetivo い (forma simples) + のではあるまいか""",
no="""É bem mais formal que んじゃないかな ou のではないだろうか.

Aparece em ensaios, artigos de opinião e textos acadêmicos.""",
bf="ではあるまいか",
rx="ではあるまいか|のではあるまいか",
tk=["では", "ある", "まい", "か"],
va=["ではあるまいか", "のではあるまいか"],
E=[
("この問題の原因はストレスではあるまいか。", "このもんだいのげんいんはストレスではあるまいか。", "Será que a causa deste problema não é o estresse?"),
("彼は何か隠しているのではあるまいか。", "かれはなにかかくしているのではあるまいか。", "Será que ele não está escondendo alguma coisa?"),
("この計画は無理なのではあるまいか。", "このけいかくはむりなのではあるまいか。", "Não seria este plano impossível?"),
("彼女の言うことは正しいのではあるまいか。", "かのじょのいうことはただしいのではあるまいか。", "Talvez o que ela diz seja correto."),
("それは誤解ではあるまいか。", "それはごかいではあるまいか。", "Será que isso não é um mal-entendido?"),
],
R=[
("この絵は偽物____。", "Será que este quadro não é falso?", ["ではあるまいか"]),
("もう手遅れなの____。", "Será que já não é tarde demais?", ["ではあるまいか"]),
("彼は来ないの____。", "Será que ele não vem?", ["ではあるまいか"]),
("その説明は不十分____。", "Não seria essa explicação insuficiente?", ["ではあるまいか"]),
("私たちは大切なことを忘れているの____。", "Será que não estamos esquecendo algo importante?", ["ではあるまいか"]),
],
),
dict(
n=24,
jp="〜ではあるまいし",
rd="dewa arumai shi",
tr="Não é como se / Afinal não sou / Já que não é",
ex="""ではあるまいし indica que, como a pessoa não está em determinada situação, aquela atitude não faz sentido. Equivale a "não é como se..." ou "afinal não sou...".

A segunda parte costuma ser uma crítica, um conselho ou uma reclamação. Por exemplo, "não é como se fosse criança, então faça sozinho".

É uma expressão coloquial, comum na fala.""",
st="""Substantivo + ではあるまいし + Crítica / Conselho
Verbo (forma simples) + わけではあるまいし""",
no="""Na fala, também aparece como じゃあるまいし.

É parecido com ではないのだから.

Expressões comuns são 子供じゃあるまいし e 神様ではあるまいし.""",
bf="ではあるまいし",
rx="ではあるまいし|じゃあるまいし",
tk=["では", "ある", "まい", "し"],
va=["ではあるまいし", "じゃあるまいし"],
E=[
("子供ではあるまいし、一人でできるでしょう。", "こどもではあるまいし、ひとりでできるでしょう。", "Não é como se fosse criança, dá para fazer sozinho, não é?"),
("神様じゃあるまいし、未来のことなんてわからない。", "かみさまじゃあるまいし、みらいのことなんてわからない。", "Não sou Deus, não tenho como saber do futuro."),
("一生会えないわけではあるまいし、そんなに泣かないで。", "いっしょうあえないわけではあるまいし、そんなになかないで。", "Não é como se nunca mais fôssemos nos ver, não chore tanto."),
("初心者じゃあるまいし、こんなミスをするなんて。", "しょしんしゃじゃあるまいし、こんなミスをするなんて。", "Não é como se fosse iniciante, e mesmo assim cometeu um erro desses."),
("学生ではあるまいし、遅刻はだめだよ。", "がくせいではあるまいし、ちこくはだめだよ。", "Você não é mais estudante, atrasos não dão."),
],
R=[
("赤ちゃん____、自分で食べなさい。", "Não é como se fosse um bebê, coma sozinho.", ["ではあるまいし", "じゃあるまいし"]),
("魔法使い____、すぐには直せないよ。", "Não sou mágico, não dá para consertar na hora.", ["ではあるまいし", "じゃあるまいし"]),
("永遠に別れるわけ____、笑って見送ろう。", "Não é como se fosse uma despedida para sempre, vamos nos despedir sorrindo.", ["ではあるまいし", "じゃあるまいし"]),
("プロ____、完璧にできなくてもいい。", "Não é como se fosse profissional, não precisa ser perfeito.", ["ではあるまいし", "じゃあるまいし"]),
("小学生____、そんなことで泣くな。", "Você não é criança do primário, não chore por uma coisa dessas.", ["ではあるまいし", "じゃあるまいし"]),
],
),
dict(
n=25,
jp="〜では済まない",
rd="dewa sumanai",
tr="Não basta / Não fica só nisso / Não se resolve com",
ex="""では済まない indica que algo não pode ser resolvido de forma simples, porque a situação é grave. Equivale a "não basta" ou "não fica só nisso".

A pessoa mostra que será preciso algo mais sério, como uma punição, uma responsabilidade ou uma ação maior. Por exemplo, "pedir desculpas não basta" ou "se descobrirem, não vai ficar só numa bronca".""",
st="""Substantivo + では済まない
Verbo (forma simples) + だけでは済まない
Verbo (forma て) + は済まない""",
no="""Expressões comuns são 謝って済む問題ではない e 冗談では済まない.

A forma positiva, で済む, significa "basta" ou "dá para resolver com".""",
bf="では済まない",
rx="では済まない|では済まされない|ではすまない|では済みません|だけでは済まない",
tk=["では", "済まない"],
va=["では済まない", "では済まされない", "では済みません"],
E=[
("これは謝罪だけでは済まない問題だ。", "これはしゃざいだけではすまないもんだいだ。", "Este é um problema que não se resolve só com um pedido de desculpas."),
("そんなことをしたら、冗談では済まないよ。", "そんなことをしたら、じょうだんではすまないよ。", "Se fizer uma coisa dessas, não vai ficar só na brincadeira."),
("会社のお金を使ったら、注意では済まされない。", "かいしゃのおかねをつかったら、ちゅういではすまされない。", "Se usar o dinheiro da empresa, não vai ficar só numa advertência."),
("けがをさせたのだから、ごめんでは済まない。", "けがをさせたのだから、ごめんではすまない。", "Você machucou alguém, então só desculpa não basta."),
("今回のミスは知らなかったでは済みません。", "こんかいのミスはしらなかったではすみません。", "Neste erro, dizer que não sabia não basta."),
],
R=[
("約束を破ったら、それ____。", "Se quebrar a promessa, não vai ficar só nisso.", ["では済まない", "では済まされない", "では済みません"]),
("この事故は、運が悪かった____。", "Neste acidente, dizer que foi azar não basta.", ["では済まない", "では済まされない", "では済みません"]),
("お金で解決____。", "Isso não se resolve com dinheiro.", ["では済まない", "では済まされない", "では済みません"]),
("嘘をついたのがばれたら、怒られるだけ____。", "Se descobrirem a mentira, não vai ficar só numa bronca.", ["では済まない", "では済まされない", "では済みません"]),
("子供のいたずら____ことだ。", "Isso não dá para tratar como uma simples travessura de criança.", ["では済まない", "では済まされない"]),
],
),
dict(
n=26,
jp="どうにも〜ない",
rd="dou nimo ~ nai",
tr="De jeito nenhum / Não tem como / Simplesmente não",
ex="""どうにも junto com uma forma negativa indica que a pessoa tentou de várias formas, mas não consegue resolver ou mudar algo. Equivale a "de jeito nenhum" ou "não tem como".

Muitas vezes vem com verbos como ならない, できない ou 仕方がない. Por exemplo, "não tem como resolver isso sozinho".

Também aparece em frases afirmativas para expressar um sentimento forte, como "simplesmente não suporto".""",
st="""どうにも + Verbo (forma potencial negativa)
どうにも + ならない / しようがない""",
no="""A expressão どうにもならない significa "não há nada que se possa fazer".

É parecido com どうしても〜ない, mas どうにも destaca a impotência diante da situação.""",
bf="どうにも〜ない",
rx="どうにも",
tk=["どうにも", "ない"],
va=["どうにも〜ない", "どうにもならない"],
E=[
("この問題は私一人ではどうにもならない。", "このもんだいはわたしひとりではどうにもならない。", "Não tem como eu resolver este problema sozinho."),
("どうにも眠くて仕方がない。", "どうにもねむくてしかたがない。", "Simplesmente não consigo parar de ter sono."),
("壊れた機械は、どうにも直せなかった。", "こわれたきかいは、どうにもなおせなかった。", "Não teve jeito de consertar a máquina quebrada."),
("今さら言っても、どうにもならないよ。", "いまさらいっても、どうにもならないよ。", "Dizer isso agora não adianta nada."),
("彼の態度はどうにも理解できない。", "かれのたいどはどうにもりかいできない。", "Simplesmente não consigo entender a atitude dele."),
],
R=[
("お金がなくて、____ならない。", "Sem dinheiro, não tem jeito.", ["どうにも"]),
("この痛みは____我慢できない。", "Não consigo aguentar esta dor de jeito nenhum.", ["どうにも"]),
("過ぎたことは、もう____ならない。", "O que passou, não tem mais como mudar.", ["どうにも"]),
("この漢字が____覚えられない。", "Simplesmente não consigo decorar este kanji.", ["どうにも"]),
("天気だけは____しようがない。", "Com o tempo não há nada que se possa fazer.", ["どうにも"]),
],
),
dict(
n=27,
jp="〜が早いか",
rd="ga hayai ka",
tr="Mal / Assim que / No instante em que",
ex="""が早いか indica que, no mesmo instante em que uma ação acontece, outra ação começa imediatamente. Equivale a "mal..." ou "no instante em que".

A pessoa destaca a rapidez com que a segunda ação acontece. Por exemplo, "mal chegou em casa, já saiu correndo de novo".

É uma expressão literária, mais comum na escrita.""",
st="""Verbo (forma dicionário) + が早いか + Verbo (forma た)""",
no="""A segunda parte é um fato que já aconteceu, por isso costuma estar no passado.

Não se usa para falar de si mesmo nem com pedidos ou intenções.

É parecido com や否や e とたんに.""",
bf="が早いか",
rx="が早いか|がはやいか",
tk=["が", "早い", "か"],
va=["が早いか"],
E=[
("子供は家に帰るが早いか、遊びに出かけた。", "こどもはいえにかえるがはやいか、あそびにでかけた。", "Mal chegou em casa, a criança saiu para brincar."),
("ベルが鳴るが早いか、学生たちは教室を飛び出した。", "ベルがなるがはやいか、がくせいたちはきょうしつをとびだした。", "No instante em que o sinal tocou, os alunos saíram correndo da sala."),
("彼は布団に入るが早いか、眠ってしまった。", "かれはふとんにはいるがはやいか、ねむってしまった。", "Mal se deitou, ele adormeceu."),
("店が開くが早いか、客が押し寄せた。", "みせがあくがはやいか、きゃくがおしよせた。", "Assim que a loja abriu, os clientes invadiram."),
("料理が出るが早いか、彼は食べ始めた。", "りょうりがでるがはやいか、かれはたべはじめた。", "Mal a comida foi servida, ele começou a comer."),
],
R=[
("彼女は電話を切る____、泣き出した。", "Mal desligou o telefone, ela começou a chorar.", ["が早いか"]),
("ドアが開く____、犬が走ってきた。", "No instante em que a porta abriu, o cachorro veio correndo.", ["が早いか"]),
("給料をもらう____、全部使ってしまった。", "Mal recebeu o salário, gastou tudo.", ["が早いか"]),
("試合が終わる____、選手たちは抱き合った。", "Assim que a partida terminou, os jogadores se abraçaram.", ["が早いか"]),
("彼は席に着く____、パソコンを開いた。", "Mal se sentou, ele abriu o computador.", ["が早いか"]),
],
),
dict(
n=28,
jp="〜が / 〜も〜なら、〜も〜だ",
rd="ga / mo ~ nara, ~ mo ~ da",
tr="Tal pai tal filho / Um é tão ruim quanto o outro / Ambos são iguais",
ex="""Esta estrutura indica que duas pessoas ou coisas relacionadas têm o mesmo defeito ou problema. Equivale a "um é tão ruim quanto o outro" ou "tal pai, tal filho".

A pessoa critica os dois lados ao mesmo tempo. Por exemplo, "o pai é irresponsável, e o filho também é".

É uma expressão coloquial, com tom de crítica.""",
st="""Substantivo A + も + Adjetivo / Substantivo + なら、Substantivo B + も + Adjetivo / Substantivo + だ
Substantivo A + が + Adjetivo + なら、Substantivo B + も + Adjetivo + だ""",
no="""Os dois elementos costumam ser pares, como pais e filhos, chefe e subordinado, ou marido e mulher.

O adjetivo ou substantivo costuma ser repetido nas duas partes.""",
bf="〜も〜なら、〜も〜だ",
rx="なら",
tk=["も", "なら", "も", "だ"],
va=["〜も〜なら、〜も〜だ", "〜が〜なら、〜も〜だ"],
E=[
("親も親なら、子も子だ。", "おやもおやなら、こもこだ。", "Tal pai, tal filho."),
("社長も無責任なら、社員も無責任だ。", "しゃちょうもむせきにんなら、しゃいんもむせきにんだ。", "O presidente é irresponsável, e os funcionários também."),
("夫が夫なら、妻も妻だ。", "おっとがおっとなら、つまもつまだ。", "O marido é daquele jeito, e a mulher também."),
("店も店なら、客も客だ。", "みせもみせなら、きゃくもきゃくだ。", "A loja é ruim, e os clientes não ficam atrás."),
("先生がいい加減なら、学生もいい加減だ。", "せんせいがいいかげんなら、がくせいもいいかげんだ。", "Se o professor é desleixado, os alunos também são."),
],
R=[
("兄も兄____、弟も弟だ。", "O irmão mais velho é daquele jeito, e o mais novo também.", ["なら"]),
("上司も上司____、部下も部下だ。", "O chefe é daquele jeito, e o subordinado também.", ["なら"]),
("政治家も政治家____、国民も国民だ。", "Os políticos são daquele jeito, e o povo também.", ["なら"]),
("母親が甘い____、父親も甘い。", "A mãe é mole, e o pai também.", ["なら"]),
("売る方も売る方____、買う方も買う方だ。", "Quem vende é daquele jeito, e quem compra também.", ["なら"]),
],
),
dict(
n=29,
jp="〜がましい",
rd="gamashii",
tr="Que soa como / Com jeito de / Parece",
ex="""がましい é um sufixo que indica que algo parece ou tem o tom de algo, geralmente de forma negativa ou excessiva. Equivale a "que soa como" ou "com jeito de".

Por exemplo, 言い訳がましい significa "que soa como desculpa", 恩着せがましい significa "que joga na cara o favor feito" e 押し付けがましい significa "insistente".

É usado para criticar uma atitude ou maneira de falar.""",
st="""Substantivo / Verbo (forma ます sem ます) + がましい
Substantivo + がましい + Substantivo""",
no="""Só funciona com algumas palavras fixas, como 言い訳がましい, 恩着せがましい, 押し付けがましい, 未練がましい e 催促がましい.

O tom é sempre de crítica.""",
bf="がましい",
rx="がましい|がましく|がましさ",
tk=["がましい"],
va=["がましい", "がましく", "がましさ"],
E=[
("言い訳がましいことは言いたくない。", "いいわけがましいことはいいたくない。", "Não quero dizer nada que soe como desculpa."),
("彼の恩着せがましい態度が嫌いだ。", "かれのおんきせがましいたいどがきらいだ。", "Não gosto da atitude dele de jogar na cara os favores que faz."),
("押し付けがましいアドバイスは困る。", "おしつけがましいアドバイスはこまる。", "Conselhos insistentes são um incômodo."),
("別れた恋人に未練がましく電話した。", "わかれたこいびとにみれんがましくでんわした。", "Liguei para a ex de um jeito que mostrava que eu não tinha superado."),
("催促がましくて申し訳ありませんが、お返事をお待ちしています。", "さいそくがましくてもうしわけありませんが、おへんじをおまちしています。", "Desculpe se parece cobrança, mas aguardo sua resposta."),
],
R=[
("遅刻の理由を言い訳____説明した。", "Explicou o motivo do atraso de um jeito que soava como desculpa.", ["がましく"]),
("彼は恩着せ____ことばかり言う。", "Ele só diz coisas jogando na cara os favores que fez.", ["がましい"]),
("押し付け____ようですが、この本を読んでください。", "Pode parecer insistência, mas leia este livro.", ["がましい"]),
("いつまでも未練____考えるのはやめよう。", "Vamos parar de pensar nisso com apego para sempre.", ["がましく"]),
("差し出____ことを言って、すみません。", "Desculpe dizer algo que soa intrometido.", ["がましい"]),
],
),
dict(
n=30,
jp="〜がてら",
rd="gatera",
tr="Aproveitando para / Ao mesmo tempo que / Enquanto",
ex="""がてら indica que, ao fazer uma ação, a pessoa aproveita para fazer outra também. Equivale a "aproveitando para" ou "ao mesmo tempo que".

A primeira parte é a ação principal ou o motivo, e a segunda é o que se aproveita para fazer. Por exemplo, "aproveitando o passeio, fui fazer compras".

Costuma vir com verbos de movimento na segunda parte, como 行く, 来る, 歩く ou 寄る.""",
st="""Substantivo (ação) + がてら + Verbo de movimento
Verbo (forma ます sem ます) + がてら + Verbo de movimento""",
no="""Expressões comuns são 散歩がてら, 買い物がてら e 遊びがてら.

É parecido com かたがた e ついでに. がてら é mais coloquial e muito usado na fala.""",
bf="がてら",
rx="がてら",
tk=["がてら"],
va=["がてら"],
E=[
("散歩がてら、パンを買いに行った。", "さんぽがてら、パンをかいにいった。", "Aproveitando o passeio, fui comprar pão."),
("駅まで送りがてら、少し話をした。", "えきまでおくりがてら、すこしはなしをした。", "Aproveitei que o levei até a estação para conversar um pouco."),
("買い物がてら、友達の家に寄った。", "かいものがてら、ともだちのいえによった。", "Aproveitando as compras, passei na casa de um amigo."),
("遊びがてら、日本の文化を学んだ。", "あそびがてら、にほんのぶんかをまなんだ。", "Enquanto me divertia, aprendi sobre a cultura japonesa."),
("運動がてら、自転車で会社に行っている。", "うんどうがてら、じてんしゃでかいしゃにいっている。", "Vou de bicicleta para o trabalho, aproveitando para me exercitar."),
],
R=[
("花見____、公園を散歩した。", "Aproveitando para ver as cerejeiras, caminhei pelo parque.", ["がてら"]),
("出張____、昔の友達に会った。", "Aproveitando a viagem a trabalho, encontrei um velho amigo.", ["がてら"]),
("ドライブ____、海を見に行った。", "Aproveitando o passeio de carro, fui ver o mar.", ["がてら"]),
("お見舞い____、近くの店で花を買った。", "Aproveitando a visita ao doente, comprei flores numa loja próxima.", ["がてら"]),
("犬の散歩____、郵便局に寄った。", "Aproveitando o passeio com o cachorro, passei nos correios.", ["がてら"]),
],
),
]
