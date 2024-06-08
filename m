Return-Path: <jailhouse-dev+bncBCVZJANLUQORB7VFR6ZQMGQE4ZXICHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DB0900F5A
	for <lists+jailhouse-dev@lfdr.de>; Sat,  8 Jun 2024 05:41:52 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-df7a6530373sf5067353276.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2024 20:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717818111; x=1718422911; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wj67pvPlomgCXMT0vxVW/nBMJddg93KSU4vQnb8YRnU=;
        b=LxpJIotRQzkOewqx62/Q6IRUU3QgDVbl3vTxlgk9IlgynqdAkpsAZ3ELo8QjQpT3D7
         0oxbq1I5wweHNJXrU+BbPsUwvATRPweiZMUM3kRsAPMX6ZjbD97D3f0PR+8wcX6dHjaA
         P2TBh444V1miEytlJ8hMeITnYpzq/yV1FysEz1vmECN3V05PF6NMLM7g1f5Gx3MhY8Gl
         U9xI4cPWhh+JDUgLpgfs/4UD5am069sSoy4Srz3UuP63PfqVGtE3PbZYPA2Bp/uf8eDU
         Ye0kkLTn4nLLJGoIUn8UiOFhU1rnTMxkoeQ1BgBhQ/5YH7EaTO1QKOx3wMkn/0gWT6Uc
         kEyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717818111; x=1718422911; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wj67pvPlomgCXMT0vxVW/nBMJddg93KSU4vQnb8YRnU=;
        b=HsdH60FsuMIIzsQptXnBeCCz1o1QUmk/dYVuTexgMZQlPrwg89G1MBt4vPzIdouRZj
         51LG/R+fUzUKfC/GdJmJzmAusdOXklAvZVNKhMaaRS6BsRTRbElf9FFuUM/tCacU9okQ
         QCAZSQlLkcGHCyEphXwxErBWJ6twesfK8+IIu7Dxn7lZffBQiKSZX50Rq6jIZ4REhLoG
         vEqbN8lTIMT6oWY3d/HMcGB50p5WEwo+5Pxuak+EZbsjvMuI48p7XtMsT05a78nFcpiy
         Bum1YR7dmR7qXwADPr3d9/qdWXqAvQH+Zdat5wOBZXbrjFV4MoLpYfqJNSn5yipMT+Q+
         3UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717818111; x=1718422911;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wj67pvPlomgCXMT0vxVW/nBMJddg93KSU4vQnb8YRnU=;
        b=cPnfIx9RGBLF5ORB8oWcM5LXl9WJBu6W1MT5biEawcNwTD+zcM3tVOqgq+dWVVqtQx
         11TxUBE3g4bK3nIC3hK02IL3bVwqAtn6VLJyuIqmI1KdazFM9e8NkYps5b2147IK8NOU
         qfs3WsLQS6GR03BbU7R89AOkEi8qCB4FlBacJ/TcseQoo8BoQ0ZL9bLivmeiDk6M23JE
         CUKXXgZ1pD5EKrGBYmbs/7ztVJpdQ+VCsj9wxFIFquQ8GsFamGCPcHUMQKFKukweFR7I
         /B4Mq16sD1JwNNZxMmj8YKgCWdXjALwM1U2ZQhLVmtLLaHnFwkSpN8J+bk3DXD/9jZiq
         b6og==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXrP4kunZtlIJEjWI8Gih/+D+CcE2HDkabx3lBwDLYJthvCtavZgTleUA3DACwJlOjyNQhJXMik6fXPjXswwGVxJPwGMqDyNZbVoIg=
X-Gm-Message-State: AOJu0Ywii/SOT7VJyz2dlfkFsGgWs1jLNZ0sbnjSL62qZ+IIxKOdeNgA
	Vst1y/SagYtX06eMI/BhJkq/9s5QF5ZPZJ5aCso+hyhH0OU7HV8x
X-Google-Smtp-Source: AGHT+IH9Ld1uPWI7GHS3w9a40SoUFvpeBesqsAI8hUY1qaXrEn6NmgDV01j6COEFJBPDO53noIn4Yw==
X-Received: by 2002:a25:ae4f:0:b0:dfb:912:9713 with SMTP id 3f1490d57ef6-dfb0912983emr1884772276.11.1717818110754;
        Fri, 07 Jun 2024 20:41:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:fc09:0:b0:dfa:77ba:dc1f with SMTP id 3f1490d57ef6-dfaf162a805ls2123910276.2.-pod-prod-06-us;
 Fri, 07 Jun 2024 20:41:49 -0700 (PDT)
X-Received: by 2002:a05:690c:6d0d:b0:61b:e6d8:1c01 with SMTP id 00721157ae682-62cd568ca3dmr9545177b3.10.1717818108514;
        Fri, 07 Jun 2024 20:41:48 -0700 (PDT)
Date: Fri, 7 Jun 2024 20:41:47 -0700 (PDT)
From: Smith Crower <crowersmith440@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d83ab8a9-1856-4d2b-9367-3de6f931feddn@googlegroups.com>
In-Reply-To: <2fa40b8d-4aac-4759-9f10-11d5347ff6bdn@googlegroups.com>
References: <795dc3b1-be89-41c7-9671-d30f85711eaan@googlegroups.com>
 <0f3f8043-7aa0-4029-a9cc-8bf645291972n@googlegroups.com>
 <8369a91d-4047-4519-b342-65b33be6cf6en@googlegroups.com>
 <3d207a08-0b5e-445a-bb57-56e4822bc388n@googlegroups.com>
 <e8805f00-c8bb-4331-97d4-8aaa48820bf6n@googlegroups.com>
 <ef543eaf-4f84-4854-b391-4c3a04a27c3an@googlegroups.com>
 <d92306e5-4a6d-4b20-891e-ec35109c98ecn@googlegroups.com>
 <50eb5272-0367-4db0-9bf0-37d99524b72fn@googlegroups.com>
 <0378a22b-af83-460d-8ef9-db8cf0101f79n@googlegroups.com>
 <12017ac0-3bfd-48aa-901f-8955cfc43b6cn@googlegroups.com>
 <262bafc5-d42f-4e09-9f1a-887c4e3bcf35n@googlegroups.com>
 <da1f9334-ae6d-4cef-8b08-347a8ac13f2bn@googlegroups.com>
 <19f5f391-6330-4cc1-837e-6c1e6afb456bn@googlegroups.com>
 <d080ec3f-e2fd-4272-b9b6-996567bcac09n@googlegroups.com>
 <2fa40b8d-4aac-4759-9f10-11d5347ff6bdn@googlegroups.com>
Subject: Re: Buy DMT VAPE PEN, ECSTACY MOLLY ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_87023_724601698.1717818107639"
X-Original-Sender: crowersmith440@gmail.com
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

------=_Part_87023_724601698.1717818107639
Content-Type: multipart/alternative; 
	boundary="----=_Part_87024_1373167081.1717818107639"

------=_Part_87024_1373167081.1717818107639
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Buy all your psychedelic products with me including clone cards
All products are available for deliveries and drop offs
Fast shipping and delivery of packages to all locations worldwide=20
Let me know with your orders
Text me on telegram @Carlantonn01
You can also join my channel for more products and reviews,link below

https://t.me/psychoworldwide01
https://t.me/psychoworldwide01
https://t.me/psychoworldwide01
https://t.me/psychoworldwide01

Backup channel below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87

https://t.me/trippycross1
https://t.me/trippycross1
https://t.me/trippycross1


You can let me know anytime with your orders
Prices are also slightly negotiable depending on the quantity needed

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d83ab8a9-1856-4d2b-9367-3de6f931feddn%40googlegroups.com.

------=_Part_87024_1373167081.1717818107639
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Buy all your psychedelic products with me including clone cards<br />=
All products are available for deliveries and drop offs<br />Fast shipping =
and delivery of packages to all locations worldwide <br />Let me know with =
your orders<br />Text me on telegram @Carlantonn01<br />You can also join m=
y channel for more products and reviews,link below<br /><br />https://t.me/=
psychoworldwide01<br />https://t.me/psychoworldwide01<br />https://t.me/psy=
choworldwide01<br />https://t.me/psychoworldwide01<br /><br />Backup channe=
l below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87<br /><br />https://t.me/trippyc=
ross1<br />https://t.me/trippycross1<br />https://t.me/trippycross1<br /><b=
r /><br />You can let me know anytime with your orders<br />Prices are also=
 slightly negotiable depending on the quantity needed<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d83ab8a9-1856-4d2b-9367-3de6f931feddn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d83ab8a9-1856-4d2b-9367-3de6f931feddn%40googlegroups.co=
m</a>.<br />

------=_Part_87024_1373167081.1717818107639--

------=_Part_87023_724601698.1717818107639--
