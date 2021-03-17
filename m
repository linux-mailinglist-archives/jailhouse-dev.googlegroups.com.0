Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB5P2Y2BAMGQEAA4ILIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE7333EB75
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 09:27:34 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id 130sf28801449qkm.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k0LWWzQm0noTeuR1N6FVU4SAJvQZX/gTjmgNLuxCbNU=;
        b=FE2X9jbaPbVjdv9rL7zPxk+QK5dsU6TmnKPbDg0/pWeo+/31Gni4CnZlpFNEdDNAtS
         mK67gjtUVwbuoua3guhhwy6X4Ofrw2pU3e9jlnQ0/P3+ET9HsTUhXs0sCPEP2wuGaF5O
         nRT73XgmEO2c5IlGavhlK95hQcnj1Y66Koznnezt8K1rADlDREd/dfaSpnF8cLciIkyP
         b7m7hBuhkwUNf202F7N+oVyn8CnA2ygku2hTY6NXIIPjgIluZd0/GKv2P029yu2rUtbX
         5gTBzfBqbKZfyB0knjS5pixA+WnUUuyvC4pVr2fxwDK0mPIK0yTrM262tQ3LmGkje9qr
         aTzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k0LWWzQm0noTeuR1N6FVU4SAJvQZX/gTjmgNLuxCbNU=;
        b=Y//+j8jlYJNYSIrz2xjOqsdoEJ09co88LNoKgc570asvF/izx7AK4n03HM8Whuypjs
         Ju5Gt9e5HwvWeSNRn8NrAs3s4TY/+k3tmdC64SLlw8p9Km6ZaVX3y2lHWPthWmtyxtyE
         Hmz4deGdsZGtoExwKdVUBPvQDpdTcCMrSslD5bbqG0iyDwdEkiPvaeMWw1i9Z4Cmk2I/
         nAtmPklbC9GIQ+6gMnQqL82zpmAy78I6vneNN3lkYGFXz2TDruabFWQ3KQCqdeBd/aEu
         LQpQH1c1ndEM8t6/yOvQkc2QUwvrWeKimyFGHG8Icy5oQ2MZYZPm1IzutfTbcd4Enr5Q
         5oYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=k0LWWzQm0noTeuR1N6FVU4SAJvQZX/gTjmgNLuxCbNU=;
        b=U60MBcxxdlZ6yQZV9A3gf6RlOJDTLsYX7zyIkvEWHGKrc8W5cqGF2agnHT35undOG3
         /GrqfCzEdra/H1MNRw+bgmELlCRjRneN6Dvtq+QyQbL2efFd/50Gvdek2MUQZ53QdfMV
         UlwcizkirP1Qsk/roiCHS+l3GeR8kBFs5PrL5N3HKTZIL8mLx3SOa1n72eEqp9QbTE03
         IslEMUE9qt4tpur1IL/QUmsFSWkShUlC6CTMI5qI82Kb/NQDMZkH+b3X8MlSsAscrbVj
         9tquK8LYHG2s4WT3CyaltpWL68XEYcmVfhE0svgnQyP6NWekH9XEiS6Bv8PHwObXRFJX
         ePaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Sd2iT5Mv+e7C7m+vs1sE5N8781mV/Uy3WnPNgCjL4nuWcmG/J
	IqTehVnVpk52XSR1FgYXWqc=
X-Google-Smtp-Source: ABdhPJx+A0N5/SDPnydrrvZq6iOKbD/0a9H7X7ucjlWeJ5+v4oJmCoSrvHR3yu1HBSm1DI9eeTbzJA==
X-Received: by 2002:a05:620a:699:: with SMTP id f25mr3502444qkh.249.1615969653759;
        Wed, 17 Mar 2021 01:27:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:c207:: with SMTP id i7ls12540781qkm.9.gmail; Wed, 17 Mar
 2021 01:27:33 -0700 (PDT)
X-Received: by 2002:a37:a515:: with SMTP id o21mr3451444qke.307.1615969653139;
        Wed, 17 Mar 2021 01:27:33 -0700 (PDT)
Date: Wed, 17 Mar 2021 01:27:32 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3fa39e88-c9d8-4f6d-9451-01331b459903n@googlegroups.com>
In-Reply-To: <AM0PR03MB44504D2242854324D3B00F16B66A9@AM0PR03MB4450.eurprd03.prod.outlook.com>
References: <AQHXGwLegvUwVQtp5kaKjLbc9MIQ76qH0Iww>
 <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
 <b736e651-8add-7e49-f103-728173b0b751@siemens.com>
 <AM0PR03MB44504D2242854324D3B00F16B66A9@AM0PR03MB4450.eurprd03.prod.outlook.com>
Subject: Re: where can I get configuration document ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4642_1804932637.1615969652638"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_4642_1804932637.1615969652638
Content-Type: multipart/alternative; 
	boundary="----=_Part_4643_470689547.1615969652638"

------=_Part_4643_470689547.1615969652638
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It can be found here:
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf

=E5=9C=A82021=E5=B9=B43=E6=9C=8817=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+=
8 =E4=B8=8B=E5=8D=884:00:38<Sainz Markel> =E5=86=99=E9=81=93=EF=BC=9A

>
> -----Mensaje original-----
> De: jailho...@googlegroups.com <jailho...@googlegroups.com> En nombre de=
=20
> Jan Kiszka
> Enviado el: mi=C3=A9rcoles, 17 de marzo de 2021 8:48
> Para: Smith li <v654...@gmail.com>; Jailhouse <jailho...@googlegroups.com=
>
> Asunto: Re: where can I get configuration document ?
>
> CAUTION: This email originated from outside of the organization. Do not=
=20
> click links or open attachments unless you recognize the sender and know=
=20
> the content is safe.
>
>
> >On 15.03.21 07:47, Smith li wrote:
> >> In
> >> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
th
> >> ub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2Fconfigu
> >> ration-format.md&amp;data=3D04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f=
34
> >> 43ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7C6375
> >> 15645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> >> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DwldQEArIJ%2FcFx=
Gw
> >> 4x6SskbaxOJyVdBLeDuM1vOMWO%2Bc%3D&amp;reserved=3D0
> >> It only shows "To be written..." .
> >>
> >> I found how to write right .c configuration is very important .
> >> For example , I want add a new inmate, a new inmate to run linux, I
> >> don't know how to set the value in the document.
> >>
> >> The result is I can't easily run a new inmate.
> >> I think it's not good.
> >>
> >> Will the document be written ?
> >> or
> >> Where can I found some good tips about how to write a right .c=20
> >> configuration?
> >> Thanks very much!
>
> >Eventually, this document needs to be written, at least to describe the=
=20
> binary format (which is expected to stay). The way we generate it >right=
=20
> now via C may change, though.
>
> >For the time being, have a look at existing configurations, in the main=
=20
> tree as well as in jailhouse-images (depending on your target) and >also=
=20
> study the tutorial I gave a long time ago [1][2]. Some aspects have chang=
ed=20
> since then but not essential concepts.
>
> >When details are unclear, ask questions here.
>
> >Jan.
>
> >[1]
>
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fevent=
s.linuxfoundation.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE2016-Jailhous=
e-Tutorial.pdf&amp;data=3D04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3443ea2=
8df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7C63751564517038=
6416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Deli3PRBWeg4PUcrt%2BU6XJdukfxxwwqNji=
lc8h1YzrRY%3D&amp;reserved=3D0
> >[2]=20
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fyoutu=
.be%2F7fiJbwmhnRw%3Flist%3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q&amp;data=3D04=
%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3443ea28df08d8e919c2b7%7C910ac815f8=
554a08bf2990b46552cf11%7C0%7C0%7C637515645170386416%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&=
amp;sdata=3Dnm0vus3DsupHfxZ7sDPu4yhbVKkQbRHNtBcMezsykzk%3D&amp;reserved=3D0
>
> Hi Jan,
>
> First link is down. Can you check it?
>
> Markel.
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3fa39e88-c9d8-4f6d-9451-01331b459903n%40googlegroups.com.

------=_Part_4643_470689547.1615969652638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>It can be found here:</div>https://events.static.linuxfound.org/sites/=
events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf<br><br><div class=3D"gm=
ail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B43=
=E6=9C=8817=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 =E4=B8=8B=E5=8D=884:0=
0:38&lt;Sainz Markel> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb=
(204, 204, 204); padding-left: 1ex;">
<br>-----Mensaje original-----
<br>De: <a href data-email-masked rel=3D"nofollow">jailho...@googlegroups.c=
om</a> &lt;<a href data-email-masked rel=3D"nofollow">jailho...@googlegroup=
s.com</a>&gt; En nombre de Jan Kiszka
<br>Enviado el: mi=C3=A9rcoles, 17 de marzo de 2021 8:48
<br>Para: Smith li &lt;<a href data-email-masked rel=3D"nofollow">v654...@g=
mail.com</a>&gt;; Jailhouse &lt;<a href data-email-masked rel=3D"nofollow">=
jailho...@googlegroups.com</a>&gt;
<br>Asunto: Re: where can I get configuration document ?
<br>
<br>CAUTION: This email originated from outside of the organization. Do not=
 click links or open attachments unless you recognize the sender and know t=
he content is safe.
<br>
<br>
<br>&gt;On 15.03.21 07:47, Smith li wrote:
<br>&gt;&gt; In
<br>&gt;&gt; <a href=3D"https://eur02.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgith" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://eur02.safelink=
s.protection.outlook.com/?url%3Dhttps%253A%252F%252Fgith&amp;source=3Dgmail=
&amp;ust=3D1616055833403000&amp;usg=3DAFQjCNFkYYkgtoSkjFYAn5nIXezK0Pr4nQ">h=
ttps://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith</a>
<br>&gt;&gt; <a href=3D"http://ub.com" target=3D"_blank" rel=3D"nofollow" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp:/=
/ub.com&amp;source=3Dgmail&amp;ust=3D1616055833403000&amp;usg=3DAFQjCNFznB7=
-76BLfRtqRcChIrls9q6vsg">ub.com</a>%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2=
FDocumentation%2Fconfigu
<br>&gt;&gt; ration-format.md&amp;amp;data=3D04%7C01%7Cmsainz%<a href=3D"ht=
tp://40ikerlan.es" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://40ikerlan.es&amp;s=
ource=3Dgmail&amp;ust=3D1616055833403000&amp;usg=3DAFQjCNFjtEzWDBHIVpuRLvOg=
Vo6S-iE8Mw">40ikerlan.es</a>%7Ce416bf160f34
<br>&gt;&gt; 43ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C=
0%7C6375
<br>&gt;&gt; 15645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2l
<br>&gt;&gt; uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dwld=
QEArIJ%2FcFxGw
<br>&gt;&gt; 4x6SskbaxOJyVdBLeDuM1vOMWO%2Bc%3D&amp;amp;reserved=3D0
<br>&gt;&gt; It only shows &quot;To be written...&quot; .
<br>&gt;&gt;
<br>&gt;&gt; I found how to write  right .c configuration is very important=
 .
<br>&gt;&gt; For example , I want  add a new inmate,   a new inmate to run =
linux,  I
<br>&gt;&gt; don&#39;t know how to set the value in the document.
<br>&gt;&gt;
<br>&gt;&gt; The result is I can&#39;t   easily run a new  inmate.
<br>&gt;&gt; I think it&#39;s not good.
<br>&gt;&gt;
<br>&gt;&gt; Will  the document be written ?
<br>&gt;&gt; or
<br>&gt;&gt; Where  can  I found some  good tips  about  how to write a  ri=
ght  .c=20
<br>&gt;&gt; configuration?
<br>&gt;&gt; Thanks very much!
<br>
<br>&gt;Eventually, this document needs to be written, at least to describe=
 the binary format (which is expected to stay). The way we generate it &gt;=
right now via C may change, though.
<br>
<br>&gt;For the time being, have a look at existing configurations, in the =
main tree as well as in jailhouse-images (depending on your target) and &gt=
;also study the tutorial I gave a long time ago [1][2]. Some aspects have c=
hanged since then but not essential concepts.
<br>
<br>&gt;When details are unclear, ask questions here.
<br>
<br>&gt;Jan.
<br>
<br>&gt;[1]
<br><a href=3D"https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fevents.linuxfoundation.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE=
2016-Jailhouse-Tutorial.pdf&amp;amp;data=3D04%7C01%7Cmsainz%40ikerlan.es%7C=
e416bf160f3443ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0=
%7C637515645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Deli3PRBWeg4PUc=
rt%2BU6XJdukfxxwwqNjilc8h1YzrRY%3D&amp;amp;reserved=3D0" target=3D"_blank" =
rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh=
-CN&amp;q=3Dhttps://eur02.safelinks.protection.outlook.com/?url%3Dhttps%253=
A%252F%252Fevents.linuxfoundation.org%252Fsites%252Fevents%252Ffiles%252Fsl=
ides%252FELCE2016-Jailhouse-Tutorial.pdf%26amp;data%3D04%257C01%257Cmsainz%=
2540ikerlan.es%257Ce416bf160f3443ea28df08d8e919c2b7%257C910ac815f8554a08bf2=
990b46552cf11%257C0%257C0%257C637515645170386416%257CUnknown%257CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%253D%257C=
3000%26amp;sdata%3Deli3PRBWeg4PUcrt%252BU6XJdukfxxwwqNjilc8h1YzrRY%253D%26a=
mp;reserved%3D0&amp;source=3Dgmail&amp;ust=3D1616055833404000&amp;usg=3DAFQ=
jCNGO1jv328rpLM7X4clhWm0Cryyajw">https://eur02.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fevents.linuxfoundation.org%2Fsites%2Fevents%2Ffil=
es%2Fslides%2FELCE2016-Jailhouse-Tutorial.pdf&amp;amp;data=3D04%7C01%7Cmsai=
nz%40ikerlan.es%7Ce416bf160f3443ea28df08d8e919c2b7%7C910ac815f8554a08bf2990=
b46552cf11%7C0%7C0%7C637515645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdat=
a=3Deli3PRBWeg4PUcrt%2BU6XJdukfxxwwqNjilc8h1YzrRY%3D&amp;amp;reserved=3D0</=
a>
<br>&gt;[2] <a href=3D"https://eur02.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fyoutu.be%2F7fiJbwmhnRw%3Flist%3DPLbzoR-pLrL6pRFP6SOywVJWdE=
HlmQE51q&amp;amp;data=3D04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3443ea28d=
f08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7C6375156451703864=
16%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dnm0vus3DsupHfxZ7sDPu4yhbVKkQbRHNt=
BcMezsykzk%3D&amp;amp;reserved=3D0" target=3D"_blank" rel=3D"nofollow" data=
-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://e=
ur02.safelinks.protection.outlook.com/?url%3Dhttps%253A%252F%252Fyoutu.be%2=
52F7fiJbwmhnRw%253Flist%253DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q%26amp;data%3=
D04%257C01%257Cmsainz%2540ikerlan.es%257Ce416bf160f3443ea28df08d8e919c2b7%2=
57C910ac815f8554a08bf2990b46552cf11%257C0%257C0%257C637515645170386416%257C=
Unknown%257CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%253D%257C3000%26amp;sdata%3Dnm0vus3DsupHfxZ7sDPu4yhbVKkQbRHNtB=
cMezsykzk%253D%26amp;reserved%3D0&amp;source=3Dgmail&amp;ust=3D161605583340=
4000&amp;usg=3DAFQjCNE2_sMO-AH8Sicyy9q1ECpbm8ub8Q">https://eur02.safelinks.=
protection.outlook.com/?url=3Dhttps%3A%2F%2Fyoutu.be%2F7fiJbwmhnRw%3Flist%3=
DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q&amp;amp;data=3D04%7C01%7Cmsainz%40ikerl=
an.es%7Ce416bf160f3443ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11=
%7C0%7C0%7C637515645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dnm0vus=
3DsupHfxZ7sDPu4yhbVKkQbRHNtBcMezsykzk%3D&amp;amp;reserved=3D0</a>
<br>
<br>Hi Jan,
<br>
<br>First link is down. Can you check it?
<br>
<br>Markel.
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3fa39e88-c9d8-4f6d-9451-01331b459903n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3fa39e88-c9d8-4f6d-9451-01331b459903n%40googlegroups.co=
m</a>.<br />

------=_Part_4643_470689547.1615969652638--

------=_Part_4642_1804932637.1615969652638--
