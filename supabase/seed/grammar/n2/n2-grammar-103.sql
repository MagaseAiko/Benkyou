-- n2-grammar-103 — 〜にしろ〜にしろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-103',
    'grammar',
    'N2',
    $$〜にしろ〜にしろ$$,
    $$ni shiro ~ ni shiro$$,
    $$Seja... seja / Quer... quer / Tanto... quanto$$,
    $$にしろ〜にしろ apresenta duas opções ou dois exemplos e mostra que, em qualquer caso, a conclusão é a mesma. Equivale a "seja... seja" ou "quer... quer".

Por exemplo, "seja de trem, seja de ônibus, leva uma hora" ou "indo ou não indo, avise".

A forma にせよ〜にせよ tem o mesmo sentido e é mais formal.$$,
    $$Os dois elementos costumam ser opostos ou do mesmo grupo.

É parecido com にしても〜にしても, que é mais comum na fala.$$,
    $$Substantivo + にしろ + Substantivo + にしろ
Verbo + にしろ + Verbo (forma ない) + にしろ
Substantivo + にせよ + Substantivo + にせよ$$,
    $$にしろ〜にしろ$$,
    $$にしろ|にせよ$$,
    ARRAY['に', 'しろ']::text[],
    ARRAY['にしろ〜にしろ', 'にせよ〜にせよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-103', $$電車にしろバスにしろ、一時間はかかる。$$, $$でんしゃにしろバスにしろ、いちじかんはかかる。$$, $$Seja de trem, seja de ônibus, leva uma hora.$$),
    ('n2-grammar-103', $$行くにしろ行かないにしろ、連絡してください。$$, $$いくにしろいかないにしろ、れんらくしてください。$$, $$Indo ou não, entre em contato.$$),
    ('n2-grammar-103', $$賛成にせよ反対にせよ、意見を言ってください。$$, $$さんせいにせよはんたいにせよ、いけんをいってください。$$, $$Sendo a favor ou contra, dê a sua opinião.$$),
    ('n2-grammar-103', $$肉にしろ魚にしろ、新鮮なものがいい。$$, $$にくにしろさかなにしろ、しんせんなものがいい。$$, $$Seja carne, seja peixe, o bom é que seja fresco.$$),
    ('n2-grammar-103', $$勝つにしろ負けるにしろ、全力を尽くそう。$$, $$かつにしろまけるにしろ、ぜんりょくをつくそう。$$, $$Ganhando ou perdendo, vamos dar o nosso melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大人____子供にしろ、ルールは守らなければならない。$$, $$Seja adulto, seja criança, é preciso seguir as regras.$$),
        (2, $$買う____買わないにしろ、一度見てみよう。$$, $$Comprando ou não, vamos dar uma olhada.$$),
        (3, $$日本語にしろ英語____、毎日の練習が大切だ。$$, $$Seja japonês, seja inglês, a prática diária é importante.$$),
        (4, $$好き____嫌いにせよ、この仕事はやるしかない。$$, $$Gostando ou não, não há outra saída senão fazer este trabalho.$$),
        (5, $$雨____雪にしろ、試合は中止だ。$$, $$Seja chuva, seja neve, a partida está cancelada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしろ$$),
        (1, $$にせよ$$),
        (2, $$にしろ$$),
        (2, $$にせよ$$),
        (3, $$にしろ$$),
        (3, $$にせよ$$),
        (4, $$にせよ$$),
        (4, $$にしろ$$),
        (5, $$にしろ$$),
        (5, $$にせよ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
