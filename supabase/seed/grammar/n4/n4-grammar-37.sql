-- n4-grammar-37 — 〜ことになる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-37',
    'grammar',
    'N4',
    $$〜ことになる$$,
    $$koto ni naru$$,
    $$Ficar decidido que / Acabar sendo / Ter que$$,
    $$ことになる é usado para dizer que algo foi decidido, mas não necessariamente por quem fala. A decisão veio de fora: da empresa, da escola, de outras pessoas ou das circunstâncias. Equivale a "ficou decidido que" ou "vai acontecer que".

A ideia é que a situação "virou" assim, como resultado de algo. Por isso, ela é muito usada para anunciar mudanças, como transferências de trabalho, casamentos e eventos.

Muitas vezes, ことになりました também é usado por modéstia, mesmo quando a própria pessoa tomou a decisão. Assim, ela evita parecer que está se exibindo ou impondo algo.

Também pode indicar uma consequência: se algo continuar, "vai acabar resultando em...".$$,
    $$A diferença entre ことにする e ことになる é quem decide. ことにする indica uma decisão de quem fala; ことになる indica uma decisão externa ou que "acabou acontecendo".

Para regras ou costumes já estabelecidos, usa-se ことになっている, que aparece no N3.

Em anúncios pessoais, como casamento ou mudança, ことになりました é a forma mais natural e educada.$$,
    $$Verbo na forma de dicionário + ことになる
Verbo na forma ない + ことになる

Decisão anunciada: ことになりました / ことになった
Consequência: 〜ことになる / ことになります$$,
    $$ことになる$$,
    $$ことになる|ことになりました|ことになった|ことになります|ことになって$$,
    ARRAY['こと', 'に', 'なる']::text[],
    ARRAY['ことになる', 'ことになった', 'ことになりました', 'ことになります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-37', $$来月、大阪に転勤することになりました。$$, $$らいげつ、おおさかにてんきんすることになりました。$$, $$Ficou decidido que vou ser transferido para Osaka no mês que vem.$$),
    ('n4-grammar-37', $$会議は金曜日に行うことになった。$$, $$かいぎはきんようびにおこなうことになった。$$, $$Ficou decidido que a reunião será na sexta-feira.$$),
    ('n4-grammar-37', $$今度、結婚することになりました。$$, $$こんど、けっこんすることになりました。$$, $$Vou me casar em breve.$$),
    ('n4-grammar-37', $$このまま続けると、大変なことになるよ。$$, $$このままつづけると、たいへんなことになるよ。$$, $$Se continuar assim, vai dar problema sério.$$),
    ('n4-grammar-37', $$雨のため、試合は中止することになりました。$$, $$あめのため、しあいはちゅうしすることになりました。$$, $$Por causa da chuva, ficou decidido cancelar a partida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来週から、アメリカへ出張する____。$$, $$Ficou decidido que vou viajar a trabalho para os Estados Unidos a partir da semana que vem.$$),
        (2, $$父の仕事で、家族で引っ越す____。$$, $$Por causa do trabalho do meu pai, nossa família vai se mudar.$$),
        (3, $$話し合いの結果、私がリーダーをやる____。$$, $$Depois da conversa, ficou decidido que eu serei o líder.$$),
        (4, $$会社の決まりで、毎週月曜日に会議をする____。$$, $$Por regra da empresa, ficou decidido que haverá reunião toda segunda-feira.$$),
        (5, $$嘘をつき続けると、困る____よ。$$, $$Se continuar mentindo, você vai acabar se complicando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことになりました$$),
        (1, $$ことになった$$),
        (2, $$ことになりました$$),
        (2, $$ことになった$$),
        (3, $$ことになりました$$),
        (3, $$ことになった$$),
        (4, $$ことになりました$$),
        (4, $$ことになった$$),
        (5, $$ことになる$$),
        (5, $$ことになります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
