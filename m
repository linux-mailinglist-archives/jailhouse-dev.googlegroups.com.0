Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBRXUW62AMGQEYRMPDUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3FD92C8E0
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2024 05:04:40 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-e03c68e79casf9901026276.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 20:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720580679; x=1721185479; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LMx4yvu2N27fRyRnvNmSwDFUPJMcxPVDGy4h+0ZC08=;
        b=LjI820yE7x3eAGhe/YfHgxzSXI3u9Rpzf1byhDXhYXdJMgYGniWlneboU92fu4StKO
         zyl8ycK/6YX66tae5BTHAFjfpEaC3jJpFOyldul1sqqylrjTto7HTFGRy1dNXbYEycm/
         0KwZTjtjMN5XC3lhYOJ9r2uIhL+fCRODWSobZdrqAHTJsx3SaIXvPCQq8p9zLTUgTvsu
         AX4JI1w8szR71RW0YZs+l9gwkSyrLvsE68qEnW3xbgb5VOgJ4/GWXv0RRrjoZyekQ57U
         Iw4X4mzMjflJswvFtozHmBeAQH5cuw7yigGpb60v7QO4C+57E0QscI6C9lbaYO0V9IG5
         VVhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720580679; x=1721185479; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LMx4yvu2N27fRyRnvNmSwDFUPJMcxPVDGy4h+0ZC08=;
        b=EabFjcxRv7q6nMYnxghalm+HUV69yPcnBaEn9zH3p93xyoDCaLbAvITonlvso4j/ad
         dpXuIdO5TcXy3i88n53Jan58nT11dxAUw+5aZGQQgyR31WbXhnn+UgbNhD7aZkxQ+vyQ
         guir8+OIT/XBCGZ02rFZGSp14CiUhX++Q9KxgJMnruI0jjbJeBCPfGc4HnjGS4RBXaoH
         PqUv5YZbR2qsniJ8CTDNiDvZGlwiQLKgLfbjEcQ8fNswd/uz0YXhdHRm2RYmdqWGhHYS
         ukwUmuKlx69MUhncG3BEIKV00ewKIaT/jBqUYpCQ4D481Ly7OL1jRAUVX2ed8WdjRC8x
         H3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720580679; x=1721185479;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LMx4yvu2N27fRyRnvNmSwDFUPJMcxPVDGy4h+0ZC08=;
        b=kla6wIUSv5h3cGupgIHc74mRTE1j5b2bvmtLAp3mcWwJIFp4EkR0Y4uIw3WBzyr83p
         JRqT1uBG5Lf0czQJsjrzdVVYFjUyRuHksHZcxsomUTFVhO4oO0y8R6U6uj48hcSJTcnN
         bIccjE+UF3InUBr43S29Q5egimhdVZYQGeE8LJIXNj1qIz31m7zihMq00674jNq74lw8
         TkWcpTM0RYNpwf9X7nZqosharlnVOclL8BUz7ORV4FEv/WoQji4fvjNnwWvlzaxTZRnv
         OMOD0DBFkE3VihaQ3BfdIz10Uyei258Ihb5U05kve/WSDPNBOH8QaQOv/rL245ptVNqa
         bGlA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWzxjGfYXdDUc2VWMqL45a5Sbn9P+rlUwxTzcu5aBdQQlemNGnRjnyOm6nnXNxoNa12pcwuvBzISahu0rc7nDbmMgTmZbL0bG8BjKw=
X-Gm-Message-State: AOJu0Yxj1qcHfAfUJKn/XxDbkRbTTo0ajq1ka0qpCdjR/Cv8CfyPKZK4
	6YWcgnAJifJ7YOYAYo+EPNiozLepQCi5ZFGfAXIFFBCVYBD37T8Y
X-Google-Smtp-Source: AGHT+IExu7gaQeOyGOM0CzgTx0+tdoMUFriFdDXu3WkQ9tZAXXhnrSRQIafInUsuYve194m/rt6bjw==
X-Received: by 2002:a5b:b0e:0:b0:e02:b68d:b432 with SMTP id 3f1490d57ef6-e041b079f9bmr5012947276.37.1720580679178;
        Tue, 09 Jul 2024 20:04:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1205:b0:dff:aa9:b9ad with SMTP id
 3f1490d57ef6-e03bd07819cls8917022276.2.-pod-prod-08-us; Tue, 09 Jul 2024
 20:04:38 -0700 (PDT)
X-Received: by 2002:a05:6902:1892:b0:df4:8ff6:47f4 with SMTP id 3f1490d57ef6-e041b03772bmr29599276.1.1720580677812;
        Tue, 09 Jul 2024 20:04:37 -0700 (PDT)
Date: Tue, 9 Jul 2024 20:04:37 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c4f9e9c3-c55d-48ac-b51a-f19e7a018c79n@googlegroups.com>
In-Reply-To: <a7287bcc-f3a3-460c-bd92-cd118fef4e99n@googlegroups.com>
References: <0a9db60d-e86b-4b33-b7d1-d609b9f786d6n@googlegroups.com>
 <e9bb3fdc-1bcf-4554-b34e-55f0e21c993en@googlegroups.com>
 <a7287bcc-f3a3-460c-bd92-cd118fef4e99n@googlegroups.com>
Subject: Re: Buy DMT mushrooms chocolate bars only
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_89882_1874413520.1720580677074"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_89882_1874413520.1720580677074
Content-Type: multipart/alternative; 
	boundary="----=_Part_89883_789605732.1720580677074"

------=_Part_89883_789605732.1720580677074
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company chocolate,=
=20
they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
mushrooms in the form of consuming mushroom chocolate bars have recently=20
increased in popularity.  https://t.me/motionking_caliweed_psychedelics=20

https://t.me/motionking_caliweed_psychedelics


On Tuesday, July 9, 2024 at 7:32:00=E2=80=AFAM UTC-6 Asah Randy wrote:

>
> https://t.me/motionking_caliweed_psychedelics
>
> psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=
=20
> effects, you get from eating the Mushroom and polka dot company chocolate=
,=20
> they are also a great way to microdose magic mushrooms. Microdosing magic=
=20
> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
> increased in popularity.  https://t.me/motionking_caliweed_psychedelics=
=20
>
> https://t.me/motionking_caliweed_psychedelics
>
>
> On Tuesday, July 9, 2024 at 7:30:57=E2=80=AFAM UTC-6 Asah Randy wrote:
>
>> Mushroom Belgian Milk Chocolate is not only delicious, but it equates to=
=20
>> 4 grams of  =20
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>>   psilocybin-containing mushrooms. Aside from the fantastic, mind-blowin=
g=20
>> effects, you get from eating the Mushroom and polka dot company chocolat=
e,=20
>> they are also a great way to microdose magic mushrooms. Microdosing magi=
c=20
>> mushrooms in the form of consuming mushroom chocolate bars have recently=
=20
>> increased in popularity.  https://t.me/motionking_caliweed_psychedelics=
=20
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>>
>> On Tuesday, July 9, 2024 at 6:43:51=E2=80=AFAM UTC-6 ecstasyclinic pharm=
acy wrote:
>>
>>> Your best online shop to get plantinum quality products online,=20
>>> pain,anxiety pills, and research chemicals.
>>> Be 100% assured about the quality and genuineness of the product, and=
=20
>>> you will also be able to buy legal hallucinogens at a fair price.
>>>
>>> ORDER DIRECTLY ON OUR Telegram
>>> message @Clackderby1
>>>
>>> Telegram : https://t.me/ukverifiedv
>>> Telegram : https://t.me/ukverifiedv
>>> Telegram : https://t.me/ukverifiedv
>>> Telegram : https://t.me/ukverifiedv
>>>
>>> Buy  mdma champagne ,ketamine for sale,order crystal meth=20
>>> online,Roxicodone for sale,buy vicodin online,order oxycontin=20
>>> online,mantrax for sale,tramadol for sale,buy xanax online,pregabalin f=
or=20
>>> sale,buy morphine,order amphetamine online,viagra for sale,retaline for=
=20
>>> sale,buy vyvanse online,ephedrine for sale, lsd for sale online ,cocain=
e=20
>>> for sale,dmt for sale ,ecstasy pills for sale online .
>>>
>>> Telegram : https://t.me/ukverifiedv
>>> Telegram : https://t.me/ukverifiedv
>>> Telegram : https://t.me/ukverifiedv
>>> Telegram : https://t.me/ukverifiedv
>>>
>>> -100% Discreet and Confidential ,
>>> -Your personal details are 100% SECURE.,
>>> -Your orders are 100% Secure and Anonymous.,
>>> -Fast Worldwide Delivery (You can track and trace with your tracking=20
>>> number provided).
>>>
>>> =20
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c4f9e9c3-c55d-48ac-b51a-f19e7a018c79n%40googlegroups.com.

------=_Part_89883_789605732.1720580677074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics</div><div><br /></div><d=
iv><div>psilocybin-containing mushrooms. Aside from the fantastic, mind-blo=
wing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank">https://t.me/motionking_caliweed_psychedelics</a> <br /><=
/div><div><br /></div><div><a href=3D"https://t.me/motionking_caliweed_psyc=
hedelics" rel=3D"nofollow" target=3D"_blank">https://t.me/motionking_caliwe=
ed_psychedelics</a></div><div><br /><br /></div></div><div class=3D"gmail_q=
uote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, July 9, 2024 at 7:=
32:00=E2=80=AFAM UTC-6 Asah Randy wrote:<br/></div><blockquote class=3D"gma=
il_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204=
, 204); padding-left: 1ex;"><div><br></div><div><a href=3D"https://t.me/mot=
ionking_caliweed_psychedelics" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/moti=
onking_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1720667022911000&=
amp;usg=3DAOvVaw35bkLySo5bxQzlZlIg198m">https://t.me/motionking_caliweed_ps=
ychedelics</a></div><div><br></div><div><div>psilocybin-containing mushroom=
s. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720667022911000&amp;usg=3DAOvVaw35bkLySo5bxQzlZlIg198m">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720667022911000&amp;usg=3DAOvVaw35bkLySo5bxQzlZlIg198m">https://t.m=
e/motionking_caliweed_psychedelics</a></div><div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, Jul=
y 9, 2024 at 7:30:57=E2=80=AFAM UTC-6 Asah Randy wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div>Mushroom Belgian Milk Chocolate is n=
ot only delicious, but it equates to 4 grams of=C2=A0=C2=A0=C2=A0</div><div=
><br></div><div><a href=3D"https://t.me/motionking_caliweed_psychedelics" r=
el=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp=
;source=3Dgmail&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw35bkLySo5bxQzlZl=
Ig198m">https://t.me/motionking_caliweed_psychedelics</a></div><div><br></d=
iv><div>=C2=A0
psilocybin-containing mushrooms. Aside from the fantastic, mind-blowing=20
effects, you get from eating the Mushroom and polka dot company=20
chocolate, they are also a great way to microdose magic mushrooms.=20
Microdosing magic mushrooms in the form of consuming mushroom chocolate=20
bars have recently increased in popularity.=C2=A0
<a href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&=
amp;ust=3D1720667022911000&amp;usg=3DAOvVaw35bkLySo5bxQzlZlIg198m">https://=
t.me/motionking_caliweed_psychedelics</a> <br></div><div><br></div><div><a =
href=3D"https://t.me/motionking_caliweed_psychedelics" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/motionking_caliweed_psychedelics&amp;source=3Dgmail&amp=
;ust=3D1720667022911000&amp;usg=3DAOvVaw35bkLySo5bxQzlZlIg198m">https://t.m=
e/motionking_caliweed_psychedelics</a></div><br><br><div class=3D"gmail_quo=
te"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday, July 9, 2024 at 6:43=
:51=E2=80=AFAM UTC-6 ecstasyclinic pharmacy wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Your best online shop to get plantinum quality=
 products online, pain,anxiety pills, and research chemicals.<br>Be 100% as=
sured about the quality and genuineness of the product, and you will also b=
e able to buy legal hallucinogens at a fair price.<br><br>ORDER DIRECTLY ON=
 OUR Telegram<br>message @Clackderby1<br><br>Telegram : <a href=3D"https://=
t.me/ukverifiedv" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifiedv&amp=
;source=3Dgmail&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1LO_4obgb=
uq9JRT">https://t.me/ukverifiedv</a><br>Telegram : <a href=3D"https://t.me/=
ukverifiedv" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifiedv&amp;source=
=3Dgmail&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1LO_4obgbuq9JRT"=
>https://t.me/ukverifiedv</a><br>Telegram : <a href=3D"https://t.me/ukverif=
iedv" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://ww=
w.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifiedv&amp;source=3Dgmai=
l&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1LO_4obgbuq9JRT">https:=
//t.me/ukverifiedv</a><br>Telegram : <a href=3D"https://t.me/ukverifiedv" r=
el=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifiedv&amp;source=3Dgmail&amp;u=
st=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1LO_4obgbuq9JRT">https://t.me/=
ukverifiedv</a><br><br>Buy =C2=A0mdma champagne ,ketamine for sale,order cr=
ystal meth online,Roxicodone for sale,buy vicodin online,order oxycontin on=
line,mantrax for sale,tramadol for sale,buy xanax online,pregabalin for sal=
e,buy morphine,order amphetamine online,viagra for sale,retaline for sale,b=
uy vyvanse online,ephedrine for sale, lsd for sale online ,cocaine for sale=
,dmt for sale ,ecstasy pills for sale online .<br><br>Telegram : <a href=3D=
"https://t.me/ukverifiedv" rel=3D"nofollow" target=3D"_blank" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifi=
edv&amp;source=3Dgmail&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1L=
O_4obgbuq9JRT">https://t.me/ukverifiedv</a><br>Telegram : <a href=3D"https:=
//t.me/ukverifiedv" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifiedv&amp=
;source=3Dgmail&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1LO_4obgb=
uq9JRT">https://t.me/ukverifiedv</a><br>Telegram : <a href=3D"https://t.me/=
ukverifiedv" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifiedv&amp;source=
=3Dgmail&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1LO_4obgbuq9JRT"=
>https://t.me/ukverifiedv</a><br>Telegram : <a href=3D"https://t.me/ukverif=
iedv" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://ww=
w.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/ukverifiedv&amp;source=3Dgmai=
l&amp;ust=3D1720667022911000&amp;usg=3DAOvVaw0I4PlDi1LO_4obgbuq9JRT">https:=
//t.me/ukverifiedv</a><br><br>-100% Discreet and Confidential ,<br>-Your pe=
rsonal details are 100% SECURE.,<br>-Your orders are 100% Secure and Anonym=
ous.,<br>-Fast Worldwide Delivery (You can track and trace with your tracki=
ng number provided).<br><br>=C2=A0<br></blockquote></div></blockquote></div=
></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c4f9e9c3-c55d-48ac-b51a-f19e7a018c79n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c4f9e9c3-c55d-48ac-b51a-f19e7a018c79n%40googlegroups.co=
m</a>.<br />

------=_Part_89883_789605732.1720580677074--

------=_Part_89882_1874413520.1720580677074--
