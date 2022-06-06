Return-Path: <jailhouse-dev+bncBDG4LI57R4KBBTO47GKAMGQEM4YYTAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53b.google.com (mail-pg1-x53b.google.com [IPv6:2607:f8b0:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7411053F177
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jun 2022 23:14:55 +0200 (CEST)
Received: by mail-pg1-x53b.google.com with SMTP id 72-20020a63014b000000b003fce454aaf2sf5776985pgb.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jun 2022 14:14:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654550094; cv=pass;
        d=google.com; s=arc-20160816;
        b=gt939gWIlyuWKIY+cd6J3+fBSBkobdErnV5DK95MclfkaPIp+6AcnGWlNWblcmofLe
         fsDV3iqBUNv26iOeewbLDhJ+kbrFkDkspOgXo+3tTuEYmc0qa7Y2Cp8+0VnQr37sjPiC
         uPLxJR4lxA2h8tC/aE7Qs0GG6qywjop868EyAja/JfRP9KWCodlDJLdJsibOjkLAMmyx
         9FinZyCQmWTA6VVqhypTAe/KuaHOgNsxwxdUDP4sV0ZZ/Iwoj14ecNSBcEyQaB2H6DE6
         HE00qhsxA+eR6UyB8yDHcj5bcY6VsH4/eJCRne/jlMm5CEoPgKd/k8y8Afb7nhGNaF/W
         wlbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=x93C+1gNNX8mA7/Gp1AJ+cXmS9dN5jOrvPvEGkfFTyw=;
        b=k4gd8q0taWa7W57WixxBf0zIoEfXfJXUG04SdV1JqSX9rRgJy+AjNjVfejVqWdjy4m
         JQTCMbdsnBLLuJxdCZI6hY8SZ/50ZDSsoMoG5jxJgsMI/rHM2A000QShJKwSYltLn0vY
         e/b32qbr/5XN2+QQuyq+gAORwOFa/Lvlnzdb1AShcDeIg+CLTAohQbJBD5WwzVDqJ/9v
         9lLhOkGCTCDWHcI9CTzgrOIY+lmKKyTJnQCdkKyS0gN84rHdpHZkrDsaUm+JnWfonZeN
         4hbqb8L0scVjX/q2KP4jXasQPbMhRrCmo3LxE2MN6E8me/77EljuY2AlA0IahNYEt22B
         lOjQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lnYeKmKp;
       spf=pass (google.com: domain of elizabethm356876@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=elizabethm356876@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x93C+1gNNX8mA7/Gp1AJ+cXmS9dN5jOrvPvEGkfFTyw=;
        b=rbZtkxSNPf57QN40rQRLcaCHsZEs4xLtgnHOXnCSxqX+xwODY/7E/ACIqkkJMEpbtL
         2sQt4HBbKNgUjN2pPo17Hah9XTsY6eoW3EIeLXREhk8z6uk/MmiaYODiu4j8/OhfTtKz
         KF0joTcl8p3x7r6UHn88gWmdJiGC/F6zeZsmLrU75ahto6edOVlrCHTosBXuqIg5iDD5
         NksUSLMtYjh750Q7Xt1VPDH5/C1NMyeBBpW006xlf34f3vNga5NNqjo8btKO9hXFoGhk
         tS58jNjaFz2LmhTDqNfJeJImeFgo0YfW9Tx8tyKE3Rg7knYk5PoYzKkWHPjrJ+k1alic
         Pi/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x93C+1gNNX8mA7/Gp1AJ+cXmS9dN5jOrvPvEGkfFTyw=;
        b=DfO7oX+mtD29/z2NwjBu+pDdERxp1tOPusqgIOOonv+FDtQ1Qsr34MHEJRujn3mRpN
         weH4yiKagFUuItx0OQLl4SzIFNXOZNzKizxZydnCGrbFBh3MXfHwyQdqCMlFSwX/qRZQ
         IVht/UOlqARSat+98r4+E0xHxp/S+MvNC2jSUL8SncFB7Q3sbKSM+fm/DSlT6eR91l2L
         h1SSoCMCiPKEJXdCriaF3UhWmWBfjZZHBCHqMZy0wnaigEfoyfV1siD3x+I76Awsr0N1
         9B8vNXuyeLJk/jjCy9D4gjeDSH5JosrAzaDnM5HAW7JK1pE3uvIF5lymYFy1BaJA3Bld
         TfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:reply-to:from:date
         :message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x93C+1gNNX8mA7/Gp1AJ+cXmS9dN5jOrvPvEGkfFTyw=;
        b=Q9zGcUvix5XaueUdZJ6hOHhlPW982Sw7SMekVh+1B8Xzfoe5St9DYj8Gsdfj9F9IxH
         PgLl4JKIW39CRuSiz7CbYh8YV4+HKj3HyCId6nSFdcSwjIF1pY04PIezSAUGhdekCl48
         MoqIlIMyUabM4IyJyRgTQpUyFVCrNIh2EDUo7ftNoTWiO7/ICRTdJWzip0+zB2RlAwNa
         /kgM4Wn8LrgM43vb2uu/APep3LRrB1nVr+lbNCL6pgLMnKKewjqnhsuSaU3Ai/mNJoSI
         ZNaDdP05slMQdbJk/kRNc1opK5ojs4oucgrps1JpxCd66o6dKfvUZRprbhgSx3bRStEe
         LAwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533GqcHmIv2Pqq4yFs7n5CGUJnBRjQP5dmyhSLPOAPTYA/xCGAtI
	Jm0dbsK8Wr4bIL2iiVsOi5E=
X-Google-Smtp-Source: ABdhPJykUHg4Mf3YgpfEslGCYD9ksSuShvqBoX6aK7PY8K1q4SVsGj2arhEZoDVvV7jYUsFe/YenCA==
X-Received: by 2002:a17:90a:14a6:b0:1dc:f64f:ff2c with SMTP id k35-20020a17090a14a600b001dcf64fff2cmr28389953pja.161.1654550094009;
        Mon, 06 Jun 2022 14:14:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:8c7:0:b0:3fd:5560:7be with SMTP id 190-20020a6308c7000000b003fd556007bels2683007pgi.5.gmail;
 Mon, 06 Jun 2022 14:14:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c8:b0:51c:29fb:7b2 with SMTP id w8-20020a056a0014c800b0051c29fb07b2mr3944209pfu.24.1654550092886;
        Mon, 06 Jun 2022 14:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654550092; cv=none;
        d=google.com; s=arc-20160816;
        b=LVovLYrTNCEfjfhyuqVxW1QEtPPtAFfnO9HTkkk503pc328VOSqNCgefXxYwkMsl+u
         cguGQfwaOmQmPmbRRbRQSCTtciy0OUJ6sB6l3hnbZY9k1Gb8KyX/BRyelrPKGQcN1BxX
         Gu/nzs4MhGEV+BLhfvw5gHNXJ87dokM9ILsZhmb7z9qlrT1nw0MyRi5IntXomAj3Qo6X
         Pr33XHfEITqYMfSAcSEqFQdUc2S1WCslg/kyyE373NdQK1MBk+l9yvdrQevlvF2+l373
         ZuVLDy8wP+SArkwcyk3g8poBR62odA4M8blxVFc13Z9kyn12Nv4g7sjwhgA0L0lMuA4J
         TYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=SyBmTO/3gm6oVfcgnfdeKQgRwgcn40G/oiaH8v7PaTs=;
        b=pc8AEIuNMtXrZnT+MaCwnHqJoK7P/LhMAyZ2tXt9hRTkXT5OqpIl2Xu9WhFkVVJJjO
         6IxeHJfP4hP55MlLIsbLuzmuXCob/izPOGvncxObn3uWuMOoqE24QCs2/z7b+dJwnlZK
         8PsFylMJj7sLyq33ndShTWeqrVHxMw8JI/lX1ZPMfRG5UPIIbSwfKwY/Z+GZ01C4w80o
         ytiAJ7iLPqKDsoAaB3ciQ/NbDR2PS5pcFPaBuYmGe0wnJhmTOrumBE1ZH/gyXZEyZmam
         K/rLAeq2JogFJCNBsG28ELSKYNOb826x9DgvZq+t72v0DkmeT+XnZGiz9dlc3ZCe8445
         3nYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lnYeKmKp;
       spf=pass (google.com: domain of elizabethm356876@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=elizabethm356876@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com. [2607:f8b0:4864:20::112b])
        by gmr-mx.google.com with ESMTPS id mn21-20020a17090b189500b001e2f63fa04bsi878563pjb.0.2022.06.06.14.14.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 14:14:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of elizabethm356876@gmail.com designates 2607:f8b0:4864:20::112b as permitted sender) client-ip=2607:f8b0:4864:20::112b;
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-30fa61b1a83so150552417b3.0
        for <jailhouse-dev@googlegroups.com>; Mon, 06 Jun 2022 14:14:52 -0700 (PDT)
X-Received: by 2002:a81:7783:0:b0:2fe:e20c:5dd6 with SMTP id
 s125-20020a817783000000b002fee20c5dd6mr27367342ywc.441.1654550092255; Mon, 06
 Jun 2022 14:14:52 -0700 (PDT)
MIME-Version: 1.0
Reply-To: elizabethmark12022@gmail.com
From: Elizabeth Mark <elizabethmark12022@gmail.com>
Date: Tue, 7 Jun 2022 05:14:41 +0800
Message-ID: <CADtbehQjPEZ8gjWeop93wnjwUoQ7vy1=mn5nEcCw9CQC2HjGhw@mail.gmail.com>
Subject: =?UTF-8?B?0JfQtNGA0LDQstC10LnRgtC1?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000008318c505e0cdf683"
X-Original-Sender: elizabethmark12022@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=lnYeKmKp;       spf=pass
 (google.com: domain of elizabethm356876@gmail.com designates
 2607:f8b0:4864:20::112b as permitted sender) smtp.mailfrom=elizabethm356876@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000008318c505e0cdf683
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

INCX0LTRgNCw0LLQtdC50YLQtQ0KICDQnNC+0LvRjywg0YHQutGK0L/QuCwg0LzQvtC20LXRgtC1
INC70Lgg0LTQsCDQvNC4INC60LDQttC10YLQtSDQv9GA0LjRh9C40L3QsNGC0LAsINC/0L7RgNCw
0LTQuCDQutC+0Y/RgtC+INC90LUg0YHRgtC1DQrQvtGC0LPQvtCy0L7RgNC40LvQuCDQvdCwINGB
0YrQvtCx0YnQtdC90LjQtdGC0L4g0LzQuA0KICDQktCw0YjQuNGP0YIg0YHQtdGA0LbQsNC90YIg
0JXQu9C40LfQsNCx0LXRgtCwINCc0LDRgNC6DQpIZWxsbw0KIFBsZWFzZSBkZWFyIGNhbiB5b3Ug
bGV0IG1lIGtub3cgdGhlIHJlYXNvbiB3aHkgeW91IGhhdmUgbm90IHJlcGx5IG15DQptZXNzYWdl
DQogWW91ciBzZXJnZWFudCBFbGlzYWJldHRhIE1hcmsNCg0KLS0gCllvdSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMg
IkphaWxob3VzZSIgZ3JvdXAuClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3Rv
cCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8gamFpbGhvdXNlLWRl
dit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBv
biB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91
c2UtZGV2L0NBRHRiZWhRalBFWjhnaldlb3A5M3duandVb1E3dnkxJTNEbW41bkVjQ3c5Q1FDMkhq
R2h3JTQwbWFpbC5nbWFpbC5jb20uCg==
--0000000000008318c505e0cdf683
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+wqDQl9C00YDQsNCy0LXQudGC0LU8YnI+wqAg0JzQvtC70Y8sINGB0LrR
itC/0LgsINC80L7QttC10YLQtSDQu9C4INC00LAg0LzQuCDQutCw0LbQtdGC0LUg0L/RgNC40YfQ
uNC90LDRgtCwLCDQv9C+0YDQsNC00Lgg0LrQvtGP0YLQviDQvdC1INGB0YLQtSDQvtGC0LPQvtCy
0L7RgNC40LvQuCDQvdCwINGB0YrQvtCx0YnQtdC90LjQtdGC0L4g0LzQuDxicj7CoCDQktCw0YjQ
uNGP0YIg0YHQtdGA0LbQsNC90YIg0JXQu9C40LfQsNCx0LXRgtCwINCc0LDRgNC6PGJyPkhlbGxv
PGJyPsKgUGxlYXNlIGRlYXIgY2FuIHlvdSBsZXQgbWUga25vdyB0aGUgcmVhc29uIHdoeSB5b3Ug
aGF2ZSBub3QgcmVwbHkgbXkgbWVzc2FnZTxicj7CoFlvdXIgc2VyZ2VhbnQgRWxpc2FiZXR0YSBN
YXJrwqDCoDxicj48L2Rpdj4NCg0KPHA+PC9wPgoKLS0gPGJyIC8+CllvdSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmliZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMg
JnF1b3Q7SmFpbGhvdXNlJnF1b3Q7IGdyb3VwLjxiciAvPgpUbyB1bnN1YnNjcmliZSBmcm9tIHRo
aXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVtYWls
IHRvIDxhIGhyZWY9Im1haWx0bzpqYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb20iPmphaWxob3VzZS1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbTwvYT4uPGJy
IC8+ClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgPGEgaHJlZj0iaHR0
cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0FEdGJlaFFqUEVa
OGdqV2VvcDkzd25qd1VvUTd2eTElM0RtbjVuRWNDdzlDUUMySGpHaHclNDBtYWlsLmdtYWlsLmNv
bT91dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9Zm9vdGVyIj5odHRwczovL2dyb3Vwcy5nb29n
bGUuY29tL2QvbXNnaWQvamFpbGhvdXNlLWRldi9DQUR0YmVoUWpQRVo4Z2pXZW9wOTN3bmp3VW9R
N3Z5MSUzRG1uNW5FY0N3OUNRQzJIakdodyU0MG1haWwuZ21haWwuY29tPC9hPi48YnIgLz4K
--0000000000008318c505e0cdf683--
