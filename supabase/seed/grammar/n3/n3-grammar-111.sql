-- n3-grammar-111 — 〜そうもない・〜そうにない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-111',
    'grammar',
    'N3',
    $$〜そうもない・〜そうにない$$,
    $$sou mo nai / sou ni nai$$,
    $$Não parece que vai / Pelo jeito não vai / Sem chance de$$,
    $$そうもない e そうにない são usados para dizer que, pelo que se vê ou se sente, algo provavelmente não vai acontecer. Equivalem a "não parece que vai...", "pelo jeito não vai..." ou "sem chance de...".

Elas são a forma negativa da そうだ de aparência. Em vez de dizer "parece que vai acontecer", dizem "não parece que vai acontecer".

A estrutura junta o verbo na forma ます sem ます com そうもない ou そうにない. As duas formas têm o mesmo sentido; そうもない é um pouco mais enfática.

É muito usada com verbos potenciais e com verbos de mudança, como terminar, parar e chegar. Por exemplo, "este trabalho não parece que vai terminar hoje" ou "a chuva não dá sinal de parar".$$,
    $$A forma "Verbo + そうではない" existe, mas soa menos natural para esse sentido. そうもない e そうにない são as formas mais usadas.

Para adjetivos, a negação da aparência é diferente: おいしくなさそう (não parece gostoso).

Essa estrutura expressa uma previsão pessimista, muitas vezes com um pouco de frustração.$$,
    $$Verbo na forma ます sem ます + そうもない / そうにない
Verbo potencial sem ます + そうもない / そうにない

Educado: そうもありません / そうにありません$$,
    $$そうもない$$,
    $$そうもない|そうにない|そうもありません|そうにありません$$,
    ARRAY['そう', 'も', 'ない']::text[],
    ARRAY['そうもない', 'そうにない', 'そうもありません', 'そうにありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-111', $$この仕事は今日中に終わりそうもない。$$, $$このしごとはきょうじゅうにおわりそうもない。$$, $$Este trabalho não parece que vai terminar hoje.$$),
    ('n3-grammar-111', $$雨はやみそうにない。$$, $$あめはやみそうにない。$$, $$A chuva não dá sinal de parar.$$),
    ('n3-grammar-111', $$この問題は難しくて、解けそうもない。$$, $$このもんだいはむずかしくて、とけそうもない。$$, $$Esta questão é difícil, e pelo jeito não vou conseguir resolver.$$),
    ('n3-grammar-111', $$もう八時だ。彼は来そうにありません。$$, $$もうはちじだ。かれはきそうにありません。$$, $$Já são oito horas. Pelo jeito, ele não vem.$$),
    ('n3-grammar-111', $$一人では運べそうもないので、手伝ってください。$$, $$ひとりではこべそうもないので、てつだってください。$$, $$Sozinho não vou conseguir carregar, então me ajude, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日は忙しくて、早く帰れ____。$$, $$Hoje estou ocupado, e pelo jeito não vou conseguir sair cedo.$$),
        (2, $$この渋滞では、約束の時間に間に合い____。$$, $$Com este congestionamento, não parece que vou chegar a tempo.$$),
        (3, $$あんなに怒っていたから、彼女は許してくれ____。$$, $$Ela estava tão brava que pelo jeito não vai me perdoar.$$),
        (4, $$この量は一人では食べ切れ____。$$, $$Esta quantidade, sozinho, não parece que vou conseguir comer tudo.$$),
        (5, $$雪はまだやみ____ですね。$$, $$A neve ainda não parece que vai parar, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうもない$$),
        (1, $$そうにない$$),
        (2, $$そうもない$$),
        (2, $$そうにない$$),
        (3, $$そうもない$$),
        (3, $$そうにない$$),
        (4, $$そうもない$$),
        (4, $$そうにない$$),
        (5, $$そうにない$$),
        (5, $$そうもない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
