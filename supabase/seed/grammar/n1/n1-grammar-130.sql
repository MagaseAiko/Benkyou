-- n1-grammar-130 — 〜にとどまらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-130',
    'grammar',
    'N1',
    $$〜にとどまらず$$,
    $$ni todomarazu$$,
    $$Não só / Vai além de / Não se limita a$$,
    $$にとどまらず indica que algo não fica restrito a um limite e se estende a um alcance maior. Equivale a "não só" ou "vai além de".

Por exemplo, "o problema não se limita ao Japão, afeta o mundo inteiro" ou "a fama dele foi além do país".

É uma expressão formal, comum em notícias e textos.$$,
    $$É parecido com だけでなく e に限らず, mas にとどまらず destaca a expansão de algo.

Também é escrito に留まらず.$$,
    $$Substantivo + にとどまらず
Verbo (forma dicionário) + にとどまらず$$,
    $$にとどまらず$$,
    $$にとどまらず|に留まらず|にとどまらない$$,
    ARRAY['に', 'とどまらず']::text[],
    ARRAY['にとどまらず', 'に留まらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-130', $$この問題は日本にとどまらず、世界中に広がっている。$$, $$このもんだいはにほんにとどまらず、せかいじゅうにひろがっている。$$, $$Este problema não se limita ao Japão e está se espalhando pelo mundo todo.$$),
    ('n1-grammar-130', $$彼の人気は国内にとどまらず、海外にも及んでいる。$$, $$かれのにんきはこくないにとどまらず、かいがいにもおよんでいる。$$, $$A popularidade dele vai além do país e chega ao exterior.$$),
    ('n1-grammar-130', $$被害は一つの町にとどまらず、県全体に広がった。$$, $$ひがいはひとつのまちにとどまらず、けんぜんたいにひろがった。$$, $$Os danos não ficaram em uma só cidade e se espalharam por toda a província.$$),
    ('n1-grammar-130', $$彼女は歌手にとどまらず、女優としても活躍している。$$, $$かのじょはかしゅにとどまらず、じょゆうとしてもかつやくしている。$$, $$Ela não é só cantora, também faz sucesso como atriz.$$),
    ('n1-grammar-130', $$その影響は経済にとどまらず、文化にも及んだ。$$, $$そのえいきょうはけいざいにとどまらず、ぶんかにもおよんだ。$$, $$A influência não se limitou à economia e chegou também à cultura.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$インフルエンザは学校内____、地域全体に広がった。$$, $$A gripe não ficou só na escola e se espalhou por toda a região.$$),
        (2, $$彼の研究は医学____、さまざまな分野で役立っている。$$, $$A pesquisa dele não se limita à medicina e é útil em vários campos.$$),
        (3, $$このブームは若者____、高齢者にも広がっている。$$, $$Esta moda não se limita aos jovens e está chegando aos idosos.$$),
        (4, $$彼女の活動は国内____、世界中で注目されている。$$, $$As atividades dela vão além do país e chamam a atenção do mundo todo.$$),
        (5, $$その事件は一企業の問題____、社会問題になった。$$, $$Esse caso não ficou como problema de uma só empresa e virou um problema social.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にとどまらず$$),
        (1, $$に留まらず$$),
        (2, $$にとどまらず$$),
        (2, $$に留まらず$$),
        (3, $$にとどまらず$$),
        (3, $$に留まらず$$),
        (4, $$にとどまらず$$),
        (4, $$に留まらず$$),
        (5, $$にとどまらず$$),
        (5, $$に留まらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
