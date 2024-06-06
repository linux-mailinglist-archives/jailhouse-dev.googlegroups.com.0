Return-Path: <jailhouse-dev+bncBC33PBVJQ4BRBUMNRCZQMGQERYK74VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id C68918FF509
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2024 20:58:27 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-df7bdb0455bsf1987787276.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717700307; x=1718305107; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coUuEXc14wilkMwo9ckPQdV5m5v3+YWsRmL8ZlNgeeM=;
        b=wuKxL9uZtiB5nEto+L1UyK43MW9IEg6v3gVhFlWDQECjcJBUeg7KUiAlEPihJOpOlM
         mjNbhbpxUruhKrW5yjsdwNxelJxcFvuMgMjs8seIbDOR7cMhCh7FWrFTWro+gwsVrByr
         TDvnyDGkqVmYYVu394UMeJWX3sn82LBDSZa+TtoB1rmhSa5xUY9SCSZ9oj6o7Qe7ZVRE
         siCVzPLyAfWKLa1GIY1UzEq2MHqlrKRE/xU7VOMnCPtaMRQRCz68O6/3r5yOoT/apfk3
         YegeNa83RpwnQ6wk4wpo64orctk3I62ErhE8NvV77pxlBANqU2MB7c8HCRAV+5xvSW60
         VMIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717700307; x=1718305107; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coUuEXc14wilkMwo9ckPQdV5m5v3+YWsRmL8ZlNgeeM=;
        b=KmH76Mt9wO4JlNWqyxMCOTbqAF2Mt62lVyZk2YcDBecGPJv3+g0HkUsZZmqcJOh2b2
         g2z5r6NMc86tFo0lYZFcrU0L35cH8D8cBviX7/HD0XCwVhGu5T3yIkCUbgDgeE1UJ3cw
         bGNk3rWYex+iIwYr7FI6qM5s6WQ3aBjhVzw4T5MaldRf3DTY/B01jmDy56jx0ylJ27FM
         rb6j41FbMPkGl/IunXVqU4LDY8WCaHuCVeBhkGZ3ZE7I6pAau6jwl+sBAjRtSHej667R
         X16KKkeew6krF3VIblVTqXYbWCZ0RcY6lKEJN+6Vr7EtiN5UaPy2crwV0vHFSPVmo3MN
         aIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717700307; x=1718305107;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coUuEXc14wilkMwo9ckPQdV5m5v3+YWsRmL8ZlNgeeM=;
        b=vrDNkaucns5gerXomHCkZ8mD3BJbwQMM+QNP8J3hJimr/ly0ZStAJHL9tTHNNj9uvs
         5AWzlKAHG7Qyo9dfx3LWvrLR5BBwuD+TDkhvxabS5PC0tB395R7TfndfiCkB5JPPetRi
         13GUhbhGOdXALmivDCEpmj79kL5C5i3K9maSBjxQ/0XKc6jp+c9svRimjbk1tfmY6D1D
         f3B3RKpG/F3KjlhGat+x2FkAMOp39UpzEr5eh4+4rH2OIszmJHrg/mq0OgznpjcgB4az
         /g5Ko9Pt+5OOjSn/TIPuJaxrj0aDxjpDBs6FU/Ai6CbKMsQON9V94bgOCa5fWWIAEDJp
         2rYA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUYxM9H+v7gQTuw1txvmCh57czBHKld35MG01ThFeMwcdMEPvNuhfpj6ugq5EfKrs36uRaSy6M1p+nFf1YCtjYLpIzKjeEl5fJKSAo=
X-Gm-Message-State: AOJu0Yzi3VT9kVzOlzVgUfVMRY296O4e7UDXENVReMxOxbd7iEn9DrVv
	QRao+Y0OeKfwrUiqyfNrnlN7hAP4DN9u1sulA6eHSi4VV3Zju0tF
X-Google-Smtp-Source: AGHT+IEExMRAImw8OMLGgzAzIG9vGY79L+XL2zx+exBTtY3Dg0/QYVItcJg3bniJ4VqW44wwyiQOHw==
X-Received: by 2002:a25:dc87:0:b0:dfa:b42d:f818 with SMTP id 3f1490d57ef6-dfaf65e70e7mr293609276.19.1717700306724;
        Thu, 06 Jun 2024 11:58:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:aa87:0:b0:df7:69a2:f82b with SMTP id 3f1490d57ef6-dfaf1696c0els484146276.2.-pod-prod-00-us;
 Thu, 06 Jun 2024 11:58:25 -0700 (PDT)
X-Received: by 2002:a25:dfd5:0:b0:df4:eb0b:8fd with SMTP id 3f1490d57ef6-dfade9e0f4dmr678008276.2.1717700304803;
        Thu, 06 Jun 2024 11:58:24 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:58:24 -0700 (PDT)
From: Julse Ferry <ferryjulse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <19f5f391-6330-4cc1-837e-6c1e6afb456bn@googlegroups.com>
In-Reply-To: <da1f9334-ae6d-4cef-8b08-347a8ac13f2bn@googlegroups.com>
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
Subject: Re: BUY MAGIC MUSHROOM ONLINE AUSTRALIA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_111294_1277602591.1717700304324"
X-Original-Sender: ferryjulse@gmail.com
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

------=_Part_111294_1277602591.1717700304324
Content-Type: multipart/alternative; 
	boundary="----=_Part_111295_483159165.1717700304324"

------=_Part_111295_483159165.1717700304324
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards
All products are available for deliveries and drop offs
Fast shipping and delivery of packages to all locations worldwide
Let me know with your orders
Text me on telegram @michaelhardy33
You can also join my channel for more products and reviews,link below

https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes
https://t.me/psychedelicfakenotes

You can let me know anytime with your orders
Prices are also slightly negotiable depending on the quantity needed

Call or text +12099894742

On Thursday, June 6, 2024 at 7:31:40=E2=80=AFPM UTC+1 James Pemberton wrote=
:

>
> Buy all your psychedelic products with me including clone cards
> All products are available for deliveries and drop offs
> Fast shipping and delivery of packages to all locations worldwide=20
> Let me know with your orders
> Text me on telegram @Carlantonn01
> You can also join my channel for more products and reviews,link below
>
> https://t.me/psychoworldwide01
> https://t.me/psychoworldwide01
> https://t.me/psychoworldwide01
> https://t.me/psychoworldwide01
>
> Backup channel below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87
>
> https://t.me/trippycross1
> https://t.me/trippycross1
> https://t.me/trippycross1
>
>
> You can let me know anytime with your orders
> Prices are also slightly negotiable depending on the quantity needed
> On Tuesday 4 June 2024 at 16:08:32 UTC+1 Asah Randy wrote:
>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> Read on for our complete guide to golden teacher magic mushrooms,=20
>> including their effects, potency, and potential benefits. We will also=
=20
>> provide a brief overview of the growing process and explain why they are=
=20
>> many mushroom lovers=E2=80=99 go-to strain.
>>
>>
>> https://t.me/motionking_caliweed_psychedelics
>> On Tuesday, June 4, 2024 at 4:05:02=E2=80=AFPM UTC+1 Asah Randy wrote:
>>
>>> https://t.me/motionking_caliweed_psychedelics
>>>
>>> Anecdotal reports suggest that side effects such as anxiety and paranoi=
a=20
>>> rarely occur with golden teachers. Furthermore, some state that the ove=
rall=20
>>> experience is shorter than average, sometimes lasting just 2=E2=80=934 =
hours. For=20
>>> these reasons, golden teachers are sometimes considered an ideal choice=
 for=20
>>> those new to the world of psychedelics.
>>>
>>> https://t.me/motionking_caliweed_psychedelics
>>> On Tuesday, June 4, 2024 at 4:03:55=E2=80=AFPM UTC+1 Asah Randy wrote:
>>>
>>>> https://t.me/motionking_caliweed_psychedelics
>>>>
>>>> Psilocybin Gummies - Mushroom Gummy Cubes 3.5g online | Buy Psilocybin=
=20
>>>> Gummies 100% Fast And Discreet Shipping
>>>>
>>>> Worldwide
>>>> Buy Magic Mushrooms Online | Psychedelics For Sale USA | Mushroom=20
>>>> Chocolate Bars Online
>>>> Buy Xanax 2mg bars, Hydrocodone, Diazepam, Dilaudid, Oxycotin,=20
>>>> Roxycodone, Suboxone, Subutex, Klonpin, Soma, Ritalin
>>>> Buy microdosing psychedelics online | Buy magic mushrooms gummies=20
>>>> online | buy dmt carts online usa
>>>> DMT for Sale | Order DMT Cartridges Online | Buy DMT Online | WHere to=
=20
>>>> Buy DMT in Australia
>>>> NN DMT for Sale | Order DMT Cartridges Online | Buy DMT Online Europe =
|=20
>>>> WHere to Buy DMT Near Me |Buy DMT USA
>>>>
>>>>
>>>> https://t.me/motionking_caliweed_psychedelics
>>>>
>>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/19f5f391-6330-4cc1-837e-6c1e6afb456bn%40googlegroups.com.

------=_Part_111295_483159165.1717700304324
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Buy all your psychedelic products with me including clone cards<br />All pr=
oducts are available for deliveries and drop offs<br />Fast shipping and de=
livery of packages to all locations worldwide<br />Let me know with your or=
ders<br />Text me on telegram @michaelhardy33<br />You can also join my cha=
nnel for more products and reviews,link below<br /><br />https://t.me/psych=
edelicfakenotes<br />https://t.me/psychedelicfakenotes<br />https://t.me/ps=
ychedelicfakenotes<br />https://t.me/psychedelicfakenotes<br /><br />You ca=
n let me know anytime with your orders<br />Prices are also slightly negoti=
able depending on the quantity needed<br /><br />Call or text +12099894742<=
br /><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr=
">On Thursday, June 6, 2024 at 7:31:40=E2=80=AFPM UTC+1 James Pemberton wro=
te:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br>Buy a=
ll your psychedelic products with me including clone cards<br>All products =
are available for deliveries and drop offs<br>Fast shipping and delivery of=
 packages to all locations worldwide <br>Let me know with your orders<br>Te=
xt me on telegram @Carlantonn01<br>You can also join my channel for more pr=
oducts and reviews,link below<br><br><a href=3D"https://t.me/psychoworldwid=
e01" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=
=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3DAOvVaw17BdINess_qieQURx4DS2-"=
>https://t.me/psychoworldwide01</a><br><a href=3D"https://t.me/psychoworldw=
ide01" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=
=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3DAOvVaw17BdINess_qieQURx4DS2-"=
>https://t.me/psychoworldwide01</a><br><a href=3D"https://t.me/psychoworldw=
ide01" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=
=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3DAOvVaw17BdINess_qieQURx4DS2-"=
>https://t.me/psychoworldwide01</a><br><a href=3D"https://t.me/psychoworldw=
ide01" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=
=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3DAOvVaw17BdINess_qieQURx4DS2-"=
>https://t.me/psychoworldwide01</a><br><br>Backup channel below=F0=9F=91=87=
=F0=9F=91=87=F0=9F=91=87<br><br><a href=3D"https://t.me/trippycross1" targe=
t=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.co=
m/url?hl=3Den&amp;q=3Dhttps://t.me/trippycross1&amp;source=3Dgmail&amp;ust=
=3D1717786694506000&amp;usg=3DAOvVaw0Wa_CGlQcX50TPvZDl7ut-">https://t.me/tr=
ippycross1</a><br><a href=3D"https://t.me/trippycross1" target=3D"_blank" r=
el=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&=
amp;q=3Dhttps://t.me/trippycross1&amp;source=3Dgmail&amp;ust=3D171778669450=
6000&amp;usg=3DAOvVaw0Wa_CGlQcX50TPvZDl7ut-">https://t.me/trippycross1</a><=
br><a href=3D"https://t.me/trippycross1" target=3D"_blank" rel=3D"nofollow"=
 data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:/=
/t.me/trippycross1&amp;source=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3D=
AOvVaw0Wa_CGlQcX50TPvZDl7ut-">https://t.me/trippycross1</a><br><br><br>You =
can let me know anytime with your orders<br>Prices are also slightly negoti=
able depending on the quantity needed<br><div class=3D"gmail_quote"><div di=
r=3D"auto" class=3D"gmail_attr">On Tuesday 4 June 2024 at 16:08:32 UTC+1 As=
ah Randy wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a hre=
f=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;us=
t=3D1717786694506000&amp;usg=3DAOvVaw12SwMe9Afdno5s6LmgkwWN">https://t.me/m=
otionking_caliweed_psychedelics</a><br><br>Read on for our complete guide t=
o golden teacher magic mushrooms, including their effects, potency, and pot=
ential benefits. We will also provide a brief overview of the growing proce=
ss and explain why they are many mushroom lovers=E2=80=99 go-to strain.<br>=
<br><div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psyched=
elics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychede=
lics&amp;source=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3DAOvVaw12SwMe9A=
fdno5s6LmgkwWN">https://t.me/motionking_caliweed_psychedelics</a><br></div>=
<div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesda=
y, June 4, 2024 at 4:05:02=E2=80=AFPM UTC+1 Asah Randy wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div><a href=3D"https://t.me/motion=
king_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionk=
ing_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717786694506000&amp=
;usg=3DAOvVaw12SwMe9Afdno5s6LmgkwWN">https://t.me/motionking_caliweed_psych=
edelics</a><br></div><div><br></div>Anecdotal reports suggest that side eff=
ects such as anxiety and paranoia rarely occur with golden teachers. Furthe=
rmore, some state that the overall experience is shorter than average, some=
times lasting just 2=E2=80=934 hours. For these reasons, golden teachers ar=
e sometimes considered an ideal choice for those new to the world of psyche=
delics.<br><br><div><a href=3D"https://t.me/motionking_caliweed_psychedelic=
s" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.g=
oogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics=
&amp;source=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3DAOvVaw12SwMe9Afdno=
5s6LmgkwWN">https://t.me/motionking_caliweed_psychedelics</a><br></div><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, J=
une 4, 2024 at 4:03:55=E2=80=AFPM UTC+1 Asah Randy wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div><a href=3D"https://t.me/motionking=
_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_=
caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717786694506000&amp;usg=
=3DAOvVaw12SwMe9Afdno5s6LmgkwWN">https://t.me/motionking_caliweed_psychedel=
ics</a><br></div><div><br></div>Psilocybin Gummies - Mushroom Gummy Cubes 3=
.5g online | Buy Psilocybin Gummies 100% Fast And Discreet Shipping<div><br=
></div><div>Worldwide</div><div>Buy Magic Mushrooms Online | Psychedelics F=
or Sale USA | Mushroom Chocolate Bars Online</div><div>Buy Xanax 2mg bars, =
Hydrocodone, Diazepam, Dilaudid, Oxycotin, Roxycodone, Suboxone, Subutex, K=
lonpin, Soma, Ritalin</div><div>Buy microdosing psychedelics online | Buy m=
agic mushrooms gummies online | buy dmt carts online usa</div><div>DMT for =
Sale | Order DMT Cartridges Online | Buy DMT Online | WHere to Buy DMT in A=
ustralia</div><div>NN DMT for Sale | Order DMT Cartridges Online | Buy DMT =
Online Europe | WHere to Buy DMT Near Me |Buy DMT USA</div><div><br></div><=
div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics=
" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&=
amp;source=3Dgmail&amp;ust=3D1717786694506000&amp;usg=3DAOvVaw12SwMe9Afdno5=
s6LmgkwWN">https://t.me/motionking_caliweed_psychedelics</a><br></div><br><=
/blockquote></div></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/19f5f391-6330-4cc1-837e-6c1e6afb456bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/19f5f391-6330-4cc1-837e-6c1e6afb456bn%40googlegroups.co=
m</a>.<br />

------=_Part_111295_483159165.1717700304324--

------=_Part_111294_1277602591.1717700304324--
