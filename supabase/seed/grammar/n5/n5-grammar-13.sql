-- n5-grammar-13 — 〜がほしい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-13',
    'grammar',
    'N5',
    $$〜がほしい$$,
    $$ga hoshii$$,
    $$Querer (algo) / Desejar$$,
    $$がほしい é usado para dizer que você quer alguma coisa, como um objeto, um animal, tempo ou uma pessoa na sua vida.

O ponto principal é que ほしい é um adjetivo い, e não um verbo. Por isso, a coisa desejada é marcada com が, e a conjugação segue as regras dos adjetivos い: ほしくない para o negativo e ほしかった para o passado.

ほしい serve para coisas (substantivos). Para dizer que você quer fazer uma ação, a gramática é outra: a forma たい do verbo.

ほしい expressa um desejo interno de quem fala. Por isso, em afirmações, ele é usado normalmente para "eu quero" e, em perguntas, para "você quer?". Para falar do desejo de outra pessoa, o japonês prefere outras formas, como citar o que ela disse ou usar ほしがっている.$$,
    $$Na frase negativa, é comum trocar が por は, porque は dá um tom de contraste: "isso, eu não quero".

Perguntar diretamente a um superior se ele quer algo com ほしいですか pode soar invasivo. Em situações educadas, prefere-se oferecer, com expressões como いかがですか.

Hoje em dia, ほしい é escrito mais em hiragana, mas o kanji 欲しい também é muito usado.

Para falar do desejo de outra pessoa, usa-se 欲しがっている, e nesse caso o objeto passa a ser marcado com を.$$,
    $$Substantivo + が + ほしい
Substantivo + が + ほしいです (educado)

Negativo: ほしくない / ほしくないです / ほしくありません
Passado: ほしかった / ほしかったです

Escrita: ほしい / 欲しい$$,
    $$ほしい$$,
    $$がほしい|が欲しい|がほしく|が欲しく|がほしかった|が欲しかった$$,
    ARRAY['が', 'ほしい']::text[],
    ARRAY['がほしい', 'が欲しい', 'がほしいです', 'が欲しいです', 'がほしくない', 'が欲しくない', 'がほしかった', 'が欲しかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-13', $$新しい車がほしいです。$$, $$あたらしいくるまがほしいです。$$, $$Quero um carro novo.$$),
    ('n5-grammar-13', $$誕生日に何が欲しい？$$, $$たんじょうびになにがほしい？$$, $$O que você quer de aniversário?$$),
    ('n5-grammar-13', $$今は少し時間がほしいです。$$, $$いまはすこしじかんがほしいです。$$, $$Agora eu queria um pouco de tempo.$$),
    ('n5-grammar-13', $$子供のころ、犬がほしかったです。$$, $$こどものころ、いぬがほしかったです。$$, $$Quando era criança, eu queria um cachorro.$$),
    ('n5-grammar-13', $$もっと友達がほしいなあ。$$, $$もっとともだちがほしいなあ。$$, $$Queria ter mais amigos...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冷たい水が____。$$, $$Quero água gelada.$$),
        (2, $$私は新しいくつ____です。$$, $$Eu quero sapatos novos.$$),
        (3, $$誕生日に何____ですか。$$, $$O que você quer de aniversário?$$),
        (4, $$子供のころ、自転車が____。$$, $$Quando era criança, eu queria uma bicicleta.$$),
        (5, $$弟は新しいゲームが____と言っています。$$, $$Meu irmão mais novo diz que quer um jogo novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほしい$$),
        (1, $$欲しい$$),
        (1, $$ほしいです$$),
        (1, $$欲しいです$$),
        (2, $$がほしい$$),
        (2, $$が欲しい$$),
        (3, $$がほしい$$),
        (3, $$が欲しい$$),
        (4, $$ほしかった$$),
        (4, $$欲しかった$$),
        (4, $$ほしかったです$$),
        (4, $$欲しかったです$$),
        (5, $$ほしい$$),
        (5, $$欲しい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
