-- n3-grammar-187 — 〜のではないか・〜のではないだろうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-187',
    'grammar',
    'N3',
    $$〜のではないか・〜のではないだろうか$$,
    $$no de wa nai ka / no de wa nai darou ka$$,
    $$Será que não...? / Acho que talvez / Não seria...?$$,
    $$のではないか e のではないだろうか são usados para expressar uma suposição ou uma opinião de forma cautelosa. Equivalem a "será que não...?", "acho que talvez..." ou "não seria...?".

Embora tenham forma de pergunta negativa, o sentido é afirmativo: quem fala acredita que aquilo provavelmente é verdade, mas prefere não afirmar com certeza.

Elas são muito usadas para:
• Dar opiniões suavemente, principalmente em reuniões e textos: "este plano não seria um pouco difícil?".
• Expressar preocupação: "estou preocupado se vamos nos atrasar".
• Fazer suposições: "ele já não teria ido embora?".

のではないだろうか é mais formal e comum na escrita. のではないでしょうか é a versão educada para a conversa. Na fala casual, usa-se んじゃないか.$$,
    $$Com substantivos e adjetivos な, não se esqueça do な: 無理なのではないか.

Em redações e artigos, のではないだろうか é uma das formas mais usadas para apresentar uma ideia sem impor.

Compare com ではないか (N4), que vem diretamente depois de substantivos, sem の.$$,
    $$Verbo / Adjetivo (forma simples) + のではないか
Adjetivo な / Substantivo + な + のではないか
… + のではないだろうか (formal, escrito)
… + のではないでしょうか (educado)
… + のではないかと思う / と心配だ

Fala casual: んじゃないか / んじゃない？$$,
    $$のではないか$$,
    $$のではないか|のではないだろうか|のではないでしょうか|んじゃないか|んじゃないだろうか$$,
    ARRAY['の', 'では', 'ない', 'か']::text[],
    ARRAY['のではないか', 'のではないだろうか', 'のではないでしょうか', 'んじゃないか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-187', $$電気が消えている。彼はもう帰ったのではないか。$$, $$でんきがきえている。かれはもうかえったのではないか。$$, $$As luzes estão apagadas. Será que ele já não foi embora?$$),
    ('n3-grammar-187', $$この計画は少し難しいのではないでしょうか。$$, $$このけいかくはすこしむずかしいのではないでしょうか。$$, $$Este plano não seria um pouco difícil?$$),
    ('n3-grammar-187', $$この雲を見ると、明日は雨が降るのではないだろうか。$$, $$このくもをみると、あしたはあめがふるのではないだろうか。$$, $$Vendo essas nuvens, acho que talvez chova amanhã.$$),
    ('n3-grammar-187', $$彼女は何か悩んでいるんじゃないか。$$, $$かのじょはなにかなやんでいるんじゃないか。$$, $$Será que ela não está preocupada com alguma coisa?$$),
    ('n3-grammar-187', $$もっといい方法があるのではないかと思う。$$, $$もっといいほうほうがあるのではないかとおもう。$$, $$Acho que talvez exista um jeito melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が混んでいるから、遅れる____と心配だ。$$, $$O trânsito está ruim, então estou preocupado se vamos nos atrasar.$$),
        (2, $$この値段は少し高い____。$$, $$Este preço não seria um pouco alto?$$),
        (3, $$彼はいつも笑っているが、本当は寂しい____と思う。$$, $$Ele está sempre sorrindo, mas acho que talvez, no fundo, se sinta sozinho.$$),
        (4, $$いろいろ試したが、この方法が一番いい____。$$, $$Tentei várias coisas, mas não seria este método o melhor?$$),
        (5, $$電気がついているから、まだ誰かいる____。$$, $$A luz está acesa, então será que ainda não tem alguém?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-187', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のではないか$$),
        (2, $$のではないでしょうか$$),
        (2, $$のではないだろうか$$),
        (3, $$のではないか$$),
        (4, $$のではないでしょうか$$),
        (4, $$のではないだろうか$$),
        (5, $$のではないか$$),
        (5, $$のではないだろうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
