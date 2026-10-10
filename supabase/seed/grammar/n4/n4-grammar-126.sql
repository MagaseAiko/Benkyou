-- n4-grammar-126 — 〜ようになる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-126',
    'grammar',
    'N4',
    $$〜ようになる$$,
    $$you ni naru$$,
    $$Passar a / Começar a / Conseguir (com o tempo)$$,
    $$ようになる é usado para indicar uma mudança gradual de capacidade ou de hábito. Equivale a "passar a", "começar a" ou "conseguir, com o tempo".

Com a forma potencial, mostra que a pessoa ganhou uma habilidade depois de algum tempo ou esforço. Por exemplo, "passei a conseguir falar japonês" ou "aprendi a nadar".

Com a forma de dicionário, mostra que um hábito mudou. Por exemplo, "passei a acordar cedo" ou "meu filho passou a comer verdura".

Com a forma ない, indica que algo deixou de acontecer: なくなる ou ないようになる.

A ideia central é que a situação antes era diferente e foi mudando até chegar ao estado atual.$$,
    $$Para dizer que alguém deixou de fazer algo, a forma なくなる é mais comum que ないようになる: タバコを吸わなくなった.

A diferença entre ようになる e ようにする está em quem controla a mudança: ようになる é uma mudança que aconteceu; ようにする é um esforço consciente.

É muito usado para falar do próprio progresso nos estudos.$$,
    $$Verbo potencial + ようになる (passar a conseguir)
Verbo na forma de dicionário + ようになる (passar a fazer)
Verbo na forma ない + ようになる (deixar de fazer)

Passado: ようになった / ようになりました$$,
    $$ようになる$$,
    $$ようになる|ようになった|ようになりました|ようになって|ようになります$$,
    ARRAY['よう', 'に', 'なる']::text[],
    ARRAY['ようになる', 'ようになった', 'ようになりました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-126', $$一年勉強して、日本語が話せるようになりました。$$, $$いちねんべんきょうして、にほんごがはなせるようになりました。$$, $$Depois de um ano estudando, passei a conseguir falar japonês.$$),
    ('n4-grammar-126', $$最近、毎朝早く起きるようになった。$$, $$さいきん、まいあさはやくおきるようになった。$$, $$Ultimamente, passei a acordar cedo toda manhã.$$),
    ('n4-grammar-126', $$たくさん練習して、泳げるようになった。$$, $$たくさんれんしゅうして、およげるようになった。$$, $$Treinei bastante e aprendi a nadar.$$),
    ('n4-grammar-126', $$子供が野菜を食べるようになりました。$$, $$こどもがやさいをたべるようになりました。$$, $$Meu filho passou a comer verdura.$$),
    ('n4-grammar-126', $$引っ越してから、あまり車に乗らないようになった。$$, $$ひっこしてから、あまりくるまにのらないようになった。$$, $$Depois da mudança, deixei de andar muito de carro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$漢字が少し読める____。$$, $$Passei a conseguir ler um pouco de kanji.$$),
        (2, $$毎日練習して、ピアノが弾ける____。$$, $$Pratiquei todo dia e aprendi a tocar piano.$$),
        (3, $$弟は最近、よく勉強する____。$$, $$Ultimamente, meu irmão mais novo passou a estudar bastante.$$),
        (4, $$日本に来てから、納豆が食べられる____。$$, $$Desde que vim ao Japão, passei a conseguir comer natto.$$),
        (5, $$結婚してから、夫はタバコを吸わない____。$$, $$Depois do casamento, meu marido deixou de fumar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようになりました$$),
        (1, $$ようになった$$),
        (2, $$ようになりました$$),
        (2, $$ようになった$$),
        (3, $$ようになりました$$),
        (3, $$ようになった$$),
        (4, $$ようになりました$$),
        (4, $$ようになった$$),
        (5, $$ようになりました$$),
        (5, $$ようになった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
