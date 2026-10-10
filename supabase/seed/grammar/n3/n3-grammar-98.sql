-- n3-grammar-98 — 〜っぽい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-98',
    'grammar',
    'N3',
    $$〜っぽい$$,
    $$ppoi$$,
    $$Com jeito de / Meio / Que tende a$$,
    $$っぽい é um sufixo informal com dois usos principais.

O primeiro é indicar que algo parece ou tem características de outra coisa, sem ser exatamente aquilo. Equivale a "com jeito de" ou "meio". Por exemplo, 子供っぽい (infantil, com jeito de criança), 安っぽい (com cara de barato), 熱っぽい (meio febril).

O segundo, com verbos, indica uma tendência a fazer algo com frequência. Por exemplo, 忘れっぽい (esquecido, que esquece fácil), 怒りっぽい (que se irrita fácil), 飽きっぽい (que enjoa das coisas rápido).

Ele vem depois de substantivos, de adjetivos い sem い e de verbos na forma ます sem ます. O resultado funciona como um adjetivo い.

O tom costuma ser casual e, muitas vezes, levemente negativo.$$,
    $$大人っぽい (com jeito de adulto, maduro) costuma ser um elogio, enquanto 子供っぽい (infantil) geralmente é uma crítica.

Na fala jovem, っぽい também é usado no fim da frase com o sentido de "parece que", como em 雨っぽい (parece que vai chover).

Comparado a らしい, que significa "típico de" algo ideal, っぽい indica uma semelhança mais superficial.$$,
    $$Substantivo + っぽい (子供っぽい / 大人っぽい / 熱っぽい)
Adjetivo い sem い + っぽい (安っぽい)
Verbo na forma ます sem ます + っぽい (忘れっぽい / 怒りっぽい / 飽きっぽい)

Conjugação: っぽくない / っぽかった / っぽく$$,
    $$っぽい$$,
    $$っぽい|っぽく|っぽかった$$,
    ARRAY['っぽい']::text[],
    ARRAY['っぽい', 'っぽく', 'っぽかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-98', $$彼は大人だが、子供っぽいところがある。$$, $$かれはおとなだが、こどもっぽいところがある。$$, $$Ele é adulto, mas tem um lado meio infantil.$$),
    ('n3-grammar-98', $$最近、忘れっぽくなった。$$, $$さいきん、わすれっぽくなった。$$, $$Ultimamente, fiquei esquecido.$$),
    ('n3-grammar-98', $$この服は少し安っぽい。$$, $$このふくはすこしやすっぽい。$$, $$Esta roupa tem um pouco cara de barata.$$),
    ('n3-grammar-98', $$今日は熱っぽいので、早く帰ります。$$, $$きょうはねつっぽいので、はやくかえります。$$, $$Hoje estou meio febril, então vou embora mais cedo.$$),
    ('n3-grammar-98', $$彼女は怒りっぽい性格だ。$$, $$かのじょはおこりっぽいせいかくだ。$$, $$Ela tem um temperamento que se irrita fácil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$弟は飽き____ので、何をしても続かない。$$, $$Meu irmão mais novo enjoa das coisas rápido, então não continua nada.$$),
        (2, $$まだ中学生なのに、彼の話し方は大人____。$$, $$Ele ainda está no ginásio, mas fala de um jeito bem maduro.$$),
        (3, $$風邪をひいたのか、少し熱____。$$, $$Será que peguei um resfriado? Estou meio febril.$$),
        (4, $$年をとって、忘れ____なった。$$, $$Com a idade, fiquei esquecido.$$),
        (5, $$このかばんは安____見える。$$, $$Esta bolsa parece meio barata.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っぽい$$),
        (2, $$っぽい$$),
        (3, $$っぽい$$),
        (4, $$っぽく$$),
        (5, $$っぽく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
