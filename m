Return-Path: <jailhouse-dev+bncBDJ5VLND4MLRBTFH6OZAMGQER3AU6LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E228D77D5
	for <lists+jailhouse-dev@lfdr.de>; Sun,  2 Jun 2024 22:19:26 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-df771b5e942sf6393940276.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717359565; x=1717964365; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FpySEk6MaiZDjgamrVHn8USCp2EdthNGQxRUqqojA9k=;
        b=GlKhNOoVgGcx6f3mpnSPMT/Knv2U69JFI5b+gJlsMW7V+ynz5o1dQ522iccklPkdDo
         XQfk0i468qdulk800yMzQ7LvLACcxNs6twEyVjxeNUpbwugRxagaw0YJ1LdzmWtK+KbS
         QZxBjUqiGnmV53Xtk793rXupcVxfEMyWGy4aXnH9sqoDSdTI4/GhOOxBHfqzpZDVMaK5
         HXF7vAjZaB4qP6xP0GdARwsQfuzunhEjMTP5E8RcH3byTvATlC03p+5oALBi1xjfVqow
         /ouY6lPvPORLm1Rx7m4VN9yg1cLtF/FrwKhMITF3ZoQZMWreiMYF+xG7YgGF8o0zN7lg
         WlmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717359565; x=1717964365; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpySEk6MaiZDjgamrVHn8USCp2EdthNGQxRUqqojA9k=;
        b=XqiitLd7kaHWMMHIxJLvrF8NSww5Am6QmFGLNdSW82JnsPWr0xpc9XFODC1IFfIFsU
         6ie2QdVh6NlEELThqSGb3NYA6gplCoFjrF4IAX6AnX9eMxrshH/39t86xdcHAbC8VFFt
         x2Vprk28G+g+3r5Fob9WDtvyHR2LzlgxuOloS3Ow6HOq3oDevbnUHVcs3nFKuo+wuyx4
         Pma+wNfWYLsRFcuZGsoGDA3X/jaJeRNLE5M2i2Mkdk0h+nE+QDuqJdkxsfdoBoRfyMGW
         v6OiDA1jY1HM7LzREF26Y84BUOxxGyoI2Z5tUtFFz6mTaqqtsK5ETgszHt6HWWmISmsw
         XBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717359565; x=1717964365;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FpySEk6MaiZDjgamrVHn8USCp2EdthNGQxRUqqojA9k=;
        b=dh54z4ZV9u3QzEkPv7sd/0lpM/5Y31jaJNT28Y6ObTy0spwpq59PB8ifca4pn9kM7j
         0Kp0IewvoSQ4JwqqioLLwTDYhXOMku4CorkPyq4BB0o/BdUUwKsepkB6TKRWoynZmEgz
         3YkDZ69dbJwW65LNQ3JKx8Nw/dKj0hP6+tvWe/CPFEXN51qz72206MI/j61UR16MDv3h
         GgK+6oB1Mf0tVdqgD9QCbrsn9vRLp0UvIWcsZwG8wIwQCxq2ZjuNS8Ob9KyZDdfzs6Id
         Y4c4JbUzKxqzKz2nrB8maBn2S+MMAn7x78AHoPDb9S5l9fkcMMQM0biHgkvPnxzlzg4c
         w/gg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUsGI6StQYIVeiYD5cikkrs5ksJ3FZ/fsLiU7M0qJsLw17HmPAGrzEdJ4cTR8M8ZYM1JpWEj238X86pjxdW9CcDIQf1k835bfEkuF4=
X-Gm-Message-State: AOJu0YywM25CXfOk2wqEJbd6+2QCRDlc0tjEKm5VUaLJgqkAgeovxqZp
	fnfNYSWZjLwF/EHEehhcvM7/jpgN5f/jD3s2Oqlyyf1qYqt+5sfH
X-Google-Smtp-Source: AGHT+IEF8BlzxaOG3S/iAELZJMFfAhgQzE/3sPrynePZAeTUWwHO+vFMEZ0TaSAPs4dVU4JZBEIMXg==
X-Received: by 2002:a25:d6d4:0:b0:df7:a75c:28e0 with SMTP id 3f1490d57ef6-dfa73c40be0mr6909101276.36.1717359565529;
        Sun, 02 Jun 2024 13:19:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:253:0:b0:de5:a5cb:9690 with SMTP id 3f1490d57ef6-dfa595d8a16ls240762276.0.-pod-prod-02-us;
 Sun, 02 Jun 2024 13:19:24 -0700 (PDT)
X-Received: by 2002:a81:4c03:0:b0:62a:5309:57ed with SMTP id 00721157ae682-62c796b0f91mr18225117b3.2.1717359564013;
        Sun, 02 Jun 2024 13:19:24 -0700 (PDT)
Date: Sun, 2 Jun 2024 13:19:23 -0700 (PDT)
From: Dwayne Mickey <dwnmickey@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bacb756a-78ac-4687-a33e-f7ab1f6ffc70n@googlegroups.com>
In-Reply-To: <446876dc-adb4-4fdc-ba8e-ecae817ea8f4n@googlegroups.com>
References: <446876dc-adb4-4fdc-ba8e-ecae817ea8f4n@googlegroups.com>
Subject: Re: GET AT ME FOR YOUR LOW &HIGH BALANCE CLONE CARD FOR COOL PRICES
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_469678_346750365.1717359563338"
X-Original-Sender: dwnmickey@gmail.com
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

------=_Part_469678_346750365.1717359563338
Content-Type: multipart/alternative; 
	boundary="----=_Part_469679_341439372.1717359563338"

------=_Part_469679_341439372.1717359563338
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Get at me for your low & high balance clone cards going for cool prices.
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
=20
Clone cards are spammed credit cards with clean funds. My clone cards are=
=20
available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F a=
nd can be used for online=20
purchases. Our clone card comes with an ATM pin for easy cash outs =E2=84=
=A2=EF=B8=8F
$300 for balance $2k
$400 for balance $5K
$500for balance $7k
$700 for balance $10k
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

High balance
$1k for balance $15k
$3k for balance $30k
$5k balance $50k
$7k for balance $ 75k
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
=E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB

=E2=80=A2 Swift Delivery On DHL & FedEx express
https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

Text me now and make your
On Saturday, June 1, 2024 at 11:32:32=E2=80=AFAM UTC+1 Asah Randy wrote:

>
> Get at me for your low & high balance clone cards going for cool prices.
>
>
> https://t.me/motionking_caliweed_psychedelics
>
>
> Clone cards are spammed credit cards with clean funds. My clone cards are=
=20
> available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F=
 and can be used for online=20
> purchases. Our clone card comes with an ATM pin for easy cash outs =E2=84=
=A2=EF=B8=8F
> $300 for balance $2k
> $400 for balance $5K
> $500for balance $7k
> $700 for balance $10k
>
> https://t.me/motionking_caliweed_psychedelics
>
> High balance
> $1k for balance $15k
> $3k for balance $30k
> $5k balance $50k
> $7k for balance $ 75k
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bacb756a-78ac-4687-a33e-f7ab1f6ffc70n%40googlegroups.com.

------=_Part_469679_341439372.1717359563338
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Get at me for your low &amp; high balance clone cards going for cool =
prices.<div>https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars=
-for-sale/ Clone cards are spammed credit cards with clean funds. My clone =
cards are available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=
=EF=B8=8F and can be used for online purchases. Our clone card comes with a=
n ATM pin for easy cash outs =E2=84=A2=EF=B8=8F</div><div>$300 for balance =
$2k</div><div>$400 for balance $5K</div><div>$500for balance $7k</div><div>=
$700 for balance $10k</div><div>https://t.me/Ricko_swavy8/product/good-trip=
-milk-chocolate-bars-for-sale/</div><div><br /></div><div>High balance</div=
><div>$1k for balance $15k</div><div>$3k for balance $30k</div><div>$5k bal=
ance $50k</div><div>$7k for balance $ 75k</div><div>https://t.me/Ricko_swav=
y8/product/good-trip-milk-chocolate-bars-for-sale/</div><div>https://t.me/R=
icko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/</div><div>=E2=
=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB</div><div><br /></div><div>=E2=80=
=A2 Swift Delivery On DHL &amp; FedEx express</div><div>https://t.me/Ricko_=
swavy8/product/good-trip-milk-chocolate-bars-for-sale/</div><div><br /></di=
v><div>Text me now and make your</div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">On Saturday, June 1, 2024 at 11:32:32=E2=80=
=AFAM UTC+1 Asah Randy wrote:<br/></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); pad=
ding-left: 1ex;"><br><div><span style=3D"color:rgb(80,0,80)">Get at me for =
your low &amp; high balance clone cards going for cool prices.</span><div s=
tyle=3D"color:rgb(80,0,80)"><br></div><div style=3D"color:rgb(80,0,80)"><br=
></div><div style=3D"color:rgb(80,0,80)"><a href=3D"https://t.me/motionking=
_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_=
caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717445919379000&amp;usg=
=3DAOvVaw31lFNHSZ0k-KesPWgHodzA">https://t.me/motionking_caliweed_psychedel=
ics</a><br></div><div style=3D"color:rgb(80,0,80)"><br></div><div style=3D"=
color:rgb(80,0,80)"><br></div><div style=3D"color:rgb(80,0,80)">Clone cards=
 are spammed credit cards with clean funds. My clone cards are available fo=
r cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F and can be us=
ed for online purchases. Our clone card comes with an ATM pin for easy cash=
 outs =E2=84=A2=EF=B8=8F</div><div style=3D"color:rgb(80,0,80)">$300 for ba=
lance $2k</div><div style=3D"color:rgb(80,0,80)">$400 for balance $5K</div>=
<div style=3D"color:rgb(80,0,80)">$500for balance $7k</div><div style=3D"co=
lor:rgb(80,0,80)">$700 for balance $10k</div><div style=3D"color:rgb(80,0,8=
0)"><br></div><div style=3D"color:rgb(80,0,80)"><a href=3D"https://t.me/mot=
ionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/moti=
onking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717445919379000&=
amp;usg=3DAOvVaw31lFNHSZ0k-KesPWgHodzA">https://t.me/motionking_caliweed_ps=
ychedelics</a><br></div><div style=3D"color:rgb(80,0,80)"><br></div><div st=
yle=3D"color:rgb(80,0,80)">High balance</div><div style=3D"color:rgb(80,0,8=
0)">$1k for balance $15k</div><div style=3D"color:rgb(80,0,80)">$3k for bal=
ance $30k</div><div style=3D"color:rgb(80,0,80)">$5k balance $50k</div><div=
 style=3D"color:rgb(80,0,80)">$7k for balance $ 75k</div></div></blockquote=
></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bacb756a-78ac-4687-a33e-f7ab1f6ffc70n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bacb756a-78ac-4687-a33e-f7ab1f6ffc70n%40googlegroups.co=
m</a>.<br />

------=_Part_469679_341439372.1717359563338--

------=_Part_469678_346750365.1717359563338--
