-- n1-grammar-198 — 〜とばかりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-198',
    'grammar',
    'N1',
    $$〜とばかりに$$,
    $$to bakari ni$$,
    $$Como se dissesse / Como quem diz / Como se fosse$$,
    $$とばかりに indica que alguém não disse nada, mas a atitude ou expressão deixava claro o que pensava. Equivale a "como se dissesse" ou "como quem diz".

Por exemplo, "ele me olhou como quem diz 'saia daqui'".

Também pode indicar que alguém aproveitou uma oportunidade com entusiasmo, como "aproveitando a chance, ele começou a falar".$$,
    $$Expressões comuns são ここぞとばかりに e 待ってましたとばかりに.

Não se usa para falar de si mesmo.$$,
    $$Frase (fala imaginada) + とばかりに + Ação
Substantivo + とばかりに$$,
    $$とばかりに$$,
    $$とばかりに|とばかり$$,
    ARRAY['と', 'ばかり', 'に']::text[],
    ARRAY['とばかりに', 'とばかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-198', $$彼は早く帰れとばかりに、時計を見た。$$, $$かれははやくかえれとばかりに、とけいをみた。$$, $$Ele olhou o relógio como quem diz: vá embora logo.$$),
    ('n1-grammar-198', $$子供はもういらないとばかりに、お皿を押しのけた。$$, $$こどもはもういらないとばかりに、おさらをおしのけた。$$, $$A criança empurrou o prato como se dissesse: não quero mais.$$),
    ('n1-grammar-198', $$ここぞとばかりに、彼は自分の意見を述べた。$$, $$ここぞとばかりに、かれはじぶんのいけんをのべた。$$, $$Aproveitando a chance, ele expôs sua opinião.$$),
    ('n1-grammar-198', $$待ってましたとばかりに、観客は拍手をした。$$, $$まってましたとばかりに、かんきゃくははくしゅをした。$$, $$O público aplaudiu como quem diz: finalmente!$$),
    ('n1-grammar-198', $$彼女は知らないとばかりに、横を向いた。$$, $$かのじょはしらないとばかりに、よこをむいた。$$, $$Ela virou o rosto como quem diz: não sei de nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$店員は早く買え____、こちらを見ていた。$$, $$O vendedor me olhava como quem diz: compre logo.$$),
        (2, $$犬は遊んでほしい____、しっぽを振った。$$, $$O cachorro abanou o rabo como se dissesse: brinque comigo.$$),
        (3, $$ここぞ____、セールで買い物をした。$$, $$Aproveitando a chance, fiz compras na liquidação.$$),
        (4, $$彼はお前のせいだ____、私をにらんだ。$$, $$Ele me encarou como quem diz: a culpa é sua.$$),
        (5, $$待ってました____、子供たちはケーキに飛びついた。$$, $$As crianças avançaram no bolo como quem diz: finalmente!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-198', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とばかりに$$),
        (2, $$とばかりに$$),
        (3, $$とばかりに$$),
        (4, $$とばかりに$$),
        (5, $$とばかりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
