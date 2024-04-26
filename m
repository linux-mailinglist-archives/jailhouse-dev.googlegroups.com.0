Return-Path: <jailhouse-dev+bncBCAYF6GBVYFBBSNSVWYQMGQE5ZU2HCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B88B3177
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Apr 2024 09:35:39 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dbf216080f5sf3343728276.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Apr 2024 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1714116938; x=1714721738; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdLqhpgySF7w0yKk+KP8paCZ611dkiG93OaYVtfGErA=;
        b=fFnrX/jKl8ewY+5sCpcqGvf3fIT47CROuiXL6R3wyGifWqhVlBRNyqz3uFdYfscWCw
         Yo8u6eZZ8lO5/zzMjHYXdnLdN7Axb10YXDikuAOu+y50RUCqRER3O7PIqv8+fdIvQrvs
         8LJreqfcZk2sVeFyaIM1Zf7j/SOzi287WjmEA60Nh6J69HH4/sxjvvP9YFd16G72At/p
         VVB7NUZV+sehnGcGO8KEZLRsw2bR3I2CXi6dPpPDVmrXiHqz4m4Riovo2qGOuw/xCwpm
         hiyx/aQTLMJi47/bT4m7HfNY8s1EsYFohRQphjgTnNUNxv46ueJMQW24/p9Svl+Ji5bW
         u87A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714116938; x=1714721738; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdLqhpgySF7w0yKk+KP8paCZ611dkiG93OaYVtfGErA=;
        b=UolLcp9AeVHaoxBfKow+e7Yt2TSXTiB5eYsNLGzdcXbIhNLerjsfxYqRC+7WY4G5W7
         RCmswWjgc3tnWTMBb6UJLCiI1dBdDwe73QBcsjP0znE5Er8m0l9cl7ES0h2k0LB+JXTm
         +A4WHGbNKRBDpfl5DVZEgJDOhewMIYiHXQk3OPAnL4FJP0brCRBzzAQdb/gHICVY4kfC
         Dsi1xExb/8BlVW1FEy2MedOmxzVB2dKlnMWv53jxKpsKTxxlTkTtlOY44WSA5cZocI7s
         wTxQIhUWLRpUAcQfzQdcoeMjcPL2Dugx8b1/x7Z+5bRo39HNolGGpZExLidrthudHY9r
         19jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714116938; x=1714721738;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GdLqhpgySF7w0yKk+KP8paCZ611dkiG93OaYVtfGErA=;
        b=Tt83V0LU4OUhIGUoFoD2HSJDwJzMtapzrBBrZVlizw8NEYMd0+E70vI7pNJqbxZZua
         e0/ow74sSS7i9++2t0EYpfhfZ0xi8mYXSomccLhgeJgcjZBVewb3Uf19loupVqw39OYf
         MOW3cpKQ99Nxohy4GgM4h6Wdv4RrWjygFNVgstBoLOe1DNKs9gVQhjeQ5JlbSY8FOo8c
         1ev2pOqOynF7LZBVNsNONI+eAAA1KfBKegBt5gtsjb+QqKt2faCB7R1fC86F2oqgz1m2
         3ZzIj5gV3kmjV9bgZnFIoKUEfIWGQIdCWr0CE7DYO/dovDFrt2uF49whBvTnitA4XE+M
         5CWQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVnsK+9eF3WMfqsk1EP5JisNzuQh2K3TPxAzAautnoxyKUvvlyiACUaynrWdzboWXAPlooQWTwyKsrCBV9dEdP27l0Atbzi0cSVc4Y=
X-Gm-Message-State: AOJu0YzMDw99c0ks+RgX8cROsqJSD6K6+ZL1n1vYy7/N41Eutq9ffc5l
	MKK86MaRXYZ1XhYW5V8nCcsmr5r5vXfdXU21IXiSHLl+/IaaSASj
X-Google-Smtp-Source: AGHT+IF6xNX2/HPS0B1EyTsxqFDfG3bXs3F96EFiiKAz3Rgl3a9zkUbpBNMHUQnXxrL4ntZFoELXKg==
X-Received: by 2002:a25:6942:0:b0:de5:5084:715d with SMTP id e63-20020a256942000000b00de55084715dmr2014937ybc.53.1714116938280;
        Fri, 26 Apr 2024 00:35:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:a4e8:0:b0:de5:a878:2bc8 with SMTP id 3f1490d57ef6-de5a8783c48ls358723276.2.-pod-prod-05-us;
 Fri, 26 Apr 2024 00:35:36 -0700 (PDT)
X-Received: by 2002:a05:6902:723:b0:dcc:f01f:65e1 with SMTP id l3-20020a056902072300b00dccf01f65e1mr635322ybt.8.1714116936571;
        Fri, 26 Apr 2024 00:35:36 -0700 (PDT)
Date: Fri, 26 Apr 2024 00:35:35 -0700 (PDT)
From: Yulon Liao <lylguagn@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <492b460f-4d4e-4817-bb05-f45101326c5an@googlegroups.com>
In-Reply-To: <04066d75-c4b6-4450-9986-47d2df5ad939n@googlegroups.com>
References: <04066d75-c4b6-4450-9986-47d2df5ad939n@googlegroups.com>
Subject: Re: non-root cell cpu clock always 24M
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_26076_211602195.1714116935821"
X-Original-Sender: lylguagn@gmail.com
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

------=_Part_26076_211602195.1714116935821
Content-Type: multipart/alternative; 
	boundary="----=_Part_26077_1746072243.1714116935821"

------=_Part_26077_1746072243.1714116935821
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

reason is known already, It is stimer1 value but not cpu frequency=20

=E5=9C=A82024=E5=B9=B44=E6=9C=8825=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+=
8 17:57:49<Yulon Liao> =E5=86=99=E9=81=93=EF=BC=9A

> Hi, everyone,
> I use chip: arm64 a55x4(rk3568)
> After jailhouse start non-root cell, I found that the non-root cpu=20
> frequency alway 24M, I don't know how to change it, any ideas?
>
> I change some cru/pmu registers , nothing happened.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/492b460f-4d4e-4817-bb05-f45101326c5an%40googlegroups.com.

------=_Part_26077_1746072243.1714116935821
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

reason is known already, It is stimer1 value but not cpu frequency <br /><b=
r /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=
=9C=A82024=E5=B9=B44=E6=9C=8825=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 1=
7:57:49&lt;Yulon Liao> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rg=
b(204, 204, 204); padding-left: 1ex;"><div><font color=3D"#000000">Hi, ever=
yone,</font><br></div><div>I use chip: arm64 a55x4(rk3568)</div><div>After =
jailhouse start non-root cell, I found that the non-root cpu frequency alwa=
y 24M, I don&#39;t know how to change it, any ideas?</div><div><br></div><d=
iv>I change some cru/pmu registers , nothing happened.</div></blockquote></=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/492b460f-4d4e-4817-bb05-f45101326c5an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/492b460f-4d4e-4817-bb05-f45101326c5an%40googlegroups.co=
m</a>.<br />

------=_Part_26077_1746072243.1714116935821--

------=_Part_26076_211602195.1714116935821--
