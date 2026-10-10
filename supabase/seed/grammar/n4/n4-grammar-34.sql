-- n4-grammar-34 — 〜こと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-34',
    'grammar',
    'N4',
    $$〜こと$$,
    $$koto$$,
    $$O ato de / O fato de / Coisa$$,
    $$こと é usado para transformar um verbo ou uma frase em um substantivo. É como dizer "o ato de..." ou "o fato de...".

Isso é necessário porque, em japonês, partículas como は, が e を só se ligam a substantivos. Para dizer coisas como "falar japonês é fácil" ou "meu hobby é ler", o verbo precisa virar substantivo primeiro.

A frase antes de こと fica na forma simples. Com adjetivos な, usa-se な, e com substantivos, である ou だった, conforme o caso.

こと também aparece em muitas outras gramáticas, como ことができる, ことがある, ことにする e ことになる.

の também pode transformar verbos em substantivos, mas こと soa mais abstrato e é obrigatório em alguns casos, como antes de です em definições e com verbos como 話す ou 伝える.$$,
    $$Com verbos de percepção, como 見る e 聞く, usa-se の e não こと, para descrever algo que se viu ou ouviu acontecendo.

Em frases como "meu hobby é...", "meu sonho é...", o natural é こと, e não の.

Sozinho, こと também é um substantivo comum que significa "coisa" no sentido abstrato, como assunto ou fato, diferente de 物, que é coisa concreta.$$,
    $$Verbo (forma simples) + こと + は / が / を / です
Frase + こと + を + 知っている / 忘れる / 聞く
Substantivo + は + Verbo + ことです (趣味 / 夢 / 仕事)$$,
    $$こと$$,
    $$こと$$,
    ARRAY['こと']::text[],
    ARRAY['こと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-34', $$私の趣味は写真を撮ることです。$$, $$わたしのしゅみはしゃしんをとることです。$$, $$Meu hobby é tirar fotos.$$),
    ('n4-grammar-34', $$日本語を話すことは難しくないです。$$, $$にほんごをはなすことはむずかしくないです。$$, $$Falar japonês não é difícil.$$),
    ('n4-grammar-34', $$毎日運動することが大切です。$$, $$まいにちうんどうすることがたいせつです。$$, $$É importante fazer exercício todo dia.$$),
    ('n4-grammar-34', $$彼が結婚したことを知っていますか。$$, $$かれがけっこんしたことをしっていますか。$$, $$Você sabia que ele se casou?$$),
    ('n4-grammar-34', $$私の夢は世界を旅行することだ。$$, $$わたしのゆめはせかいをりょこうすることだ。$$, $$Meu sonho é viajar pelo mundo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私の趣味は本を読む____です。$$, $$Meu hobby é ler livros.$$),
        (2, $$早く寝る____は体にいいです。$$, $$Dormir cedo faz bem para o corpo.$$),
        (3, $$約束を守る____が大切です。$$, $$É importante cumprir as promessas.$$),
        (4, $$先生に言われた____を忘れました。$$, $$Esqueci o que o professor me disse.$$),
        (5, $$彼が会社をやめた____を、誰から聞きましたか。$$, $$De quem você ouviu que ele saiu da empresa?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こと$$),
        (2, $$こと$$),
        (3, $$こと$$),
        (4, $$こと$$),
        (5, $$こと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
