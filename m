Return-Path: <jailhouse-dev+bncBC653PXTYYERBYX5SWHAMGQEVNZM7DI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FE47ECF2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Dec 2021 09:03:47 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id v13-20020a05620a440d00b00468380f4407sf6165665qkp.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Dec 2021 00:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2F6Mus2sO+Qo+/Z3ktOSV1CBHY3pPpRo1e43/nuFNls=;
        b=YlNNmUSpTa87hb9Sm32VcJKBLUjtCJTarbbmnja3zmyVufO0HnJSHPLkdsJCMKNE+M
         bFGpo/P6iKsFol4GXw1WPCEMs07SzJMxgBVwEAYLUAwAv4B2kN8n9MHbUIcfrzERaxqc
         iVCustN1FHU3fESgkar0Kp/T5O17cSuqzHhYDngvCb2mknCm+XpVfUCZ2DYcRXSR4755
         vywllXA3NM1mnbNp3jamyM+XdsO/NTfhcZs5xjd86H7Gj2jDrhrFRj+HBTGGwHdM0D8Q
         toLuAY6zIcZIe81FmRkmh496Oc2/1kqHCQ6y4sw5kWrsx3zBgaBUzaNm30lRstne6v0I
         CGog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2F6Mus2sO+Qo+/Z3ktOSV1CBHY3pPpRo1e43/nuFNls=;
        b=IyyR2xexXBsu4vofpEYy5wptoYn5Uu/uGfKnBosuxDz5sSkRvnA9c9CMGPBcqP90ZJ
         fOYLd/1eMBsE3dNtCH0sm3NdamOuNxeRKDsZbfv4buo3UrdIvDrsLzgcXqIMNr4hGu06
         2pznoRk27r2d5sHn6zWhgFuYLKckThM513sW1xA5I9fTVdFipWwOGa01fFUO+0t10igS
         ZmGVsZTbCaZYqgjPcfPH19xjCYBdiIYGABXJT+D3THJJ0YvDB6G/v+W98B16ylP8nMYU
         Z8SRBZD/+2QWCgcee2UycACHVaKDqnXQigiZCB69xAeq7sa+m24xDKaGUmNGnxR+eQML
         iafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2F6Mus2sO+Qo+/Z3ktOSV1CBHY3pPpRo1e43/nuFNls=;
        b=Jwa8ZTgGPvqOxMUma5If5M8AjoRH9tkvabhfXR3xZwbd3ldaBwidaYcmC399ryt6ej
         gXpWFcSu5FpHeajeDxp4TdG8CJMXv1HsjuyiWiLFqveH06vx94qBJs5G0s8X005AE5Ln
         oY4Qsid9l7IDSrPyNocPKJWMmhbhY+LKno2mK/16fnypEUzwBxtaGTWtYQWLt1Jenug4
         Ji5YZoSL9j0asoNe3Mjt9b5yZfDFceFgEuGKXMsAkvvtNnsmcVUhU01q5vQFxnk4W9KD
         2Pv4xWMNjYPba0llF1L2PmcNrWkyuovk4dGUbRJMy7wdV7Xdy452/ynN5jSP15lbuAxE
         Calg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533s/LPMCop6B6bUSAVqg3Mag1Q+Uf5/y+QE9+2/8RokH7heoSHf
	1O424iBeOfpSjlpP36W8HcQ=
X-Google-Smtp-Source: ABdhPJwrq867HIwzzaYKVOLiuupA0dTQsFPBTiDymj5nSBAjoYuAE4GbLnXAXq4Fmgvh9NufTtKV8Q==
X-Received: by 2002:a05:620a:461f:: with SMTP id br31mr4059634qkb.72.1640333026147;
        Fri, 24 Dec 2021 00:03:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:b3cf:: with SMTP id b15ls3256660qvf.1.gmail; Fri, 24 Dec
 2021 00:03:45 -0800 (PST)
X-Received: by 2002:a05:6214:b62:: with SMTP id ey2mr4746057qvb.0.1640333025600;
        Fri, 24 Dec 2021 00:03:45 -0800 (PST)
Date: Fri, 24 Dec 2021 00:03:44 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <49832756-b7b3-4855-b71a-ee13a766d30en@googlegroups.com>
In-Reply-To: <7c009dfd324b083434cc24fb828dbe8d73fe022b.camel@siemens.com>
References: <AQHX7au/vU9SnFS39E6o6OuxlJ1X2KwrfNgA>
 <0e3feaf8-c623-4ba6-8925-e648c946f148n@googlegroups.com>
 <7c009dfd324b083434cc24fb828dbe8d73fe022b.camel@siemens.com>
Subject: Re: NAT bridge
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12477_616335161.1640333024980"
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

------=_Part_12477_616335161.1640333024980
Content-Type: multipart/alternative; 
	boundary="----=_Part_12478_687252112.1640333024980"

------=_Part_12478_687252112.1640333024980
Content-Type: text/plain; charset="UTF-8"

I tried everything and then gave up jailhouse-images for RPi4. I was 
successful in porting jailhouse on my own kernel, I was only missing some 
kernel flags, like:

CONFIG_IVSHMEM_NET=y
CONFIG_UIO_IVSHMEM=y
Without these flags, there will be no drivers for pci devices, no veth and 
no inter-cell communication. The bridge can be easily made and I have not 
had any problems regarding bridging. 

Moustafa
On Friday, 10 December 2021 at 10:55:46 UTC+1 Bezdeka, Florian wrote:

> On Fri, 2021-12-10 at 01:53 -0800, Moustafa Nofal wrote:
> > Hello, 
> > I am using the latest jailhouse-image for Raspberry Pi4(RT version).
> > I
> > am trying to create a bridge between wlan0 and jailhouse NIC, I
> > learnt
> > that the Ethernet eth0 is used as physical jailhouse NIC. So, 
> > 1- Edited defconfig
> > CONFIG_IP_NF_IPTABLES=y 
> > CONFIG_BRIDGE=Y
>
> Sounds like CONFIG_IP_NF_NAT is missing. Just a guess...
>
> > 
> > 2- installed dhcpcd5, dnsmasq and iptables.
> > 3- I always get this error, while using iptables:
> > can't initialize iptables table `nat': Table does not exist (do you
> > need to insmod?) Perhaps iptables or your kernel needs to be
> > upgraded.
> > 
> > I understand that this is not Jailhouse specific, but I tried the
> > same way in a different kernel image and it was working fine.
> > 
> > Regards, 
> > Moustafa Noufale
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/49832756-b7b3-4855-b71a-ee13a766d30en%40googlegroups.com.

------=_Part_12478_687252112.1640333024980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried everything and then gave up jailhouse-images for RPi4. I was succes=
sful in porting jailhouse on my own kernel, I was only missing some kernel =
flags, like:<br><br>CONFIG_IVSHMEM_NET=3Dy<br><div>CONFIG_UIO_IVSHMEM=3Dy<b=
r></div><div>Without these flags, there will be no drivers for pci devices,=
 no veth and no inter-cell communication. The bridge can be easily made and=
 I have not had any problems regarding bridging.&nbsp;</div><div><br></div>=
<div>Moustafa</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gm=
ail_attr">On Friday, 10 December 2021 at 10:55:46 UTC+1 Bezdeka, Florian wr=
ote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8=
ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On Fri, =
2021-12-10 at 01:53 -0800, Moustafa Nofal wrote:
<br>&gt; Hello,=20
<br>&gt; I am using the latest jailhouse-image for Raspberry Pi4(RT version=
).
<br>&gt; I
<br>&gt; am trying to create a bridge between wlan0 and jailhouse NIC, I
<br>&gt; learnt
<br>&gt; that the Ethernet eth0 is used as physical jailhouse NIC. So,=20
<br>&gt; 1- Edited defconfig
<br>&gt; CONFIG_IP_NF_IPTABLES=3Dy=20
<br>&gt; CONFIG_BRIDGE=3DY
<br>
<br>Sounds like CONFIG_IP_NF_NAT is missing. Just a guess...
<br>
<br>&gt;=20
<br>&gt; 2- installed dhcpcd5, dnsmasq and iptables.
<br>&gt; 3- I always get this error, while using iptables:
<br>&gt; can&#39;t initialize iptables table `nat&#39;: Table does not exis=
t (do you
<br>&gt; need to insmod?) Perhaps iptables or your kernel needs to be
<br>&gt; upgraded.
<br>&gt;=20
<br>&gt; I understand that this is not Jailhouse specific, but I tried the
<br>&gt; same way in a different kernel image and it was working fine.
<br>&gt;=20
<br>&gt; Regards,=20
<br>&gt; Moustafa Noufale
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
om/d/msgid/jailhouse-dev/49832756-b7b3-4855-b71a-ee13a766d30en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/49832756-b7b3-4855-b71a-ee13a766d30en%40googlegroups.co=
m</a>.<br />

------=_Part_12478_687252112.1640333024980--

------=_Part_12477_616335161.1640333024980--
