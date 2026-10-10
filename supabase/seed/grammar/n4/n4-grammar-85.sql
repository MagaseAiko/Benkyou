-- n4-grammar-85 — 他動詞・自動詞
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-85',
    'grammar',
    'N4',
    $$他動詞・自動詞$$,
    $$tadoushi / jidoushi$$,
    $$Verbo transitivo / Verbo intransitivo$$,
    $$Em japonês, muitos verbos existem em pares: um transitivo (他動詞) e um intransitivo (自動詞). Os dois falam da mesma mudança, mas com foco diferente.

O verbo transitivo indica que alguém faz uma ação em alguma coisa. A coisa é marcada com を. Por exemplo, "eu abro a janela".

O verbo intransitivo indica que algo muda ou acontece sozinho, sem destacar quem causou. A coisa é marcada com が. Por exemplo, "a janela abre" ou "a janela abriu (com o vento)".

Essa diferença é muito importante no japonês, que muitas vezes prefere descrever o que aconteceu (intransitivo) em vez de dizer quem fez (transitivo).

Os pares mais comuns no N4 são 開ける / 開く, 閉める / 閉まる, つける / つく, 消す / 消える, 始める / 始まる, 止める / 止まる, 落とす / 落ちる, 壊す / 壊れる, 出す / 出る e 入れる / 入る.$$,
    $$Com a forma ている, os verbos intransitivos descrevem um estado: 窓が開いている (a janela está aberta). Com てある, os transitivos indicam que alguém deixou assim de propósito: 窓が開けてある.

Para pedir desculpas, os japoneses às vezes usam o intransitivo para soar menos acusador, como dizer que algo "quebrou" em vez de "eu quebrei". Mas, para assumir a responsabilidade, o transitivo é mais honesto.

Muitos pares seguem padrões, como える (transitivo) e わる / まる (intransitivo), o que ajuda a memorizar.$$,
    $$Transitivo: Pessoa + が + Coisa + を + Verbo transitivo
Intransitivo: Coisa + が + Verbo intransitivo

Pares comuns:
開ける / 開く (abrir)
閉める / 閉まる (fechar)
つける / つく (acender)
消す / 消える (apagar)
始める / 始まる (começar)
止める / 止まる (parar)
落とす / 落ちる (derrubar / cair)
壊す / 壊れる (quebrar)
出す / 出る (tirar / sair)
入れる / 入る (colocar / entrar)$$,
    $$他動詞・自動詞$$,
    $$を開け|が開|を閉め|が閉ま|をつけ|がつ|を消|が消え|を始め|が始ま|を止め|が止ま|を落と|が落ち|を壊|が壊れ|を出|が出|を入れ|が入$$,
    ARRAY['を', 'が']::text[],
    ARRAY['開ける', '開く', '閉める', '閉まる', 'つける', 'つく', '消す', '消える', '始める', '始まる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-85', $$暑いので、私は窓を開けました。$$, $$あついので、わたしはまどをあけました。$$, $$Como estava quente, eu abri a janela.$$),
    ('n4-grammar-85', $$風で窓が開きました。$$, $$かぜでまどがあきました。$$, $$A janela abriu com o vento.$$),
    ('n4-grammar-85', $$先生が授業を始めます。$$, $$せんせいがじゅぎょうをはじめます。$$, $$O professor começa a aula.$$),
    ('n4-grammar-85', $$毎朝九時に授業が始まります。$$, $$まいあさくじにじゅぎょうがはじまります。$$, $$A aula começa às nove toda manhã.$$),
    ('n4-grammar-85', $$部屋の電気が消えています。$$, $$へやのでんきがきえています。$$, $$A luz do quarto está apagada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寒いので、ドアを____ください。$$, $$Está frio, então feche a porta, por favor.$$),
        (2, $$風でドアが____。$$, $$A porta fechou com o vento.$$),
        (3, $$暗いから、電気を____ください。$$, $$Está escuro, então acenda a luz, por favor.$$),
        (4, $$停電で、電気が____。$$, $$Com a queda de energia, a luz apagou.$$),
        (5, $$十時に会議が____。$$, $$A reunião começa às dez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$閉めて$$),
        (2, $$閉まりました$$),
        (2, $$閉まった$$),
        (3, $$つけて$$),
        (4, $$消えました$$),
        (4, $$消えた$$),
        (5, $$始まります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
