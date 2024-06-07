Return-Path: <jailhouse-dev+bncBCVZJANLUQORBPH4RGZQMGQEXS7KUFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD68FFA2E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 05:27:58 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-df78fddad5dsf3201138276.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2024 20:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717730877; x=1718335677; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tcz3ZOwO6O7967TvwHYmN5rN4o+HgTtMZvOPhTNlxV8=;
        b=QVA9piw6uDpBol0lJiM/tDt0t4nrpU1VZnghiTlp9I3iDyo/aFEolgZLzE/um3U5uE
         pNBZGGqI04aSB9JAJFVtPPo4edJqvnaYC2Qmuih/3gMqBgNXJqC5OGpEoGpFumDHR//p
         9VvH0WwFOonXDbjx+tPUbnhGYrK2sQXHxU847ohari8kc8udt79k7FQRrfLe6gSfAZeA
         RLlJw8J8xJYuOeN7CIp/iu3vsMtga599IuWmDH2GAQ3SNbzDBve4VDzNC0IlV8F4bGZ5
         D5CBP9nKm39jcJCWXXL0WnCBlcopJcd0tMIolVWKXYXCWG+ABrEGmnsAOqBJZWpT8CCy
         Pogg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717730877; x=1718335677; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tcz3ZOwO6O7967TvwHYmN5rN4o+HgTtMZvOPhTNlxV8=;
        b=LYnWYW9nHPJ0Mfify6Ac8U8PKzHQ1wAx74BaiXWMnuttYf8qRKdRfd4/nEW9wOPEe1
         y0xzUb15sz1Ic1DFxNgTsvYG0g1cQGqqyTxACFhXGCWgnIeUVfjpJSbD6ERWNUsG6a8g
         HTmH6b9BvlJZmxNnYUkFcZSOZGlh3kmsgqJArBI+dKIm7eP2I4cgxmg3bpsyqCOsYbgy
         gwCXn07zCB+LOHPeI0KsicsnOmPNaFndvRodHXLK2zdNrWAQBZNRC82VVNolHFmFZccL
         Mvf3+OvglKHa8j5XAr+5zl2uY33CQ8p9ifUVGo7SCCrs42lYHUogEbArjYQYWbp0y5Oi
         q8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717730877; x=1718335677;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tcz3ZOwO6O7967TvwHYmN5rN4o+HgTtMZvOPhTNlxV8=;
        b=iuycZA+9P62eCyrqHsSMuGu2EPOYVD+sy8bjltU5Esj3ie/xrFzA6hvYL8fT3a+PE6
         ZkR8co+yxLETRnyKmndfVMj1x+eIKruDkYU/4rvqokP73mtZgkuEOiBh6LmBYULnC8F7
         DcvQZEZBCNDDGI3utzdICAc8MsPE812trLKv70ZuJbLF2gZvrl+9LCt+lIxuqaow1PJc
         6zTlpEQc4yM1Fb8eNIoXxdKSgsB19Hhyy7TRl5Ec//5uL24ZouyjWmhx23s/kpckicj4
         hT+oPpoe89pTmfV/sD3mC+tTo/aExpajXNZeSGESXcbclwhOH+9HonRpNHSlbHIoUzcB
         ShTw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWWyyNFCIliD0XOo4FQNSZ/V6w2js27xHiWDoyOPM72DSg9YrPkgjYg3R9b+RFA53/yoRosKFJ+u5v5Ns+80TZNJYMmhVHV77gQYIA=
X-Gm-Message-State: AOJu0Yyt6sxZGj0jON0whas+7F/p1TXSoe+3ZLelv01GLbdhZxmk9lL6
	eeIPsaZ4SR6grUcVdiHOGbCgKZfFAQrpyv8ZySbS3hXM6HaopEAX
X-Google-Smtp-Source: AGHT+IFAts/bRTr1h+UADdUSQs81ErIS4aeG9bZOMK00g4ixxIIZUdFeR3wugYIFZH+xxS/ig5QcOA==
X-Received: by 2002:a25:ce84:0:b0:de5:5a84:7640 with SMTP id 3f1490d57ef6-dfaf65c51b9mr1196076276.19.1717730877314;
        Thu, 06 Jun 2024 20:27:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:84d1:0:b0:dfa:74b4:7e65 with SMTP id 3f1490d57ef6-dfaf166c4dels940026276.2.-pod-prod-09-us;
 Thu, 06 Jun 2024 20:27:55 -0700 (PDT)
X-Received: by 2002:a05:6902:1245:b0:dcb:e982:4e40 with SMTP id 3f1490d57ef6-dfaf66c5d0fmr342904276.12.1717730875619;
        Thu, 06 Jun 2024 20:27:55 -0700 (PDT)
Date: Thu, 6 Jun 2024 20:27:55 -0700 (PDT)
From: Smith Crower <crowersmith440@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <06474f43-e481-4399-8cb8-0657709c39e0n@googlegroups.com>
In-Reply-To: <ab8b0f77-78bf-4b38-97e5-32235d8e0887n@googlegroups.com>
References: <c9433a4b-d94f-4980-b161-37158cb141e0n@googlegroups.com>
 <ce2d0554-c969-46a5-b4bd-35138d610584n@googlegroups.com>
 <9a735cf6-0a8f-4a7c-8f96-6e6d56c5da27n@googlegroups.com>
 <bbcab077-ea1b-4177-bcb4-2a52efe69db6n@googlegroups.com>
 <ab8b0f77-78bf-4b38-97e5-32235d8e0887n@googlegroups.com>
Subject: Re: MDMA FOR SALE ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_157650_1292019396.1717730875130"
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

------=_Part_157650_1292019396.1717730875130
Content-Type: multipart/alternative; 
	boundary="----=_Part_157651_1732181804.1717730875130"

------=_Part_157651_1732181804.1717730875130
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
On Saturday 1 June 2024 at 10:57:37 UTC+1 Asah Randy wrote:

>
> https://t.me/motionking_caliweed_psychedelics
>
> BUY KETAMINE ONLINE
> WHERE CAN YOU BUY KETAMINE ONLINE?
> HOW TO BUY KETAMINE ONLINE
> BUY KETAMINE FOR EXPERIMENT ONLINE
>
> https://t.me/motionking_caliweed_psychedelics
> On Saturday, June 1, 2024 at 10:55:40=E2=80=AFAM UTC+1 Asah Randy wrote:
>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> BUY QUALITY POWDER COCAINE (ORDER COKAS) ONLINE
>> Where to buy high quality cocaine powder?
>>  COCAINE POWDER FOR SALE
>> CRYSTAL METH FOR SALE
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/06474f43-e481-4399-8cb8-0657709c39e0n%40googlegroups.com.

------=_Part_157651_1732181804.1717730875130
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
ail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Saturday 1 June 2024 a=
t 10:57:37 UTC+1 Asah Randy wrote:<br/></div><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204)=
; padding-left: 1ex;"><div><br></div><div><a href=3D"https://t.me/motionkin=
g_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/motionk=
ing_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717817263721000&amp=
;usg=3DAOvVaw3f1dDAIEOr_WucGhud8HOw">https://t.me/motionking_caliweed_psych=
edelics</a><br></div><br>BUY KETAMINE ONLINE<br>WHERE CAN YOU BUY KETAMINE =
ONLINE?<br>HOW TO BUY KETAMINE ONLINE<br>BUY KETAMINE FOR EXPERIMENT ONLINE=
<br><div><br></div><div><a href=3D"https://t.me/motionking_caliweed_psyched=
elics" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me/motionking_caliweed_psych=
edelics&amp;source=3Dgmail&amp;ust=3D1717817263721000&amp;usg=3DAOvVaw3f1dD=
AIEOr_WucGhud8HOw">https://t.me/motionking_caliweed_psychedelics</a><br></d=
iv><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Sat=
urday, June 1, 2024 at 10:55:40=E2=80=AFAM UTC+1 Asah Randy wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div><a href=3D"https://t.me/m=
otionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-sa=
feredirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://t.me=
/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D171781726372=
1000&amp;usg=3DAOvVaw3f1dDAIEOr_WucGhud8HOw">https://t.me/motionking_caliwe=
ed_psychedelics</a><br></div><br>BUY QUALITY POWDER COCAINE (ORDER COKAS) O=
NLINE<br>Where to buy high quality cocaine powder?<br>=C2=A0COCAINE POWDER =
FOR SALE<br>CRYSTAL METH FOR SALE<br><div><br></div><div><a href=3D"https:/=
/t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" =
data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps=
://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D17178=
17263721000&amp;usg=3DAOvVaw3f1dDAIEOr_WucGhud8HOw">https://t.me/motionking=
_caliweed_psychedelics</a><br></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/06474f43-e481-4399-8cb8-0657709c39e0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/06474f43-e481-4399-8cb8-0657709c39e0n%40googlegroups.co=
m</a>.<br />

------=_Part_157651_1732181804.1717730875130--

------=_Part_157650_1292019396.1717730875130--
