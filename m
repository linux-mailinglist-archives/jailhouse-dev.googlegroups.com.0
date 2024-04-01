Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB56ZVKYAMGQEQWSXWVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1140.google.com (mail-yw1-x1140.google.com [IPv6:2607:f8b0:4864:20::1140])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD33893B1B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:47:52 +0200 (CEST)
Received: by mail-yw1-x1140.google.com with SMTP id 00721157ae682-60a61b31993sf71247757b3.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711975671; x=1712580471; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JS96NaPxOnUoQGTVZJxc9ZuUbLTgTxlrtYwue7b7BtE=;
        b=dbJ/h3iIg6Hs1Xr84qbDzLjpBzamnnZu8sI6NmH3m8HI/r1JjwYpwMkhEkMKualzoS
         qG2GH25SML8jYOeS37kwaDWchc4fJvGtdMgAwodwi1hV2YSTF/CkUK3TIxF4J7FxHfDX
         3h34cDSz+CK2SriqvvqRovRS4JGstAF0KBsIlq9LIphEREMQ1hFHnxYouZSUamQxmFzj
         /hOomQeHgeeRkooyBk3jXhLbYED/2aDvCC77TVpV4hsaVRXywdPle2h24uMHcrO/vjpr
         yc4mQukzJeZJRayRl49uWHUf/dwc17CSqo7HWHs1cJ8NG/Nqg8DY0SwAN6MU3Y72r5sE
         IGsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711975671; x=1712580471; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JS96NaPxOnUoQGTVZJxc9ZuUbLTgTxlrtYwue7b7BtE=;
        b=VAkoYNNr9mxPL8giCtW+lxFffm3jdAfhzwXIlYnZyPaFVS/0cn4uAhEc0SIpM3U6gq
         0gqv27HLHfp91uuLJRwD0BcUfiTfHNR/gK61MKBq9A0nUoPTrR0DBb31kE0krWa8oarT
         oKlTj0Ig4Q7lno2kuO8qzi//TbKkSkK9gaDxB2oiSLZn8vFFoOQapNfgUL3BJJg2ZkQw
         vMmMOw4xDF3aRL65xqv2ss700/sYpr2veGfqq6tigq37muNtADlCO/n8BdDS8P1LF/Pq
         C/KEcInPDU0yDotKkrJFZihKeZx3D1e6CcMj13IEBCkQWTUvsGtPnUSBz0Vc6d3ROoGP
         Nw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975671; x=1712580471;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JS96NaPxOnUoQGTVZJxc9ZuUbLTgTxlrtYwue7b7BtE=;
        b=jdw0wKjFRC8JIaPLHeeVOMI0UMuphSnwsg1i6eDBhuVUBjCTUjVIwZv6WwoD5wDBN3
         5bGoowGCw4BdisF3JuGVBUYcIdnp0uZ0TS6orPpbhROtEqtTi0gDY1itn7sMwr4Vvi3A
         IysH7Lhi9U2MVrd+0fPfSxef/9p3Zp1NVH7zUXg5Vh1lB4m5c9bedxQXB3J8JzYAk0kD
         FSVwzcbqckrj7Xzl+vhT3ximwbf8eforl5Gog5km4R459HJLHuUnVOSUrs5ffyJH1fxH
         oY+Clq2VSW119vn9IVBBT7/3o99zNh5N8XAeTtcGs+LZDc+me4O05sflEkQ1bUL03nHv
         yJsg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUI4B8rFG4Z0wk+L2mFMwSuw2x1kNWVXCLTsYEND5AA4Lqk6VQDCwS/eYX9KsqbfOa1TtpfaXD1Zg34iQ4QhS0BTz7luVuD3sWZbz8=
X-Gm-Message-State: AOJu0YweYhQH5ImlHkxeGARHJH9B1Woq1IVhf62g4F5Ut2cGGT/G7hCh
	VYaVw4TxZnt71flsLjU8XFK2ZeRVPYgVaAce3dxx+SCl/CZP/lKh
X-Google-Smtp-Source: AGHT+IHWmFtD3pwL4Han2nAMcdsP3tiPD03XCoB1uIAwG7td+hcDvbE6qIvyNyoa/I9CIL6saCPF6Q==
X-Received: by 2002:a05:6902:11:b0:dd1:55b6:e671 with SMTP id l17-20020a056902001100b00dd155b6e671mr7447662ybh.21.1711975671646;
        Mon, 01 Apr 2024 05:47:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:aa29:0:b0:dcb:b370:7d12 with SMTP id s38-20020a25aa29000000b00dcbb3707d12ls1454348ybi.1.-pod-prod-00-us;
 Mon, 01 Apr 2024 05:47:50 -0700 (PDT)
X-Received: by 2002:a25:c753:0:b0:dd3:f55f:ff02 with SMTP id w80-20020a25c753000000b00dd3f55fff02mr2588338ybe.1.1711975670357;
        Mon, 01 Apr 2024 05:47:50 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:47:49 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1f52b026-3344-40cb-83e2-067e9ae01de5n@googlegroups.com>
In-Reply-To: <FR2P281MB0012344B03A77623DC1DC278D6312@FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM>
References: <Adp8JuO1iMwOs0b0TfKEUXcqEhIvHA==>
 <FR2P281MB0012344B03A77623DC1DC278D6312@FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM>
Subject: Re: helpdesk
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13618_921247378.1711975669690"
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

------=_Part_13618_921247378.1711975669690
Content-Type: multipart/alternative; 
	boundary="----=_Part_13619_537869615.1711975669690"

------=_Part_13619_537869615.1711975669690
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1f52b026-3344-40cb-83e2-067e9ae01de5n%40googlegroups.com.

------=_Part_13619_537869615.1711975669690
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
om/d/msgid/jailhouse-dev/1f52b026-3344-40cb-83e2-067e9ae01de5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1f52b026-3344-40cb-83e2-067e9ae01de5n%40googlegroups.co=
m</a>.<br />

------=_Part_13619_537869615.1711975669690--

------=_Part_13618_921247378.1711975669690--
