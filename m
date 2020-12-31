Return-Path: <jailhouse-dev+bncBCO7LMW7VYMRB2P4WT7QKGQEGX37XHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3e.google.com (mail-vk1-xa3e.google.com [IPv6:2607:f8b0:4864:20::a3e])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DC2E7DCD
	for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Dec 2020 03:58:50 +0100 (CET)
Received: by mail-vk1-xa3e.google.com with SMTP id t9sf7991528vkm.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Dec 2020 18:58:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609383529; cv=pass;
        d=google.com; s=arc-20160816;
        b=TYtci8KtYxSTVyKbAor04wnggx0sZQseB3vGiwYKxSlYnv3NOOGFiNSnd/GBHIXt7h
         Or6AqnEJPIpdzausH72DltGDaxawmDR5Ziy+I1XxVFJQAd3OiA/Ygjf9bUlDXeOVdDoJ
         Jq5uj5mmf4Dtt438gM+FVWHa3iPCsM4kqvoPB3s5DaSbG2D71qGbxW9simwsz7jgUgA3
         G24PmQWtaVE5DBWB4Cij4A0Sv7IlC70qtjmI9Xfp64GA7gv21EehQxf4+wMp4G0Ely+H
         Y0IGL93PEecXzJToJiOxtisMSM15LzjIdgcanasig2tk/V8b3vnefC0bxkQzGrKzpifl
         JfvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:subject:to:from
         :mime-version:list-unsubscribe:date:message-id:sender:dkim-signature
         :dkim-signature;
        bh=6T07uHAJAO3aJl48BLEcFQyAJx96sL+ToEFnZINb+oU=;
        b=FJKe9SVQm8bP//XwDbuknBe0gzHviB9cc6o2huSueOQGzhW6wr69anODN5ETMqw0U1
         pDQVteg7pE4LQE2DWfz/rIHUrv1ZGvk5dH1F1QHzLQy69Cl3MkUOeJfWEHKrPomZ8rZb
         k1PKbub/e9FmlkhzQRjJCrnPDMrWvS/zd8SeeFWymAKD1/4QsKD+au3Xtep1iMUFn9p6
         JN6fWU14BsfW9+dp+Eyt9wuUgaR2mn6pOK4xeLD+gbNbtIOq56thBEZSswDQgrBiiKr9
         YdqyIBDmAn2o+pdoHggXFPjEB/oWdLs9Hwq1FDw2vdnq+7gEa/gxYB73eScrt05BrRTP
         yGTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jn+TjIh0;
       spf=pass (google.com: domain of sontruong2646@gmail.com designates 2607:f8b0:4864:20::52d as permitted sender) smtp.mailfrom=sontruong2646@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:message-id:date:list-unsubscribe:mime-version:from:to
         :subject:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=6T07uHAJAO3aJl48BLEcFQyAJx96sL+ToEFnZINb+oU=;
        b=UuhWTB4/TUK1C/GMv1C5y1sdpKE2Jk6ZduGg+/So5ef3+KGWpz//1huDwgr8w0iHog
         FtuPR3m7jp6fzaTUEGj4kLkplPDv1Xppd973RLoMKTQLuBs19yZkZe7nZ/jk+nV7SQcZ
         VtlFAdd+3ROLskPotFwqaRzhyXVwiXh5m3qYV1SXSNlYRmOrV5hKRlCzqCzlQYGEVvHJ
         XUIaJCyaEiTOQJJx6svCMw6UiLYmt+lDewShbmrtsRNc6uHBbzTlK9Ntt47q/pF1kGkG
         lCEtlFWVDJVZaxb96CvuuJPPWAWeXivN7iJFLTO5s/cWN8KlTi+0ODDfgi3ELhcK7Tp/
         MnLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:list-unsubscribe:mime-version:from:to:subject
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe;
        bh=6T07uHAJAO3aJl48BLEcFQyAJx96sL+ToEFnZINb+oU=;
        b=MrFM42azvzXiHpvEesDZ7/Lx9XEqtFQFz1SLOaOXyD3wHhfoRyq2tXmua2LanLM603
         1xbuJY7obzTbpqo/vSk4vtIFh3gBa7tpF2u2LOd+C/nQUn6j+CpXQ3VwHOo2KdtbSpDH
         T/nFiA/M9XlklaaZ6okrUP/o/tmlr5av/zUJEKvtJkJmxYQ2551g/g5WEuYApISHKMFn
         8y5jNqqPeUT7Qll1k29+nLWwLUB0OO0cZMyE6cYhcG2wx3TKUPro2qgFBsNkYb+v05CS
         c/RyZVZLC3aDBwj/UA1E4m/8+q5qTrj5a0Ja5uXBLCQvdH8zGtBCLnGf7MrYC1cMMVIX
         entw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:message-id:date:list-unsubscribe
         :mime-version:from:to:subject:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe;
        bh=6T07uHAJAO3aJl48BLEcFQyAJx96sL+ToEFnZINb+oU=;
        b=DYr/CwfQWD9Gqbq6aHLUKRW4OjCiWT/qEOj3o8EqPECexHk/l4ijV301ldn8F2OGpp
         zaJKe6DxRO2lVwcRvG70xfR/m+Q8w2fWlJ7SpXT6nfS1inUok+efUmyAmHRWU+ywGycO
         szfAiZmTfUjLvAeKEyA4XsCwtFZP2bDn7l2quNnoeBswAb75evC5kLUTBw2vvPdRRUt/
         jjQTxXeGEC859aBrpbDzXZ5rRWFnnsRquh9t2IrUoLUqoTso2GEZUPNuteXxfTsaFixY
         rfqPM5T+QYuk8jesHvpMGCBeSL5Jbbg1WnC2p3CkWX12naDWXK8mMFuukm4lPV87AcCp
         EEzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Vwq09JY82N0Wu027xtQFQ+0U6OeQCT1XrIES8nvpsVQYnKo81
	xyrzj4yIKhZ5Si3LoEHo2nA=
X-Google-Smtp-Source: ABdhPJyv6PewdqTXLdr3NKqIbTH6S7BP6wipTFScT2hW0updPLxiR4+Buh5c6vtgEx0I4qQbF6WZPg==
X-Received: by 2002:a9f:356b:: with SMTP id o98mr35878947uao.40.1609383529718;
        Wed, 30 Dec 2020 18:58:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6102:382:: with SMTP id m2ls7799188vsq.8.gmail; Wed, 30
 Dec 2020 18:58:49 -0800 (PST)
X-Received: by 2002:a05:6102:d1:: with SMTP id u17mr34809188vsp.8.1609383529128;
        Wed, 30 Dec 2020 18:58:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609383529; cv=none;
        d=google.com; s=arc-20160816;
        b=wndqb0+hiZohGh91wd/G9pfiW+KkGJJNplvYwEYsvXeQTlXpIzGiBhEf0h+Y80RpqS
         DFD4RNC9keSQohHHIFjMAXwRsuyJ8RVnTrU9PMoEaM99CX4cQRfsUxwxfcW1+rwSCZWQ
         e0VDPe44LvcxGNBOAKt9nsebi1SX+O6WM5nEfNWosy/Fpc34Y2wdZ+UzT4E7SHP0liHY
         OlZilSFL79d2CeOZsZOpVrq68AoF3GkAilQr00pELCJ6hJbufgUbIGgwuds1+zWdcv3V
         qNGlvlIzn6/zlzabHNsAyVqPWjFIk8orWvI8lR217Wv1tZma68sB4CzHYB7lwOw/huC+
         EMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:subject:to:from:mime-version
         :list-unsubscribe:date:message-id:dkim-signature;
        bh=Me14urYwBVkvVR2NfnUjn7QFqx2LjbQQPqRs5IIyKKs=;
        b=grGet3JvpmkCHgMFiMTqXNZuH/xzDHwKM2ZgM975mNZpavNkg7dOE/DR5qFpfwZiC9
         l0GPTnlKOeyCKmeyyPLk5rzCtbAsESWkwafWHjJLgE4XIfjjuOpsTwQaCflLNqOQc7st
         RVRlhVUqtSaOIu7mNiLY0cJOkHoBu18YSOfg3B6aiSAWEL5/wBvVSIaVPzmEE/clEPqm
         uLe8pV1DR2VTB9BnCiLbagydvfS3ceAEvWJjdEL01sEFfV+nwZSiiOuilbIJUG9/4J8l
         zgY3PqxYVAZYjFt3YQCAWz2cx2MGA6UO9AAS8OtXO/5JISGrQEjuLhZmt5256+7mmy4o
         WT7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jn+TjIh0;
       spf=pass (google.com: domain of sontruong2646@gmail.com designates 2607:f8b0:4864:20::52d as permitted sender) smtp.mailfrom=sontruong2646@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com. [2607:f8b0:4864:20::52d])
        by gmr-mx.google.com with ESMTPS id y8si3588606vko.4.2020.12.30.18.58.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 18:58:49 -0800 (PST)
Received-SPF: pass (google.com: domain of sontruong2646@gmail.com designates 2607:f8b0:4864:20::52d as permitted sender) client-ip=2607:f8b0:4864:20::52d;
Received: by mail-pg1-x52d.google.com with SMTP id c22so12349634pgg.13
        for <jailhouse-dev@googlegroups.com>; Wed, 30 Dec 2020 18:58:49 -0800 (PST)
X-Received: by 2002:a63:804a:: with SMTP id j71mr54496789pgd.307.1609383528166;
        Wed, 30 Dec 2020 18:58:48 -0800 (PST)
Received: from DESKTOP-DI4367S ([27.3.184.35])
        by smtp.gmail.com with ESMTPSA id s33sm8650410pjj.56.2020.12.30.18.58.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 30 Dec 2020 18:58:47 -0800 (PST)
Message-ID: <5fed3e67.1c69fb81.2712c.1c3c@mx.google.com>
Date: Wed, 30 Dec 2020 18:58:47 -0800 (PST)
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
MIME-Version: 1.0
From: "Lakisha" <sontruong2646@gmail.com>
To: jailhouse-dev@googlegroups.com
Subject: =?utf-8?B?amFpbGhvdXNlLWRldj/otbfor4nmsZ/mgbbpppYhRnJvbSBM?=
 =?utf-8?B?YWtpc2hhLg==?=
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: SonTruong2646@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=jn+TjIh0;       spf=pass
 (google.com: domain of sontruong2646@gmail.com designates 2607:f8b0:4864:20::52d
 as permitted sender) smtp.mailfrom=sontruong2646@gmail.com;       dmarc=pass
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

<CENTER>
<p><div style=3D"font-size: 27px; font-family: verdana, arial, helvetica, s=
ans-serif; background-color: rgb(255, 255, 255)"><font color=3D"#0000cc"><a=
 href=3D"http://theuocxua.com/getdocuments/w0nfBBBB0bNY4sOr9taFKYJziEd5kiJI=
jnIPZCMtO73mc6GUe4jwglDcKlhWAMb0WBBBBZ3M1DhaqAAAAzluuAAAABb1POg05Q=3D=3D/YI=
mzivsoURV9KKulu4cHYQ=3D=3D/jailhouse-dev?=E8=B5=B7=E8=AF=89=E6=B1=9F=E6=81=
=B6=E9=A6=96!From Lakisha." target=3D"_blank" rel=3D"noreferrer">The truth.=
info</a></font></div>
<div>
<img src=3D"http://theuocxua.com/getdocuments/w0nfBBBB0bNY4sOr9taFKYJzqtVi2=
1JsYVSKkoqM8REqMHTvCLKiGstT3oZytAZN8plguGwhoPPy0mhvJHBMAAAAM5phG7n2cpzWEyhw=
yJqjBuNPE=3D/8yN5UgFLyEOiNtCb9AAAAniXaeTYLfqY4Zezeazy6hpWGz8iYol8S4wWHpg3Ox=
1uD16/jailhouse-dev?=E8=B5=B7=E8=AF=89=E6=B1=9F=E6=81=B6=E9=A6=96!From Laki=
sha.">
<img src=3D"http://theuocxua.com/getdocuments/w0nfBBBB0bNY4sOr9taFKYJziEd5k=
iJIjnIPZCMtO73mc6GUe4jwglDcKlhWAMb0WBBBBZ3M1DhaqAAAAzluuAAAABb1POg05Q=3D=3D=
/DGe5gLSWwZX8gRRSScEeihmV1Ti6fM0pwUMnzHwxWiu5P6nNGUVjPy83RRuBw7dp/jailhouse=
-dev?=E8=B5=B7=E8=AF=89=E6=B1=9F=E6=81=B6=E9=A6=96!From Lakisha.">
<img src=3D"http://theuocxua.com/getdocuments/w0nfBBBB0bNY4sOr9taFKYJziEd5k=
iJIjnIPZCMtO73mc6GUe4jwglDcKlhWAMb0WBBBBZ3M1DhaqAAAAzluuAAAABb1POg05Q=3D=3D=
/hRcTy4WjRXqlBc0n0B59k63Ot3bql5FJAAAA72dQdHAAAAFLv5joiUjAG4UznIrpzcg1Jyyf3k=
WQgPsDg6SOuaDGkadHEi8nt0Kp5aaxNi604VT4I=3D/jailhouse-dev?=E8=B5=B7=E8=AF=89=
=E6=B1=9F=E6=81=B6=E9=A6=96!From Lakisha.">
<img src=3D"http://theuocxua.com/getdocuments/w0nfBBBB0bNY4sOr9taFKYJziEd5k=
iJIjnIPZCMtO73mc6GUe4jwglDcKlhWAMb0WBBBBZ3M1DhaqAAAAzluuAAAABb1POg05Q=3D=3D=
/hRcTy4WjRXqlBc0n0B59k63Ot3bql5FJAAAA72dQdHAAAAFLs2lEBBBBOIyY2zBg70zwTFQ42E=
RzMciQriVXyoYfiiueISb5QnQ6Ci3L5VKqZAqb95XU=3D/jailhouse-dev?=E8=B5=B7=E8=AF=
=89=E6=B1=9F=E6=81=B6=E9=A6=96!From Lakisha.">
<img src=3D"http://theuocxua.com/getdocuments/w0nfBBBB0bNY4sOr9taFKYJziEd5k=
iJIjnIPZCMtO73mc6GUe4jwglDcKlhWAMb0WBBBBZ3M1DhaqAAAAzluuAAAABb1POg05Q=3D=3D=
/hRcTy4WjRXqlBc0n0B59k63Ot3bql5FJAAAA72dQdHAAAAFLtK7RQEzNlFSnKeYmmsnyeOGXS8=
aoAREkQbd3mETn9oGaLhyd4tQLCZOSnAAAAzNKOgOI=3D/jailhouse-dev?=E8=B5=B7=E8=AF=
=89=E6=B1=9F=E6=81=B6=E9=A6=96!From Lakisha.">
<div>
<em>*=E5=85=B6=E4=BB=96=E6=96=87=E4=BB=B6:</em><br />
<em>https://www.mediafire.com/folder/inj2vedwe7cj3</em><br />
<em>http://coduyen.info/mh/00/9&pi_n.g.pdf</em><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5fed3e67.1c69fb81.2712c.1c3c%40mx.google.com?utm_m=
edium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailho=
use-dev/5fed3e67.1c69fb81.2712c.1c3c%40mx.google.com</a>.<br />
