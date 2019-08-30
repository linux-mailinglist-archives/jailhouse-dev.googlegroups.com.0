Return-Path: <jailhouse-dev+bncBCW3RFO4ZUCRBP6ZUPVQKGQEK5CVIXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id EF28BA3404
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 11:30:40 +0200 (CEST)
Received: by mail-oi1-x23e.google.com with SMTP id s3sf2601385oia.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Aug 2019 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YfvFI7snboasZ/cjqAj2UNlB71y3gGcUU2nLqP3N8+8=;
        b=AEYyGDO7mmpmzgrBNTMOuzCKW9CG1EoaA2m0LcR2wtYPfkI44Z/TtepIHg01IsZS2t
         hdMNu+N0ReMqeW+AKBOcANvu6E8vJfLAv4WbJHw6UTBfhfrXh0xzkADYnZ/HJxPSCA8V
         3d+2HhI922NYP2xd30UQPd6ymYY5RI5Na7tIR9AIv1D8+XHrfam99m3XBVVL5WkKaBiO
         pGwrHY7IcvvS673zAH9ofh9TUMxxi+fcWs/KS2Wvo1deJoQyvKd0qzU13N1fHnG3GhXL
         F7fEfRF9NHd1TE/T0d8bQAcJFHnNCVOY6G4Bu7Xv0q0q68CgRUX61XxE2oh9w6TZS6io
         kZiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YfvFI7snboasZ/cjqAj2UNlB71y3gGcUU2nLqP3N8+8=;
        b=McqQn2iKEEMIT25jTtnvCXa2H5wyGC+ghLo8TfsaA82MvbR8it1pNV1xqHBrWtSEad
         MwEifOMlkKq/jV9KnW5aypRB9TtogpxWiiNVv6cEfohdx8+zop2Ggq8MzW/sPN1SV0+y
         pfsWIqdAa3pKd0zIFgX7bDtrPhg018YW9eIhY8JXJ6wie2OgpQIFCzoiR/dKwZW8BgK+
         to4pVoYGQUmzvIl8hzXEs3nFHOLTjrAhMKU8sbO4epTj8Y9RDjSlpMfOeFr5DPRBsc8V
         vx969FsQiR2AlzMDCIFzgE8ZqeEWwLNqvQYXlAcfbSsxJgb9vnJTQBEn+8caCC5Db6n1
         qDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YfvFI7snboasZ/cjqAj2UNlB71y3gGcUU2nLqP3N8+8=;
        b=KHxZovnJtq9JE5fR6PkzVy8I/tH84KLESbVZxEijPekTLLLNcdPgd9VEE0NkVGfMAI
         /FsIgXf0gz7NYueBL8J9x8iQRRXQb5KjzI02nrmu05tekCyx9zb+PP1+jxvVkGcbfl5z
         XAQ+KFoT3nYx+jplo+M2Gz9LoiDG9USHdwuhJY1st8fSEefDdFHa0Tvs7rf3dox1KfHU
         HpSN1dpqFgFAdNEhHhqoVZz0VGV6rFgZ790aAGAcJziwDiqL3nNj4EHBI0PdAYyRG1Bt
         46o2z93kfBu69krey+3Pj9aETqzRlpJQCmgJXZAa3ziBLEua7IYnqnEaEJIIpTrVEq4F
         M+lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW1MVVvtJtc0q+DbUK37AYOrd1j9ot8rHntLDWF+q+1dcw5zkZe
	Uz9o7Zw9JpdEx3qqIUzJtF4=
X-Google-Smtp-Source: APXvYqzulhou2zszFzOz2JDYWsZC16SJadrEJ2M1zIpBs+UeYUrX/FXv5XEsijzNGgQCuyy8T5Zvgg==
X-Received: by 2002:a9d:4e11:: with SMTP id p17mr11725804otf.192.1567157439752;
        Fri, 30 Aug 2019 02:30:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6250:: with SMTP id i16ls142787otk.1.gmail; Fri, 30 Aug
 2019 02:30:39 -0700 (PDT)
X-Received: by 2002:a9d:6281:: with SMTP id x1mr1842705otk.44.1567157439035;
        Fri, 30 Aug 2019 02:30:39 -0700 (PDT)
Date: Fri, 30 Aug 2019 02:30:38 -0700 (PDT)
From: sebastiansaueressig@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8e2da73f-ce4f-4999-a7bd-ce4116be8503@googlegroups.com>
In-Reply-To: <fd8da5de-70ad-4bf9-b892-3a21d7718ca1@googlegroups.com>
References: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
 <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
 <6b4bb950-5b1e-42e2-8d54-52beb009b025@googlegroups.com>
 <1dc9ffa7-64a6-6578-cb29-2573f680b6b3@siemens.com>
 <fd8da5de-70ad-4bf9-b892-3a21d7718ca1@googlegroups.com>
Subject: Re: Unable to find IVSHMEM pci-device on root cell (ARM64)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_163_706012195.1567157438339"
X-Original-Sender: SebastianSaueressig@gmail.com
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

------=_Part_163_706012195.1567157438339
Content-Type: multipart/alternative; 
	boundary="----=_Part_164_962474646.1567157438339"

------=_Part_164_962474646.1567157438339
Content-Type: text/plain; charset="UTF-8"


Hey Jan and Jan,

I was later able to see the device and assign an IP address but I was not 
able to send pings back and forth.

Just using Ifconfig did not work.

I had to use ifup and of course create an interface for them. See code

root@tsn-inmate:/etc/network/interfaces.d# ls
enp0s6
root@tsn-inmate:/etc/network/interfaces.d# less enp0s6 
auto enp0s6
iface enp0s6 inet static
    address 192.168.3.2
    netmask 255.255.255.0


Maybe it will save you a few minutes of work ;)

Sebastian

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e2da73f-ce4f-4999-a7bd-ce4116be8503%40googlegroups.com.

------=_Part_164_962474646.1567157438339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hey Jan and Jan,<br><br>I was later able to see the de=
vice and assign an IP address but I was not able to send pings back and for=
th.<br><div><br></div><div>Just using Ifconfig did not work.</div><br><div>=
I had to use ifup and of course create an interface for them. See code<br><=
br><div style=3D"margin-left: 40px;"><div style=3D"background-color: rgb(25=
0, 250, 250); border-color: rgb(187, 187, 187); border-style: solid; border=
-width: 1px; overflow-wrap: break-word;" class=3D"prettyprint"><code class=
=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"color: #000;"=
 class=3D"styled-by-prettify">root@tsn</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">inmate</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">:</span><span style=3D"color: #080;" class=3D"styled-by-pret=
tify">/etc/</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>network</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify">interfaces<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify">d</span><span style=
=3D"color: #800;" class=3D"styled-by-prettify"># ls</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br>enp0s6<br>root@tsn</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">inmate</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #080;=
" class=3D"styled-by-prettify">/etc/</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">network</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">interfaces</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">d</span><span style=3D"color: #800;" class=3D"styled-by-prettify"># l=
ess enp0s6 </span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br></span><span style=3D"color: #008;" class=3D"styled-by-prettify">auto<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> enp0s6<br>=
iface enp0s6 inet </span><span style=3D"color: #008;" class=3D"styled-by-pr=
ettify">static</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"><br>=C2=A0 =C2=A0 address </span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">192.168</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">.</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">3.2</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br>=C2=A0 =C2=A0 netmask </span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">255.255</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">.</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">255.0</span></div></code></div></div><br></div><div><br></div>Maybe it=
 will save you a few minutes of work ;)<br><br>Sebastian<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8e2da73f-ce4f-4999-a7bd-ce4116be8503%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/8e2da73f-ce4f-4999-a7bd-ce4116be8503%40googlegroups.com<=
/a>.<br />

------=_Part_164_962474646.1567157438339--

------=_Part_163_706012195.1567157438339--
