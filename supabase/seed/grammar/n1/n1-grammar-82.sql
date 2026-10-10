-- n1-grammar-82 — 〜ものと思われる / 〜ものと見られる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-82',
    'grammar',
    'N1',
    $$〜ものと思われる / 〜ものと見られる$$,
    $$mono to omowareru / mono to mirareru$$,
    $$Acredita-se que / Supõe-se que / Estima-se que$$,
    $$ものと思われる e ものと見られる expressam uma suposição de forma objetiva e formal. Equivalem a "acredita-se que" ou "supõe-se que".

São muito usadas em notícias, relatórios e documentos oficiais, quando a informação ainda não é certa. Por exemplo, "acredita-se que a causa do incêndio foi um cigarro".

ものと見られる é ainda mais comum em notícias.$$,
    $$Também aparece como ものとみられる, em hiragana.

É parecido com と考えられる, mas ものと見られる é típico de jornalismo.$$,
    $$Verbo / Adjetivo (forma simples) + ものと思われる
Verbo / Adjetivo (forma simples) + ものと見られる$$,
    $$ものと思われる$$,
    $$ものと思われる|ものと見られる|ものとみられる|ものと思われます|ものと見られます|ものと見られて$$,
    ARRAY['もの', 'と', '思われる']::text[],
    ARRAY['ものと思われる', 'ものと見られる', 'ものとみられる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-82', $$火事の原因はたばこの火によるものと思われる。$$, $$かじのげんいんはたばこのひによるものとおもわれる。$$, $$Acredita-se que a causa do incêndio foi a brasa de um cigarro.$$),
    ('n1-grammar-82', $$犯人はまだ市内にいるものと見られている。$$, $$はんにんはまだしないにいるものとみられている。$$, $$Supõe-se que o culpado ainda esteja na cidade.$$),
    ('n1-grammar-82', $$今年の売り上げは、去年より増えるものと見られる。$$, $$ことしのうりあげは、きょねんよりふえるものとみられる。$$, $$Estima-se que as vendas deste ano aumentem em relação ao ano passado.$$),
    ('n1-grammar-82', $$この遺跡は千年前のものと思われます。$$, $$このいせきはせんねんまえのものとおもわれます。$$, $$Acredita-se que estas ruínas sejam de mil anos atrás.$$),
    ('n1-grammar-82', $$台風は明日の朝、上陸するものと見られる。$$, $$たいふうはあしたのあさ、じょうりくするものとみられる。$$, $$Estima-se que o tufão chegue à terra amanhã de manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故の原因は、運転手の不注意による____。$$, $$Acredita-se que a causa do acidente foi descuido do motorista.$$),
        (2, $$この絵は有名な画家が描いた____。$$, $$Acredita-se que este quadro foi pintado por um pintor famoso.$$),
        (3, $$景気は今後、回復に向かう____。$$, $$Estima-se que a economia caminhe para a recuperação daqui em diante.$$),
        (4, $$被害は広い範囲に及んでいる____。$$, $$Supõe-se que os danos atinjam uma grande área.$$),
        (5, $$投票率は前回を下回る____。$$, $$Estima-se que a taxa de votação fique abaixo da anterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものと思われる$$),
        (1, $$ものと見られる$$),
        (1, $$ものとみられる$$),
        (2, $$ものと思われる$$),
        (2, $$ものと見られる$$),
        (2, $$ものと思われます$$),
        (3, $$ものと見られる$$),
        (3, $$ものとみられる$$),
        (3, $$ものと思われる$$),
        (4, $$ものと見られる$$),
        (4, $$ものとみられる$$),
        (4, $$ものと思われる$$),
        (5, $$ものと見られる$$),
        (5, $$ものとみられる$$),
        (5, $$ものと思われる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
