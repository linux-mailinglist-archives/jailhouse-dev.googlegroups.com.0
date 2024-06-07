Return-Path: <jailhouse-dev+bncBCVZJANLUQORBMNKROZQMGQEDDQ7SBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id E02808FFFB6
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 11:38:58 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-df773f9471fsf3631792276.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2024 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717753138; x=1718357938; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qm/sfmRWdJhEHM7P8LgP1xG5JotFG+xD+KTFWcRsejo=;
        b=FFsPiSZmQmNiDeCwwgY6fsS/JcAWp9SG47FvrI5brg5NKMfsfLw5TsN5IHz1vOO/6O
         QfDjmp7U1ykgv66jnhpSaM5gj/tI+hY3ATF2Tx85MGkhEOxPZTkfvjXRIuF6C6fahW+i
         K/bRvkRb1HfwQUGNzv8GhXGv12tf9NbVjHx+v6kdXIkw9/zJdPEWEId26It/7iG7nOOh
         tyc5siec63QZ0X6D/kbnzd9gGZiXfhsLqa+U5LoX7hmHTna7huuuZosMc8d0+GNnPaza
         nHiz78oyed5zfBI40KQoIKCPXPidOL7bHV2Pl/z6jz8nxJ5tjaFo0gz9c5fKmug2neoR
         hbrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717753138; x=1718357938; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qm/sfmRWdJhEHM7P8LgP1xG5JotFG+xD+KTFWcRsejo=;
        b=SUiSYurZ7TnAEWIX1Q/7FKOE/MTC5XjQXbEcpJBXx7uatsk3gOPzAnjiKHmUZoO3vl
         +ynLvBwuIB0vW8YO8cHpFKFyHKJas2b1DEJvgX4JhrRkbvCC8w+qtLZiEDKXwR8Zf9kK
         o8Dx/xYVCePxqCdilAHAHMQp2KrUbmdaLQFi5k2RVqjHc+yVURPZ+lNGGNRYIsibsyxL
         glCJ3N9qOZ/AqRDb0Q3bBvt4yii0hKzpLNGrubhwdDJhY10076+IVUIUo7QiDzbzrmMD
         YWLL7a422fLg8xDgyGZgzUq5/rR8+b4sBvyL33mUX/bF4rIhEkmlmdzKxyXANFmDWCED
         Pg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717753138; x=1718357938;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qm/sfmRWdJhEHM7P8LgP1xG5JotFG+xD+KTFWcRsejo=;
        b=HJS33YYMwIjhIaB8lfLGOOuR/GCS/vP3X2qTOrVdoMVOyEGikbvTcr0+qzEJUGEdI4
         1Jr+GN1InvOyxCB/RTBEylBJRFd4D5jY56HPP0P+Vw8rtdatuP7paGf/zu9nKlEdyKKc
         HlECnwwkY9oN5D/rC3b0zQ2oDJJ03lR9nFVZwkFmdXJNZqkTrGMzdJVxLdHebXdG4WPe
         VDejbfExjmRcWqRf0Z/HVBXA7VyPSfJsk2rLCkl9235yhFplaIgzMG37Exi/ec55uT6n
         HvbXWOjpCFRujtylcfoC0QFyemfl88XzGUlkxXFo0z23mDnLzIiFSci20s/3VLFqhGDL
         OkYQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCW3ibVEKhciiOy1dlvlJfEWRWoYDjrC0ZL7cq+Rsv8aI+hC5NXyLCtn6dba7PIGob7ZfuosIeMa4V7hAE0TwqPlKUMCvRj8XaS/ERc=
X-Gm-Message-State: AOJu0YxkXQthASKE1NIRQgxhzyBkgxZ3w+LdIru3HhUe1G21Hya7wpPN
	+ijUeG0sZs7RUWjhHPRUV2Swp1Z7AhrO/yIRUlJNe28dJ4FdFiZe
X-Google-Smtp-Source: AGHT+IGfkvZCMRSMelYKfpLTcKM3KKnMM8INUffzvG8u0dZUvanYnWP2AGHfW54u5ZVjMcMasp9X5Q==
X-Received: by 2002:a25:fc1f:0:b0:dfa:f156:4015 with SMTP id 3f1490d57ef6-dfaf66848f4mr1787118276.40.1717753137765;
        Fri, 07 Jun 2024 02:38:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2e04:0:b0:df4:e17a:8653 with SMTP id 3f1490d57ef6-dfaf165ddf6ls1334709276.1.-pod-prod-08-us;
 Fri, 07 Jun 2024 02:38:56 -0700 (PDT)
X-Received: by 2002:a05:6902:1894:b0:dc6:e5d3:5f03 with SMTP id 3f1490d57ef6-dfaf6552e4bmr507791276.4.1717753136261;
        Fri, 07 Jun 2024 02:38:56 -0700 (PDT)
Date: Fri, 7 Jun 2024 02:38:55 -0700 (PDT)
From: Smith Crower <crowersmith440@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <24fd936d-df08-499e-a84f-27a878af50a9n@googlegroups.com>
In-Reply-To: <89fc6920-718f-4d39-ad92-f97a37c93578n@googlegroups.com>
References: <1e84942d-5882-4515-8312-2623d641ee03n@googlegroups.com>
 <c62f4a27-91cb-41a2-947a-ffdadfc4a692n@googlegroups.com>
 <94308113-15ad-4b8d-b834-5ee646aaff9fn@googlegroups.com>
 <89fc6920-718f-4d39-ad92-f97a37c93578n@googlegroups.com>
Subject: Re: Order Psilocybin Mushroom Chocolate Bras
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_64632_2022216584.1717753135724"
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

------=_Part_64632_2022216584.1717753135724
Content-Type: multipart/alternative; 
	boundary="----=_Part_64633_652782697.1717753135724"

------=_Part_64633_652782697.1717753135724
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
On Thursday 6 June 2024 at 19:54:52 UTC+1 Julse Ferry wrote:

> Buy all your psychedelic products with me including clone cards
> All products are available for deliveries and drop offs
> Fast shipping and delivery of packages to all locations worldwide
> Let me know with your orders
> Text me on telegram @michaelhardy33
> You can also join my channel for more products and reviews,link below
>
> https://t.me/psychedelicfakenotes
> https://t.me/psychedelicfakenotes
> https://t.me/psychedelicfakenotes
> https://t.me/psychedelicfakenotes
>
> You can let me know anytime with your orders
> Prices are also slightly negotiable depending on the quantity needed
>
> Call or text +12099894742 <(209)%20989-4742>
>
> On Thursday, June 6, 2024 at 7:31:21=E2=80=AFPM UTC+1 James Pemberton wro=
te:
>
>> Buy all your psychedelic products with me including clone cards
>> All products are available for deliveries and drop offs
>> Fast shipping and delivery of packages to all locations worldwide=20
>> Let me know with your orders
>> Text me on telegram @Carlantonn01
>> You can also join my channel for more products and reviews,link below
>>
>> https://t.me/psychoworldwide01
>> https://t.me/psychoworldwide01
>> https://t.me/psychoworldwide01
>> https://t.me/psychoworldwide01
>>
>> Backup channel below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87
>>
>> https://t.me/trippycross1
>> https://t.me/trippycross1
>> https://t.me/trippycross1
>>
>>
>> You can let me know anytime with your orders
>> Prices are also slightly negotiable depending on the quantity needed
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/24fd936d-df08-499e-a84f-27a878af50a9n%40googlegroups.com.

------=_Part_64633_652782697.1717753135724
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
 slightly negotiable depending on the quantity needed<br /><div class=3D"gm=
ail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday 6 June 2024 a=
t 19:54:52 UTC+1 Julse Ferry wrote:<br/></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;">Buy all your psychedelic products with me including =
clone cards<br>All products are available for deliveries and drop offs<br>F=
ast shipping and delivery of packages to all locations worldwide<br>Let me =
know with your orders<br>Text me on telegram @michaelhardy33<br>You can als=
o join my channel for more products and reviews,link below<br><br><a href=
=3D"https://t.me/psychedelicfakenotes" target=3D"_blank" rel=3D"nofollow" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps:=
//t.me/psychedelicfakenotes&amp;source=3Dgmail&amp;ust=3D1717839522578000&a=
mp;usg=3DAOvVaw1VZXtXgv6BI_JImf_uMCZz">https://t.me/psychedelicfakenotes</a=
><br><a href=3D"https://t.me/psychedelicfakenotes" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&am=
p;q=3Dhttps://t.me/psychedelicfakenotes&amp;source=3Dgmail&amp;ust=3D171783=
9522578000&amp;usg=3DAOvVaw1VZXtXgv6BI_JImf_uMCZz">https://t.me/psychedelic=
fakenotes</a><br><a href=3D"https://t.me/psychedelicfakenotes" target=3D"_b=
lank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?h=
l=3Den-GB&amp;q=3Dhttps://t.me/psychedelicfakenotes&amp;source=3Dgmail&amp;=
ust=3D1717839522578000&amp;usg=3DAOvVaw1VZXtXgv6BI_JImf_uMCZz">https://t.me=
/psychedelicfakenotes</a><br><a href=3D"https://t.me/psychedelicfakenotes" =
target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goog=
le.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/psychedelicfakenotes&amp;source=
=3Dgmail&amp;ust=3D1717839522578000&amp;usg=3DAOvVaw1VZXtXgv6BI_JImf_uMCZz"=
>https://t.me/psychedelicfakenotes</a><br><br>You can let me know anytime w=
ith your orders<br>Prices are also slightly negotiable depending on the qua=
ntity needed<br><br>Call or text <a href=3D"tel:(209)%20989-4742" value=3D"=
+12099894742" target=3D"_blank" rel=3D"nofollow">+12099894742</a><br><br><d=
iv class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Thursday=
, June 6, 2024 at 7:31:21=E2=80=AFPM UTC+1 James Pemberton wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Buy all your psychedelic produc=
ts with me including clone cards<br>All products are available for deliveri=
es and drop offs<br>Fast shipping and delivery of packages to all locations=
 worldwide <br>Let me know with your orders<br>Text me on telegram @Carlant=
onn01<br>You can also join my channel for more products and reviews,link be=
low<br><br><a href=3D"https://t.me/psychoworldwide01" rel=3D"nofollow" targ=
et=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB=
&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgmail&amp;ust=3D171783=
9522578000&amp;usg=3DAOvVaw1P7TtGar2c46YRrmOxyKZB">https://t.me/psychoworld=
wide01</a><br><a href=3D"https://t.me/psychoworldwide01" rel=3D"nofollow" t=
arget=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den=
-GB&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgmail&amp;ust=3D171=
7839522578000&amp;usg=3DAOvVaw1P7TtGar2c46YRrmOxyKZB">https://t.me/psychowo=
rldwide01</a><br><a href=3D"https://t.me/psychoworldwide01" rel=3D"nofollow=
" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den-GB&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgmail&amp;ust=
=3D1717839522578000&amp;usg=3DAOvVaw1P7TtGar2c46YRrmOxyKZB">https://t.me/ps=
ychoworldwide01</a><br><a href=3D"https://t.me/psychoworldwide01" rel=3D"no=
follow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den-GB&amp;q=3Dhttps://t.me/psychoworldwide01&amp;source=3Dgmail&amp;=
ust=3D1717839522578000&amp;usg=3DAOvVaw1P7TtGar2c46YRrmOxyKZB">https://t.me=
/psychoworldwide01</a><br><br>Backup channel below=F0=9F=91=87=F0=9F=91=87=
=F0=9F=91=87<br><br><a href=3D"https://t.me/trippycross1" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n-GB&amp;q=3Dhttps://t.me/trippycross1&amp;source=3Dgmail&amp;ust=3D1717839=
522578000&amp;usg=3DAOvVaw0KQeit0bsF9ifgG4sLuCij">https://t.me/trippycross1=
</a><br><a href=3D"https://t.me/trippycross1" rel=3D"nofollow" target=3D"_b=
lank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=
=3Dhttps://t.me/trippycross1&amp;source=3Dgmail&amp;ust=3D1717839522578000&=
amp;usg=3DAOvVaw0KQeit0bsF9ifgG4sLuCij">https://t.me/trippycross1</a><br><a=
 href=3D"https://t.me/trippycross1" rel=3D"nofollow" target=3D"_blank" data=
-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t=
.me/trippycross1&amp;source=3Dgmail&amp;ust=3D1717839522578000&amp;usg=3DAO=
vVaw0KQeit0bsF9ifgG4sLuCij">https://t.me/trippycross1</a><br><br><br>You ca=
n let me know anytime with your orders<br>Prices are also slightly negotiab=
le depending on the quantity needed<br><br></blockquote></div></blockquote>=
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/24fd936d-df08-499e-a84f-27a878af50a9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/24fd936d-df08-499e-a84f-27a878af50a9n%40googlegroups.co=
m</a>.<br />

------=_Part_64633_652782697.1717753135724--

------=_Part_64632_2022216584.1717753135724--
