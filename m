Return-Path: <jailhouse-dev+bncBAABBVWT7KBQMGQEHHPX34I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 734003655F3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 12:15:51 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id bf25-20020a0564021a59b0290385169cebf8sf5453749edb.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 03:15:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618913751; cv=pass;
        d=google.com; s=arc-20160816;
        b=BoFDiTxrY4iIM320oQdorzeWiORUtUzQwhtbX6m/UXIYkgDCYq85X7bzJR5/BhCUBg
         jDUdA0D59vsjzv/4ytXm3aFUnSjWsG/pdan8VvFzSTXSsJrmprvkQUs2dF0qBLUB/v+c
         LqSVSxywg9ykny8evcUaXhhGY5oj88Sej4DH6RhFVqcj7KDQUN4wUP+xrHqIbBLBWCXS
         G7Ssp79jkOHbRRC1Gm6+M+Xxmpdwpcs0+nNnnTeZKMiPpU2etPGb0XfmwJmhDM0obyxx
         1eE9Pwkgc2LiVvzSUOv9t7sxiq70NqSL3wo8QzEU3vNWeiR6o3PQ0J0xfBrbcviD0cQK
         lv+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=INmPUE4feViUG4IlwUWEKUayFYJNdqRDbLUuu2yJcgM=;
        b=JphisMCf9moV8KmJPMjvWNPpHZ0c4+LlwrkNxvJ9j5h3KwvBlazvLMpRh11CZ1ejZ2
         NfzMab6d7TK0atH3VMvDdaRtDyWnJzoJgyoJozu3zGOqrLQ8GydJWq3va3b0CJHfqPJZ
         AGgf8IDeNM8F1P1Rb8m+xNmiyrOkxQ5VRJyeurIjHHRTnEQTIY91C03X0rr219QMhUgu
         sRQ8NcfM1NiYEJ0ZFXE7EUP6zZBkr+46D5QQCXuG1ABQbgfSiqyubA2tYL/O/U7PHpLJ
         txZ10TTr1BU7+NCHLmDhMg1wXRQY3GjZfAUxdFaIAKC3AMKsoGHcg03tXlZR3+t7ENke
         qRpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=DCDSEYLd;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=INmPUE4feViUG4IlwUWEKUayFYJNdqRDbLUuu2yJcgM=;
        b=LPG8EQgMOnTjFCpzIrMr+HdtCv0TluNjXHe6jPhY/uZR+viN/IN5rgsJqXYc0PpSF/
         15xYbYD3aNP+DeGyGTrJsArvRWZTaSCYbplSXvp1hOMuHyHs5XLsvDy7m1Pg737exSb2
         XlPVFqwHQVXm70R21x2nWc3rGLbvL5Z04cWvG9ob4GWeSQGwcSJVpA25Dh5N5NAz6g9F
         g6vbtTA5T2RZTimDs3HfiVTu5rTaoe4Y/v07rrAXK5/cI+S21XwUxuPCKwVaFCtqX9O0
         yA2zxboqvTXb/OI0q6SBUMa0G6us/BkdHfBQSp8xy1LdWNK+H+oZPD0aAcTyRBcj03RC
         bjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=INmPUE4feViUG4IlwUWEKUayFYJNdqRDbLUuu2yJcgM=;
        b=paqpXE3sekg3zgjteqPdWCwfbau/6tuu7ypCcxosBMl4lEB+MDrYS1EuyvZigVXGBm
         sZqPMdn2gztIFuvyCByZ/x0zg1VWwK1/E0QM7HEIW/CS31CJuHyRYhd3meyPfKxk0Rni
         K+jANtaCCG/e2a6H2etrgc5Zdi8TWguk5QWBfIRPkGAnnoGxKmIV4NUyPof9zIMuFrZe
         Cd2HuJ/+1LWS74R6kkOPy/sIieL1KaVBxqPamaZkG8z/rR78LWGiQ1G53s8YnfMeLI3g
         E0E4jFdIlKoV561t5yQkl/HnDkrKeuW1EGFrX8HmWm0+f1GO1H3RtTp+2VYab0AjEJFl
         LtrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GfyhM0blNxp5tugS3hcDFkbRGonTGvlDDClmz8aTuR18aSMzF
	/o9QRZRpkDjtMgIQWbFI3G0=
X-Google-Smtp-Source: ABdhPJwIfFFp0PA28aK4Ti6LZpOmFiCiwiwwOfMZGaZhqj3ptniv+tHuXeLHS3SbWCqL5Z+0fgo4sQ==
X-Received: by 2002:a17:907:6e1:: with SMTP id yh1mr26964037ejb.486.1618913751178;
        Tue, 20 Apr 2021 03:15:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:4c2:: with SMTP id n2ls4968098edw.2.gmail; Tue, 20
 Apr 2021 03:15:50 -0700 (PDT)
X-Received: by 2002:a05:6402:26c3:: with SMTP id x3mr32280571edd.126.1618913750410;
        Tue, 20 Apr 2021 03:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618913750; cv=none;
        d=google.com; s=arc-20160816;
        b=PERnLpTRrRaxonqRwLlH+KBZqFoFhuar+cea7k05DoG1TTGf06J7ZE3gaQjDX4v3lL
         EdAOAXX/4YC0gdHo+7/oIh72IcVTfB9uJlFTkxiMZo2EUl2I++5VcvFhWTzKhLNMq5J1
         Dwcj5Y5TSqnVivyVLcFJmUW/WiDL68jQx9vu/EmJ3w+8FI+1lPt4m0QGU7Akpu8ph0jr
         qPzhc1iO6T2gpLznZTFkSXPmOAJstKofN579SY3yHqZKiIJkXnB5IR+Ce0zw9fqPav7o
         84fLu1EhyjfLHv3Watpv8owj96QPpuyvhhz20im8GvWN0HgulVBShC2Ppfy21mMUNbFu
         nOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=MXSwHjKn+fKvbLT5ZxdslyXp1T0TlsLnmH7oz8XPh6A=;
        b=kyBdzxm8YbBNeyn4W8u1gxzayxs8Pk+TBiMKu6leLWYWINqzJ00zjKqHjaucCNYVCi
         HtR/ugSwvvzJLvkgPvNat9/m9gw1nhkhV7MTV2oBGxCtbyxqyYtw5TpdMCCKRy7T3xYg
         CQYCCMMEGb2MBD/ntpOWVOZyHmqqPRNAdpzTSSdaScYOO+Z5D6ZigmZViYFZuy9aDzs5
         7Cnxt7AGOUzrifbJyvTbQQLrEWS38tf1p7uoNMgWfm4Tuh+sfgCjLnH/9F1blG1tjela
         HGhjjDQRLLzP5eXZbRiwqHEUxK6ywh86u2ymH6KsJrThFQNC5VWEUW23h6qsIKD9b/hy
         zv4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=DCDSEYLd;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id co24si971859edb.4.2021.04.20.03.15.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 03:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.82 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Tue, 20 Apr 2021 10:15:43 GMT
Received: from Pickup by email2.uni-rostock.de with Microsoft SMTP Server id
 15.2.792.3; Tue, 20 Apr 2021 10:15:42 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email2.uni-rostock.de
 (139.30.22.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 20 Apr 2021
 12:14:37 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0792.013; Tue, 20 Apr 2021 12:14:37 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: AW: Inquiry
Thread-Topic: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP//1HbA
Date: Tue, 20 Apr 2021 10:14:37 +0000
Message-ID: <291fcaabeedb40f698924221453fe3f6@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
In-Reply-To: <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.74.209]
x-tm-smex-dtas-header-wtp-uuid: B857092791C60E5908C607C2297F8F6A600D0171
x-tm-smex-dtas-header-wtp-flag: BC4A395C517E27D5DC5D9D61FE921023AB71153C0004
	bd127265-a962-44dc-959c-9ccb87f8eba5:E86D7FA298E5BF5C91B1B1620E328B6A9CBADD
	E500005e0c4824-6356-4856-87ef-3a011ea812e6
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26102.007
x-tm-as-result: No-10--14.794700-8.000000
x-tmase-matchedrid: cGemfQPmQigMPDZrnvcM98CxC+PryYbT7cb2TOoXceLd5HexqBUAVBFE
	t97pQ+C8KZJ/tbfy833MPxvkxRKDN5ZIlMv7Dr1YifYNsPPgB9aKCqau4lmOsOTWTJAOkSPwKPn
	doQHmoMvRkO/NjySKHCBl7skJmCwKJ/rbRITdMovFVAV8vDjN//k28qH5D2eKZjiZg0VE/6BxIj
	nrOLtMu7U/+wsmIcKXxpqqR73orOy35J/JantqGr5k9lVEXoZaa/fioJ9l4HhNmmbrcm6XNd7Zw
	STQ4qKY4ieJlmKIZ+5Y/tLUDKI8QP2RvKEqDomULIrMljt3adu061diBteN10etfYTYyR9EGIox
	h8aZq5krHiCRDCE67jMuZ8ZjqIORn9v8HoDZ0FHadufbUXKsZ3+671wbxJFpb8zqAERVGSm4eAQ
	ijLjp32Bm61CamJGh4slG5grepOibOzDpidNhxPw4wQxTs7JmmTMkhNp6sQXUxLhtzaZFAxtGVf
	Wt+lVvbIg0UwHzDrsJCtelS0ag/QEj1AVDtJJ4XbTfocfAWb88mh6RW8S4q2OMyb1Ixq8VXyhX/
	iFhpnYAX5PrQf2SSY01LSMmJ1GRloBKBgQnitwaPMGCcVm9DuNlVbqPGsKiBph69XjMbdlJIPvK
	803FzXwT/cy/ea3njbH/38hdI8rPRS6+V5+kKufOVcxjDhcwWWZjCFLCEBrAuFFGa+JUhfoA9r2
	LThYYKrauXd3MZDWXf5sC39gVVDMH4PKir8YO1uGGps9qBz4eoxxa8BYpPCeygA+KSI5xS4W/MR
	hJ1X4=
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--14.794700-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26102.007
x-tm-snts-smtp: E3ACA1B9790AB63377A2EEA338499F058841DDABA38E7DEAFD8DF4392CED72132002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de;       dkim=pass header.i=@uni-rostock.de
 header.s=itmz header.b=DCDSEYLd;       spf=pass (google.com: domain of
 moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender)
 smtp.mailfrom=moustafa.noufale@uni-rostock.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=uni-rostock.de
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

I am grateful for your quick support. Thank you!

-----Urspr=C3=BCngliche Nachricht-----
Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>=20
Gesendet: Dienstag, 20. April 2021 11:39
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.kis=
zka@web.de>; jailhouse-dev@googlegroups.com
Betreff: Re: AW: Inquiry

Hi,

On 20/04/2021 11:29, Moustafa Noufale wrote:
> Hi Mr. Kiszka,
> I have tried to  build an image through running "build-images.sh" with an=
d without root access:
>=20
> without root access:
>=20
> Select images to build (space-separated index list): 1
> docker: Got permission denied while trying to connect to the Docker daemo=
n socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.=
sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: perm=
ission denied.

your local user needs to be in the docker group.

> See 'docker run --help'.
>=20
> With root access:
>=20
> Select images to build (space-separated index list): 1
> Error: Running as root - may break certain recipes.
> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to ove=
rride.

Simply read the error message and follow the instructions: If you want to r=
un docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environment=
. For good reasons: You shouldn't do that as root.

Anyway, solve the issue by adding your user to the docker group.

  Ralf

>=20
> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualizatio=
n.=20
> I would really appreciate it, if you could me a hint.=20
> Thanks in advance,
> Moustafa Noufale
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@web.de>
> Gesendet: Samstag, 17. April 2021 11:45
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;=20
> jailhouse-dev@googlegroups.com
> Betreff: Re: Inquiry
>=20
> Hi Moustafa,
>=20
> On 16.04.21 10:29, Moustafa Noufale wrote:
>>
>> To whom it may concern,
>> I am a Master student in Rostock University and I am studying=20
>> Jailhouse this semester as a Master project and I would like to=20
>> gather information about this Hypervisor, as well as I would like to=20
>> ask, whether it is possible to install it on an Ubuntu Virtual=20
>> Machine? I just need an outline, how I can learn it. I spent today=20
>> reading the code on GitHub, but I need more information and appreciate i=
t if you can help me.
>>
>=20
> A good starting point for experiments can be the images generated by [1],=
 both for KVM VMs, pure QEMU emulation target or also real boards.
> Note that emulating target inside a VM will work but using KVM (for x86) =
may not or is at least fairly slow. I would recommend a native Linux host.
>=20
> Then you will find a lot of presentations on Jailhouse on the internet as=
 well as an (aging) tutorial on how to bring it up on new hardware.
>=20
> Jan
>=20
> [1] https://github.com/siemens/jailhouse-images
> [2]
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE201
> 6-Jailhouse-Tutorial.pdf [2]=20
> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/291fcaabeedb40f698924221453fe3f6%40uni-rostock.de.
