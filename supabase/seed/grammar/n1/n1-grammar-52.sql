-- n1-grammar-52 — 〜かたわら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-52',
    'grammar',
    'N1',
    $$〜かたわら$$,
    $$katawara$$,
    $$Ao mesmo tempo que / Paralelamente a / Além de$$,
    $$かたわら indica que, além de uma atividade principal, a pessoa realiza outra atividade em paralelo, durante um longo período. Equivale a "ao mesmo tempo que" ou "paralelamente a".

Muitas vezes a primeira parte é o trabalho principal, e a segunda é uma atividade secundária. Por exemplo, "trabalha numa empresa e, paralelamente, escreve romances".

É uma expressão formal, comum na escrita.$$,
    $$Diferente de ながら, かたわら não indica ações ao mesmo tempo, mas atividades que acontecem em paralelo ao longo de um período.

Também pode significar "ao lado de", como em 道のかたわら.$$,
    $$Verbo (forma dicionário) + かたわら
Substantivo + の + かたわら$$,
    $$かたわら$$,
    $$かたわら|傍ら$$,
    ARRAY['かたわら']::text[],
    ARRAY['かたわら', '傍ら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-52', $$彼は会社に勤めるかたわら、小説を書いている。$$, $$かれはかいしゃにつとめるかたわら、しょうせつをかいている。$$, $$Ele trabalha numa empresa e, paralelamente, escreve romances.$$),
    ('n1-grammar-52', $$彼女は子育てのかたわら、大学で勉強している。$$, $$かのじょはこそだてのかたわら、だいがくでべんきょうしている。$$, $$Ela cuida dos filhos e, ao mesmo tempo, estuda na universidade.$$),
    ('n1-grammar-52', $$父は農業をするかたわら、村長を務めている。$$, $$ちちはのうぎょうをするかたわら、そんちょうをつとめている。$$, $$Meu pai trabalha na agricultura e, além disso, é prefeito da vila.$$),
    ('n1-grammar-52', $$仕事のかたわら、ボランティア活動をしている。$$, $$しごとのかたわら、ボランティアかつどうをしている。$$, $$Além do trabalho, faço trabalho voluntário.$$),
    ('n1-grammar-52', $$彼は医者のかたわら、画家としても活躍している。$$, $$かれはいしゃのかたわら、がかとしてもかつやくしている。$$, $$Ele é médico e, paralelamente, faz sucesso como pintor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$教師をする____、翻訳の仕事もしている。$$, $$Sou professor e, paralelamente, também faço traduções.$$),
        (2, $$学業の____、アルバイトをしている。$$, $$Além dos estudos, trabalho meio período.$$),
        (3, $$彼は店を経営する____、料理教室も開いている。$$, $$Ele administra uma loja e, ao mesmo tempo, dá aulas de culinária.$$),
        (4, $$本業の____、趣味で写真を撮っている。$$, $$Além do trabalho principal, tiro fotos como hobby.$$),
        (5, $$研究の____、学生の指導も行っている。$$, $$Além da pesquisa, também oriento os alunos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かたわら$$),
        (1, $$傍ら$$),
        (2, $$かたわら$$),
        (2, $$傍ら$$),
        (3, $$かたわら$$),
        (3, $$傍ら$$),
        (4, $$かたわら$$),
        (4, $$傍ら$$),
        (5, $$かたわら$$),
        (5, $$傍ら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
