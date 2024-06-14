Return-Path: <jailhouse-dev+bncBCCMRLPB2UFRBRWNWCZQMGQE7BNQDSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADED908AB1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2024 13:17:28 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dfe2488aec9sf352956276.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2024 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1718363847; x=1718968647; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCD9FZb8/6k0E+wkToQRG/LJf/aw4+X/Mbi8wUpvMPY=;
        b=EdNxXLQefOJxqVLM+EpliYChm8akQB28QmVwIhGXI6tTgfVOjvQdZMSiQ50AHGzkKd
         xfUNMW0RiatF+0IxmZVOEWYpV/oxgLjQdTRQ/Cs+EMR6KbQQhQ4pG8JOrZcCqhjJRJlO
         6Ccl+mZzjtnOFt9QbKsebmC0ed7y+9HgDDok0W6u0g7C01Mc6qAtMCWia1BgYEoZmHGV
         /d/i4XDKs2nx/99CsT3uD53k3axSLRs5Q3RCufexngujxeJfDYxWo3UP2kEEtPORf2ne
         qNVo1P6QA80CR5EYSCsLQMzEnU2vIC+MQJ2kBWtYFbOyR7RIm+qhPDKuQiaeqYPKjVIY
         kztg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718363847; x=1718968647; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCD9FZb8/6k0E+wkToQRG/LJf/aw4+X/Mbi8wUpvMPY=;
        b=KtetnSdGCqn5bslygNPwSHa/CMXKYqFXY6W5Y9WTk37btslpxPMVx8PuvEBr9ldI53
         6lEcSstnnAQA5M18peEsQmoWS30P4hQHN9E/zq2tha53B9zW8R2FN/V+BUcY1aeDQbHC
         PEwvGUvCDr2J7SmVrPJNIYUqfzz8VjnSU6RH1TkCZXOb2jokfmcn7WM3ysXoEJPzSdsS
         v2pyTMalOuq0MvkJyKf4ozTU2IhpSs7PQcecIbQ5byS0yq+yT7zmd3lqin3vZt3zZFBk
         jpCirH4VS8adFlhXJJcrNWlrFTUzPMWCK0G0eaKogrNMuwaNJGKOQ+wwRSdfBy8vo135
         By6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718363847; x=1718968647;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCD9FZb8/6k0E+wkToQRG/LJf/aw4+X/Mbi8wUpvMPY=;
        b=ZUS9cknkDdbuFgqLReRPTrEyCyk3CBLYbfiFiVCDLe+QNf7pa9N/0+qDz76836J7wC
         uEJHmSD+U/V58+itKiqnenFxQ8lxnf1hvAbh9GpHpOnpjhS1zZpO4FRBNeNG3+F5IIMV
         fm8UK+54n9p8/1ZNyVgjL1+La9I+b1nGYwoFhygvtGabKeRb/sDBZgFp3QsdZ2xJ8Y/B
         sTgKsIRgo63+AMPQzHnWq3SabqY66kkOWWEMVrSKKqpSUZrxthNaDPFBj2xHI9ydyAer
         u/EIBxdXqoqhig9nfM1ly/7yictj5lTcxubd9Kr+m7fRDAl+TWCDYuqL1zOpNwLSKop+
         PaOA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXej9DxnKipEHBWAxN6/1kdFxuBJGCUAkWEB+A5ayrRIesrhPGPjZ/hFXK/53YwEkILG3HpPs1GJbpOvnPA+OrmGB1Om2xjRcrcfVk=
X-Gm-Message-State: AOJu0YxIoHe+T0dnQ5Wi0U+tKc8LxIr9A54QsNwFFfVDdaYv5qcGoYjV
	j0u5HjNS6BHBUue+5WVR99kn61jx+mDvvnTvXmWthI6THc6Axoa1
X-Google-Smtp-Source: AGHT+IHTKDhxYHotAXyFOJ0CwkE5mMw+4rYE9sJXIXM3igkBjnYbPwttJAL6L5DUReJUlSIIFZtpDQ==
X-Received: by 2002:a25:74c5:0:b0:dfb:54b:fbc1 with SMTP id 3f1490d57ef6-dff150e1ebemr1972876276.0.1718363847017;
        Fri, 14 Jun 2024 04:17:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:150a:b0:dfd:ee2e:d48e with SMTP id
 3f1490d57ef6-dfefeb05de1ls3150749276.2.-pod-prod-05-us; Fri, 14 Jun 2024
 04:17:25 -0700 (PDT)
X-Received: by 2002:a25:6942:0:b0:dff:2349:bd59 with SMTP id 3f1490d57ef6-dff2349c28emr45458276.1.1718363844101;
        Fri, 14 Jun 2024 04:17:24 -0700 (PDT)
Date: Fri, 14 Jun 2024 04:17:22 -0700 (PDT)
From: Clarksville Pop <popclarksville@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <41ab4c3d-e91c-4322-9282-9d7c4ff85749n@googlegroups.com>
In-Reply-To: <13550f2d-5902-468a-8fcc-849a5daafb01n@googlegroups.com>
References: <00efaad9-c84e-4a0f-b16e-512d1351ca2c@googlegroups.com>
 <13550f2d-5902-468a-8fcc-849a5daafb01n@googlegroups.com>
Subject: jailhouse + ZCU102 V1.0 + second UART problem + petalinux 2017.4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1654_1523626120.1718363842995"
X-Original-Sender: popclarksville@gmail.com
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

------=_Part_1654_1523626120.1718363842995
Content-Type: multipart/alternative; 
	boundary="----=_Part_1655_1947163120.1718363842995"

------=_Part_1655_1947163120.1718363842995
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


PolkaDot mushroom, also known as Fly Agaric or Amanita muscaria, here are=
=20
some ideas to help you stand out:
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
. The Enigmatic World of the PolkaDot Mushroom: Craft an article that=20
explores the fascinating characteristics, cultural significance, and=20
historical uses of the PolkaDot mushroom. Discuss its distinctive=20
appearance, natural habitats, and the myths or folklore associated with=20
this iconic mushroom.
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
 Psychedelic Potential of the PolkaDot Mushroom: Investigate the=20
psychoactive properties and effects of the PolkaDot mushroom. Provide a=20
balanced exploration of its hallucinogenic compounds, experiential=20
accounts, and potential therapeutic applications. Emphasize responsible=20
use, safe practices, and the importance of understanding the risks=20
associated with consuming this mushroom.
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
 Foraging Tips and Ethical Harvesting of PolkaDot Mushrooms: Create a guide=
=20
for those interested in foraging for PolkaDot mushrooms. Discuss the ideal=
=20
growing conditions, identification techniques, and precautions for safe=20
mushroom harvesting. Emphasize the importance of sustainable foraging=20
practices, including leaving a minimal ecological footprint and respecting=
=20
local regulations.
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
PolkaDot Mushroom in Art and Culture: Explore the presence of the PolkaDot=
=20
mushroom in various art forms, including literature, visual arts, and=20
mythology. Highlight famous artworks, literary works, and cultural=20
references that have depicted or mentioned the iconic mushroom. Discuss how=
=20
it has been symbolically interpreted and its role in different cultural=20
traditions/ order products=20
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/
. The Science Behind the PolkaDot Mushroom: Offer a scientific perspective=
=20
on the biology, taxonomy, and chemistry of the PolkaDot mushroom. Discuss=
=20
its unique features, mycological relationship, and the chemical compounds=
=20
responsible for its psychoactive effects. Cite relevant scientific studies=
=20
and provide insights into ongoing research in this field./
https://psychedelicsdreams.com/
https://psychedelicsdreams.com/

 Safety Precautions and Identifying Look-Alike Mushrooms: Educate readers=
=20
on how to differentiate the PolkaDot mushroom from similar-looking species=
=20
and potential look-alikes. Provide clear guidelines, images, and=20
descriptions to help readers make accurate identifications and avoid=20
harmful or poisonous fungi.
https://psychedelicsdreams.com/
Culinary Uses and Traditional Recipes: Explore the culinary traditions=20
surrounding the PolkaDot mushroom and share creative and traditional=20
recipes that utilize this unique ingredient. Highlight cooking methods,=20
flavor profiles, and cultural dishes that incorporate the mushroom. Include=
=20
safety considerations and proper preparation techniques to neutralize its=
=20
psychoactive compounds.

https://psychedelicsdreams.com/
On Tuesday, June 11, 2024 at 11:53:06=E2=80=AFAM UTC+1 https://deltacartsto=
re.com/=20
wrote:

> We are world wide best online psychedelic  shop, more importantly, you ca=
n=20
> easily get your stuffs discreetly and fast, again where to buy magic=20
> mushrooms online in USA ship discreet. Buying magic mushrooms online is o=
ne=20
> of the difficulties depressed people face daily. In Australia, USA, UK,=
=20
> Canada etc. Buy Magic Mushrooms Online Seattle.=20
>
>
>  order directly from our website=20
>
> https://deltacartstore.com/
> https://deltacartstore.com/
> https://deltacartstore.com/
>
> 100% discreet and confidential,
> -Your personal information is 100% SECURE.
> -Your orders are 100% secure and anonymous.
> -Fast delivery worldwide (you can track the shipment with the provided=20
> tracking number).   =20
>
> On Wednesday, June 27, 2018 at 9:33:04=E2=80=AFAM UTC-7 christophe...@gma=
il.com=20
> wrote:
>
>> hi all,
>>
>> i'm trying to make jailhouse work on my ZCU102 v1.0 (production)
>> using petalinux 2017.4 following this documentation :=20
>>
>>
>> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-=
zynqmp-zcu102.md
>>
>>
>> the second uart doesn't work. After a question on the Xilinx forum
>>
>>
>> https://forums.xilinx.com/t5/Embedded-Linux/ZCU102-V1-0-petalinux-2017-4=
-ttyPS1-uart-doesn-t-work/m-p/867113/highlight/false#M26987
>>
>> i can activate /dev/ttyPS1 on the zcu102 and verify it using=20
>>
>> echo hello > /dev/ttyPS1
>>
>> but i still can't use it with jailhouse.
>>
>>
>> i have checked with the gic-demo and linux-demo without any success.
>> i can use the debug console with gic-demo, but that's all.
>>
>> this command should work, but it doesn't :=20
>>
>> jailhouse cell linux zynqmp-zcu102-linux-demo.cell Image -d=20
>> inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c "console=3DttyPS1,115200"
>>
>>
>> in the zynqmp-zcu102-linux-demo.c file, the uart address is correct :=20
>>
>> .mem_regions =3D {
>> /* UART */ {
>> .phys_start =3D 0xff010000,
>> .virt_start =3D 0xff010000,
>> .size =3D 0x1000,
>> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> },
>>
>> what can i do ?
>>
>> regards
>> C.Alexandre
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/41ab4c3d-e91c-4322-9282-9d7c4ff85749n%40googlegroups.com.

------=_Part_1655_1947163120.1718363842995
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />PolkaDot mushroom, also known as Fly Agaric or Amanita muscaria, here=
 are some ideas to help you stand out:<br />https://psychedelicsdreams.com/=
<br />https://psychedelicsdreams.com/<br />https://psychedelicsdreams.com/<=
br />https://psychedelicsdreams.com/<br />https://psychedelicsdreams.com/<b=
r />https://psychedelicsdreams.com/<br />https://psychedelicsdreams.com/<br=
 />. The Enigmatic World of the PolkaDot Mushroom: Craft an article that ex=
plores the fascinating characteristics, cultural significance, and historic=
al uses of the PolkaDot mushroom. Discuss its distinctive appearance, natur=
al habitats, and the myths or folklore associated with this iconic mushroom=
.<br />https://psychedelicsdreams.com/<br />https://psychedelicsdreams.com/=
<br />https://psychedelicsdreams.com/<br />https://psychedelicsdreams.com/<=
br />=C2=A0Psychedelic Potential of the PolkaDot Mushroom: Investigate the =
psychoactive properties and effects of the PolkaDot mushroom. Provide a bal=
anced exploration of its hallucinogenic compounds, experiential accounts, a=
nd potential therapeutic applications. Emphasize responsible use, safe prac=
tices, and the importance of understanding the risks associated with consum=
ing this mushroom.<br />https://psychedelicsdreams.com/<br />https://psyche=
delicsdreams.com/<br />=C2=A0Foraging Tips and Ethical Harvesting of PolkaD=
ot Mushrooms: Create a guide for those interested in foraging for PolkaDot =
mushrooms. Discuss the ideal growing conditions, identification techniques,=
 and precautions for safe mushroom harvesting. Emphasize the importance of =
sustainable foraging practices, including leaving a minimal ecological foot=
print and respecting local regulations.<br />https://psychedelicsdreams.com=
/<br />https://psychedelicsdreams.com/<br />https://psychedelicsdreams.com/=
<br />PolkaDot Mushroom in Art and Culture: Explore the presence of the Pol=
kaDot mushroom in various art forms, including literature, visual arts, and=
 mythology. Highlight famous artworks, literary works, and cultural referen=
ces that have depicted or mentioned the iconic mushroom. Discuss how it has=
 been symbolically interpreted and its role in different cultural tradition=
s/ order products <br />https://psychedelicsdreams.com/<br />https://psyche=
delicsdreams.com/<br />https://psychedelicsdreams.com/<br />. The Science B=
ehind the PolkaDot Mushroom: Offer a scientific perspective on the biology,=
 taxonomy, and chemistry of the PolkaDot mushroom. Discuss its unique featu=
res, mycological relationship, and the chemical compounds responsible for i=
ts psychoactive effects. Cite relevant scientific studies and provide insig=
hts into ongoing research in this field./<br />https://psychedelicsdreams.c=
om/<br />https://psychedelicsdreams.com/<br /><br />=C2=A0Safety Precaution=
s and Identifying Look-Alike Mushrooms: Educate readers on how to different=
iate the PolkaDot mushroom from similar-looking species and potential look-=
alikes. Provide clear guidelines, images, and descriptions to help readers =
make accurate identifications and avoid harmful or poisonous fungi.<br />ht=
tps://psychedelicsdreams.com/<br />Culinary Uses and Traditional Recipes: E=
xplore the culinary traditions surrounding the PolkaDot mushroom and share =
creative and traditional recipes that utilize this unique ingredient. Highl=
ight cooking methods, flavor profiles, and cultural dishes that incorporate=
 the mushroom. Include safety considerations and proper preparation techniq=
ues to neutralize its psychoactive compounds.<br /><br />https://psychedeli=
csdreams.com/<br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gm=
ail_attr">On Tuesday, June 11, 2024 at 11:53:06=E2=80=AFAM UTC+1 https://de=
ltacartstore.com/ wrote:<br/></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">We are world wide best online psychedelic =C2=A0shop, more imp=
ortantly, you can easily get your stuffs discreetly and fast, again where t=
o buy magic mushrooms online in USA ship discreet. Buying magic mushrooms o=
nline is one of the difficulties depressed people face daily. In Australia,=
 USA, UK, Canada etc. Buy Magic Mushrooms Online Seattle. <br><br><br>=C2=
=A0order directly from our website <br><br><a href=3D"https://deltacartstor=
e.com/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://=
www.google.com/url?hl=3Den&amp;q=3Dhttps://deltacartstore.com/&amp;source=
=3Dgmail&amp;ust=3D1718450203493000&amp;usg=3DAOvVaw0HRoR7iKyP4Tnn6fTR2V3m"=
>https://deltacartstore.com/</a><br><a href=3D"https://deltacartstore.com/"=
 target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://deltacartstore.com/&amp;source=3Dgmail&=
amp;ust=3D1718450203493000&amp;usg=3DAOvVaw0HRoR7iKyP4Tnn6fTR2V3m">https://=
deltacartstore.com/</a><br><a href=3D"https://deltacartstore.com/" target=
=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://deltacartstore.com/&amp;source=3Dgmail&amp;ust=
=3D1718450203493000&amp;usg=3DAOvVaw0HRoR7iKyP4Tnn6fTR2V3m">https://deltaca=
rtstore.com/</a><br><br>100% discreet and confidential,<br>-Your personal i=
nformation is 100% SECURE.<br>-Your orders are 100% secure and anonymous.<b=
r>-Fast delivery worldwide (you can track the shipment with the provided tr=
acking number).=C2=A0 =C2=A0=C2=A0<br><br><div class=3D"gmail_quote"><div d=
ir=3D"auto" class=3D"gmail_attr">On Wednesday, June 27, 2018 at 9:33:04=E2=
=80=AFAM UTC-7 <a href data-email-masked rel=3D"nofollow">christophe...@gma=
il.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">hi a=
ll,<p>i&#39;m trying to make jailhouse work on my ZCU102 v1.0 (production)<=
br>using petalinux 2017.4 following this documentation : <p><a href=3D"http=
s://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-=
zcu102.md" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://github.com/siemens/jailhouse/=
blob/master/Documentation/setup-on-zynqmp-zcu102.md&amp;source=3Dgmail&amp;=
ust=3D1718450203493000&amp;usg=3DAOvVaw3UFC0rf5a8LKXPmzzd5-34">https://gith=
ub.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu102.m=
d</a><p><br>the second uart doesn&#39;t work. After a question on the Xilin=
x forum<p><a href=3D"https://forums.xilinx.com/t5/Embedded-Linux/ZCU102-V1-=
0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/867113/highlight/false#M269=
87" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://forums.xilinx.com/t5/Embedded-Linux/=
ZCU102-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/867113/highlight/=
false%23M26987&amp;source=3Dgmail&amp;ust=3D1718450203493000&amp;usg=3DAOvV=
aw0Ek51ae__0BhOoiOuw3z8Z">https://forums.xilinx.com/t5/Embedded-Linux/ZCU10=
2-V1-0-petalinux-2017-4-ttyPS1-uart-doesn-t-work/m-p/867113/highlight/false=
#M26987</a><p>i can activate /dev/ttyPS1 on the zcu102 and verify it using =
<p> echo hello &gt; /dev/ttyPS1<p>but i still can&#39;t use it with jailhou=
se.<p><br>i have checked with the gic-demo and linux-demo without any succe=
ss.<br>i can use the debug console with gic-demo, but that&#39;s all.<p>thi=
s command should work, but it doesn&#39;t : <p>jailhouse cell linux zynqmp-=
zcu102-linux-demo.cell Image -d inmate-zynqmp-zcu102.dtb -i rootfs.cpio -c =
&quot;console=3DttyPS1,115200&quot;<p><br>in the zynqmp-zcu102-linux-demo.c=
 file, the uart address is correct : <p>	.mem_regions =3D {<br>		/* UART */=
 {<br>			.phys_start =3D 0xff010000,<br>			.virt_start =3D 0xff010000,<br>	=
		.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,<br>		},<p>what can=
 i do ?<p>regards<br>C.Alexandre</p></p></p></p></p></p></p></p></p></p></p=
></p></p></p></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/41ab4c3d-e91c-4322-9282-9d7c4ff85749n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/41ab4c3d-e91c-4322-9282-9d7c4ff85749n%40googlegroups.co=
m</a>.<br />

------=_Part_1655_1947163120.1718363842995--

------=_Part_1654_1523626120.1718363842995--
