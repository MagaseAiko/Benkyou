G = [
dict(
n=31,
jp="〜から作る",
rd="kara tsukuru",
tr="Ser feito de / Fazer a partir de",
ex="""から作る é usado para dizer de qual matéria-prima algo é feito, quando essa matéria-prima se transforma e não pode mais ser vista no produto final. Equivale a "ser feito de" ou "fazer a partir de".

Por exemplo, o vinho é feito de uvas, mas, ao olhar para o vinho, não se vê mais a uva. O tofu é feito de soja, mas a soja não aparece mais. Nesses casos, usa-se から.

Quando o material continua visível e reconhecível, como a madeira de uma mesa ou o papel de um avião de dobradura, usa-se で no lugar de から.

Essa estrutura aparece muito na forma passiva, 〜から作られる, para explicar como produtos e alimentos são feitos.""",
st="""Produto + は + Matéria-prima + から + 作る / 作ります
Produto + は + Matéria-prima + から + 作られる / 作られています (passiva)

Material visível: Produto + は + Material + で + 作る""",
no="""A diferença entre から e で é um ponto clássico de provas: から para transformação química ou completa, で para material que continua reconhecível.

Para bebidas alcoólicas e grandes construções, às vezes se usa o kanji 造る no lugar de 作る.

Em textos sobre alimentos, também aparece 原料 (matéria-prima), como em 原料は大豆です.""",
bf="から作る",
rx="から作|からつく",
tk=["から", "作る"],
va=["から作る", "から作ります", "から作られる", "から作られています"],
E=[
("ワインはぶどうから作ります。", "ワインはぶどうからつくります。", "O vinho é feito de uvas."),
("豆腐は大豆から作られています。", "とうふはだいずからつくられています。", "O tofu é feito de soja."),
("このお酒は米から作られた。", "このおさけはこめからつくられた。", "Este saquê foi feito de arroz."),
("チーズは牛乳から作ります。", "チーズはぎゅうにゅうからつくります。", "O queijo é feito de leite."),
("紙は木から作られることを知っていますか。", "かみはきからつくられることをしっていますか。", "Você sabia que o papel é feito de madeira?"),
],
R=[
("バターは牛乳____作ります。", "A manteiga é feita de leite.", ["から"]),
("しょうゆは大豆____作られています。", "O shoyu é feito de soja.", ["から"]),
("ビールは麦____作ります。", "A cerveja é feita de cevada.", ["から"]),
("日本酒は何____作られていますか。", "De que é feito o saquê japonês?", ["から"]),
("このジャムは庭のいちご____作りました。", "Fiz esta geleia com os morangos do quintal.", ["から"]),
],
),
dict(
n=32,
jp="きっと",
rd="kitto",
tr="Com certeza / Certamente / Sem falta",
ex="""きっと é um advérbio que mostra uma forte convicção de quem fala. Equivale a "com certeza", "certamente" ou "tenho certeza de que".

Ele é usado quando a pessoa acredita fortemente que algo vai acontecer ou é verdade, mesmo sem uma prova absoluta. Por isso, combina muito com だろう, でしょう e と思う.

Também é usado para expressar determinação ou fazer um pedido forte, com o sentido de "sem falta": prometer que vai fazer algo ou pedir que alguém faça algo de qualquer jeito.

O tom de きっと é pessoal e emocional, ligado à convicção ou à esperança de quem fala.""",
st="""きっと + Verbo / Adjetivo + だろう / でしょう
きっと + … + と思う
きっと + Verbo (promessa / determinação)
きっと + Verbo て + ください (pedido forte)""",
no="""きっと é diferente de 必ず. 必ず indica algo que acontece sempre ou uma certeza objetiva; きっと indica uma convicção pessoal.

Por isso, em regras e fatos gerais, como "sempre lave as mãos", usa-se 必ず, e não きっと.

Em frases negativas, きっと também funciona, como em "com certeza ele não vem", desde que a convicção seja de quem fala.""",
bf="きっと",
rx="きっと",
tk=["きっと"],
va=["きっと"],
E=[
("明日はきっと晴れるでしょう。", "あしたはきっとはれるでしょう。", "Amanhã com certeza vai fazer sol."),
("彼ならきっと合格しますよ。", "かれならきっとごうかくしますよ。", "Ele com certeza vai passar."),
("きっとまた会いましょう。", "きっとまたあいましょう。", "Vamos nos ver de novo, sem falta."),
("田中さんはきっと忙しいんだと思う。", "たなかさんはきっといそがしいんだとおもう。", "Acho que o Tanaka com certeza está ocupado."),
("パーティーには、きっと来てくださいね。", "パーティーには、きっときてくださいね。", "Venha à festa sem falta, tá?"),
],
R=[
("あんなに練習したんだから、____勝てるよ。", "Você treinou tanto que com certeza vai ganhar.", ["きっと"]),
("このプレゼントを見たら、彼女は____喜ぶと思います。", "Acho que ela com certeza vai ficar feliz quando vir este presente.", ["きっと"]),
("この薬を飲めば、____よくなりますよ。", "Se tomar este remédio, com certeza vai melhorar.", ["きっと"]),
("来年は____日本へ行きます。", "Ano que vem, vou ao Japão sem falta.", ["きっと"]),
("電気が消えているから、____もう寝たのだろう。", "As luzes estão apagadas, então com certeza já foram dormir.", ["きっと"]),
],
),
dict(
n=33,
jp="〜頃・〜ごろ",
rd="koro / goro",
tr="Por volta de / Na época em que / Quando",
ex="""頃 tem dois usos principais, e a leitura muda conforme o uso.

Lido ごろ, ele vem depois de horários, datas e momentos específicos para indicar um tempo aproximado. Equivale a "por volta de" ou "lá pelas". Por exemplo, "por volta das sete".

Lido ころ, ele indica uma época ou um período, geralmente mais amplo. Equivale a "na época em que" ou "quando". É muito usado para falar da infância, da juventude ou de um tempo do passado.

No uso de época, ころ funciona como substantivo: vem depois de の com substantivos, e diretamente depois de verbos e adjetivos.

Também pode indicar que chegou o momento esperado de algo, como "já está na hora de ele chegar".""",
st="""Horário / Data + ごろ (por volta de)
Substantivo + の + 頃 (ころ) (na época de)
Verbo / Adjetivo い + 頃 (ころ)
Adjetivo な + な + 頃 (ころ)

Escrita: 頃 / ころ / ごろ""",
no="""Com horários, ごろ já indica aproximação, então não é necessário に depois. Dizer 七時ごろに também é aceito, mas 七時ごろ sozinho é mais comum.

A expressão 子供の頃 é praticamente fixa para falar da infância.

ぐらい / くらい também indica aproximação, mas de quantidade ou duração, como "cerca de uma hora". ごろ é para um ponto no tempo.""",
bf="頃",
rx="頃|ころ|ごろ",
tk=["頃"],
va=["頃", "ころ", "ごろ"],
E=[
("毎朝七時ごろ起きます。", "まいあさしちじごろおきます。", "Toda manhã acordo por volta das sete."),
("子供の頃、よく海で泳ぎました。", "こどものころ、よくうみでおよぎました。", "Quando eu era criança, nadava muito no mar."),
("三月の終わり頃、桜が咲きます。", "さんがつのおわりごろ、さくらがさきます。", "As cerejeiras florescem lá pelo fim de março."),
("学生の頃は、毎日アルバイトをしていた。", "がくせいのころは、まいにちアルバイトをしていた。", "Na época de estudante, eu trabalhava meio período todo dia."),
("もうそろそろ彼が着く頃です。", "もうそろそろかれがつくころです。", "Já está quase na hora de ele chegar."),
],
R=[
("昨日は十一時____寝ました。", "Ontem dormi por volta das onze.", ["ごろ", "頃"]),
("若い____、よく旅行をしました。", "Quando era jovem, viajava bastante.", ["頃", "ころ"]),
("来週の水曜日____、また連絡します。", "Entro em contato de novo lá pela quarta-feira da semana que vem.", ["ごろ", "頃"]),
("小学生の____、犬を飼っていました。", "Na época do primário, eu tinha um cachorro.", ["頃", "ころ"]),
("桜が咲く____に、日本へ行きたいです。", "Quero ir ao Japão na época em que as cerejeiras florescem.", ["頃", "ころ"]),
],
),
dict(
n=34,
jp="〜こと",
rd="koto",
tr="O ato de / O fato de / Coisa",
ex="""こと é usado para transformar um verbo ou uma frase em um substantivo. É como dizer "o ato de..." ou "o fato de...".

Isso é necessário porque, em japonês, partículas como は, が e を só se ligam a substantivos. Para dizer coisas como "falar japonês é fácil" ou "meu hobby é ler", o verbo precisa virar substantivo primeiro.

A frase antes de こと fica na forma simples. Com adjetivos な, usa-se な, e com substantivos, である ou だった, conforme o caso.

こと também aparece em muitas outras gramáticas, como ことができる, ことがある, ことにする e ことになる.

の também pode transformar verbos em substantivos, mas こと soa mais abstrato e é obrigatório em alguns casos, como antes de です em definições e com verbos como 話す ou 伝える.""",
st="""Verbo (forma simples) + こと + は / が / を / です
Frase + こと + を + 知っている / 忘れる / 聞く
Substantivo + は + Verbo + ことです (趣味 / 夢 / 仕事)""",
no="""Com verbos de percepção, como 見る e 聞く, usa-se の e não こと, para descrever algo que se viu ou ouviu acontecendo.

Em frases como "meu hobby é...", "meu sonho é...", o natural é こと, e não の.

Sozinho, こと também é um substantivo comum que significa "coisa" no sentido abstrato, como assunto ou fato, diferente de 物, que é coisa concreta.""",
bf="こと",
rx="こと",
tk=["こと"],
va=["こと"],
E=[
("私の趣味は写真を撮ることです。", "わたしのしゅみはしゃしんをとることです。", "Meu hobby é tirar fotos."),
("日本語を話すことは難しくないです。", "にほんごをはなすことはむずかしくないです。", "Falar japonês não é difícil."),
("毎日運動することが大切です。", "まいにちうんどうすることがたいせつです。", "É importante fazer exercício todo dia."),
("彼が結婚したことを知っていますか。", "かれがけっこんしたことをしっていますか。", "Você sabia que ele se casou?"),
("私の夢は世界を旅行することだ。", "わたしのゆめはせかいをりょこうすることだ。", "Meu sonho é viajar pelo mundo."),
],
R=[
("私の趣味は本を読む____です。", "Meu hobby é ler livros.", ["こと"]),
("早く寝る____は体にいいです。", "Dormir cedo faz bem para o corpo.", ["こと"]),
("約束を守る____が大切です。", "É importante cumprir as promessas.", ["こと"]),
("先生に言われた____を忘れました。", "Esqueci o que o professor me disse.", ["こと"]),
("彼が会社をやめた____を、誰から聞きましたか。", "De quem você ouviu que ele saiu da empresa?", ["こと"]),
],
),
dict(
n=35,
jp="〜ことがある",
rd="koto ga aru",
tr="Às vezes acontece de / Há vezes em que",
ex="""Quando vem depois do verbo na forma de dicionário ou na forma ない, ことがある significa que algo acontece de vez em quando. Equivale a "às vezes" ou "há vezes em que".

A ideia é que a situação não é frequente nem habitual, mas acontece em algumas ocasiões.

É muito comum junto com 時々, たまに ou com a partícula も, formando こともある, que suaviza ainda mais: "também acontece de...".

Não confunda com たことがある, que usa o verbo no passado e fala de experiências de vida: "já fiz isso alguma vez".""",
st="""Verbo na forma de dicionário + ことがある
Verbo na forma ない + ことがある
Adjetivo + ことがある

Educado: ことがあります
Mais suave: こともある / こともあります""",
no="""A diferença é só a forma do verbo: forma de dicionário = "às vezes acontece"; forma た = "já aconteceu (experiência)".

こともある soa natural quando se quer admitir algo, como "às vezes eu também erro".

Para hábitos regulares, o japonês prefere outras formas, como ことにしている ou simplesmente o verbo com いつも ou よく.""",
bf="ことがある",
rx="ことがある|ことがあります|こともある|こともあります",
tk=["こと", "が", "ある"],
va=["ことがある", "ことがあります", "こともある", "こともあります"],
E=[
("時々、朝ご飯を食べないことがあります。", "ときどき、あさごはんをたべないことがあります。", "Às vezes acontece de eu não tomar café da manhã."),
("この電車は遅れることがある。", "このでんしゃはおくれることがある。", "Este trem às vezes atrasa."),
("忙しいときは、夜遅くまで働くこともあります。", "いそがしいときは、よるおそくまではたらくこともあります。", "Quando estou ocupado, às vezes trabalho até tarde da noite."),
("父は休みの日に料理を作ることがあります。", "ちちはやすみのひにりょうりをつくることがあります。", "Meu pai às vezes cozinha nos dias de folga."),
("彼はたまに約束を忘れることがある。", "かれはたまにやくそくをわすれることがある。", "Ele de vez em quando esquece os compromissos."),
],
R=[
("疲れていると、電車で寝てしまう____。", "Quando estou cansado, às vezes acabo dormindo no trem.", ["ことがあります", "ことがある"]),
("この道は夜、暗くて危ない____。", "Esta rua às vezes fica escura e perigosa à noite.", ["ことがある", "ことがあります"]),
("母は時々、一人で映画を見に行く____。", "Minha mãe às vezes vai ao cinema sozinha.", ["ことがあります", "ことがある"]),
("雪が多い年は、学校が休みになる____。", "Nos anos com muita neve, às vezes as aulas são canceladas.", ["ことがあります", "ことがある"]),
("私も、たまに失敗する____。", "Eu também às vezes erro.", ["こともあります", "こともある", "ことがあります", "ことがある"]),
],
),
dict(
n=36,
jp="〜ことができる",
rd="koto ga dekiru",
tr="Poder / Conseguir / Saber (fazer)",
ex="""ことができる é usado para dizer que alguém é capaz de fazer algo ou que algo é possível. Equivale a "poder", "conseguir" ou "saber fazer".

A estrutura junta o verbo na forma de dicionário com こと, que o transforma em substantivo, e できる, que significa "ser possível". A ideia literal é "fazer isso é possível".

Ela expressa tanto habilidade (saber tocar piano) quanto possibilidade (ser permitido tirar fotos em um lugar).

O sentido é o mesmo da forma potencial (話せる, 食べられる), mas ことができる soa um pouco mais formal e é muito comum em textos, regras e explicações.""",
st="""Verbo na forma de dicionário + ことができる
Verbo na forma de dicionário + ことができます (educado)

Negativo: ことができない / ことができません
Passado: ことができた / ことができました
Passado negativo: ことができなかった / ことができませんでした""",
no="""Na conversa do dia a dia, a forma potencial é mais curta e natural. ことができる aparece mais em textos, avisos e situações formais.

ことができました expressa a alegria de ter conseguido algo depois de esforço.

Para substantivos, a estrutura é mais simples: Substantivo + ができる.""",
bf="ことができる",
rx="ことができる|ことができます|ことができない|ことができません|ことができた|ことができました|ことができなかった",
tk=["こと", "が", "できる"],
va=["ことができる", "ことができます", "ことができない", "ことができません", "ことができた", "ことができました"],
E=[
("私はピアノを弾くことができます。", "わたしはピアノをひくことができます。", "Eu sei tocar piano."),
("ここで写真を撮ることができますか。", "ここでしゃしんをとることができますか。", "É possível tirar fotos aqui?"),
("この図書館では、本を二週間借りることができる。", "このとしょかんでは、ほんをにしゅうかんかりることができる。", "Nesta biblioteca, é possível pegar livros emprestados por duas semanas."),
("足が痛くて、走ることができません。", "あしがいたくて、はしることができません。", "Estou com dor no pé e não consigo correr."),
("やっと日本語で手紙を書くことができました。", "やっとにほんごでてがみをかくことができました。", "Finalmente consegui escrever uma carta em japonês."),
],
R=[
("彼は五か国語を話す____。", "Ele sabe falar cinco idiomas.", ["ことができます", "ことができる"]),
("このホテルでは、無料でインターネットを使う____。", "Neste hotel, é possível usar a internet de graça.", ["ことができます", "ことができる"]),
("昨日は熱があって、学校に行く____。", "Ontem eu estava com febre e não consegui ir à escola.", ["ことができませんでした", "ことができなかった"]),
("このカードで、電車に乗る____か。", "É possível pegar o trem com este cartão?", ["ことができます"]),
("一生懸命練習して、試合に勝つ____。", "Treinei muito e consegui vencer a partida.", ["ことができました", "ことができた"]),
],
),
dict(
n=37,
jp="〜ことになる",
rd="koto ni naru",
tr="Ficar decidido que / Acabar sendo / Ter que",
ex="""ことになる é usado para dizer que algo foi decidido, mas não necessariamente por quem fala. A decisão veio de fora: da empresa, da escola, de outras pessoas ou das circunstâncias. Equivale a "ficou decidido que" ou "vai acontecer que".

A ideia é que a situação "virou" assim, como resultado de algo. Por isso, ela é muito usada para anunciar mudanças, como transferências de trabalho, casamentos e eventos.

Muitas vezes, ことになりました também é usado por modéstia, mesmo quando a própria pessoa tomou a decisão. Assim, ela evita parecer que está se exibindo ou impondo algo.

Também pode indicar uma consequência: se algo continuar, "vai acabar resultando em...".""",
st="""Verbo na forma de dicionário + ことになる
Verbo na forma ない + ことになる

Decisão anunciada: ことになりました / ことになった
Consequência: 〜ことになる / ことになります""",
no="""A diferença entre ことにする e ことになる é quem decide. ことにする indica uma decisão de quem fala; ことになる indica uma decisão externa ou que "acabou acontecendo".

Para regras ou costumes já estabelecidos, usa-se ことになっている, que aparece no N3.

Em anúncios pessoais, como casamento ou mudança, ことになりました é a forma mais natural e educada.""",
bf="ことになる",
rx="ことになる|ことになりました|ことになった|ことになります|ことになって",
tk=["こと", "に", "なる"],
va=["ことになる", "ことになった", "ことになりました", "ことになります"],
E=[
("来月、大阪に転勤することになりました。", "らいげつ、おおさかにてんきんすることになりました。", "Ficou decidido que vou ser transferido para Osaka no mês que vem."),
("会議は金曜日に行うことになった。", "かいぎはきんようびにおこなうことになった。", "Ficou decidido que a reunião será na sexta-feira."),
("今度、結婚することになりました。", "こんど、けっこんすることになりました。", "Vou me casar em breve."),
("このまま続けると、大変なことになるよ。", "このままつづけると、たいへんなことになるよ。", "Se continuar assim, vai dar problema sério."),
("雨のため、試合は中止することになりました。", "あめのため、しあいはちゅうしすることになりました。", "Por causa da chuva, ficou decidido cancelar a partida."),
],
R=[
("来週から、アメリカへ出張する____。", "Ficou decidido que vou viajar a trabalho para os Estados Unidos a partir da semana que vem.", ["ことになりました", "ことになった"]),
("父の仕事で、家族で引っ越す____。", "Por causa do trabalho do meu pai, nossa família vai se mudar.", ["ことになりました", "ことになった"]),
("話し合いの結果、私がリーダーをやる____。", "Depois da conversa, ficou decidido que eu serei o líder.", ["ことになりました", "ことになった"]),
("会社の決まりで、毎週月曜日に会議をする____。", "Por regra da empresa, ficou decidido que haverá reunião toda segunda-feira.", ["ことになりました", "ことになった"]),
("嘘をつき続けると、困る____よ。", "Se continuar mentindo, você vai acabar se complicando.", ["ことになる", "ことになります"]),
],
),
dict(
n=38,
jp="〜ことにする",
rd="koto ni suru",
tr="Decidir (fazer) / Resolver",
ex="""ことにする é usado para dizer que a própria pessoa decidiu fazer ou não fazer algo. Equivale a "decidir" ou "resolver".

A estrutura junta o verbo na forma de dicionário ou na forma ない com こと e にする. A ideia é "escolher essa ação" entre as opções possíveis.

No passado, ことにした / ことにしました indica uma decisão já tomada. No presente, ことにする / ことにします indica uma decisão tomada naquele momento.

A diferença em relação a ことになる é importante: ことにする mostra uma decisão pessoal, de quem fala; ことになる mostra algo decidido por fatores externos.""",
st="""Verbo na forma de dicionário + ことにする
Verbo na forma ない + ことにする

Decisão tomada: ことにした / ことにしました
Decisão agora: ことにする / ことにします
Proposta: ことにしよう""",
no="""Quando a decisão vira um hábito, usa-se ことにしている, que aparece mais adiante no N4.

ことにする também pode significar "fingir que" ou "considerar como", em frases como "vamos considerar que isso não aconteceu". Esse uso é mais avançado.

Compare com つもり: つもり é uma intenção, ことにする é uma decisão já tomada.""",
bf="ことにする",
rx="ことにする|ことにします|ことにした|ことにしました|ことにしよう",
tk=["こと", "に", "する"],
va=["ことにする", "ことにします", "ことにした", "ことにしました", "ことにしよう"],
E=[
("明日から毎日走ることにしました。", "あしたからまいにちはしることにしました。", "Decidi correr todos os dias a partir de amanhã."),
("今年は国に帰らないことにした。", "ことしはくににかえらないことにした。", "Decidi não voltar para o meu país este ano."),
("体のために、お酒をやめることにします。", "からだのために、おさけをやめることにします。", "Pela minha saúde, vou parar de beber."),
("よく考えて、この会社に入ることにしました。", "よくかんがえて、このかいしゃにはいることにしました。", "Depois de pensar bem, decidi entrar nesta empresa."),
("雨だから、今日は出かけないことにしよう。", "あめだから、きょうはでかけないことにしよう。", "Está chovendo, então vamos decidir não sair hoje."),
],
R=[
("健康のために、毎朝野菜ジュースを飲む____。", "Pela saúde, decidi tomar suco de verduras toda manhã.", ["ことにしました", "ことにした"]),
("夏休みは北海道へ行く____。", "Decidi ir a Hokkaido nas férias de verão.", ["ことにしました", "ことにした", "ことにします"]),
("もうタバコは吸わない____。", "Decidi não fumar mais.", ["ことにしました", "ことにした", "ことにします", "ことにする"]),
("今日は疲れたから、外で食べる____。", "Hoje estou cansado, então vou comer fora.", ["ことにする", "ことにします", "ことにしよう"]),
("迷ったけど、新しいパソコンを買う____。", "Fiquei em dúvida, mas decidi comprar um computador novo.", ["ことにしました", "ことにした"]),
],
),
dict(
n=39,
jp="〜くする",
rd="ku suru",
tr="Tornar / Deixar (mais...)",
ex="""くする é usado com adjetivos い para dizer que alguém muda algo de propósito, deixando aquilo com uma nova característica. Equivale a "tornar" ou "deixar".

Para formar, tira-se o い do adjetivo e acrescenta-se く, seguido de する. Por exemplo, deixar o quarto claro, deixar o som baixo, deixar o cabelo curto.

A diferença em relação a くなる é quem causa a mudança. Com くなる, a mudança acontece naturalmente ("ficou escuro"). Com くする, alguém faz a mudança acontecer ("deixei escuro").

Por isso, a coisa que muda é marcada com を, como objeto da ação.

Com adjetivos な e substantivos, a estrutura equivalente é にする, como em きれいにする (deixar limpo).""",
st="""Substantivo + を + Adjetivo い sem い + く + する
Exceção: いい → よくする

Pedido: 〜くしてください
Passado: 〜くした / 〜くしました

Equivalente com adjetivos な: Adjetivo な + に + する""",
no="""Compare: 部屋が明るくなった (o quarto ficou claro, por exemplo porque amanheceu) e 部屋を明るくした (eu deixei o quarto claro, acendendo a luz).

Em lojas, pedir desconto com 安くしてください ou 安くしてもらえませんか é bem comum em alguns contextos.

くする é muito usado em pedidos práticos, como aumentar ou diminuir o volume.""",
bf="くする",
rx="くする|くします|くした|くしました|くして",
tk=["く", "する"],
va=["くする", "くします", "くした", "くしました", "くして"],
E=[
("カーテンを開けて、部屋を明るくしました。", "カーテンをあけて、へやをあかるくしました。", "Abri a cortina e deixei o quarto claro."),
("すみません、音を小さくしてください。", "すみません、おとをちいさくしてください。", "Com licença, abaixe o som, por favor."),
("夏だから、髪を短くしたいです。", "なつだから、かみをみじかくしたいです。", "Como é verão, quero deixar o cabelo curto."),
("今日は料理を少し辛くしました。", "きょうはりょうりをすこしからくしました。", "Hoje deixei a comida um pouco mais apimentada."),
("値段をもう少し安くしてくれませんか。", "ねだんをもうすこしやすくしてくれませんか。", "Não pode deixar o preço um pouco mais barato?"),
],
R=[
("テレビの音を大き____ください。", "Aumente o volume da TV, por favor.", ["くして"]),
("子供のために、カレーを甘____。", "Deixei o curry mais suave por causa das crianças.", ["くしました", "くした"]),
("部屋が暗いから、もう少し明る____ください。", "O quarto está escuro, então deixe-o um pouco mais claro, por favor.", ["くして"]),
("冬は部屋を暖か____寝ます。", "No inverno, durmo com o quarto aquecido.", ["くして"]),
("文章を短____、読みやすくしました。", "Encurtei o texto e o deixei mais fácil de ler.", ["くして"]),
],
),
dict(
n=40,
jp="急に",
rd="kyuu ni",
tr="De repente / Repentinamente / Sem aviso",
ex="""急に é um advérbio que significa "de repente". Ele indica que algo aconteceu de forma súbita, sem aviso, ou que uma mudança foi muito rápida.

Ele vem antes do verbo ou da expressão que descreve a mudança. É muito usado com fenômenos do tempo, mudanças de estado, imprevistos e reações inesperadas.

A palavra vem do adjetivo な 急 (súbito, urgente). Com に, ela vira advérbio.

Comparado a 突然, que também significa "de repente", 急に é mais comum na conversa e destaca a rapidez da mudança. 突然 soa um pouco mais formal e destaca o elemento de surpresa.""",
st="""急に + Verbo
急に + Adjetivo + なる

Escrita: 急に / きゅうに""",
no="""急 também aparece em palavras como 急ぐ (apressar-se), 急行 (trem expresso) e 急用 (assunto urgente). A ideia comum é velocidade ou urgência.

Combinações muito frequentes são 急に雨が降る, 急に寒くなる e 急に用事ができる.

急に também combina bem com 出す, que reforça a ideia de algo que começou de repente.""",
bf="急に",
rx="急に|きゅうに",
tk=["急", "に"],
va=["急に", "きゅうに"],
E=[
("急に雨が降ってきました。", "きゅうにあめがふってきました。", "De repente, começou a chover."),
("前の車が急に止まった。", "まえのくるまがきゅうにとまった。", "O carro da frente parou de repente."),
("急に用事ができて、行けなくなりました。", "きゅうにようじができて、いけなくなりました。", "Surgiu um compromisso de repente, e não vou poder ir."),
("彼女は急に泣き出した。", "かのじょはきゅうになきだした。", "Ela começou a chorar de repente."),
("急に寒くなったので、風邪をひいてしまった。", "きゅうにさむくなったので、かぜをひいてしまった。", "Esfriou de repente, e acabei pegando um resfriado."),
],
R=[
("____電気が消えました。", "De repente, a luz apagou.", ["急に", "きゅうに"]),
("子供が____道に飛び出した。", "A criança saiu correndo para a rua de repente.", ["急に", "きゅうに"]),
("食事の後、____お腹が痛くなりました。", "Depois da refeição, de repente fiquei com dor de barriga.", ["急に", "きゅうに"]),
("彼は____会社をやめた。", "Ele saiu da empresa de repente.", ["急に", "きゅうに"]),
("午後から天気が____悪くなりました。", "A partir da tarde, o tempo piorou de repente.", ["急に", "きゅうに"]),
],
),
]
