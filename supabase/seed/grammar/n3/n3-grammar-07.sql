-- n3-grammar-07 — 〜ば〜ほど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-07',
    'grammar',
    'N3',
    $$〜ば〜ほど$$,
    $$ba ~ hodo$$,
    $$Quanto mais... mais...$$,
    $$ば〜ほど é usado para dizer que, quanto mais algo acontece ou aumenta, mais outra coisa muda também. Equivale a "quanto mais..., mais...".

A estrutura repete a mesma palavra duas vezes: primeiro na forma condicional ば, depois na forma de dicionário seguida de ほど. Por exemplo, "quanto mais pratica, melhor fica".

Funciona com verbos e com adjetivos. Com adjetivos い, usa-se ければ e depois o adjetivo normal: 広ければ広いほど. Com adjetivos な, usa-se なら ou であれば: 静かなら静かなほど.

A segunda parte mostra a mudança proporcional, que pode ser positiva ou negativa.$$,
    $$Às vezes, a primeira parte com ば é omitida, ficando só a forma com ほど: 練習するほど上手になる. O sentido é o mesmo.

A expressão 早ければ早いほどいい ("quanto mais cedo, melhor") é muito usada.

ほど sozinho também indica grau ou extensão, como em "a ponto de", que aparece em outras gramáticas do N3.$$,
    $$Verbo ば + Verbo (dicionário) + ほど
Adjetivo い sem い + ければ + Adjetivo い + ほど
Adjetivo な + なら + Adjetivo な + な + ほど

Forma curta: Verbo / Adjetivo + ほど (sem a parte com ば)$$,
    $$ほど$$,
    $$ほど$$,
    ARRAY['ば', 'ほど']::text[],
    ARRAY['ば〜ほど', 'ほど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-07', $$練習すればするほど、上手になります。$$, $$れんしゅうすればするほど、じょうずになります。$$, $$Quanto mais você pratica, melhor fica.$$),
    ('n3-grammar-07', $$考えれば考えるほど、わからなくなる。$$, $$かんがえればかんがえるほど、わからなくなる。$$, $$Quanto mais penso, menos entendo.$$),
    ('n3-grammar-07', $$部屋は広ければ広いほどいい。$$, $$へやはひろければひろいほどいい。$$, $$Quanto maior o quarto, melhor.$$),
    ('n3-grammar-07', $$日本語は勉強すればするほどおもしろい。$$, $$にほんごはべんきょうすればするほどおもしろい。$$, $$Quanto mais estudo japonês, mais interessante fica.$$),
    ('n3-grammar-07', $$野菜は新しければ新しいほどおいしい。$$, $$やさいはあたらしければあたらしいほどおいしい。$$, $$Quanto mais fresca a verdura, mais gostosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$甘い物は、食べれば食べる____、太ります。$$, $$Quanto mais doce você come, mais engorda.$$),
        (2, $$アパートは駅に近ければ近い____、家賃が高い。$$, $$Quanto mais perto da estação, mais caro é o aluguel.$$),
        (3, $$話せば話す____、彼のことが好きになった。$$, $$Quanto mais conversávamos, mais eu gostava dele.$$),
        (4, $$返事は早ければ早い____いいです。$$, $$Quanto mais cedo a resposta, melhor.$$),
        (5, $$練習すればする____、自信がつく。$$, $$Quanto mais você treina, mais confiança ganha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (2, $$ほど$$),
        (3, $$ほど$$),
        (4, $$ほど$$),
        (5, $$ほど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
