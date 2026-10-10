-- n3-grammar-38 — 〜代わりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-38',
    'grammar',
    'N3',
    $$〜代わりに$$,
    $$kawari ni$$,
    $$No lugar de / Em vez de / Em troca de$$,
    $$代わりに tem três usos principais.

O primeiro é substituição de pessoa ou coisa: "no lugar de...". Por exemplo, "cozinhei no lugar da minha mãe" ou "comi pão em vez de arroz". Com substantivos, usa-se の antes.

O segundo é troca: "em troca de...". A pessoa faz algo em compensação por outra coisa. Por exemplo, "em troca de me ajudar, paguei o jantar". Com verbos, eles vêm na forma simples antes de 代わりに.

O terceiro é compensação de características: algo tem um lado bom e um lado ruim. Por exemplo, "esta cidade é prática, mas em compensação o aluguel é caro".

Sozinho, no começo da frase, 代わりに significa "em vez disso" ou "em compensação".$$,
    $$O verbo 代わる significa "substituir" e aparece em expressões como 電話を代わる ("passar o telefone").

Em reuniões de trabalho, 〜の代わりに参りました significa "vim no lugar de...".

Não confunda com 変わりに (de 変わる, mudar). O kanji correto aqui é 代.$$,
    $$Substantivo + の + 代わりに (no lugar de)
Verbo (forma simples) + 代わりに (em troca de / em vez de)
Adjetivo い + 代わりに (em compensação)
Adjetivo な + な + 代わりに

Escrita: 代わりに / かわりに$$,
    $$代わりに$$,
    $$代わりに|かわりに|代わりの$$,
    ARRAY['代わり', 'に']::text[],
    ARRAY['代わりに', 'かわりに', '代わりの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-38', $$母の代わりに、私が料理を作った。$$, $$ははのかわりに、わたしがりょうりをつくった。$$, $$Cozinhei no lugar da minha mãe.$$),
    ('n3-grammar-38', $$今日は課長の代わりに会議に出ます。$$, $$きょうはかちょうのかわりにかいぎにでます。$$, $$Hoje vou à reunião no lugar do chefe de seção.$$),
    ('n3-grammar-38', $$米の代わりにパンを食べた。$$, $$こめのかわりにパンをたべた。$$, $$Comi pão em vez de arroz.$$),
    ('n3-grammar-38', $$引っ越しを手伝ってもらう代わりに、晩ご飯をごちそうした。$$, $$ひっこしをてつだってもらうかわりに、ばんごはんをごちそうした。$$, $$Em troca da ajuda com a mudança, paguei o jantar.$$),
    ('n3-grammar-38', $$この町は便利な代わりに、家賃が高い。$$, $$このまちはべんりなかわりに、やちんがたかい。$$, $$Esta cidade é prática, mas em compensação o aluguel é caro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$病気の先生の____、別の先生が授業をした。$$, $$No lugar do professor doente, outro professor deu a aula.$$),
        (2, $$このケーキは砂糖の____蜂蜜を使った。$$, $$Neste bolo, usei mel em vez de açúcar.$$),
        (3, $$英語を教える____、日本語を教えてもらった。$$, $$Em troca de ensinar inglês, aprendi japonês.$$),
        (4, $$今日はバスの____、自転車で来た。$$, $$Hoje vim de bicicleta em vez de ônibus.$$),
        (5, $$この仕事は大変な____、給料がいい。$$, $$Este trabalho é pesado, mas em compensação o salário é bom.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$代わりに$$),
        (1, $$かわりに$$),
        (2, $$代わりに$$),
        (2, $$かわりに$$),
        (3, $$代わりに$$),
        (3, $$かわりに$$),
        (4, $$代わりに$$),
        (4, $$かわりに$$),
        (5, $$代わりに$$),
        (5, $$かわりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
