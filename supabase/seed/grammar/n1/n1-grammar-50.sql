-- n1-grammar-50 — 〜かれ〜かれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-50',
    'grammar',
    'N1',
    $$〜かれ〜かれ$$,
    $$kare ~ kare$$,
    $$Mais ou menos / Seja... seja / Em maior ou menor grau$$,
    $$かれ〜かれ é uma forma antiga usada com pares de adjetivos opostos, indicando que, em qualquer caso, a conclusão é a mesma. Equivale a "seja... seja" ou "em maior ou menor grau".

É usada principalmente em expressões fixas, como 多かれ少なかれ, "mais ou menos", e 遅かれ早かれ, "mais cedo ou mais tarde".

Por exemplo, "mais cedo ou mais tarde, a verdade vai aparecer".$$,
    $$Só funciona com alguns pares fixos, como 多かれ少なかれ, 遅かれ早かれ e 良かれ悪しかれ.

É uma expressão formal, comum na escrita e em discursos.$$,
    $$Adjetivo い (sem い) + かれ + Adjetivo oposto (sem い) + かれ$$,
    $$かれ〜かれ$$,
    $$かれ$$,
    ARRAY['かれ']::text[],
    ARRAY['かれ〜かれ', '多かれ少なかれ', '遅かれ早かれ', '良かれ悪しかれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-50', $$多かれ少なかれ、誰にでも悩みはある。$$, $$おおかれすくなかれ、だれにでもなやみはある。$$, $$Em maior ou menor grau, todo mundo tem preocupações.$$),
    ('n1-grammar-50', $$遅かれ早かれ、真実は明らかになるだろう。$$, $$おそかれはやかれ、しんじつはあきらかになるだろう。$$, $$Mais cedo ou mais tarde, a verdade vai aparecer.$$),
    ('n1-grammar-50', $$良かれ悪しかれ、彼は会社に大きな影響を与えた。$$, $$よかれあしかれ、かれはかいしゃにおおきなえいきょうをあたえた。$$, $$Para o bem ou para o mal, ele teve grande influência na empresa.$$),
    ('n1-grammar-50', $$人は多かれ少なかれ、親の影響を受けている。$$, $$ひとはおおかれすくなかれ、おやのえいきょうをうけている。$$, $$As pessoas são, mais ou menos, influenciadas pelos pais.$$),
    ('n1-grammar-50', $$遅かれ早かれ、彼も気づくはずだ。$$, $$おそかれはやかれ、かれもきづくはずだ。$$, $$Mais cedo ou mais tarde, ele também vai perceber.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$多____少なかれ、誰でも失敗はする。$$, $$Em maior ou menor grau, todo mundo erra.$$),
        (2, $$遅かれ早____、この問題に向き合わなければならない。$$, $$Mais cedo ou mais tarde, teremos que encarar este problema.$$),
        (3, $$良____悪しかれ、それが現実だ。$$, $$Para o bem ou para o mal, essa é a realidade.$$),
        (4, $$遅____早かれ、彼は会社を辞めるだろう。$$, $$Mais cedo ou mais tarde, ele vai sair da empresa.$$),
        (5, $$人は多かれ少な____、うそをつくものだ。$$, $$As pessoas, em maior ou menor grau, mentem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かれ$$),
        (2, $$かれ$$),
        (3, $$かれ$$),
        (4, $$かれ$$),
        (5, $$かれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
