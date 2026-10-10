-- n2-grammar-152 — 〜てばかりはいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-152',
    'grammar',
    'N2',
    $$〜てばかりはいられない$$,
    $$te bakari wa irarenai$$,
    $$Não dá para ficar só / Não posso continuar só / Não dá para viver só$$,
    $$てばかりはいられない indica que a pessoa não pode continuar apenas em um estado ou fazendo só uma coisa, porque precisa agir. Equivale a "não dá para ficar só...".

Muitas vezes a situação atual é confortável ou emocional, mas a pessoa percebe que precisa mudar. Por exemplo, "não dá para ficar só chorando, tenho que seguir em frente".

É uma expressão de determinação ou de reflexão sobre a realidade.$$,
    $$A forma ばかりもいられない tem o mesmo sentido.

É parecido com てはいられない, mas ばかり destaca que a pessoa estava fazendo apenas aquilo.$$,
    $$Verbo (forma て) + ばかりはいられない
Verbo (forma て) + ばかりもいられない$$,
    $$てばかりはいられない$$,
    $$ばかりはいられない|ばかりもいられない|ばかりはいられません|ばかりもいられません$$,
    ARRAY['て', 'ばかり', 'は', 'いられない']::text[],
    ARRAY['てばかりはいられない', 'てばかりもいられない', 'でばかりはいられない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-152', $$いつまでも泣いてばかりはいられない。$$, $$いつまでもないてばかりはいられない。$$, $$Não dá para ficar só chorando para sempre.$$),
    ('n2-grammar-152', $$試験が近いから、遊んでばかりはいられない。$$, $$しけんがちかいから、あそんでばかりはいられない。$$, $$A prova está chegando, então não dá para ficar só brincando.$$),
    ('n2-grammar-152', $$親に頼ってばかりもいられない。$$, $$おやにたよってばかりもいられない。$$, $$Não posso continuar só dependendo dos meus pais.$$),
    ('n2-grammar-152', $$休んでばかりはいられないので、仕事を探し始めた。$$, $$やすんでばかりはいられないので、しごとをさがしはじめた。$$, $$Como não dá para ficar só descansando, comecei a procurar emprego.$$),
    ('n2-grammar-152', $$失敗を悔やんでばかりはいられません。$$, $$しっぱいをくやんでばかりはいられません。$$, $$Não dá para ficar só lamentando o fracasso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$落ち込んで____、次の準備をしよう。$$, $$Não dá para ficar só desanimado, vamos preparar o próximo passo.$$),
        (2, $$文句を言って____。自分で何とかしよう。$$, $$Não dá para ficar só reclamando. Vou dar um jeito sozinho.$$),
        (3, $$いつまでも寝て____。$$, $$Não dá para ficar só dormindo para sempre.$$),
        (4, $$喜んで____。まだ問題は残っている。$$, $$Não dá para ficar só comemorando. Ainda há problemas.$$),
        (5, $$待って____から、自分から連絡した。$$, $$Como não dava para ficar só esperando, entrei em contato por conta própria.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-152', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりはいられない$$),
        (1, $$ばかりもいられない$$),
        (2, $$ばかりはいられない$$),
        (2, $$ばかりもいられない$$),
        (3, $$ばかりはいられない$$),
        (3, $$ばかりもいられない$$),
        (4, $$ばかりはいられない$$),
        (4, $$ばかりもいられない$$),
        (5, $$ばかりはいられない$$),
        (5, $$ばかりもいられない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
