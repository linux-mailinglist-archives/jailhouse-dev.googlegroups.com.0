Return-Path: <jailhouse-dev+bncBDJ5VLND4MLRBZVG6OZAMGQEKT5JATA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FEF8D77CC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  2 Jun 2024 22:17:44 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-dfa73db88dcsf3623329276.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717359463; x=1717964263; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YweqMnZukmqhgjNv/7veYNnYZEG/W0KsZdEwswKaqz4=;
        b=V21wVf84fGOr48r/kxFbhnb3AFDReLG9hh69sjDEMdbSmf9DwQ+shtEGOz2VCKTx69
         5DK4XoAacbd1GQFE7OcVhwR/42rXdQ+XlVb5bmE7LqoaGH7jqW/lv5KFLCiYLaRN4jUo
         gsOl9E2Hfp8g3Z1Eb363gaao3AeQhthOQBKfVyZYt9P2vaN8zwsAJJ0E/3seJxmArJsM
         sJnrfD2jIs0Ua88haGNqSwsCTl+GZRXFeuKhZxXDFbW+2zGEOzMDNBaVCieXdSVuyQpY
         4/UPKtiKblcmr2et+McalPIdLsdXJLSyb6pTyDUS2IGk9jbcpUKeM9vlgOD+hYdLVU7y
         MmZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717359463; x=1717964263; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YweqMnZukmqhgjNv/7veYNnYZEG/W0KsZdEwswKaqz4=;
        b=U/P4/0l83QMOZflX3rgryCTkBH9cYmYK5300m88krBpJiY0iba6qfnDWaxB3QRIYh+
         KBi9Jwuj/PhxiSenTgXio0qgnoPhus//8Y7ZNgBRC9CvIWg3tbrdch5IgTaHDZUkgxxE
         /OWieG5ahvJqBfq7g0wL642wuhTiHocOxZvvWSL3PzLoizpc9iRHzKiZ8Ps9gxmNq2YM
         k6eGji2Q7R7ypncHb7KizkYktThvYsX4vpli2o/JuON1jU9tsjt6epjPaA934ynOVs6V
         70n2qQW+XaEU9n5+bSJD3HycGwSobanRto8vvJibjg4ctPIC/Njantyr9UxxCupSpnWn
         /58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717359463; x=1717964263;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YweqMnZukmqhgjNv/7veYNnYZEG/W0KsZdEwswKaqz4=;
        b=e73tDRS9u86ouSjJeiTxKe5ltkkxEc+4nWf7ez0b1opw4uMUIL9T95Z7a4NofuBnmV
         cOqd74JUSwqP+EJm5JauICFx9J8Du5wBBh4nSzLYyayiiBxGs3poiLd8x3Dd1jMndyev
         ClUf4n5twZI7XH04Ai2i2S+KvRzw+8Xm95N1WxQNwExVi8DAhExI3uF6XOJ3NCgwUpyL
         2kj/tTkElJ4jUvvPkplju6WV8tyrVWSvI8+FcW9R/p7K2Vgo35tRgNtXGLaW4fKvdEnY
         pMrMVSBh/FZdOKPX4Wb/F6Pds1vr/A+AyFPCvoZaJ50uc+fmaA6hCJBY3ixpc+yjCIH/
         PvZw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCW/e2cUS3xyvbKL2TFwTOHRVtYOXSc8b6NP+RxLM+F88uyo6uiZ6xK4Z8iRaFFSHxyTFBRaXctCn5b297qmitR72gSJXTOC9y1Oh2w=
X-Gm-Message-State: AOJu0YykFm5e1PHrOeVdKaH4aUyDsFcJHe7Ljmh2GOcvdOlWI572dHFS
	uaOl22vFjdX96GfruDO21xC478Ehj4AZIWBH+0JE+P60Occei4fA
X-Google-Smtp-Source: AGHT+IHasJ915uclmX3o0IA/j4KEAowM9mvAJx0eo/l1CPDt51dE2q5yOoipnR3wlat9BzYxJmMGQg==
X-Received: by 2002:a25:8008:0:b0:df4:50a4:e21c with SMTP id 3f1490d57ef6-dfa73d9e7b5mr6982812276.46.1717359463433;
        Sun, 02 Jun 2024 13:17:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:253:0:b0:de5:a5cb:9690 with SMTP id 3f1490d57ef6-dfa595d8a16ls240228276.0.-pod-prod-02-us;
 Sun, 02 Jun 2024 13:17:42 -0700 (PDT)
X-Received: by 2002:a05:690c:dcf:b0:622:c8eb:6ffd with SMTP id 00721157ae682-62c794aa9a5mr23118847b3.0.1717359461882;
        Sun, 02 Jun 2024 13:17:41 -0700 (PDT)
Date: Sun, 2 Jun 2024 13:17:40 -0700 (PDT)
From: Dwayne Mickey <dwnmickey@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d733ed98-17be-4029-b96b-407142be4901n@googlegroups.com>
In-Reply-To: <f2ee268a-9788-4c77-a180-8384ff1a1b5cn@googlegroups.com>
References: <ba978c38-a6be-4d27-ac21-31299ce61affn@googlegroups.com>
 <cb3b68b2-1d11-4956-842e-9d1ec707936an@googlegroups.com>
 <82a144e2-6359-4ef8-8919-a784e82897afn@googlegroups.com>
 <f2ee268a-9788-4c77-a180-8384ff1a1b5cn@googlegroups.com>
Subject: Re: BUY ONE UP MUSHROOM CHOCOLATE BARS ONLINE IN USA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_403143_1765942555.1717359460880"
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

------=_Part_403143_1765942555.1717359460880
Content-Type: multipart/alternative; 
	boundary="----=_Part_403144_162819116.1717359460880"

------=_Part_403144_162819116.1717359460880
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Great Taste =E2=80=93 A chocolate bar that makes you trip your face off. Ho=
w could=20
that not be the dream?
Clean High =E2=80=93 We formulated this chocolate bar to produce a clean hi=
gh that=20
won=E2=80=99t leave you crashing after the initial peak. shroom chocolate
True Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mushr=
ooms=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality of=20
your trip, in fact, you may even decide to switch to edibles!
Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that doesn=
=E2=80=99t=20
necessarily mean you want to be seen stuffing your face with them. For=20
those who want to keep it classy and discrete, nibbling on some chocolate=
=20
is the way to go. shroom chocolate bar
Versatile Dosage =E2=80=93 The combined 3.5g of mushrooms in this chocolate=
 can be=20
broken up for versatile dosage. Each square of this chocolate bar contains=
=20
approximately .6g of Magic Mushrooms, while each bar contains 3.5g. Whether=
=20
it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has got =
you=20
covered. shroom chocolate bar

https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

Buy Good Trip Mushroom Chocolate Bars Online
Have you ever wished mushrooms tasted better? We=E2=80=99re here to grant t=
hat wish=20
by bringing you our Good Trip Mushroom Chocolate Bar. This bar is tasty,=20
irresistible also, contains a total of 3.5g of Magic Mushrooms ( 6 grams=20
per chocolate square). And can be broken off into squares for flexible=20
shroom dosage.

https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

IT has an awesome taste and smells good too chocolate. Good Trip Mushroom=
=20
Chocolate Bars makes you trip your face off. So, how could that not be the=
=20
dream?. =E2=80=A2

https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

Clean High =E2=80=93 We formulated this chocolate bar to produce a clean hi=
gh that=20
won=E2=80=99t leave you crashing after the initial peak.

https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/

True Psychedelic Experience Just cause it doesn=E2=80=99t taste like mushro=
oms=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality of=20
your trip, in fact, you may even decide to switch to edibles!
:Sneaky-Sure, Magic Mushrooms are legal in Canada but that doesn=E2=80=99t=
=20
necessarily mean you want to be seen stuffing your face with them For those=
=20
who want to keep it classy and discrete, nibbling on some chocolate is the=
=20
way to go. shroom chocolate bar =E2=80=A2
On Sunday, June 2, 2024 at 9:27:48=E2=80=AFAM UTC+1 Asah Randy wrote:

> https://t.me/prime_house00
>
> Great Taste =E2=80=93 A chocolate bar that makes you trip your face off. =
How could=20
> that not be the dream?
>
> Clean High =E2=80=93 We formulated this chocolate bar to produce a clean =
high that=20
> won=E2=80=99t leave you crashing after the initial peak. shroom chocolate
>
> True Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mus=
hrooms=20
> doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find a=
ny drop in the quality of=20
> your trip, in fact, you may even decide to switch to edibles!
>
> Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that does=
n=E2=80=99t=20
> necessarily mean you want to be seen stuffing your face with them. For=20
> those who want to keep it classy and discrete, nibbling on some chocolate=
=20
> is the way to go. shroom chocolate bar
>
> Versatile Dosage =E2=80=93 The combined 3.5g of mushrooms in this chocola=
te can be=20
> broken up for versatile dosage. Each square of this chocolate bar contain=
s=20
> approximately .6g of Magic Mushrooms, while each bar contains 3.5g. Wheth=
er=20
> it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has go=
t you=20
> covered. shroom chocolate bar
>
> https://t.me/prime_house00
>
> On Sunday, June 2, 2024 at 2:25:35=E2=80=AFAM UTC-6 Asah Randy wrote:
>
> https://t.me/prime_house00
>
> Buy Good Trip Mushroom Chocolate Bars Online
>
> Have you ever wished mushrooms tasted better? We=E2=80=99re here to grant=
 that=20
> wish by bringing you our Good Trip Mushroom Chocolate Bar. This bar is=20
> tasty, irresistible also, contains a total of 3.5g of Magic Mushrooms ( 6=
=20
> grams per chocolate square). And can be broken off into squares for=20
> flexible shroom dosage.
>
>
> https://t.me/prime_house00
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d733ed98-17be-4029-b96b-407142be4901n%40googlegroups.com.

------=_Part_403144_162819116.1717359460880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Great Taste =E2=80=93 A chocolate bar that makes you trip your face o=
ff. How could that not be the dream?<div>Clean High =E2=80=93 We formulated=
 this chocolate bar to produce a clean high that won=E2=80=99t leave you cr=
ashing after the initial peak. shroom chocolate</div><div>True Psychedelic =
Experience -Just cause it doesn=E2=80=99t taste like mushrooms doesn=E2=80=
=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any drop in th=
e quality of your trip, in fact, you may even decide to switch to edibles!<=
/div><div>Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but t=
hat doesn=E2=80=99t necessarily mean you want to be seen stuffing your face=
 with them. For those who want to keep it classy and discrete, nibbling on =
some chocolate is the way to go. shroom chocolate bar</div><div>Versatile D=
osage =E2=80=93 The combined 3.5g of mushrooms in this chocolate can be bro=
ken up for versatile dosage. Each square of this chocolate bar contains app=
roximately .6g of Magic Mushrooms, while each bar contains 3.5g. Whether it=
=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has got yo=
u covered. shroom chocolate bar</div><div><br /></div><div>https://t.me/Ric=
ko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/</div><div><br /><=
/div><div>Buy Good Trip Mushroom Chocolate Bars Online</div><div>Have you e=
ver wished mushrooms tasted better? We=E2=80=99re here to grant that wish b=
y bringing you our Good Trip Mushroom Chocolate Bar. This bar is tasty, irr=
esistible also, contains a total of 3.5g of Magic Mushrooms ( 6 grams per c=
hocolate square). And can be broken off into squares for flexible shroom do=
sage.</div><div><br /></div><div>https://t.me/Ricko_swavy8/product/good-tri=
p-milk-chocolate-bars-for-sale/</div><div><br /></div><div>IT has an awesom=
e taste and smells good too chocolate. Good Trip Mushroom Chocolate Bars ma=
kes you trip your face off. So, how could that not be the dream?. =E2=80=A2=
</div><div><br /></div><div>https://t.me/Ricko_swavy8/product/good-trip-mil=
k-chocolate-bars-for-sale/</div><div><br /></div><div>Clean High =E2=80=93 =
We formulated this chocolate bar to produce a clean high that won=E2=80=99t=
 leave you crashing after the initial peak.</div><div><br /></div><div>http=
s://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/</div>=
<div><br /></div><div>True Psychedelic Experience Just cause it doesn=E2=80=
=99t taste like mushrooms doesn=E2=80=99t mean it=E2=80=99s not mushrooms. =
You won=E2=80=99t find any drop in the quality of your trip, in fact, you m=
ay even decide to switch to edibles!</div><div>:Sneaky-Sure, Magic Mushroom=
s are legal in Canada but that doesn=E2=80=99t necessarily mean you want to=
 be seen stuffing your face with them For those who want to keep it classy =
and discrete, nibbling on some chocolate is the way to go. shroom chocolate=
 bar =E2=80=A2</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"g=
mail_attr">On Sunday, June 2, 2024 at 9:27:48=E2=80=AFAM UTC+1 Asah Randy w=
rote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div><a=
 href=3D"https://t.me/prime_house00" target=3D"_blank" rel=3D"nofollow" dat=
a-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.m=
e/prime_house00&amp;source=3Dgmail&amp;ust=3D1717445789227000&amp;usg=3DAOv=
Vaw2Y6rQUBkifyUWP4ZKtScnm">https://t.me/prime_house00</a></div><div><br></d=
iv><div>Great Taste =E2=80=93 A chocolate bar that makes you trip your face=
 off. How could that not be the dream?<br><br>Clean
 High =E2=80=93 We formulated this chocolate bar to produce a clean high th=
at=20
won=E2=80=99t leave you crashing after the initial peak. shroom chocolate<b=
r><br>True
 Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mushrooms=
=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality=20
of your trip, in fact, you may even decide to switch to edibles!<br><br>Sne=
aky
 =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that doesn=E2=80=
=99t=20
necessarily mean you want to be seen stuffing your face with them. For=20
those who want to keep it classy and discrete, nibbling on some=20
chocolate is the way to go. shroom chocolate bar<br><br>Versatile Dosage
 =E2=80=93 The combined 3.5g of mushrooms in this chocolate can be broken u=
p for
 versatile dosage. Each square of this chocolate bar contains=20
approximately .6g of Magic Mushrooms, while each bar contains 3.5g.=20
Whether it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar =
has=20
got you covered. shroom chocolate bar<br><br></div><div><a href=3D"https://=
t.me/prime_house00" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/prime_house00&a=
mp;source=3Dgmail&amp;ust=3D1717445789227000&amp;usg=3DAOvVaw2Y6rQUBkifyUWP=
4ZKtScnm">https://t.me/prime_house00</a></div><br><div><div dir=3D"auto">On=
 Sunday, June 2, 2024 at 2:25:35=E2=80=AFAM UTC-6 Asah Randy wrote:<br></di=
v><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div><a href=3D"https://t.me/prime_house00" r=
el=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den&amp;q=3Dhttps://t.me/prime_house00&amp;source=3Dgmail&amp=
;ust=3D1717445789227000&amp;usg=3DAOvVaw2Y6rQUBkifyUWP4ZKtScnm">https://t.m=
e/prime_house00</a></div><div><br></div><div>Buy Good Trip Mushroom Chocola=
te Bars Online<br><br>Have you ever wished
 mushrooms tasted better? We=E2=80=99re here to grant that wish by bringing=
 you=20
our Good Trip Mushroom Chocolate Bar. This bar is tasty, irresistible=20
also, contains a total of 3.5g of Magic Mushrooms ( 6 grams per=20
chocolate square). And can be broken off into squares for flexible=20
shroom dosage.</div><div><br></div><div><br></div><a href=3D"https://t.me/p=
rime_house00" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/prime_house00&amp;sou=
rce=3Dgmail&amp;ust=3D1717445789227000&amp;usg=3DAOvVaw2Y6rQUBkifyUWP4ZKtSc=
nm">https://t.me/prime_house00</a><br></blockquote></div></blockquote></div=
>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d733ed98-17be-4029-b96b-407142be4901n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d733ed98-17be-4029-b96b-407142be4901n%40googlegroups.co=
m</a>.<br />

------=_Part_403144_162819116.1717359460880--

------=_Part_403143_1765942555.1717359460880--
