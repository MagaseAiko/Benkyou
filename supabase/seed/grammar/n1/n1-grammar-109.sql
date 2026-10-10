-- n1-grammar-109 — 〜に至るまで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-109',
    'grammar',
    'N1',
    $$〜に至るまで$$,
    $$ni itaru made$$,
    $$Até mesmo / Até / Desde... até$$,
    $$に至るまで indica que algo se estende até um limite extremo ou surpreendente. Equivale a "até mesmo" ou "até".

Muitas vezes aparece junto com から, mostrando um grande alcance, como "desde crianças até idosos". A pessoa destaca que nem o último item fica de fora.

É uma expressão formal, usada para mostrar que algo abrange tudo.$$,
    $$É parecido com まで, mas に至るまで é mais formal e enfático.

O último item costuma ser algo inesperado ou extremo.$$,
    $$Substantivo + から + Substantivo + に至るまで
Substantivo + に至るまで$$,
    $$に至るまで$$,
    $$に至るまで|にいたるまで$$,
    ARRAY['に', '至る', 'まで']::text[],
    ARRAY['に至るまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-109', $$このゲームは子供から大人に至るまで、人気がある。$$, $$このゲームはこどもからおとなにいたるまで、にんきがある。$$, $$Este jogo é popular desde as crianças até os adultos.$$),
    ('n1-grammar-109', $$彼は服装から言葉遣いに至るまで、母親に注意された。$$, $$かれはふくそうからことばづかいにいたるまで、ははおやにちゅういされた。$$, $$Ele foi repreendido pela mãe por tudo, das roupas até o jeito de falar.$$),
    ('n1-grammar-109', $$この店は、家具から食器に至るまで全部手作りだ。$$, $$このみせは、かぐからしょっきにいたるまでぜんぶてづくりだ。$$, $$Nesta loja, tudo é feito à mão, desde os móveis até a louça.$$),
    ('n1-grammar-109', $$北海道から沖縄に至るまで、全国で雨が降った。$$, $$ほっかいどうからおきなわにいたるまで、ぜんこくであめがふった。$$, $$Choveu em todo o país, de Hokkaido até Okinawa.$$),
    ('n1-grammar-109', $$彼女は細かい点に至るまで、よく調べている。$$, $$かのじょはこまかいてんにいたるまで、よくしらべている。$$, $$Ela pesquisa tudo muito bem, até os mínimos detalhes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理から掃除____、家事は全部夫がしている。$$, $$Da comida até a limpeza, meu marido faz todas as tarefas de casa.$$),
        (2, $$社長から新入社員____、全員が会議に参加した。$$, $$Do presidente até os novatos, todos participaram da reunião.$$),
        (3, $$この本には、歴史から文化____、詳しく書かれている。$$, $$Este livro explica em detalhes desde a história até a cultura.$$),
        (4, $$机の引き出しの中____、全部調べられた。$$, $$Revistaram tudo, até mesmo dentro das gavetas.$$),
        (5, $$小学生から高齢者____、多くの人が参加した。$$, $$Muitas pessoas participaram, desde crianças do primário até idosos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至るまで$$),
        (1, $$にいたるまで$$),
        (2, $$に至るまで$$),
        (2, $$にいたるまで$$),
        (3, $$に至るまで$$),
        (3, $$にいたるまで$$),
        (4, $$に至るまで$$),
        (4, $$にいたるまで$$),
        (5, $$に至るまで$$),
        (5, $$にいたるまで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
