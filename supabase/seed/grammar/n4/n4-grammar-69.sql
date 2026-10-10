-- n4-grammar-69 — 可能形（〜られる・〜える）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-69',
    'grammar',
    'N4',
    $$可能形（〜られる・〜える）$$,
    $$kanoukei$$,
    $$Conseguir / Poder / Ser capaz de$$,
    $$A forma potencial (可能形) é usada para dizer que alguém consegue ou pode fazer algo. Equivale a "conseguir", "poder" ou "ser capaz de".

Ela expressa tanto habilidade, como saber ler kanji ou nadar, quanto possibilidade, como poder vir a uma festa ou dar para ver algo de um lugar.

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "e" e recebe る. No grupo 2, tira-se る e acrescenta-se られる. Os irregulares ficam できる (de する) e 来られる (こられる).

Depois de formado, o verbo potencial se conjuga como um verbo do grupo 2. E o objeto costuma ser marcado com が, embora を também apareça.

O sentido é o mesmo de ことができる, mas a forma potencial é mais curta e muito mais comum na conversa.$$,
    $$Na fala, muitos japoneses usam a forma reduzida dos verbos do grupo 2, tirando o ら: 食べれる, 見れる. Ela é comum, mas considerada informal; em provas e textos, use a forma completa.

見える e 聞こえる indicam o que naturalmente se vê ou se ouve, enquanto 見られる e 聞ける indicam possibilidade ou oportunidade de ver ou ouvir.

A forma られる também é usada para a voz passiva e para o respeito, então o contexto é importante.$$,
    $$Grupo 1: último som "u" → "e" + る (書く → 書ける / 話す → 話せる / 読む → 読める)
Grupo 2: tire る + られる (食べる → 食べられる / 見る → 見られる)
Irregulares: する → できる / 来る → 来られる (こられる)

Objeto: Substantivo + が + Verbo potencial
Negativo: 〜ない (書けない / 食べられない)$$,
    $$られる$$,
    $$られる|られない|られます|られません|できる|できない|できます|できません|ける|けない|けます|けません|める|めない|めます|めません|せる|せない|せます|せません|げる|げない|げます|げません|える|えない|えます|えません|れる|れない|れます|れません|てる|てない|てます|てません|べる|べない|べます|べません$$,
    ARRAY['られる', 'える']::text[],
    ARRAY['られる', 'られない', 'える', 'ける', 'める', 'せる', 'できる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-69', $$私は漢字が少し読めます。$$, $$わたしはかんじがすこしよめます。$$, $$Consigo ler um pouco de kanji.$$),
    ('n4-grammar-69', $$刺身が食べられますか。$$, $$さしみがたべられますか。$$, $$Você consegue comer sashimi?$$),
    ('n4-grammar-69', $$弟はまだ泳げない。$$, $$おとうとはまだおよげない。$$, $$Meu irmão mais novo ainda não sabe nadar.$$),
    ('n4-grammar-69', $$明日は忙しいので、パーティーに来られません。$$, $$あしたはいそがしいので、パーティーにこられません。$$, $$Amanhã estou ocupado, então não vou poder vir à festa.$$),
    ('n4-grammar-69', $$この部屋からは富士山が見られる。$$, $$このへやからはふじさんがみられる。$$, $$Deste quarto dá para ver o Monte Fuji.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はピアノが弾____。$$, $$Ela sabe tocar piano.$$),
        (2, $$辛い料理は食べ____か。$$, $$Você consegue comer comida apimentada?$$),
        (3, $$やっと日本語で手紙が書____ようになりました。$$, $$Finalmente passei a conseguir escrever cartas em japonês.$$),
        (4, $$明日は七時に来____か。$$, $$Você consegue vir às sete amanhã?$$),
        (5, $$今日は足が痛くて、走____。$$, $$Hoje estou com dor no pé e não consigo correr.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$けます$$),
        (1, $$ける$$),
        (2, $$られます$$),
        (3, $$ける$$),
        (4, $$られます$$),
        (5, $$れません$$),
        (5, $$れない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
