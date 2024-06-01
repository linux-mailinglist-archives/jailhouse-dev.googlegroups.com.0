Return-Path: <jailhouse-dev+bncBDJ5VLND4MLRBG575OZAMGQEVQQZSSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113b.google.com (mail-yw1-x113b.google.com [IPv6:2607:f8b0:4864:20::113b])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2128D6EF4
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Jun 2024 10:45:17 +0200 (CEST)
Received: by mail-yw1-x113b.google.com with SMTP id 00721157ae682-629f8a71413sf46603137b3.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Jun 2024 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717231516; x=1717836316; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBmfHa9M1cqzqr47B9feupHWHVwTjdOAudhz1hIQKeA=;
        b=PKMSYGiGHDJWxOVVQb1r4QpR20C5UgWg7BO+RtTag1sWrkJq8Xgq7+qnRQt70DdYqt
         kfY0VfsrwpXGr3A84cgH1jatjIU4qB+C4qgLfAXwySLV5jU0z75sp1D3ZevtjOJmGP4Q
         bMnY4AIJmT4Xu0qIF83oYlzlSN2HJ5WHanAkC/6V3qxasb7MdHV7XDPqCNfGf6aRgRIc
         IPs5nbnHHp/KkTFyLoYZGewwGX/SU+GukKYhXMWKD23JvDoL/H88CjMMI9UyHnUm0N5v
         uf27IQXgD21awcWln/8mVTVO4Jm7qaU1p4RiZLKguqAJdA6y2hVgbMAgAJh5+FtGqdBy
         x8dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717231516; x=1717836316; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBmfHa9M1cqzqr47B9feupHWHVwTjdOAudhz1hIQKeA=;
        b=N2IUe6o3VhM1tpvOxRxwyA8/1tw/w9NXk+O2RXZmrVnHH4R0Le9qxuhUPzX0OwpTCR
         3hmcz6E9tWFVffwFeN+AqqeV8T14Lgw39EaPGWJEaiF3n2IvkpIsX9NNSpXtYMhG0uN8
         +fYCDlkjk1tKz31jDlKfehl/XxMfJzNuHfB/ODeKtZAmWJzhVIy4f2sOViGh9A7LmyPH
         LlTKVh6DUmdlyNtPh1daCLEb4qgaeDJIB1RuW377b6FgRtuDnEKFFhZFPlvteqsqM/5l
         dgXZubjbDIiYmg9MMN+BkVB4HaYZZdm7YHmHuf6d4luGuzgkEmvxxFSF63p0GjGL60uN
         0j4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717231516; x=1717836316;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBmfHa9M1cqzqr47B9feupHWHVwTjdOAudhz1hIQKeA=;
        b=dejUyV9GGX13ON/AGHy9wSYzmVxqMBINAGNXIbvgWosmeiReLtWyt7ZpUUegYRgyoQ
         EIQkKykqiqVHUUwvRxueixMWQI0+GtMXG0hi/rQ8+mtzMUy0rgNGmZ87D0TtWuU4FbdX
         8nZStWv92I21qPcJC6xvsmf+WHLXw8K9m1o41y00qIlkwHN5Xd2gp8PpI/1LqQmgBGLz
         7Or6eJOm5IuaboLd8rHqotuigZPi6ToDbgucqVa23ebdYri6hxH7Om6t0M9FwJh4tavh
         ru5ZbzOW4bs1hpPbgZ3tuYvPgl3AdeheprWNBc8rED6Atr7RvjJmC6IokTUAssG6tPoS
         fvfg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXcvsqyRueI5suN0iv5ZRr34TRrAa2ml6KsIvyYn0XZEJOy2Z+1nOKRoRLEUiGPPuMSI0/1cdGn3ZSYUFdxzq4UTxEAqdlxcYpu2Ug=
X-Gm-Message-State: AOJu0YzaTDnl1m5Bbc843aYMvDeh7loY/oWKJL5r6+4Cs8xdugIALLd/
	CrbxOtx//KppBujO6elqP3YgKf6oYcuFXw8zPbwq0rs2FF1EjJU0
X-Google-Smtp-Source: AGHT+IHkW37Fr/j9+4e9dL3DeSFq/iJXCeJ1rZQdkMDXcz3u0QHGZ3ZWYzgEfRCXYrCYjDd1d9EL+g==
X-Received: by 2002:a25:ac95:0:b0:df4:ab39:8c1f with SMTP id 3f1490d57ef6-dfa73dd2735mr4172835276.53.1717231516414;
        Sat, 01 Jun 2024 01:45:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b324:0:b0:df4:e1a7:3170 with SMTP id 3f1490d57ef6-dfa59b0029dls2421678276.2.-pod-prod-03-us;
 Sat, 01 Jun 2024 01:45:15 -0700 (PDT)
X-Received: by 2002:a05:690c:4b07:b0:627:a961:caee with SMTP id 00721157ae682-62c796b1075mr8822027b3.4.1717231514459;
        Sat, 01 Jun 2024 01:45:14 -0700 (PDT)
Date: Sat, 1 Jun 2024 01:45:13 -0700 (PDT)
From: Dwayne Mickey <dwnmickey@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3a2fedea-7608-4eef-9b1d-ec5efe8ae518n@googlegroups.com>
In-Reply-To: <cfc43845-9041-40e0-81f6-d71886acd878n@googlegroups.com>
References: <c1903dda-39bd-4ef8-97e2-0c2c0864a962n@googlegroups.com>
 <cfc43845-9041-40e0-81f6-d71886acd878n@googlegroups.com>
Subject: Re: ORDER CLONE CARDS ONLINE SWIFT CASHOUT FROM THE ATM MACHINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_128506_1641409774.1717231513798"
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

------=_Part_128506_1641409774.1717231513798
Content-Type: multipart/alternative; 
	boundary="----=_Part_128507_346535190.1717231513799"

------=_Part_128507_346535190.1717231513799
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
On Friday, May 31, 2024 at 12:29:15=E2=80=AFAM UTC+1 Will Smichel wrote:

> Get at me for your low & high balance clone cards going for cool prices.=
=20
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
=20
> Clone cards are spammed credit cards with clean funds. My clone cards are=
=20
> available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F=
 and can be used for online=20
> purchases. Our clone card comes with an ATM pin for easy cash outs =E2=84=
=A2=EF=B8=8F $300=20
> for balance $2k $400 for balance $5K $500for balance $7k $700 for balance=
=20
> $10k=20
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
 =20
> High balance $1k for balance $15k $3k for balance $30k $5k balance $50k $=
7k=20
> for balance $ 75k=20
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
=20
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
=20
> =E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB  =E2=80=A2 Swift Delivery On=
 DHL & FedEx express=20
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
 =20
> Text me now and make your
>
> On Thursday, May 30, 2024 at 6:24:19=E2=80=AFPM UTC+1 Williams Baylor wro=
te:
>
>> Get at me for your low & high balance clone cards going for cool prices.
>> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale=
/=20
>> Clone cards are spammed credit cards with clean funds. My clone cards ar=
e=20
>> available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=
=8F and can be used for online=20
>> purchases. Our clone card comes with an ATM pin for easy cash outs =E2=
=84=A2=EF=B8=8F
>> $300 for balance $2k
>> $400 for balance $5K
>> $500for balance $7k
>> $700 for balance $10k
>> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale=
/
>>
>> High balance
>> $1k for balance $15k
>> $3k for balance $30k
>> $5k balance $50k
>> $7k for balance $ 75k
>> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale=
/
>> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale=
/
>> =E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB
>>
>> =E2=80=A2 Swift Delivery On DHL & FedEx express
>> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale=
/
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3a2fedea-7608-4eef-9b1d-ec5efe8ae518n%40googlegroups.com.

------=_Part_128507_346535190.1717231513799
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
=3D"auto" class=3D"gmail_attr">On Friday, May 31, 2024 at 12:29:15=E2=80=AF=
AM UTC+1 Will Smichel wrote:<br/></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padd=
ing-left: 1ex;">Get at me for your low &amp; high balance clone cards going=
 for cool prices.
<a href=3D"https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-=
for-sale/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/goo=
d-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D171731787=
0270000&amp;usg=3DAOvVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/p=
roduct/good-trip-milk-chocolate-bars-for-sale/</a> Clone cards are spammed =
credit cards with clean funds. My clone cards are available for cash out in=
 ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F and can be used for online=
 purchases. Our clone card comes with an ATM pin for easy cash outs =E2=84=
=A2=EF=B8=8F
$300 for balance $2k
$400 for balance $5K
$500for balance $7k
$700 for balance $10k
<a href=3D"https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-=
for-sale/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/goo=
d-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D171731787=
0270000&amp;usg=3DAOvVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/p=
roduct/good-trip-milk-chocolate-bars-for-sale/</a>=C2=A0
High balance
$1k for balance $15k
$3k for balance $30k
$5k balance $50k
$7k for balance $ 75k
<a href=3D"https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-=
for-sale/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/goo=
d-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D171731787=
0270000&amp;usg=3DAOvVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/p=
roduct/good-trip-milk-chocolate-bars-for-sale/</a>
<a href=3D"https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-=
for-sale/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/goo=
d-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D171731787=
0270000&amp;usg=3DAOvVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/p=
roduct/good-trip-milk-chocolate-bars-for-sale/</a>
=E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB=C2=A0
=E2=80=A2 Swift Delivery On DHL &amp; FedEx express
<a href=3D"https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-=
for-sale/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/goo=
d-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D171731787=
0270000&amp;usg=3DAOvVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/p=
roduct/good-trip-milk-chocolate-bars-for-sale/</a>=C2=A0
Text me now and make your<br><br><div class=3D"gmail_quote"><div dir=3D"aut=
o" class=3D"gmail_attr">On Thursday, May 30, 2024 at 6:24:19=E2=80=AFPM UTC=
+1 Williams Baylor wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Get at me for your low &amp; high balance clone cards going for cool p=
rices.<br><a href=3D"https://t.me/Ricko_swavy8/product/good-trip-milk-choco=
late-bars-for-sale/" rel=3D"nofollow" target=3D"_blank" data-saferedirectur=
l=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/p=
roduct/good-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=
=3D1717317870270000&amp;usg=3DAOvVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ri=
cko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/</a> Clone cards =
are spammed credit cards with clean funds. My clone cards are available for=
 cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F and can be use=
d for online purchases. Our clone card comes with an ATM pin for easy cash =
outs =E2=84=A2=EF=B8=8F<br>$300 for balance $2k<br>$400 for balance $5K<br>=
$500for balance $7k<br>$700 for balance $10k<br><a href=3D"https://t.me/Ric=
ko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/" rel=3D"nofollow"=
 target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
en&amp;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-=
for-sale/&amp;source=3Dgmail&amp;ust=3D1717317870270000&amp;usg=3DAOvVaw1QQ=
iv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/product/good-trip-milk-choco=
late-bars-for-sale/</a><br><br>High balance<br>$1k for balance $15k<br>$3k =
for balance $30k<br>$5k balance $50k<br>$7k for balance $ 75k<br><a href=3D=
"https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/"=
 rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-mil=
k-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D1717317870270000&am=
p;usg=3DAOvVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/product/goo=
d-trip-milk-chocolate-bars-for-sale/</a><br><a href=3D"https://t.me/Ricko_s=
wavy8/product/good-trip-milk-chocolate-bars-for-sale/" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-=
sale/&amp;source=3Dgmail&amp;ust=3D1717317870270000&amp;usg=3DAOvVaw1QQiv1K=
UmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate=
-bars-for-sale/</a><br>=E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB<br><br>=
=E2=80=A2 Swift Delivery On DHL &amp; FedEx express<br><a href=3D"https://t=
.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/" rel=3D"no=
follow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-milk-chocolat=
e-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D1717317870270000&amp;usg=3DAO=
vVaw1QQiv1KUmQYNhMrDmyFQ-0">https://t.me/Ricko_swavy8/product/good-trip-mil=
k-chocolate-bars-for-sale/</a><br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3a2fedea-7608-4eef-9b1d-ec5efe8ae518n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3a2fedea-7608-4eef-9b1d-ec5efe8ae518n%40googlegroups.co=
m</a>.<br />

------=_Part_128507_346535190.1717231513799--

------=_Part_128506_1641409774.1717231513798--
