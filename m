Return-Path: <jailhouse-dev+bncBC2N5U4PRAPBB34KVTWQKGQEEW4DW2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id B389ADD8BB
	for <lists+jailhouse-dev@lfdr.de>; Sat, 19 Oct 2019 14:45:37 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id m23sf4790140oih.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 19 Oct 2019 05:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jBsQC+yEyIsISNO9NC9kPYRwpGcXgHL42R5xi67owuc=;
        b=HHzaABtFVY7KvvVULy1IgK5pbfiwNIs3pa1PFYSuq34dsvTFUvAH/KuxNt71lFeUHc
         zaxBHEyF7FuWYk5js2nF68rocJa2yk+7SL+Kbd53UHM7fiK4m13vQRcRH5vX3acqHVxt
         HyyQxhmaoQLzR5RjjXrzFOMoepZweBlnRcuiYhjIxhiyOhbXtVe5VKtS+qGVKRyi+8I+
         Eri88Rv4UU0KADnotwhvMbSJvAQWsA61aY70EoUR0fw1AVlbJlJNOFtkO7rhxKvyMbA1
         V/f/n1EZIKdmlHSKNTF/8/tziwr34dLTCLpYZGXjLp2uGAuIUnWAXa38Vh98EEsK0ft/
         XDdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jBsQC+yEyIsISNO9NC9kPYRwpGcXgHL42R5xi67owuc=;
        b=mu4p2ClQ8+c/YsThLHNI1O0ihRkPkyIld3ssbHLkKWv1wGIQCuTEJWgC3EKdNnXqSZ
         FgjY40enK+e6DDL3a13RKA0b0z71h+qZsnMkNpKEZZBe8/2hebcTMCODx+kbE7aXvXAC
         wE0Flr8IFvYfgf0gSaK0R9YbCqHkd6VAcqkXntDRT0HJ2TbZ64reW1TDpRQKNYhDQB+Z
         +m3oAJcKgFFFiwkmQ6r7ieuDOXWiAO0BLDH8XZrz/cmFyNmXdhTV9ZFgL8duCi7GI13A
         pbif7JR+9+xr2SS7kxAwfdfems8a2VuGeA1+SqVZQ5UfYgZtfbrk3poZEJmnJxPIM4gv
         DrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jBsQC+yEyIsISNO9NC9kPYRwpGcXgHL42R5xi67owuc=;
        b=TNjyJ6ePRWAcDEMrSSrmgjuJapxDEMeykwHr/ri07zd9TK664L3iC0bMqGm4os8nAx
         MOXjS0opQSgyhEvp9nyw5TkW3RNYjbVi/XaITk2La8794FZMV0xf/VFJrcRKOV51jxW7
         WhMIUd4h0eOzO1HdReMa8AerFUYfbYAu48rncxX+mBawv5RDlBQtIT2//uUUYvrdWf7T
         3msSpGZZavYm9hduPC2CKYyv8qq20gY6sl9l1htAJyOWg3MBC9sN9WzhiqNNi/00CmDy
         kTobEFi+bHjf7HpBXZ7gBAnW4XL2ro7cvNrPNk9QbGCe9b+XFv80xrwqzFe6/zvFLU2a
         gf0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+PcGnh7lEYkIk+ntJjXnQmccrrnGaO1NxW6kybHrM24tVIpdY
	92a9i8/8jgXS4S9Eul3fYXk=
X-Google-Smtp-Source: APXvYqy7niqZMIAMXY7WHKX33PCeD4xPQJPsTdeBVAT/dYFRcEnZOyxEgKE1OskZaHQ4Kh9Zb7pquQ==
X-Received: by 2002:a9d:7390:: with SMTP id j16mr11437366otk.277.1571489135968;
        Sat, 19 Oct 2019 05:45:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:3cc:: with SMTP id o12ls1479228oie.0.gmail; Sat, 19
 Oct 2019 05:45:35 -0700 (PDT)
X-Received: by 2002:aca:5c82:: with SMTP id q124mr9637187oib.19.1571489135094;
        Sat, 19 Oct 2019 05:45:35 -0700 (PDT)
Date: Sat, 19 Oct 2019 05:45:33 -0700 (PDT)
From: josemartins90@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5eccb011-381f-4bdc-a6e3-768c86ce9887@googlegroups.com>
Subject: gic-demo on ZCU102 fails to print to second UART
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1370_1972772301.1571489133937"
X-Original-Sender: josemartins90@gmail.com
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

------=_Part_1370_1972772301.1571489133937
Content-Type: multipart/alternative; 
	boundary="----=_Part_1371_552086421.1571489133937"

------=_Part_1371_552086421.1571489133937
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm trying to run the gic demo on a ZCU102 using petalinux 2019.1 for the=
=20
root cell. However the demo cell fails to print to the second UART and no=
=20
error messages appear on jailhouse's console.

As suggested on your setup guide for ZCU102=20
(https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zy=
nqmp-zcu102.md)=20
I've tried to use an older device tree. However, when using this device=20
tree Linux boot hangs on "Waiting for root device /dev/mmcblk0p2...".

I've also changed the phys_start of the zynqmp-zcu102-gic-demo.c UART mem=
=20
region configuration to UART0's base address (0xff000000). With this I see=
=20
the jitter messages print to UART0 console, so the cell is running as=20
expected.

Any idea what I might be doing wrong?

Thank you in advance,
Jos=C3=A9

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5eccb011-381f-4bdc-a6e3-768c86ce9887%40googlegroups.com.

------=_Part_1371_552086421.1571489133937
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>I&#39;m trying to run the gi=
c demo on a ZCU102 using petalinux 2019.1 for the root cell. However the de=
mo cell fails to print to the second UART and no error messages appear on j=
ailhouse&#39;s console.</div><div><br></div><div>As suggested on your setup=
 guide for ZCU102 (https://github.com/siemens/jailhouse/blob/master/Documen=
tation/setup-on-zynqmp-zcu102.md) I&#39;ve tried to use an older device tre=
e. However, when using this device tree Linux boot hangs on &quot;Waiting f=
or root device /dev/mmcblk0p2...&quot;.</div><div><br></div><div>I&#39;ve a=
lso changed the=C2=A0phys_start of the zynqmp-zcu102-gic-demo.c UART mem re=
gion configuration to UART0&#39;s base address (0xff000000). With this I se=
e the jitter messages print to UART0 console, so the cell is running as exp=
ected.</div><div><br></div><div>Any idea what I might be doing wrong?</div>=
<div><br></div><div>Thank you in advance,</div><div>Jos=C3=A9</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5eccb011-381f-4bdc-a6e3-768c86ce9887%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/5eccb011-381f-4bdc-a6e3-768c86ce9887%40googlegroups.com<=
/a>.<br />

------=_Part_1371_552086421.1571489133937--

------=_Part_1370_1972772301.1571489133937--
