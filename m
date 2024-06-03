Return-Path: <jailhouse-dev+bncBD37PS7EWQCRB3PZ6SZAMGQEWQSIMVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBEA8D7A84
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 05:47:59 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dfa829361c3sf3400955276.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 20:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717386478; x=1717991278; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/9F6Q3ddsNCve2+ohdN1HL5uFooWVHgNhkeIyMQbCf0=;
        b=GBZF1v06vsD1K945xk0cWcq6E6c/CQo6ze8Kgj7fwrfj6m19CF2SDhvoNpM7lwPavf
         iB5Gc68aVuBdRqdqQo8bdUwhaYZzq/T4rLUhxqiWzhCS17V/Hax1RlPBeLAJvORsSxbo
         2Tc1sFDj1JbfaUQkiMUB58oqrGlLl/QgLNK3/2ra+xSrV8sQPjJfuUOpnOomp+185eiN
         hIbIoAP4VxSYzhbkHza/tAypiKrC4aWJywXL3nO1LkSyRLIJ5Ov504e2H9xilcsd9rNc
         w5iNV8WCAQQuV2bSvNkrhGSGls+uLEbfdxKFcl57tSUEIkfrkguQ6cjqJDH/ucvVCH0f
         I1dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717386478; x=1717991278; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9F6Q3ddsNCve2+ohdN1HL5uFooWVHgNhkeIyMQbCf0=;
        b=lBn/h2QaoLXjqQ1GQT7ubLP2Zjjq+/3BM7UbEsdEL7rncrHIysG0xt9/3bVTq6LJsg
         FIBHJ1v07pM1wnG++Ch4vlPUOT8Ey5ZbliBhPZdjizNr8J5aODKEQbhFOSfDlFV26Tfb
         QtfL77+9fwv9VE+7lhWoThTXriTxiR7LLUFRpuiMQgvjz2AIUo3UEZztp+5XxgFOxTDU
         33HwYJy2aNNsmy/9wLe5ZPhVci+IJQtJnu5P/neDTJx/c3NDEyFD7qcf+IRolFK4n965
         gxZ3Kp50tDl6iGsXj6y6sRDN11mUglYEu8ssnokl8XRjJ+/RUQgFrLKyaSP7jxFatNOg
         CSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717386478; x=1717991278;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/9F6Q3ddsNCve2+ohdN1HL5uFooWVHgNhkeIyMQbCf0=;
        b=WldK78hzqi9R8o73Lg2V/5tM99yT5SFMqXOhrLhrOwmY9ZkERejqIhUghbiibLwI1a
         G4ruZuzLaRUiIaJu7/ijmTqoES7yO4LyBJoHYj3S9pMrWqVWAX/hcYbF37bBSeFVbDo7
         4VQsOCECLs//6/RM3WipkvoYp24etsz06B+HHEWHoMrYUujFl26fCdadaRlXTrFHy+M6
         yVvlHbx3vIl9ukH8Z5ERjV0vDyhRCOde5CwRmXuBB0XTYVUVjg3TavtfhvMXsD7jKwhF
         MakmH7ThUbZvVc4Q4VF2Bl4DXplnQ9lzNYdmhbWuEUlYFuhzevG3nSgYSILRAdzMztGJ
         rDpQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWBNBW8gBg9nKWn99TtDiyBYie57k7F/Di9vgctl6VPSgSCo7KObXl0eplPtcyBt3Aju5ltJUw7ZIDDY+OU1ZoXJ2kZIlU9VH7gy3E=
X-Gm-Message-State: AOJu0YwEK6KWsBZGRk12lx8MT69/n7UF/krE/SLN4g1G+LBJj9JSqcu8
	YmKs6TecU6y211Vwt0WjXdDaS2ByJc3ofBxB0p4egZyhx2FiG/mb
X-Google-Smtp-Source: AGHT+IG/XD44bHQUjF1xZ+Gf6qGdZRiJ8nJFdv6iAf9XGoyiYhpECrq5KeA8GgPq3eOhWNlNw7NVJw==
X-Received: by 2002:a25:68ce:0:b0:dfa:72e6:47a0 with SMTP id 3f1490d57ef6-dfa73bd088dmr7475427276.10.1717386478048;
        Sun, 02 Jun 2024 20:47:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8b92:0:b0:df7:69a2:f82b with SMTP id 3f1490d57ef6-dfa59b1ea59ls138136276.2.-pod-prod-00-us;
 Sun, 02 Jun 2024 20:47:55 -0700 (PDT)
X-Received: by 2002:a05:6902:72f:b0:dfa:6c09:9b19 with SMTP id 3f1490d57ef6-dfa724e77aamr2609752276.1.1717386475669;
        Sun, 02 Jun 2024 20:47:55 -0700 (PDT)
Date: Sun, 2 Jun 2024 20:47:54 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <47bde811-e488-4afb-8a2e-e4d08db0ca76n@googlegroups.com>
In-Reply-To: <bacb756a-78ac-4687-a33e-f7ab1f6ffc70n@googlegroups.com>
References: <446876dc-adb4-4fdc-ba8e-ecae817ea8f4n@googlegroups.com>
 <bacb756a-78ac-4687-a33e-f7ab1f6ffc70n@googlegroups.com>
Subject: Re: GET AT ME FOR YOUR LOW &HIGH BALANCE CLONE CARD FOR COOL PRICES
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_280843_414470487.1717386474906"
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

------=_Part_280843_414470487.1717386474906
Content-Type: multipart/alternative; 
	boundary="----=_Part_280844_1467232940.1717386474906"

------=_Part_280844_1467232940.1717386474906
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/motionking_caliweed_psychedelics

Get at me for your low & high balance clone cards going for cool prices.
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

https://t.me/motionking_caliweed_psychedelics
High balance
$1k for balance $15k
$3k for balance $30k
$5k balance $50k
$7k for balance $75k

https://t.me/motionking_caliweed_psychedelics
On Sunday, June 2, 2024 at 9:19:23=E2=80=AFPM UTC+1 Dwayne Mickey wrote:

>
> Get at me for your low & high balance clone cards going for cool prices.
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/=
=20
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
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
>
> High balance
> $1k for balance $15k
> $3k for balance $30k
> $5k balance $50k
> $7k for balance $ 75k
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
> =E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB
>
> =E2=80=A2 Swift Delivery On DHL & FedEx express
> https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/
>
> Text me now and make your
> On Saturday, June 1, 2024 at 11:32:32=E2=80=AFAM UTC+1 Asah Randy wrote:
>
>>
>> Get at me for your low & high balance clone cards going for cool prices.
>>
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>>
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
>>
>> https://t.me/motionking_caliweed_psychedelics
>>
>> High balance
>> $1k for balance $15k
>> $3k for balance $30k
>> $5k balance $50k
>> $7k for balance $ 75k
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/47bde811-e488-4afb-8a2e-e4d08db0ca76n%40googlegroups.com.

------=_Part_280844_1467232940.1717386474906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/motionking_caliweed_psychedelics<br /></div><br /><div st=
yle=3D"color: rgb(80, 0, 80);">Get at me for your low &amp; high balance cl=
one cards going for cool prices.</div><div>Clone cards are spammed credit c=
ards with clean funds. My clone cards are available for cash out in ATMs=F0=
=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F and can be used for online purchas=
es. Our clone card comes with an ATM pin for easy cash outs =E2=84=A2=EF=B8=
=8F</div><div style=3D"color: rgb(80, 0, 80);"><div>$300 for balance $2k</d=
iv><div>$400 for balance $5K</div><div>$500for balance $7k</div><div>$700 f=
or balance $10k</div></div><div><br /></div><div style=3D"color: rgb(80, 0,=
 80);"><div>https://t.me/motionking_caliweed_psychedelics<br /></div><div>H=
igh balance</div><div>$1k for balance $15k</div><div>$3k for balance $30k</=
div><div>$5k balance $50k</div><div>$7k for balance $75k</div><div><br /></=
div><div>https://t.me/motionking_caliweed_psychedelics<br /></div></div><di=
v class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Sunday, J=
une 2, 2024 at 9:19:23=E2=80=AFPM UTC+1 Dwayne Mickey wrote:<br/></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1p=
x solid rgb(204, 204, 204); padding-left: 1ex;"><br>Get at me for your low =
&amp; high balance clone cards going for cool prices.<div><a href=3D"https:=
//t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-milk-choco=
late-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D1717472725946000&amp;usg=
=3DAOvVaw2j5zq4wTlmGFlDn7dVQBGd">https://t.me/Ricko_swavy8/product/good-tri=
p-milk-chocolate-bars-for-sale/</a> Clone cards are spammed credit cards wi=
th clean funds. My clone cards are available for cash out in ATMs=F0=9F=8F=
=A7,Gas stations=E2=9B=BD=EF=B8=8F and can be used for online purchases. Ou=
r clone card comes with an ATM pin for easy cash outs =E2=84=A2=EF=B8=8F</d=
iv><div>$300 for balance $2k</div><div>$400 for balance $5K</div><div>$500f=
or balance $7k</div><div>$700 for balance $10k</div><div><a href=3D"https:/=
/t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-milk-choco=
late-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D1717472725946000&amp;usg=
=3DAOvVaw2j5zq4wTlmGFlDn7dVQBGd">https://t.me/Ricko_swavy8/product/good-tri=
p-milk-chocolate-bars-for-sale/</a></div><div><br></div><div>High balance</=
div><div>$1k for balance $15k</div><div>$3k for balance $30k</div><div>$5k =
balance $50k</div><div>$7k for balance $ 75k</div><div><a href=3D"https://t=
.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/" target=3D=
"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-milk-chocolat=
e-bars-for-sale/&amp;source=3Dgmail&amp;ust=3D1717472725946000&amp;usg=3DAO=
vVaw2j5zq4wTlmGFlDn7dVQBGd">https://t.me/Ricko_swavy8/product/good-trip-mil=
k-chocolate-bars-for-sale/</a></div><div><a href=3D"https://t.me/Ricko_swav=
y8/product/good-trip-milk-chocolate-bars-for-sale/" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-bars-for-s=
ale/&amp;source=3Dgmail&amp;ust=3D1717472725946000&amp;usg=3DAOvVaw2j5zq4wT=
lmGFlDn7dVQBGd">https://t.me/Ricko_swavy8/product/good-trip-milk-chocolate-=
bars-for-sale/</a></div><div>=E2=80=A2 Shipping =F0=9F=9B=AB =F0=9F=9B=AB</=
div><div><br></div><div>=E2=80=A2 Swift Delivery On DHL &amp; FedEx express=
</div><div><a href=3D"https://t.me/Ricko_swavy8/product/good-trip-milk-choc=
olate-bars-for-sale/" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/Ricko_swavy8/=
product/good-trip-milk-chocolate-bars-for-sale/&amp;source=3Dgmail&amp;ust=
=3D1717472725946000&amp;usg=3DAOvVaw2j5zq4wTlmGFlDn7dVQBGd">https://t.me/Ri=
cko_swavy8/product/good-trip-milk-chocolate-bars-for-sale/</a></div><div><b=
r></div><div>Text me now and make your</div><div class=3D"gmail_quote"><div=
 dir=3D"auto" class=3D"gmail_attr">On Saturday, June 1, 2024 at 11:32:32=E2=
=80=AFAM UTC+1 Asah Randy wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br><div><span style=3D"color:rgb(80,0,80)">Get at me for your l=
ow &amp; high balance clone cards going for cool prices.</span><div style=
=3D"color:rgb(80,0,80)"><br></div><div style=3D"color:rgb(80,0,80)"><br></d=
iv><div style=3D"color:rgb(80,0,80)"><a href=3D"https://t.me/motionking_cal=
iweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionking_cali=
weed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717472725946000&amp;usg=3DA=
OvVaw36LJEOOZ5c3cAYSqi7Ys1U">https://t.me/motionking_caliweed_psychedelics<=
/a><br></div><div style=3D"color:rgb(80,0,80)"><br></div><div style=3D"colo=
r:rgb(80,0,80)"><br></div><div style=3D"color:rgb(80,0,80)">Clone cards are=
 spammed credit cards with clean funds. My clone cards are available for ca=
sh out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F and can be used f=
or online purchases. Our clone card comes with an ATM pin for easy cash out=
s =E2=84=A2=EF=B8=8F</div><div style=3D"color:rgb(80,0,80)">$300 for balanc=
e $2k</div><div style=3D"color:rgb(80,0,80)">$400 for balance $5K</div><div=
 style=3D"color:rgb(80,0,80)">$500for balance $7k</div><div style=3D"color:=
rgb(80,0,80)">$700 for balance $10k</div><div style=3D"color:rgb(80,0,80)">=
<br></div><div style=3D"color:rgb(80,0,80)"><a href=3D"https://t.me/motionk=
ing_caliweed_psychedelics" rel=3D"nofollow" target=3D"_blank" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/motionki=
ng_caliweed_psychedelics&amp;source=3Dgmail&amp;ust=3D1717472725946000&amp;=
usg=3DAOvVaw36LJEOOZ5c3cAYSqi7Ys1U">https://t.me/motionking_caliweed_psyche=
delics</a><br></div><div style=3D"color:rgb(80,0,80)"><br></div><div style=
=3D"color:rgb(80,0,80)">High balance</div><div style=3D"color:rgb(80,0,80)"=
>$1k for balance $15k</div><div style=3D"color:rgb(80,0,80)">$3k for balanc=
e $30k</div><div style=3D"color:rgb(80,0,80)">$5k balance $50k</div><div st=
yle=3D"color:rgb(80,0,80)">$7k for balance $ 75k</div></div></blockquote></=
div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/47bde811-e488-4afb-8a2e-e4d08db0ca76n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/47bde811-e488-4afb-8a2e-e4d08db0ca76n%40googlegroups.co=
m</a>.<br />

------=_Part_280844_1467232940.1717386474906--

------=_Part_280843_414470487.1717386474906--
