-- n4-grammar-83 — 〜たばかり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-83',
    'grammar',
    'N4',
    $$〜たばかり$$,
    $$ta bakari$$,
    $$Acabar de / Ter acabado de$$,
    $$たばかり é usado para dizer que algo aconteceu há pouco tempo. Equivale a "acabar de" ou "ter acabado de".

Ele é formado pelo verbo na forma た + ばかり. A ideia é que a ação está ainda "fresca" na percepção de quem fala.

O ponto importante é que esse "pouco tempo" é subjetivo. Pode ser alguns minutos, alguns dias ou até alguns meses, dependendo de como a pessoa sente. Por exemplo, alguém pode dizer que acabou de chegar ao Japão mesmo já estando lá há um mês.

ばかり funciona como substantivo, então pode ser seguido de です, なので, なのに e の + substantivo.$$,
    $$A diferença para たところ é a precisão: たところ indica que algo acabou de acontecer neste exato momento; たばかり pode cobrir um período maior, de acordo com a sensação de quem fala.

A combinação たばかりなのに mostra surpresa ou frustração, como "acabei de comprar e já quebrou".

Não confunda com ばかり de "só / nada além de", que vem depois de substantivos.$$,
    $$Verbo na forma た + ばかり + です / だ
Verbo na forma た + ばかり + なので / なのに
Verbo na forma た + ばかり + の + Substantivo$$,
    $$たばかり$$,
    $$たばかり|だばかり$$,
    ARRAY['た', 'ばかり']::text[],
    ARRAY['たばかり', 'だばかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-83', $$先月、日本に来たばかりです。$$, $$せんげつ、にほんにきたばかりです。$$, $$Acabei de chegar ao Japão no mês passado.$$),
    ('n4-grammar-83', $$さっき起きたばかりなので、まだ眠い。$$, $$さっきおきたばかりなので、まだねむい。$$, $$Acabei de acordar, então ainda estou com sono.$$),
    ('n4-grammar-83', $$買ったばかりの傘をなくしてしまった。$$, $$かったばかりのかさをなくしてしまった。$$, $$Perdi o guarda-chuva que tinha acabado de comprar.$$),
    ('n4-grammar-83', $$この本は昨日読んだばかりです。$$, $$このほんはきのうよんだばかりです。$$, $$Acabei de ler este livro ontem.$$),
    ('n4-grammar-83', $$結婚したばかりの二人は、とても幸せそうだ。$$, $$けっこんしたばかりのふたりは、とてもしあわせそうだ。$$, $$Os dois, que acabaram de se casar, parecem muito felizes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昼ご飯を食べ____なのに、もうお腹がすいた。$$, $$Acabei de almoçar e já estou com fome.$$),
        (2, $$先週、この会社に入っ____です。$$, $$Acabei de entrar nesta empresa na semana passada.$$),
        (3, $$習っ____の漢字をもう忘れた。$$, $$Já esqueci os kanji que acabei de aprender.$$),
        (4, $$この本は先月出____です。$$, $$Este livro acabou de ser lançado no mês passado.$$),
        (5, $$薬を飲ん____だから、少し休んでください。$$, $$Você acabou de tomar o remédio, então descanse um pouco.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たばかり$$),
        (2, $$たばかり$$),
        (3, $$たばかり$$),
        (4, $$たばかり$$),
        (5, $$だばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
