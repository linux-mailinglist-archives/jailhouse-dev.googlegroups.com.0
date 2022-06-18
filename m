Return-Path: <jailhouse-dev+bncBDQKRTU7ZIKBB3HEWWKQMGQEIY4PH7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D655033B
	for <lists+jailhouse-dev@lfdr.de>; Sat, 18 Jun 2022 08:36:30 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id u8-20020a05620a454800b006a74e6b39eesf7312429qkp.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jun 2022 23:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZbfEjdr5kKuVWc067hPX6uyrcqgc2mwNiMhjET0En4s=;
        b=DDPZd0mDd6RaVoXu2uCSYAjDsv7+CVv/A8zkSL30BeBnCwiqkyo2GWRLmg58mASdjy
         GS8lQwfiKEO7JCWz6GUbTl93Dmj3HJIuJ8lXCvagOjfzpUzROMAJHhInfaw2iNk9/pGr
         rrvTdaCsEcu1oK0F0UvZsaNSFqoajtnHBqgepvC3OsIm77rjChBJ1io1SGuLlQfB8gBC
         O2SK4j2W1bc3Tkw+7b/HAu3jn8cj2BZv6kkrKVzSAGrA7iHqTINt8IHE4WY+B8ysAYf0
         3kZS8ymk05NEy/MYvutLJJt0CSsRlj2g8C/k9VO0+J+wVX0QJq0zrCB/GtT7V9DfS1DG
         ciDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZbfEjdr5kKuVWc067hPX6uyrcqgc2mwNiMhjET0En4s=;
        b=emZTK5S0k/zM32AXth1T/a/XisXXsS4tphHBNohedWKX2V6AXXlihzOeA7Z/gFqPFg
         5gdr/IXl5TeNHNyEk0fSl7K5C2ILmidYD0AvCzxFP+5xExpkJ+91QscpjHe3IEFJkau3
         WB/8RWSODpNkF+80egpdeP0+E1cIT1Avxczp+yp2fRlf/MNZBVxh8uzdUusfcEcjfw3l
         r78UjyeEHHAujgD/VvnbgVUrHdPpTxiu7I5g9dfBSXWbf++SelhsDPcKWTb2tUJEmn2u
         wP0muIDY53rId4P3qzfo37SMOowF78iZq6SvRPs+YQuhmQezOKm2o1mHthz3O7qL+QVl
         fVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZbfEjdr5kKuVWc067hPX6uyrcqgc2mwNiMhjET0En4s=;
        b=UxvgNxyJJNkv9gsMX5ig8YHsckxTJZKpn+S4k3AMYw1x1+7MFfHQeJb9+c+vli6gyK
         4hOuCXDW6zsKvZJbpdnLW1E2TsiJiRAwBP8gF3SYsD7s8l84Ho+3K2/VZcOsf0NrBw81
         bUBr+vRVGkV4Q7R5SSp1rrfcnxN0rH2xAV/3PHufcI6FRsfWG8Ejs68rGHDiWY/0hwbu
         GG5bmewaRdgqCgA0xLvEIBAtklgh/UxoT6HFUPDrbAfVDOjFoQk4T55tuV1p6hLz250C
         8+DiGU9p4VVwgHnN5TDkZ8THpuADd8d3rJA5ruuF1ysIWVuKo/u8+Yg0O57FxiFTXKLl
         /L4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/QbK8Iw5V96N0CTmQnSr0YfaDgZkjJI6tzflKbJebwhIZeKJoT
	gV/CbE7He9hIjaHZclRR6cM=
X-Google-Smtp-Source: AGRyM1thjYYbkNJUyC6Pf2NVD7o1vHKn5Igy4abYEB01OByZXzqUls2i9cVCZorN1/SNjGwKaqk6eA==
X-Received: by 2002:a05:620a:1787:b0:6ab:8ea0:6b2b with SMTP id ay7-20020a05620a178700b006ab8ea06b2bmr5480177qkb.271.1655534189284;
        Fri, 17 Jun 2022 23:36:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:d648:0:b0:46d:80ee:d34c with SMTP id e8-20020a0cd648000000b0046d80eed34cls3122865qvj.8.gmail;
 Fri, 17 Jun 2022 23:36:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2525:b0:462:661b:3d11 with SMTP id gg5-20020a056214252500b00462661b3d11mr11253417qvb.56.1655534188565;
        Fri, 17 Jun 2022 23:36:28 -0700 (PDT)
Date: Fri, 17 Jun 2022 23:36:28 -0700 (PDT)
From: star sun <sunxing960116@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <73c81520-68a0-4d95-9686-221a8c953ec5n@googlegroups.com>
In-Reply-To: <01c7501d-7b12-49b8-b544-fa5ffe749387n@googlegroups.com>
References: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
 <32ebc4ac-1d9d-8983-4c25-e23856da2fad@siemens.com>
 <CAGdCPwsigcxRcikcfUovOp7=q0g8eqXv3Cois+w_0cZR6R=v_Q@mail.gmail.com>
 <e2aed10a-4d8f-1d0a-852a-bd399ac5e667@web.de>
 <CAGdCPwu4v5S-ss9UzTi4tXJBQFZ1b-J6isA+TM301BdPRPHkxg@mail.gmail.com>
 <89ad4d62-8005-44a0-9153-ace14b658e64n@googlegroups.com>
 <798dc279-8f39-b3c6-c0ec-ff10c94c2f86@siemens.com>
 <01c7501d-7b12-49b8-b544-fa5ffe749387n@googlegroups.com>
Subject: Re: Root cell configuration for RPi4 with more than 1G of memory
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_998_538405226.1655534188015"
X-Original-Sender: sunxing960116@gmail.com
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

------=_Part_998_538405226.1655534188015
Content-Type: multipart/alternative; 
	boundary="----=_Part_999_74054859.1655534188015"

------=_Part_999_74054859.1655534188015
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have the same question...Could you please introduce the solution in=20
detail? Thank you





=E5=9C=A82021=E5=B9=B48=E6=9C=8820=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+=
8 16:04:33<mustafa...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A

> Thanks for your advice.=20
> It took me a lot of time, to make it work, I was only missing the=20
> ARM-Trusted-Firmware. And now it is working like charm.
> I needed to understand jaihouse better and every time I discover new and=
=20
> interesting information.=20
> Moustafa
> On Thursday, 19 August 2021 at 15:56:23 UTC+2 j.kiszka...@gmail.com wrote=
:
>
>> On 19.08.21 13:59, Moustafa Nofal wrote:=20
>> > I tried this configuration, but it did not work with me, I attached th=
e=20
>> > log file. I have Pi4(4GB version). Initially installed 5.10, it did no=
t=20
>> > compile so I back-patched to 5.3 and added CONFIG_HOTPLUG_CPU=3Dy to t=
he=20
>> > build configuration, I was able to understand, why it was essential.=
=20
>> > Then I tried different memory reservations using device tree:=20
>> >     reserved-memory {=20
>> >         #address-cells=3D<2>;=20
>> >         #size-cells=3D<1>;=20
>> >         ranges;=20
>> >         memmap:memmap@0x20000000{=20
>> >             reg =3D <0x0 0x20000000 0x10000000>;=20
>> >             };=20
>> >     };=20
>> > The memory is reserved and observable at proc/iomem but the result is=
=20
>> > either crash as in the log file or this:=20
>> > [ 1463.849868] jailhouse: request_mem_region failed for hypervisor=20
>> memory.=20
>> > [ 1463.849882] jailhouse: Did you reserve the memory with "memmap=3D" =
or=20
>> > "mem=3D"?=20
>> > In rpi4.c=20
>> > I edited memory regions to begin with 2:=20
>> >=20
>> >         .hypervisor_memory =3D {=20
>> >             .phys_start =3D 0x2fc00000,=20
>> >             .size       =3D 0x00400000,=20
>> >         },=20
>> > and the same for all memory regions.=20
>> >=20
>> > Something that I do not really understand, is the RAM address. In the=
=20
>> > jailhouse Image, there was a RAM at 0x20000000 and the image works=20
>> fine.=20
>> > But in my case there is nothing at this address.=20
>> > Any help would be appreciated and thanks in advance.=20
>> >=20
>>
>> Integrating all the loose ends of these targets is a hairy process (I=20
>> stopped counting hours I invested). Therefore, I strongly recommend=20
>> starting from jailhouse-images where the RPi4 works fine, at least here,=
=20
>> and then step-wise deviate from that towards whatever alternative=20
>> configuration is desired.=20
>>
>> Jan=20
>>
>> --=20
>> Siemens AG, T RDA IOT=20
>> Corporate Competence Center Embedded Linux=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/73c81520-68a0-4d95-9686-221a8c953ec5n%40googlegroups.com.

------=_Part_999_74054859.1655534188015
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have the same question...Could you please introduce the solution in detai=
l? Thank you<div><br><br><br><br><br><div class=3D"gmail_quote"><div dir=3D=
"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B48=E6=9C=8820=E6=97=A5=E6=
=98=9F=E6=9C=9F=E4=BA=94 UTC+8 16:04:33&lt;mustafa...@gmail.com&gt; =E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">Thanks for your advice. <br>It took me a lot of time, to make it wo=
rk, I was only missing the ARM-Trusted-Firmware. And now it is working like=
 charm.<br>I needed to understand jaihouse better and every time I discover=
 new and interesting information. <br>Moustafa<br><div class=3D"gmail_quote=
"><div dir=3D"auto" class=3D"gmail_attr">On Thursday, 19 August 2021 at 15:=
56:23 UTC+2 <a href=3D"" data-email-masked=3D"" rel=3D"nofollow">j.kiszka..=
.@gmail.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 19.08.21 13:59, Moustafa Nofal wrote:
<br>&gt; I tried this configuration, but it did not work with me, I attache=
d the
<br>&gt; log file. I have Pi4(4GB version). Initially installed 5.10, it di=
d not
<br>&gt; compile so I back-patched to 5.3 and added CONFIG_HOTPLUG_CPU=3Dy =
to the
<br>&gt; build configuration, I was able to understand, why it was essentia=
l.
<br>&gt; Then I tried different memory reservations using device tree:
<br>&gt; &nbsp;&nbsp;&nbsp; reserved-memory {
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; #address-cells=3D&lt;2&gt;;
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; #size-cells=3D&lt;1&gt;;
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ranges;
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; memmap:memmap@0x20000000{
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg =3D &=
lt;0x0 0x20000000 0x10000000&gt;;
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; };
<br>&gt; &nbsp;&nbsp; &nbsp;};
<br>&gt; The memory is reserved and observable at proc/iomem but the result=
 is
<br>&gt; either crash as in the log file or this:
<br>&gt; [ 1463.849868] jailhouse: request_mem_region failed for hypervisor=
 memory.
<br>&gt; [ 1463.849882] jailhouse: Did you reserve the memory with "memmap=
=3D" or
<br>&gt; "mem=3D"?
<br>&gt; In rpi4.c
<br>&gt; I edited memory regions to begin with 2:
<br>&gt;=20
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .hypervisor_memory =3D {
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .phys_sta=
rt =3D 0x2fc00000,
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .size&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 0x00400000,
<br>&gt; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; },
<br>&gt; and the same for all memory regions.
<br>&gt;=20
<br>&gt; Something that I do not really understand, is the RAM address. In =
the
<br>&gt; jailhouse Image, there was a RAM at 0x20000000 and the image works=
 fine.
<br>&gt; But in my case there is nothing at this address.
<br>&gt; Any help would be appreciated and thanks in advance.
<br>&gt;=20
<br>
<br>Integrating all the loose ends of these targets is a hairy process (I
<br>stopped counting hours I invested). Therefore, I strongly recommend
<br>starting from jailhouse-images where the RPi4 works fine, at least here=
,
<br>and then step-wise deviate from that towards whatever alternative
<br>configuration is desired.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/73c81520-68a0-4d95-9686-221a8c953ec5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/73c81520-68a0-4d95-9686-221a8c953ec5n%40googlegroups.co=
m</a>.<br />

------=_Part_999_74054859.1655534188015--

------=_Part_998_538405226.1655534188015--
