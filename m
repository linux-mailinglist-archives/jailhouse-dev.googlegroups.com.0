Return-Path: <jailhouse-dev+bncBCZ2JOXC5IMRBD5S4KOQMGQE7B4EXXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B86608FF
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Jan 2023 22:56:33 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id q9-20020a19a409000000b004b6ee156e03sf993090lfc.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Jan 2023 13:56:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673042193; cv=pass;
        d=google.com; s=arc-20160816;
        b=to/I3t0WLFNCC2VyZMsnOCQwYPT+Fnb4E1ty/pIesXKIFH3vQ35ufQ2cfqvupdkGDv
         rbPAsCjYs4a+Ieo0DiFKffWERAwlvTkc7BBW/Xh1Z9+aM0r+Ef/aaQBtRJuBPsivuJqr
         rP61KbkjDBvbqR4fziOIZLY7OUHyBM9nRZvXj3EVZbGZ63CGIio//cHnvWkaxeW5aRTQ
         i1Bmmp8zarmL7xEi+zPso2Fuf9DAmllkxGdN1TR5BubSY1smCQ9dyb0cXbWH24DG3XFi
         89BZzBDN7Orpjx45JFsl3sZv6RKbkDZ0tGGH5xJe6xx96JJd2cTMQqeB7jqZe7vbRxHv
         OE4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:date
         :content-transfer-encoding:message-id:subject:to:from:sender
         :dkim-signature;
        bh=bczc+j/4IXt1bHEYxpnHNKYGP26kWtNX2IRmPugtxd0=;
        b=0Bi8vFpWrmjeFQXN+ZHusw6E90aW7pb0BdOf21selojjw0DO56CYWBgwcNcreTvFWa
         X1LoyKQ5ufOhYVlQ/cPBFjZ5hg/CioO/LTa8UQ8YpBOo4RtrJzI7Qk9v4KbwqEFGKor6
         PwZNeT67hM/qWh4i8cOqNwVw7bd+iTU76Wz3qwxgbWZGs2u6znh/m9k8+Oua1shsx4U4
         b9ZSCJIY4MtTGoSu0sBDpmhHsqEfE8HzXRmEwQsmPl7OvenVdpkulfg+TKAzMEmHQQHO
         OOgJFy9qUAm0PTw7G1rcbZop7E025kUiPLeT5IYA90h0sDkgyYpTRpnbIrVaSKbPhEZl
         U/FQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JRFKZRPs;
       spf=pass (google.com: domain of roseeribe6@gmail.com designates 2a00:1450:4864:20::42b as permitted sender) smtp.mailfrom=roseeribe6@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:date:content-transfer-encoding
         :message-id:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bczc+j/4IXt1bHEYxpnHNKYGP26kWtNX2IRmPugtxd0=;
        b=N79JGc+SV1H636uURzt9EFEIinU/B23NU0NnyMJUKLIbpyFpsDV7ulYt6cGg0RwXBF
         9wnZhuI5m4/Fq0OiwJsO6SDOWSCwwpQB5xypNwN1m2B+8Q872T1YLyERl4WxTZlYf34m
         MGi++6EgKtCQBTk4rhReQKuXUT9+BJjLCy+F7qCNHCgpR+e/zQs7iWd2hJrqef5NkHlJ
         wVt6K1F+binmafo3v78nbsRDt7eZk6IXhoX0czbrEdyMSHe8yMzFAtVpYHvo4HDiyIiD
         EHSA1GEFzPTofwKGxn4K5DzkKwBc2qCHvzk9BekMpkDyF7++/hK5+Dai/P0II4Wk5Y+H
         Tzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :date:content-transfer-encoding:message-id:subject:to:from:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bczc+j/4IXt1bHEYxpnHNKYGP26kWtNX2IRmPugtxd0=;
        b=ndRipSYM/IxsPVwcOvaXlixWesJ3RRhpjvwbgmC1SCgykvy9z2KmUULzN+ZZ26UAbk
         h3FkaFHt25XsAWPfSr9vUTJfQNm9ZvUjAy9p8I+1/Zj3ms/bMs6KdHdekHLhAw/RCZsS
         JN8OHYd3RUFucjYMPxGGoob5ohn2/i5/2lrrxUWZf3lLbr0ySWrbCyJWnTkEvcUvQedR
         yZ1T22gxsth90FVzm9MUP/hyPwrtbU8z55CUDt+JTGCp/zowoaHvbEaRWoqAe0W1hol3
         nzHmGxpcNLrCMFCVihaH73KpGAPaVjVRhzUrmH9K0npqAV3uNppRStXrtRjlxeKvagTL
         3bYA==
X-Gm-Message-State: AFqh2koLnDtw8Mzk22d+vbupAwVe3Te9zxIcFiCmtannIs+sH/cSJgsd
	iqz+YqN38czOm5xZAltN4Ak=
X-Google-Smtp-Source: AMrXdXsWMUanov2ZlxMrCmLK7dD9YmAyWOrM5BdoDrrO8CuXMpiNUDetGi42jrCVz+6xmvf00+jwSQ==
X-Received: by 2002:a2e:a5c5:0:b0:280:5b72:c3ce with SMTP id n5-20020a2ea5c5000000b002805b72c3cemr786612ljp.203.1673042193078;
        Fri, 06 Jan 2023 13:56:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:214f:b0:4c8:8384:83f3 with SMTP id
 s15-20020a056512214f00b004c8838483f3ls461309lfr.3.-pod-prod-gmail; Fri, 06
 Jan 2023 13:56:30 -0800 (PST)
X-Received: by 2002:a05:6512:318d:b0:4b5:ab93:bb1a with SMTP id i13-20020a056512318d00b004b5ab93bb1amr18519987lfe.24.1673042190541;
        Fri, 06 Jan 2023 13:56:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673042190; cv=none;
        d=google.com; s=arc-20160816;
        b=WVh8T8HfHRoiU8oAjTo2lyiPZzCbGXZh1YG8ZQQc4rgm6LFtBJP//biFoltjguqDsW
         thllDaBQbAx4I0WNeqJjMYUsGSHRnFJjsrPTUsP/cd7H8Elq/HqMgkkeHuG4ZEv5fgmu
         pdGZYJR0uZ2om9H0LEnfKy+mgBeQigooALI3fwWMhYIarr22IaNtLUjM0tlZ3n39OkdZ
         Y3RRkqxcShOtlYi4QcCxA9ctbGMpLv3t/ktrQE6K4UfrbiKq1zKGv7LSknvcJ6f2s9gJ
         6cxD9Wledq7V2ebRoy+QeMA9Nw6IoqBzrCk1hS1IFz8dAGeMeWOcoxU6YWM1pG4/Wc1U
         1sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:date:content-transfer-encoding:message-id:subject:to
         :from:sender:dkim-signature;
        bh=lCCII7qGxXM4huSt7YpEYUB0kss5j7qLdZvIZUtjPE0=;
        b=otWaPJCFJ0xPP5Z7P/c+bZkrUpNHjJw4wF2QMucSmoku+WU4iDDjil62KZ6Htn9Mvj
         HDu6tCCRouxRYgo5UqOxsTXe3cP1IJ88zit8dndj9Tn+iDLIUTNxJv7rA0yrkyobB9Qg
         BYhSC3ytUE0xk+3uY9vg/EZDJOqWnGqufzo2RIbLyEnbgeUJc6qLWoJljKWNexrYDwem
         Oxjj/ZiJfaJC1oyLTRq1Y/ckHNs5Up2AFEzqcVpB3gSWHpuIbKJuU87GTcHRZNTx+7rL
         SkZYwxpJ8Ds7G6zo8l6kGDaHDHhgchIkeHTWf2WRlEIecu/TJclcy1JUrtS/lcAVQ2Tl
         gbzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JRFKZRPs;
       spf=pass (google.com: domain of roseeribe6@gmail.com designates 2a00:1450:4864:20::42b as permitted sender) smtp.mailfrom=roseeribe6@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com. [2a00:1450:4864:20::42b])
        by gmr-mx.google.com with ESMTPS id c5-20020a056512324500b004b069b33a43si73139lfr.3.2023.01.06.13.56.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 13:56:30 -0800 (PST)
Received-SPF: pass (google.com: domain of roseeribe6@gmail.com designates 2a00:1450:4864:20::42b as permitted sender) client-ip=2a00:1450:4864:20::42b;
Received: by mail-wr1-x42b.google.com with SMTP id w13so1251636wrk.9
        for <jailhouse-dev@googlegroups.com>; Fri, 06 Jan 2023 13:56:30 -0800 (PST)
X-Received: by 2002:adf:df06:0:b0:292:27d:9647 with SMTP id y6-20020adfdf06000000b00292027d9647mr17087627wrl.10.1673042189885;
        Fri, 06 Jan 2023 13:56:29 -0800 (PST)
Received: from [127.0.0.1] ([41.83.192.224])
        by smtp.gmail.com with ESMTPSA id h2-20020adff182000000b0024246991121sm2167382wro.116.2023.01.06.13.56.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Jan 2023 13:56:29 -0800 (PST)
Sender: Capi Jack <capijack98@gmail.com>
Content-Type: text/html; charset="UTF-8"
From: Rose Eribe <roseeribe6@gmail.com>
To: jailhouse-dev@googlegroups.com
Subject: Hi dear
Message-ID: <58f89c9e-9810-811f-b8d7-d494fd7cfdbc@gmail.com>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Jan 2023 20:56:18 +0000
MIME-Version: 1.0
X-Original-Sender: roseeribe6@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=JRFKZRPs;       spf=pass
 (google.com: domain of roseeribe6@gmail.com designates 2a00:1450:4864:20::42b
 as permitted sender) smtp.mailfrom=roseeribe6@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

I'm Miss Roseline. from UK , How are you?

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/58f89c9e-9810-811f-b8d7-d494fd7cfdbc%40gmail.com?u=
tm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/ja=
ilhouse-dev/58f89c9e-9810-811f-b8d7-d494fd7cfdbc%40gmail.com</a>.<br />
