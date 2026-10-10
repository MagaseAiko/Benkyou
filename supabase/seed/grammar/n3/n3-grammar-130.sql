-- n3-grammar-130 — 〜といけないから・〜てはいけないから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-130',
    'grammar',
    'N3',
    $$〜といけないから・〜てはいけないから$$,
    $$to ikenai kara / te wa ikenai kara$$,
    $$Para não / Caso / Por precaução$$,
    $$といけないから e てはいけないから são usados para explicar uma precaução: a pessoa faz algo para evitar um problema que poderia acontecer. Equivalem a "para não...", "caso..." ou "por precaução".

A primeira parte mostra o risco ("caso eu esqueça", "caso chova"), e a segunda, a ação de prevenção ("vou anotar", "vou levar o guarda-chuva").

A forma mais comum é Verbo na forma de dicionário + といけないから. A forma てはいけないから também aparece com o mesmo sentido. Com ので no lugar de から, a frase fica um pouco mais formal.

A ideia literal é "se acontecer tal coisa, não seria bom; por isso...".

É muito usada em conselhos e cuidados do dia a dia.$$,
    $$ないように (para que não) tem sentido parecido e também expressa prevenção: 忘れないようにメモする.

Em conselhos a outras pessoas, a segunda parte pode ser uma sugestão ou um pedido.

A expressão 念のため ("por via das dúvidas") combina bem com essa estrutura.$$,
    $$Verbo na forma de dicionário + といけないから、 + Ação preventiva
Verbo na forma て + はいけないから、 + Ação preventiva
… + といけないので (um pouco mais formal)$$,
    $$といけないから$$,
    $$てはいけないから|といけないから|てはいけないので|といけないので$$,
    ARRAY['と', 'いけない', 'から']::text[],
    ARRAY['といけないから', 'てはいけないから', 'といけないので']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-130', $$忘れるといけないから、メモしておこう。$$, $$わすれるといけないから、メモしておこう。$$, $$Para não esquecer, vou anotar.$$),
    ('n3-grammar-130', $$雨が降るといけないから、傘を持っていこう。$$, $$あめがふるといけないから、かさをもっていこう。$$, $$Caso chova, vou levar o guarda-chuva.$$),
    ('n3-grammar-130', $$遅れてはいけないから、早めに家を出た。$$, $$おくれてはいけないから、はやめにいえをでた。$$, $$Para não me atrasar, saí de casa mais cedo.$$),
    ('n3-grammar-130', $$風邪をひくといけないので、暖かくして寝なさい。$$, $$かぜをひくといけないので、あたたかくしてねなさい。$$, $$Para não pegar resfriado, durma bem agasalhado.$$),
    ('n3-grammar-130', $$道に迷うといけないから、地図を持っていきます。$$, $$みちにまようといけないから、ちずをもっていきます。$$, $$Caso me perca, vou levar um mapa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝坊する____、目覚ましを二つかけた。$$, $$Para não dormir demais, coloquei dois despertadores.$$),
        (2, $$財布を落とす____、かばんの中に入れた。$$, $$Para não perder a carteira, coloquei-a dentro da bolsa.$$),
        (3, $$遅刻し____、タクシーで行った。$$, $$Para não chegar atrasado, fui de táxi.$$),
        (4, $$雨が降る____、洗濯物を中に入れた。$$, $$Caso chova, recolhi a roupa do varal.$$),
        (5, $$約束を忘れ____、カレンダーに書いておく。$$, $$Para não esquecer o compromisso, vou anotar no calendário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といけないから$$),
        (2, $$といけないから$$),
        (3, $$てはいけないから$$),
        (4, $$といけないから$$),
        (5, $$るといけないから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
