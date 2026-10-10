-- n3-grammar-75 — 〜にかけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-75',
    'grammar',
    'N3',
    $$〜にかけて$$,
    $$ni kakete$$,
    $$Até / Ao longo de / Em direção a$$,
    $$Quando aparece sozinho, sem から, にかけて indica que algo se estende ou acontece ao longo de um período até certo ponto, de forma aproximada. Equivale a "até", "ao longo de" ou "em direção a".

Ele é muito usado em previsões do tempo e em descrições de tendências: "até o fim da tarde, a chuva vai ficar mais forte" ou "até o fim do ano, o trabalho vai aumentar".

A ideia é de algo que vai acontecendo ou mudando gradualmente, e não de um limite exato. Para limites exatos, usa-se まで.

Quando aparece com から, forma から〜にかけて, que indica uma faixa completa entre dois pontos.$$,
    $$Em previsões do tempo, にかけて aparece quase todos os dias, junto com expressões como 夕方, 夜, 明日の朝 e 週末.

Não confunda com にかけては (N2), que significa "quando se trata de" e fala de habilidades.

にかけて soa um pouco mais formal e vago que まで.$$,
    $$Período / Momento + にかけて + Frase
から + … + にかけて (faixa entre dois pontos)$$,
    $$にかけて$$,
    $$にかけて$$,
    ARRAY['に', 'かけて']::text[],
    ARRAY['にかけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-75', $$夕方にかけて、雨が強くなるでしょう。$$, $$ゆうがたにかけて、あめがつよくなるでしょう。$$, $$Até o fim da tarde, a chuva deve ficar mais forte.$$),
    ('n3-grammar-75', $$週末にかけて、寒い日が続きます。$$, $$しゅうまつにかけて、さむいひがつづきます。$$, $$Os dias frios vão continuar até o fim de semana.$$),
    ('n3-grammar-75', $$年末にかけて、仕事が忙しくなる。$$, $$ねんまつにかけて、しごとがいそがしくなる。$$, $$Até o fim do ano, o trabalho vai ficar mais corrido.$$),
    ('n3-grammar-75', $$夜にかけて、風が強くなった。$$, $$よるにかけて、かぜがつよくなった。$$, $$Em direção à noite, o vento ficou mais forte.$$),
    ('n3-grammar-75', $$来週にかけて、気温が下がる見込みです。$$, $$らいしゅうにかけて、きおんがさがるみこみです。$$, $$A previsão é de que a temperatura caia até a semana que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日の朝____、雪が降るでしょう。$$, $$Deve nevar até amanhã de manhã.$$),
        (2, $$連休____、高速道路が混みます。$$, $$As rodovias vão ficar congestionadas ao longo do feriado prolongado.$$),
        (3, $$夏の終わり____、台風が多い。$$, $$Até o fim do verão, há muitos tufões.$$),
        (4, $$午後から夜____、雷に注意してください。$$, $$Da tarde até a noite, tenham cuidado com os raios.$$),
        (5, $$月末____、忙しくなりそうだ。$$, $$Parece que vou ficar ocupado até o fim do mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかけて$$),
        (2, $$にかけて$$),
        (3, $$にかけて$$),
        (4, $$にかけて$$),
        (5, $$にかけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
