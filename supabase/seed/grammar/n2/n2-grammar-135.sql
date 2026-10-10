-- n2-grammar-135 — せっかく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-135',
    'grammar',
    'N2',
    $$せっかく$$,
    $$sekkaku$$,
    $$Já que / Com tanto esforço / Logo que$$,
    $$せっかく indica que algo é valioso, raro ou foi conseguido com esforço. Equivale a "já que" ou "com tanto esforço".

Tem dois usos comuns. O primeiro é dizer que é uma pena não aproveitar algo, como "já que você veio até aqui, fique mais um pouco".

O segundo é lamentar que um esforço foi desperdiçado, como "com tanto esforço que fiz a comida, ninguém comeu". Nesse caso, costuma vir com のに.$$,
    $$Expressões comuns são せっかくですが, para recusar educadamente, e せっかくの休み.

É parecido com わざわざ, mas せっかく destaca o valor da oportunidade.$$,
    $$せっかく + Verbo (forma た) + のに (lamento)
せっかく + Verbo (forma た) + から / ので (aproveitar)
せっかく + の + Substantivo$$,
    $$せっかく$$,
    $$せっかく$$,
    ARRAY['せっかく']::text[],
    ARRAY['せっかく', 'せっかくの', 'せっかくですが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-135', $$せっかく作ったのに、誰も食べてくれなかった。$$, $$せっかくつくったのに、だれもたべてくれなかった。$$, $$Com tanto esforço que fiz, ninguém comeu.$$),
    ('n2-grammar-135', $$せっかく京都に来たから、お寺を見に行こう。$$, $$せっかくきょうとにきたから、おてらをみにいこう。$$, $$Já que viemos a Kyoto, vamos ver os templos.$$),
    ('n2-grammar-135', $$せっかくの休みなのに、雨が降っている。$$, $$せっかくのやすみなのに、あめがふっている。$$, $$Logo no meu dia de folga, está chovendo.$$),
    ('n2-grammar-135', $$せっかくですが、今日は用事があります。$$, $$せっかくですが、きょうはようじがあります。$$, $$Agradeço o convite, mas hoje tenho um compromisso.$$),
    ('n2-grammar-135', $$せっかく覚えた単語を忘れてしまった。$$, $$せっかくおぼえたたんごをわすれてしまった。$$, $$Esqueci as palavras que tinha decorado com tanto esforço.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____来てくれたのに、留守にしていてごめんね。$$, $$Você veio até aqui e eu não estava em casa, desculpe.$$),
        (2, $$____のチャンスを逃してしまった。$$, $$Deixei escapar uma chance preciosa.$$),
        (3, $$____ここまで来たんだから、頂上まで登ろう。$$, $$Já que chegamos até aqui, vamos subir até o topo.$$),
        (4, $$____ですが、遠慮しておきます。$$, $$Agradeço, mas vou recusar.$$),
        (5, $$____準備したのに、パーティーは中止になった。$$, $$Preparei tudo com tanto esforço, mas a festa foi cancelada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せっかく$$),
        (2, $$せっかく$$),
        (3, $$せっかく$$),
        (4, $$せっかく$$),
        (5, $$せっかく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
