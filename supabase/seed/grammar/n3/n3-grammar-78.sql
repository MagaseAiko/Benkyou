-- n3-grammar-78 — 〜に比べて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-78',
    'grammar',
    'N3',
    $$〜に比べて$$,
    $$ni kurabete$$,
    $$Em comparação com / Comparado a$$,
    $$に比べて é usado para comparar duas coisas, colocando uma como referência. Equivale a "em comparação com" ou "comparado a".

A coisa que serve de referência vem antes de に比べて, e a segunda parte descreve a outra coisa, mostrando a diferença.

Por exemplo, "em comparação com o ano passado, este ano chove mais" ou "comparado a Tóquio, a minha cidade é tranquila".

A forma に比べると tem o mesmo sentido e é muito usada na fala. Também é possível usar と比べて, com a partícula と.

É um pouco mais formal que より, mas muito comum tanto na conversa quanto na escrita.$$,
    $$Comparando com より: 去年より今年は暑い e 去年に比べて今年は暑い têm sentido parecido. に比べて destaca mais a comparação em si.

Para comparações de mudanças no tempo, como "comparado a dez anos atrás", に比べて é muito natural.

に比べ, sem て, é comum em notícias e textos escritos.$$,
    $$Substantivo A + に比べて、 + B + は + Adjetivo
Substantivo A + に比べると、 + …
Substantivo A + と比べて、 + …
Substantivo A + に比べ、 + … (escrito)

Escrita: 比べる / くらべる$$,
    $$に比べて$$,
    $$に比べ|にくらべ|と比べ|とくらべ$$,
    ARRAY['に', '比べて']::text[],
    ARRAY['に比べて', 'に比べると', 'と比べて', 'に比べ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-78', $$去年に比べて、今年は雨が多い。$$, $$きょねんにくらべて、ことしはあめがおおい。$$, $$Em comparação com o ano passado, este ano chove mais.$$),
    ('n3-grammar-78', $$東京に比べて、私の町は静かだ。$$, $$とうきょうにくらべて、わたしのまちはしずかだ。$$, $$Comparada a Tóquio, a minha cidade é tranquila.$$),
    ('n3-grammar-78', $$兄に比べて、弟はよく勉強する。$$, $$あににくらべて、おとうとはよくべんきょうする。$$, $$Comparado ao irmão mais velho, o mais novo estuda bastante.$$),
    ('n3-grammar-78', $$昔に比べると、生活が便利になった。$$, $$むかしにくらべると、せいかつがべんりになった。$$, $$Em comparação com antigamente, a vida ficou mais prática.$$),
    ('n3-grammar-78', $$先月と比べて、売り上げが伸びた。$$, $$せんげつとくらべて、うりあげがのびた。$$, $$Comparado ao mês passado, as vendas aumentaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏____、冬は電気代が高い。$$, $$Em comparação com o verão, a conta de luz é mais cara no inverno.$$),
        (2, $$都会____、田舎は物価が安い。$$, $$Comparado à cidade grande, o custo de vida no interior é mais baixo.$$),
        (3, $$十年前____、この町は人口が減った。$$, $$Em comparação com dez anos atrás, a população desta cidade diminuiu.$$),
        (4, $$他の店____、この店は安い。$$, $$Comparada às outras lojas, esta loja é barata.$$),
        (5, $$昨日____、今日は暖かい。$$, $$Em comparação com ontem, hoje está quente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に比べて$$),
        (1, $$に比べると$$),
        (2, $$に比べて$$),
        (2, $$に比べると$$),
        (3, $$に比べて$$),
        (3, $$に比べると$$),
        (4, $$に比べて$$),
        (4, $$に比べると$$),
        (5, $$に比べて$$),
        (5, $$に比べると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
