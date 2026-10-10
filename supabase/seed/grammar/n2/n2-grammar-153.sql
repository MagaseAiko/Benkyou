-- n2-grammar-153 — 〜てでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-153',
    'grammar',
    'N2',
    $$〜てでも$$,
    $$te demo$$,
    $$Mesmo que seja preciso / Nem que seja / Custe o que custar$$,
    $$てでも indica que a pessoa está disposta a usar um meio difícil ou extremo para alcançar um objetivo. Equivale a "mesmo que seja preciso..." ou "nem que seja...".

A primeira parte mostra o sacrifício, e a segunda mostra a vontade forte. Por exemplo, "quero ir ao show nem que seja pegando dinheiro emprestado".

A segunda parte costuma ter たい, つもりだ ou um verbo de intenção.$$,
    $$Expressões comuns são 借金してでも, 徹夜してでも e 何をしてでも.

É parecido com てまで, mas てでも mostra mais determinação, enquanto てまで muitas vezes critica o exagero.$$,
    $$Verbo (forma て) + でも + Desejo / Intenção$$,
    $$てでも$$,
    $$てでも|んででも$$,
    ARRAY['て', 'でも']::text[],
    ARRAY['てでも', 'ででも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-153', $$借金してでも、この車を買いたい。$$, $$しゃっきんしてでも、このくるまをかいたい。$$, $$Quero comprar este carro nem que seja fazendo dívida.$$),
    ('n2-grammar-153', $$徹夜してでも、明日までに終わらせる。$$, $$てつやしてでも、あしたまでにおわらせる。$$, $$Vou terminar até amanhã, nem que seja virando a noite.$$),
    ('n2-grammar-153', $$何をしてでも、彼女を助けたい。$$, $$なにをしてでも、かのじょをたすけたい。$$, $$Quero ajudá-la, custe o que custar.$$),
    ('n2-grammar-153', $$会社を休んででも、そのコンサートに行きたい。$$, $$かいしゃをやすんででも、そのコンサートにいきたい。$$, $$Quero ir a esse show mesmo que precise faltar no trabalho.$$),
    ('n2-grammar-153', $$無理をしてでも、試合に出るつもりだ。$$, $$むりをしてでも、しあいにでるつもりだ。$$, $$Pretendo jogar a partida mesmo que precise me forçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$並ん____、あの店のラーメンが食べたい。$$, $$Quero comer o lámen daquela loja nem que seja preciso enfrentar fila.$$),
        (2, $$走っ____、終電に間に合わせよう。$$, $$Vamos pegar o último trem nem que seja correndo.$$),
        (3, $$どんなことをし____、夢をかなえたい。$$, $$Quero realizar o meu sonho custe o que custar.$$),
        (4, $$仕事を辞め____、世界一周の旅に出たい。$$, $$Quero dar a volta ao mundo nem que seja preciso largar o emprego.$$),
        (5, $$頭を下げ____、協力をお願いするつもりだ。$$, $$Pretendo pedir ajuda nem que seja preciso me humilhar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-153', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ででも$$),
        (2, $$てでも$$),
        (3, $$てでも$$),
        (4, $$てでも$$),
        (5, $$てでも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
