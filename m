Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB46XVKYAMGQE6LZNSTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E5893B0D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:43:33 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2sf5428508276.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711975412; x=1712580212; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oY6X1ZS17QRzaEU9Or3clpq8j9DLRonnFOkv1cO1al4=;
        b=FFh4I5CefUPI+yawo7/OJwrX6/YMWUYFbEuRdrgWp/UOqaXEZiNybS+I3Y+Ghkc4wk
         eh7l2uGaEcCPgeiHlJ5CfEYvZ7mCZavhLyGXMgP6DcElADdgBsKhNxgzndFmmEbvqR1N
         1ZRFY8+28K49cqDbh3KQe9B7tD3CKeA/vCIB3MHS9XqfM5TA0thm+QQ1TDSvvgk2nvZ8
         wiexxZTQWNfg+7uMVusaHF/Nad0e5ioMGMTjPi066FtDF5xpOu5NuhSw1lAd1Gr6yEvN
         93kH7y5Eo1I8ECP3yTVMRgmN5ZQDQuK3CpbBGJLr0lDL8vuwEWxiQZfMz7mmcxmKnEd1
         H+AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711975412; x=1712580212; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oY6X1ZS17QRzaEU9Or3clpq8j9DLRonnFOkv1cO1al4=;
        b=ju43oekazcpxIm+vddPSpLecntEWn71fU2bmuyWaavmrCz2mxXVWQVSWsNTDi1LGYq
         PI0d9K/uoJw28GJapHMGxvNm06Ykc0y1BnwDhxcoJzxiMUajUM7Fmt96JJVsITdyzipg
         ktL6zLpwPxzN5QyNTh6SFaUg7UQF+SZ+V5kRoMz7193Vq4q9Ql6pJZGTQ1VmZPDhkscg
         hGMtNnx8hEtWXy/sKfCcoQMIgk5fLOMkhVidKSLRn8QnFFssVoDgL6HCIwSdMEQsW3/w
         TwPsSmrCFNqV6CryUSGAijGn2Xa79nQLCEX1nVOEEbSkYkEw6QMsUvbmkd5aGc9u5WPx
         W7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975412; x=1712580212;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oY6X1ZS17QRzaEU9Or3clpq8j9DLRonnFOkv1cO1al4=;
        b=RSPMwxYYmobVcDKHuOklpd/+7MrY4Wwov5+/Ka3L2AsKc/5D3PwZB45xdwq2d+wYDx
         sYx73o5v01LTbKL5ckPhpxeYeGq9fgd1y6InCgpGWS4sid7MXpXwlDq00uZ/fuHrhb7m
         bGyA66isKqbOFywFlSPm0NSXPxfoBQ3iYKirlHGg16MBoUIZvXsJ/xla5+mippYWk/2X
         zjW4mtwol3OTZyyvLwXOOwTx+uj3kZMQHOJzqVCL4xU8LUtAnNlC09tkS38+NfJCdfAs
         7y1yCmfACishJhg5cziPF0xZ1q5okoR91KnWnt7xK+Zwzu/WJUd6LZ40+hnbAWaffq/r
         NnVQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVYjwCXidkLGa5JRAqm1XlnNau4L5JwtN9xQosDkvmicRQXIm9ywqEaRwcDxiIJETmL9XlzuCpeuZMkU/KFZT689aUvM81+XbZWviI=
X-Gm-Message-State: AOJu0Yx+/PL+M2G5JiSiLlDcWynHk7zHWLVoomui7tQDfrw2G+Q85o/G
	LC5dAsSLWxrm42MLk1nJBO8QouFN8X5k2rLKSBdFYQDsYq5MQr0p
X-Google-Smtp-Source: AGHT+IFPYFghev80KQleJ6rOr+XHI4qdbINmw229DsZl8mcPbHD2Nyu1wSI0zbkxZxJQkqgxlQ8SNw==
X-Received: by 2002:a25:f622:0:b0:dd0:972b:d218 with SMTP id t34-20020a25f622000000b00dd0972bd218mr8226302ybd.41.1711975412243;
        Mon, 01 Apr 2024 05:43:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ac63:0:b0:dcd:202d:6be7 with SMTP id r35-20020a25ac63000000b00dcd202d6be7ls95685ybd.0.-pod-prod-05-us;
 Mon, 01 Apr 2024 05:43:30 -0700 (PDT)
X-Received: by 2002:a05:6902:1b84:b0:dc7:68b5:4f21 with SMTP id ei4-20020a0569021b8400b00dc768b54f21mr3061159ybb.9.1711975410441;
        Mon, 01 Apr 2024 05:43:30 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:43:29 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fee16279-0700-4724-a314-c3e9a2056421n@googlegroups.com>
In-Reply-To: <7fb62033-59ae-4019-a100-26f76d282af3n@googlegroups.com>
References: <7fb62033-59ae-4019-a100-26f76d282af3n@googlegroups.com>
Subject: Re: Jailhouse Compilation Error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_184716_439522842.1711975409729"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_184716_439522842.1711975409729
Content-Type: multipart/alternative; 
	boundary="----=_Part_184717_516198928.1711975409729"

------=_Part_184717_516198928.1711975409729
Content-Type: text/plain; charset="UTF-8"

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fee16279-0700-4724-a314-c3e9a2056421n%40googlegroups.com.

------=_Part_184717_516198928.1711975409729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fee16279-0700-4724-a314-c3e9a2056421n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fee16279-0700-4724-a314-c3e9a2056421n%40googlegroups.co=
m</a>.<br />

------=_Part_184717_516198928.1711975409729--

------=_Part_184716_439522842.1711975409729--
