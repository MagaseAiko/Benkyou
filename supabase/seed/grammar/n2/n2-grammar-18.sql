-- n2-grammar-18 — どうやら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-18',
    'grammar',
    'N2',
    $$どうやら$$,
    $$dou yara$$,
    $$Parece que / Pelo visto / Ao que tudo indica$$,
    $$どうやら é um advérbio usado para fazer uma suposição com base no que se observa ou se percebe. Equivale a "parece que", "pelo visto" ou "ao que tudo indica".

Ele quase sempre aparece junto com らしい, ようだ, みたいだ ou そうだ no final da frase, reforçando a ideia de suposição.

Por exemplo, "pelo visto vai chover" ou "parece que errei o caminho".

O tom é de alguém chegando a uma conclusão aos poucos, a partir de pistas. Às vezes, também expressa alívio, como em "parece que vou conseguir chegar a tempo".$$,
    $$どうやら é parecido com たぶん (provavelmente), mas どうやら se baseia mais em evidências observadas.

Sem らしい ou ようだ no fim, どうやら soa incompleto.

É muito comum em narrativas e em monólogos internos.$$,
    $$どうやら + … + らしい / ようだ / みたいだ / そうだ$$,
    $$どうやら$$,
    $$どうやら$$,
    ARRAY['どうやら']::text[],
    ARRAY['どうやら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-18', $$空が暗くなってきた。どうやら雨が降りそうだ。$$, $$そらがくらくなってきた。どうやらあめがふりそうだ。$$, $$O céu está escurecendo. Pelo visto vai chover.$$),
    ('n2-grammar-18', $$どうやら彼は来ないらしい。$$, $$どうやらかれはこないらしい。$$, $$Ao que tudo indica, ele não vem.$$),
    ('n2-grammar-18', $$この景色は初めてだ。どうやら道を間違えたようだ。$$, $$このけしきははじめてだ。どうやらみちをまちがえたようだ。$$, $$Nunca vi esta paisagem. Parece que errei o caminho.$$),
    ('n2-grammar-18', $$喉が痛い。どうやら風邪をひいたみたいだ。$$, $$のどがいたい。どうやらかぜをひいたみたいだ。$$, $$Estou com dor de garganta. Pelo visto peguei um resfriado.$$),
    ('n2-grammar-18', $$急いだので、どうやら試験に間に合いそうだ。$$, $$いそいだので、どうやらしけんにまにあいそうだ。$$, $$Corri, então parece que vou chegar a tempo para a prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ポケットにない。____、財布を家に忘れてきたようだ。$$, $$Não está no bolso. Pelo visto esqueci a carteira em casa.$$),
        (2, $$返事がない。____彼女は怒っているらしい。$$, $$Ela não responde. Ao que tudo indica, está brava.$$),
        (3, $$空が明るくなってきた。____雪がやみそうだ。$$, $$O céu está clareando. Parece que a neve vai parar.$$),
        (4, $$シャッターが閉まっている。____この店は今日休みのようだ。$$, $$A porta de aço está fechada. Pelo visto esta loja está fechada hoje.$$),
        (5, $$みんなが言っているから、____彼の話は本当らしい。$$, $$Todos estão dizendo, então ao que tudo indica a história dele é verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうやら$$),
        (2, $$どうやら$$),
        (3, $$どうやら$$),
        (4, $$どうやら$$),
        (5, $$どうやら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
