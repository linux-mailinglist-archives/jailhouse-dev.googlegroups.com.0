Return-Path: <jailhouse-dev+bncBAABB7F67KBQMGQEZ6SWRGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E136556E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 11:31:41 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id 32-20020adf84230000b029010705438fbfsf5463843wrf.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 02:31:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618911101; cv=pass;
        d=google.com; s=arc-20160816;
        b=APsqhVgxqh7zAQlCxz74AnDzaSXuT3gCOG/Yklhqf+E7oT255g4harKwxviQt9FyhR
         /LmlX+G2KXA7rSpmOZRf7Donl4/B92hTobI01IXwPIvWBZ0vS1mgvLZXv7kpbXbdzPOU
         JW5ra/KeuoLeeXd6hm6UsEt4pgm2KM5+3EUL6u0fCNA/8i3c4NBOjm7hDG1+le0fshTW
         i310DntGKSqNgMb2FZHY/9fvFPGbf/sVITVG3P7qHKBuipuGWY/uvCT+t4dIQRh4WOUD
         XcRcl8N4fMfD391Qa/Jh3SFA+DKtTGdbS/S2yg4FV/j5mx2sM3j/bT8gE9TH7Ycz0xm0
         R4Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=88n6oO1eXSGSsMUVeb4iXsQGaJY/vvmUN1lAu5Q3A6o=;
        b=aaWH+4tBJ729mryPviCoZ7fsMk//ldse+QwCsO7UjAnyXqHhgEBawk0Hygj1WJB/JR
         FIxQUg76n5O3rk2DZtX+2KvSH4XGtXjNRKgfsZoRt+Di/nHvtt2ni0011mKqrMv4feOr
         MvBemv7q2uj6CWdkKTLVKBPNfb26Q1tfDwcJinoUKdxX39qTU4540s4DMdMljLxkQZi5
         K+GbknLCkORewluFXqt2zvduzC6JTIeWcQtC8OgnYnfSTI+0CvyKDRufCjwpisP8IWrH
         kG0mrl/A1zpPZcOLOxEix3ZhMrd/Cb22zz1Ch3QFdMrZY93GovZrRapMACO+ZeG2Gi78
         DIJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=HR0dFyvG;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=88n6oO1eXSGSsMUVeb4iXsQGaJY/vvmUN1lAu5Q3A6o=;
        b=AcAvelejzc4Jf6GYsWk6c8WtHNRpUlHJmSveBpRzRFwLsWP71rBQjAI/fD7690VZ56
         X4BCUEkRwDEFSTZZB6qv4GYEBkWbmpsxQEOMY+cMOoeOyHRkYgqPpe/iuBmethhMmxHc
         2LpCBTzt4f/TgutpLRUPtVqvGJ1cQTgmM3hc22ZebCM0npO5X1FurbLIu+24+8XtsmbL
         UiyTJuTLTFofD2NmLy2iPuKiJl2kiBwmPGeHcbzZr0fxVI4ItZfmgoI7NGCjjNnQQnDV
         lKV+hjWxYSOVc2Efqny/6Mhg+97yMhoY60NsGEIw1k2UZ3LzhazLJ7tGeL+DJhSKI5vG
         czpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=88n6oO1eXSGSsMUVeb4iXsQGaJY/vvmUN1lAu5Q3A6o=;
        b=Ng+oatDkQHilZhODx0SxTSKR19ZOYRlqyFwwnJHZdbvmrkbwCu7pVg+j0FxYQoIFdX
         /kqGASCwiaduo3Ld9bz14jIiq8xomEMaVvNdCyKNJJSA7DZC67sAQTPWDbvHIM+Q5MES
         NqAxs2nAZoWGTo4QvZS+YPu42qjQiZnZMRm1aU/oVuYw/K4dmHXOEYP9i4G8bpxxL/S0
         VxQoI+Y/tJovWLuat6m0KfZfpJOep1qRd+NHdSYrZ5BQTi+yKGRA8/LLgZM9hANWwof8
         MgPhGgd42YZqLtH7tGGV0zI92t85txHp53rJRLjAa7Dncyc9BVjIwDWGdV2tyJsXIp4P
         dcXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532AiWJ7Wigkxk59G7W/vtpGrySLaf5u9JqGKcHJ4uZI97KxQpwk
	w42e4gEi4+5UmUHrazB75VU=
X-Google-Smtp-Source: ABdhPJwp6JPK80+OOqqju0Pn1h9LbB33tbONP6boKSKqwZ06wauMFR5NpBHEo8MAWpNxJLXWUpkVcQ==
X-Received: by 2002:adf:e8c3:: with SMTP id k3mr19855529wrn.400.1618911101182;
        Tue, 20 Apr 2021 02:31:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6804:: with SMTP id w4ls11725534wru.2.gmail; Tue, 20 Apr
 2021 02:31:40 -0700 (PDT)
X-Received: by 2002:a5d:68c3:: with SMTP id p3mr20404336wrw.62.1618911100273;
        Tue, 20 Apr 2021 02:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618911100; cv=none;
        d=google.com; s=arc-20160816;
        b=mBOL2SrzSQZjP4wpZQUL7MdVcuPXR4O/Iu3WSD3lxerA2NturqDqWK5F0nvr9WbMN+
         N/gDkWhnqAQdgTYTDnLo+jLx/Xb5PAcA5Cv4rkvkblF0dh/lfHn2+HlLemZ2dLgox8Ld
         91WhbyEU9ysIKaFgffFoklfWUPkiOnGbrGGSTmQ4imc9lga3A3mDX9jX7BUztKHdLUk7
         y6EMaVKSMun78CZHjRifEaMHFbyZmwDzzOFZUYcWX256/Ng9z31Hju7sTi97IAMZaGn4
         6mK9W8BXhOaGrecb0kCK1DE5T5l6EATlV2Ps0jOXYXmli61/7FtknCav7g7BQ+Dq4gG+
         IeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=5iLwySBKfBjnIuHzr/Ak8wbURVhmznbYYKMhOomRN40=;
        b=YdKoYqn1elf7Bn1x115I9EuGAdXVsPSkl/0uCBIZSQv9/NVlkJLaO/CBSWUxoU8y+h
         EWFN5aOu+t1whgD2EUnRs0V+hAOrc7AecgwimSWiOWNPlsH85GMkm48msgv4hPNsXDSb
         0qwO+keVNJ38L1unLdcha8n8uUyYR+DqzR/qnXvebi7ANVQce3cQwcZeO16Mhu8bpwco
         jQybVw+6DcJckFKn0tdmwjxIc8+AmpfUod0+YVj3dHhwAGXh+mMbh1PLGuOYYjI1/hbm
         fv808hsgCkgFwR2KfmveCzYYRRStMeQJ8fJH2ohnyBBDWZZUdjBLXU3lpvn/W8nNJ6+8
         TLWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=HR0dFyvG;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id s21si183179wmh.2.2021.04.20.02.31.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 02:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.83 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Tue, 20 Apr 2021 09:31:32 GMT
Received: from Pickup by email3.uni-rostock.de with Microsoft SMTP Server id
 15.2.792.3; Tue, 20 Apr 2021 09:31:29 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email3.uni-rostock.de
 (139.30.22.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 20 Apr 2021
 11:29:23 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0792.013; Tue, 20 Apr 2021 11:29:23 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Jan Kiszka <jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: Inquiry
Thread-Topic: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xA=
Date: Tue, 20 Apr 2021 09:29:22 +0000
Message-ID: <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
In-Reply-To: <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.74.209]
x-tm-smex-dtas-header-wtp-uuid: F3DE75371F8A9A35A48682DE3756F72EC0581441
x-tm-smex-dtas-header-wtp-flag: BC4A395C517E27D5DC5D9D61FE921023AB71153C0004
	8e5ba2a6-e91f-4f3e-b04d-e25a8cd63d2f:E86D7FA298E5BF5C91B1B1620E328B6A9CBADD
	E50000b52e8d27-e59a-4551-9688-12e6cff9e6a6:9757F9333200B88B432CC5ECB85BCACD
	4D93403D000089862346-c74f-40fe-a7e7-969fb4d401c4
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26102.007
x-tm-as-result: No-10--5.483600-8.000000
x-tmase-matchedrid: L9skVKoV36QMPDZrnvcM98CxC+PryYbTgdkHykGcMpl65yXsx03DxJ2r
	Mja6KQ+LCZLXVYFvBRtRgM2MVcov01PnI9A/227jp7rgqkxHgFSr3d1rmRdCgKZwleT7xjO5ANd
	Y+fMa4IxoS9ubs3d1V8s4S67NXPLDFp2/4Xy5xIgQ04M5KAO0HBPyfIr+AdT7Pikg0Pc7Za2Cwg
	lX01Zi1prshU0ckp3urCdBvt04JcZ0OTdOu6KfB2vDT+wC7pqFWpjCJBXWSUgwT6ESs+hBMOJ1Z
	55wDcxTJh27a3wSE+/GRpJJVkXFnnNs6LXGLuv48eSmTJSmEv1+S5m2/8VLmhm/VYg8VWVI87uO
	H1xxCQMAq68tMMmAMe+isLD2iP85DvekyNY9b6gAhUzEvZ6RY3+ogtHzaKWZFujNgNeS9UCm+lP
	JkxlYSLj+FTPGFTGw/nbdPfYWr3ISGqiY07lJdvbta0OAYFzyGfJU88iQ+wSGe7jsBPE0h7KZV9
	X59AsgXctUjghPOIBnmJ3xheok3uel5KJlNpuVdFIm3orOnRA/pOSL72dTf0SVpnjjB2vkOWTFg
	QkoLGr8cMHDDZ2zT/SMSNSI4ECbgljF8fKL2gnnzlXMYw4XMFlmYwhSwhAaC24oEZ6SpSk6XEE7
	Yhw4Fv+8bV0dDNKOO0ohQpASWdbbR6XeQffd1kGA0d+RMfnigqDyi6/AVNU=
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--5.483600-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26102.007
x-tm-snts-smtp: 75592776FA42898E32F03B21DE51735BE78CF6E5B4E777EB67DDE0E6279DA7192002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de;       dkim=pass header.i=@uni-rostock.de
 header.s=itmz header.b=HR0dFyvG;       spf=pass (google.com: domain of
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

Hi Mr. Kiszka,=20
I have tried to  build an image through running "build-images.sh" with and =
without root access:

without root access:

Select images to build (space-separated index list): 1
docker: Got permission denied while trying to connect to the Docker daemon =
socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.so=
ck/v1.24/containers/create: dial unix /var/run/docker.sock: connect: permis=
sion denied.
See 'docker run --help'.

With root access:

Select images to build (space-separated index list): 1
Error: Running as root - may break certain recipes.
Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to overr=
ide.

I have installed QEMU version 5, KVM 2.2 and enabled nested virtualization.=
=20
I would really appreciate it, if you could me a hint.=20
Thanks in advance,=20
Moustafa Noufale

-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka <jan.kiszka@web.de>=20
Gesendet: Samstag, 17. April 2021 11:45
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; jailhouse-dev@googl=
egroups.com
Betreff: Re: Inquiry

Hi Moustafa,

On 16.04.21 10:29, Moustafa Noufale wrote:
>
> To whom it may concern,
> I am a Master student in Rostock University and I am studying=20
> Jailhouse this semester as a Master project and I would like to gather=20
> information about this Hypervisor, as well as I would like to ask,=20
> whether it is possible to install it on an Ubuntu Virtual Machine? I=20
> just need an outline, how I can learn it. I spent today reading the=20
> code on GitHub, but I need more information and appreciate it if you can =
help me.
>

A good starting point for experiments can be the images generated by [1], b=
oth for KVM VMs, pure QEMU emulation target or also real boards.
Note that emulating target inside a VM will work but using KVM (for x86) ma=
y not or is at least fairly slow. I would recommend a native Linux host.

Then you will find a lot of presentations on Jailhouse on the internet as w=
ell as an (aging) tutorial on how to bring it up on new hardware.

Jan

[1] https://github.com/siemens/jailhouse-images
[2]
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf
[2] https://www.youtube.com/watch?v=3D7fiJbwmhnRw

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/879f50f352e14aa8b45e9aff399c2b02%40uni-rostock.de.
