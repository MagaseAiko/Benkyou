-- n1-grammar-134 — 〜にもほどがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-134',
    'grammar',
    'N1',
    $$〜にもほどがある$$,
    $$ni mo hodo ga aru$$,
    $$Tem limite / Passou dos limites / É demais$$,
    $$にもほどがある indica que algo passou do limite aceitável. Equivale a "tem limite" ou "passou dos limites".

A pessoa critica com força uma atitude exagerada. Por exemplo, "brincadeira tem limite" ou "ser tão ingênuo assim é demais".

É uma expressão emotiva, com tom de irritação ou espanto.$$,
    $$Expressões comuns são 冗談にもほどがある, ばかにもほどがある e わがままにもほどがある.

É usado para reclamar ou repreender.$$,
    $$Substantivo + にもほどがある
Adjetivo い + にもほどがある
Adjetivo な (sem な) + にもほどがある$$,
    $$にもほどがある$$,
    $$にもほどがある|にも程がある|にもほどがあります$$,
    ARRAY['に', 'も', 'ほど', 'が', 'ある']::text[],
    ARRAY['にもほどがある', 'にも程がある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-134', $$冗談にもほどがある。$$, $$じょうだんにもほどがある。$$, $$Brincadeira tem limite.$$),
    ('n1-grammar-134', $$こんな時間に電話してくるなんて、非常識にもほどがある。$$, $$こんなじかんにでんわしてくるなんて、ひじょうしきにもほどがある。$$, $$Ligar a uma hora dessas passou dos limites da falta de noção.$$),
    ('n1-grammar-134', $$人をばかにするにもほどがある。$$, $$ひとをばかにするにもほどがある。$$, $$Fazer pouco caso dos outros tem limite.$$),
    ('n1-grammar-134', $$わがままにもほどがあるよ。$$, $$わがままにもほどがあるよ。$$, $$Esse egoísmo já é demais.$$),
    ('n1-grammar-134', $$こんなに高いなんて、ぼったくりにもほどがある。$$, $$こんなにたかいなんて、ぼったくりにもほどがある。$$, $$Ser tão caro assim é um roubo que passou dos limites.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$三時間も遅れるなんて、遅刻____。$$, $$Atrasar três horas, isso passou dos limites.$$),
        (2, $$人の物を勝手に使うなんて、失礼____。$$, $$Usar as coisas dos outros sem permissão é falta de educação demais.$$),
        (3, $$そんな話を信じるなんて、お人好し____。$$, $$Acreditar numa história dessas é ingenuidade demais.$$),
        (4, $$いたずら____。$$, $$Travessura tem limite.$$),
        (5, $$一日中寝ているなんて、怠け者____。$$, $$Dormir o dia inteiro, essa preguiça já é demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にもほどがある$$),
        (1, $$にも程がある$$),
        (2, $$にもほどがある$$),
        (2, $$にも程がある$$),
        (3, $$にもほどがある$$),
        (3, $$にも程がある$$),
        (4, $$にもほどがある$$),
        (4, $$にも程がある$$),
        (5, $$にもほどがある$$),
        (5, $$にも程がある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
