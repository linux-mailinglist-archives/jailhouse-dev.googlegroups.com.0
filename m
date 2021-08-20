Return-Path: <jailhouse-dev+bncBC653PXTYYERBEWE7WEAMGQEE6AWJAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 635563F280F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 10:04:36 +0200 (CEST)
Received: by mail-qv1-xf40.google.com with SMTP id bo13-20020a05621414adb029035561c68664sf6428766qvb.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Aug 2021 01:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=quFDiZb9HKBhTvuCHhPCIsHaO6sFlZNvZAnyGin8ZEU=;
        b=Mq0mVjmOfQrhXyxT3Xe8qBRIUsHOuW0Dkgxl+YySaUARW6i/15vU6LP2B3tUmcMJl3
         DRVpBKU+7PAf8gxNsXPUCTc0n9rz4gyJamTFZ/RrTy/wWKxWfE+Fhg8ygN4/3w5WfyAz
         9hpak3k3zSfVC232HVfP3NU6qm0deW//YZMR/R4/laQgCRxePsmCXhqliXirTksGKPEd
         Xzri3IoptRzFoLHVDY3B/NdYGU4lTnMHzsSbn8DQAIwQ5lfemqMFp+K2hA7/Pbvz+pUm
         xSwuD3XF2qcJbk1uHSHiJNJpDQNq8Mgm08nNYq/0xvPe8Ma0FgyPx1Nikw9Gt9CZjZtu
         283Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=quFDiZb9HKBhTvuCHhPCIsHaO6sFlZNvZAnyGin8ZEU=;
        b=BEELTv2L3U9EbAN/j4eh/dGj7hCIFE3PfF1NB1cGN3xd3aYoLtDQyWsbVc4HV5nUWR
         iNj6tfiQV3MqbwsTPOWFaHV46rU52iLyCh22cQyHeqfZS0zQRtohYMOc4KmG4A1/SR2V
         XaipJYxgyRPtfTOW/8uzTOR7pgli6AAkvaKQ/asaDTd5jraQR/ZyjZBbOT+4iSEm1GUG
         509CHR41KRROYUC/RDdX8uT0XgM1MAeW0lFN0Ro2gkKE/8v4/uu30OOwAgd0VCaOS6GK
         2nu+Ywcaq2OekDoSGJqJoxqg+a7/3G1D/Tbl7B9dBIBiFKdqznyjsqQonnORq1G3uHLs
         ZIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=quFDiZb9HKBhTvuCHhPCIsHaO6sFlZNvZAnyGin8ZEU=;
        b=amJaN1y1hlo6z9lxY4lCN0u7bAw5fNbHDQeYZVPXDp4IwOWo7AGZc+cWmfpyKozltL
         ZBjjTJyZ/sPbpZfLd9aFbsaHiq1yRB1pc0qOT1TjVcPl9rqh80nDAKbtjCmBM/n/HBlf
         grLSfYOG8+Xx6nfDdnD+nhYb5141B/4926LrMxr0ZL8GxjAEGPU4/3l4jxh9j2tLCz2c
         L+mEgP1pf8wSoPqo9K/78gIUMQRkp2V3UugWuagn8t3QjDfn2W2H6W1iq5sLqAzjvQzM
         V8vWwwdVC0qHR5WSFfoa9oLKqUv3zHYfgp7qb9SdT/YxU2LcXFut3MBEcV3bQ1/e9lEw
         CEQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532E53NfWj6Y8uDoWWP8Pd/NGc5IOzcSg6KbocZZh1o4ZlA5Hxen
	IGmdl5Gd4f16GiXmesbwhTA=
X-Google-Smtp-Source: ABdhPJxVPaIEdkURKvCSkkzWO6jcHdr5ojYuJLkXoJUu4qaHe1Zr/iGYKnvvB9UcYBpFBBf5WwU0UA==
X-Received: by 2002:a05:6214:54b:: with SMTP id ci11mr1020839qvb.24.1629446675015;
        Fri, 20 Aug 2021 01:04:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:e605:: with SMTP id z5ls3149216qkf.8.gmail; Fri, 20 Aug
 2021 01:04:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2456:: with SMTP id h22mr7683116qkn.272.1629446674339;
        Fri, 20 Aug 2021 01:04:34 -0700 (PDT)
Date: Fri, 20 Aug 2021 01:04:33 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <01c7501d-7b12-49b8-b544-fa5ffe749387n@googlegroups.com>
In-Reply-To: <798dc279-8f39-b3c6-c0ec-ff10c94c2f86@siemens.com>
References: <CAGdCPwvsiHYiCOVWr8s_Ey6knD2LiEo_SjP2tNWFLm0LzgWS7g@mail.gmail.com>
 <32ebc4ac-1d9d-8983-4c25-e23856da2fad@siemens.com>
 <CAGdCPwsigcxRcikcfUovOp7=q0g8eqXv3Cois+w_0cZR6R=v_Q@mail.gmail.com>
 <e2aed10a-4d8f-1d0a-852a-bd399ac5e667@web.de>
 <CAGdCPwu4v5S-ss9UzTi4tXJBQFZ1b-J6isA+TM301BdPRPHkxg@mail.gmail.com>
 <89ad4d62-8005-44a0-9153-ace14b658e64n@googlegroups.com>
 <798dc279-8f39-b3c6-c0ec-ff10c94c2f86@siemens.com>
Subject: Re: Root cell configuration for RPi4 with more than 1G of memory
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_864_1111220084.1629446673880"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_864_1111220084.1629446673880
Content-Type: multipart/alternative; 
	boundary="----=_Part_865_774992125.1629446673880"

------=_Part_865_774992125.1629446673880
Content-Type: text/plain; charset="UTF-8"

Thanks for your advice. 
It took me a lot of time, to make it work, I was only missing the 
ARM-Trusted-Firmware. And now it is working like charm.
I needed to understand jaihouse better and every time I discover new and 
interesting information. 
Moustafa
On Thursday, 19 August 2021 at 15:56:23 UTC+2 j.kiszka...@gmail.com wrote:

> On 19.08.21 13:59, Moustafa Nofal wrote:
> > I tried this configuration, but it did not work with me, I attached the
> > log file. I have Pi4(4GB version). Initially installed 5.10, it did not
> > compile so I back-patched to 5.3 and added CONFIG_HOTPLUG_CPU=y to the
> > build configuration, I was able to understand, why it was essential.
> > Then I tried different memory reservations using device tree:
> >     reserved-memory {
> >         #address-cells=<2>;
> >         #size-cells=<1>;
> >         ranges;
> >         memmap:memmap@0x20000000{
> >             reg = <0x0 0x20000000 0x10000000>;
> >             };
> >     };
> > The memory is reserved and observable at proc/iomem but the result is
> > either crash as in the log file or this:
> > [ 1463.849868] jailhouse: request_mem_region failed for hypervisor 
> memory.
> > [ 1463.849882] jailhouse: Did you reserve the memory with "memmap=" or
> > "mem="?
> > In rpi4.c
> > I edited memory regions to begin with 2:
> > 
> >         .hypervisor_memory = {
> >             .phys_start = 0x2fc00000,
> >             .size       = 0x00400000,
> >         },
> > and the same for all memory regions.
> > 
> > Something that I do not really understand, is the RAM address. In the
> > jailhouse Image, there was a RAM at 0x20000000 and the image works fine.
> > But in my case there is nothing at this address.
> > Any help would be appreciated and thanks in advance.
> > 
>
> Integrating all the loose ends of these targets is a hairy process (I
> stopped counting hours I invested). Therefore, I strongly recommend
> starting from jailhouse-images where the RPi4 works fine, at least here,
> and then step-wise deviate from that towards whatever alternative
> configuration is desired.
>
> Jan
>
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/01c7501d-7b12-49b8-b544-fa5ffe749387n%40googlegroups.com.

------=_Part_865_774992125.1629446673880
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your advice. <br>It took me a lot of time, to make it work, I wa=
s only missing the ARM-Trusted-Firmware. And now it is working like charm.<=
br>I needed to understand jaihouse better and every time I discover new and=
 interesting information. <br>Moustafa<br><div class=3D"gmail_quote"><div d=
ir=3D"auto" class=3D"gmail_attr">On Thursday, 19 August 2021 at 15:56:23 UT=
C+2 j.kiszka...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_quote=
" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); =
padding-left: 1ex;">On 19.08.21 13:59, Moustafa Nofal wrote:
<br>&gt; I tried this configuration, but it did not work with me, I attache=
d the
<br>&gt; log file. I have Pi4(4GB version). Initially installed 5.10, it di=
d not
<br>&gt; compile so I back-patched to 5.3 and added CONFIG_HOTPLUG_CPU=3Dy =
to the
<br>&gt; build configuration, I was able to understand, why it was essentia=
l.
<br>&gt; Then I tried different memory reservations using device tree:
<br>&gt; =C2=A0=C2=A0=C2=A0 reserved-memory {
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 #address-cells=3D&lt;2&gt;;
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 #size-cells=3D&lt;1&gt;;
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ranges;
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 memmap:memmap@0x20000000{
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 reg =3D &=
lt;0x0 0x20000000 0x10000000&gt;;
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 };
<br>&gt; =C2=A0=C2=A0 =C2=A0};
<br>&gt; The memory is reserved and observable at proc/iomem but the result=
 is
<br>&gt; either crash as in the log file or this:
<br>&gt; [ 1463.849868] jailhouse: request_mem_region failed for hypervisor=
 memory.
<br>&gt; [ 1463.849882] jailhouse: Did you reserve the memory with &quot;me=
mmap=3D&quot; or
<br>&gt; &quot;mem=3D&quot;?
<br>&gt; In rpi4.c
<br>&gt; I edited memory regions to begin with 2:
<br>&gt;=20
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 .hypervisor_memory =3D {
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_sta=
rt =3D 0x2fc00000,
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x00400000,
<br>&gt; =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 },
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
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/01c7501d-7b12-49b8-b544-fa5ffe749387n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/01c7501d-7b12-49b8-b544-fa5ffe749387n%40googlegroups.co=
m</a>.<br />

------=_Part_865_774992125.1629446673880--

------=_Part_864_1111220084.1629446673880--
