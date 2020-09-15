Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBFEWQP5QKGQE5EN5CMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id D639526A6D1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 16:09:24 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id y3sf1266556wrl.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 07:09:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600178964; cv=pass;
        d=google.com; s=arc-20160816;
        b=rIdubb16eISpUJDM/RoHCsGZzAdqvTCDQP2fz/kYESqUTj/m4lrIETa4C7+MbEMEey
         JKxKZOXgJkzAEHVBZd4vNTitcDMTWDbXOHR0TBjkDIS1GXdVlaGfEtLDoqERK7mijlU3
         PLTguTdn+1UskjFdfVPx7Q8yDa9DJClmbTTk7Eh3ttf382zHTqjTDmvUYOGoSxjcWIQj
         dZkwalF2iwj5peuZY5G+DekDNI8YEce/IKDoUyimT2lRP969RFE3RFETfX8f23+s4+zK
         /PFifQN5ue7GDYiQNgdB297j4DjZG3uZ7wrG4U9ywA99Ex8XSYDXW/P72VTxS3+YixYr
         cd2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=+qrvxwJ5n3EBghfJI9vh0KzPJ7AJ1Bz9fF/HazgGPD8=;
        b=F59vdikGLpSLvQUZ7utbNI4c1/5fn6vTo//Grm5osM++cfJNSO5i6ix/GdTusug1gF
         0dhtDUJBbeissH13rZdWTwFlSPmOimNK90gCymwqsIKvUMaKQLp6D1CTefO9xx9vwdkd
         4GFoHRqTvkZUbl3K5ImRLOWrVyvagpuy3SqC8iNdB4kf/ZftNJwak7kxI15pDQKTQs7m
         KLvKL+3+kMFzwmW0QXHmvicKxgg84FT89Fm7Dzdea/htxXuPcAnfbfcrdnGA2i3wj9/B
         VGaEVzqMFclukQLE2dEfpG4wOSl1WCWvfXnl33HxKfysFvneqnaF+R9V9vs0+6y77mvQ
         yvnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=JK+CnyyB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+qrvxwJ5n3EBghfJI9vh0KzPJ7AJ1Bz9fF/HazgGPD8=;
        b=Wp6GwEO/Q8/aMg/5stx33cVnaf0cXzIHiYDV4su4Ily99g9pVUlZ6RWdhAUO5zwQ8t
         uNgmPAbgs8fHeTv4VK1TbqA1aZUEaXfSTexGyBs5ZL33Gs0/hf91+h53zeY64Zw1QVah
         DB7XGQgMfk8EWOO2tR4ORE0udNNj+DV1OvV54AXk47co0WgbEbIlNQyd0tA02jS7o3nA
         8uTXX0p3Lcd5AAwK/kS9idJ/WAHbgm5xN/xzlsCORPcZ/siHa0eM+QTUzwF9SWycOCHE
         yriFkoEzpyw7RzQ2mlpDKznYXiMCH1WgWLMhbjAXTerab6SEVvsrAmW11gji7/s6t1Gl
         DSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+qrvxwJ5n3EBghfJI9vh0KzPJ7AJ1Bz9fF/HazgGPD8=;
        b=DAXKApvfSjdHQ45wrH5ot4zUWP9oAPVkilZSrjnzEBvDGuX3/6phBzj2ji7JJLfWag
         nLSxO5nBNK/Fu1hkVQR+bhv1D/2dolu9KYbB4mIdPbeB2NgfUZpGoAAmkwr97rqCJrbr
         uAyOUQG1d0R70eKZYEWU+Xk/w2/IUxkR+sFNzT3reKIRH+9AicRvjsS8kj3fx/nvJ4Au
         yuhzr7KP83Iw5K2JjESnXQr4Fo4HrlxcRr0tFL/7j0pMhAl6ZVdgCLeGHDZ2CbkF8vqD
         uIHLXgyDqZIglGPJbhKelcL7GCnbNB9JUlsCQb6htnw2RH1XRYgoweGVg2uijEXhsGgn
         o+oQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533uCAE69G1sUbXyiWUhKVxw454+wpmhJ6j4Ji/HnxcwM3s8LHed
	Y/XrXfsBvuGSl0F0jj6CN+M=
X-Google-Smtp-Source: ABdhPJymUUdUGCQRZTIt9bE0WzX+0/tiUjwXjgBq7wJ4JPHlQ1WyLizsnsK7I+FssG/iTAoWTGFHVQ==
X-Received: by 2002:a5d:430d:: with SMTP id h13mr23016435wrq.41.1600178964522;
        Tue, 15 Sep 2020 07:09:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls2039134wrm.2.gmail; Tue, 15 Sep
 2020 07:09:23 -0700 (PDT)
X-Received: by 2002:a5d:6b84:: with SMTP id n4mr23225002wrx.55.1600178963404;
        Tue, 15 Sep 2020 07:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600178963; cv=none;
        d=google.com; s=arc-20160816;
        b=giujS/Gf6o0Fu0NXao4bN3LSp0sLfSpRvwoAacUlW7XFiZqzPyysgCddAnMH9w55hl
         xd8qN3A9jBWUjlnk6YZ+yIaiPDrHywYRaxKyHJEv1f81ydbItNL+sKyBvQBo1+chTkCf
         00yfAaYI0biklGmAou46Ucp99EB/X6vXbv3ZLWFTupxPTI2fDXJ4ctjtlOQlggWWLyYC
         Dvt+mTn8M//eBb01BL7ywZ4lyHm6Vb8rcnBpCse9hN0H/Tbow0x7Z2VrItL9flJ6x+TE
         kcHX/3bg+GEoWRe0RRvL9n15nyML/uI/Rw5eAMk9vOAqIRzTEd2WHnw+q6NunfGkBAkI
         oM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=lokMk/nB8Vrl+tn20hSC4W8l9sNjruRJfRNsFsjJ8GY=;
        b=ezhlGPskYY4G6vlaVB1jM8sUVuYhxLBgh1BDQF8Qg3eb+ANaVyRZFbfw0q5mFqxLhB
         88dKwx77O2xAE9aPXjnchcs520mz7DYaTBeXc7WHt81ggNm/+VpQIK/mUUhW0/bZuNWc
         tJAaICwV7y9ikmRAFD4kEWYuhmNDvFJtJMQMM6nR0KrwJobau+aDvJUBUliMKf/zvSOv
         5eqgphHbG1TVYd4L2mI9NHPysgvL+EN9UZ1OrQeHGs3nMiDwMKBBVvRHz0nROjKn4REP
         M7ZIZwSNl9Y6/sRkUAvIQWYwOQtCCgkXlOWut9s8/gTmXU0bzDVEKIYnyi+nOL6GCHy5
         AaSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=JK+CnyyB;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.18])
        by gmr-mx.google.com with ESMTPS id x1si467949wmk.2.2020.09.15.07.09.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 07:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as permitted sender) client-ip=212.227.15.18;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1k9QDi3lZ2-008sfI; Tue, 15
 Sep 2020 16:09:22 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 4E76F202544E;
	Tue, 15 Sep 2020 16:09:22 +0200 (CEST)
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: arm64-zero-exits trouble
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <33c9ad9c-41fc-2ebf-7f4d-cad19bab8135@siemens.com>
Date: Tue, 15 Sep 2020 16:09:21 +0200
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2526A9F3-F82A-44C5-858A-C4E6A1911658@gmx.de>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <9F8CA946-F83A-41A8-A12E-B6FF06FA9B37@gmx.de>
 <33c9ad9c-41fc-2ebf-7f4d-cad19bab8135@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:vTIIfQtPlPok/0fu+AMjA+DsrITalRMMahTWqU4Tq1L4iIHOhne
 MCHkQYdsSGR+PD1RJScgwgFomM9wfUdGzW9lXjWB51S/7vUBJyHosBbD24SjhgvJj8LTWh2
 m4g7XimyV7KOM91EUeAkiii/1IcMMiIaYHjPp0F9/SqTyQFRU2C8e0ciPDpHmg9rVANoY+y
 h13TzN3Qdhp5Px3gmhX6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bSouj93hXT8=:erbYBfF9Q5Buzi/6oD42EA
 W3OAudlE67OaV1pmZVTPL1eo8ODNCXiOU8ujk7Yy9U3J6H9z5bC5bP6/+6Gv5EyajoSXslPZA
 MUpQTICYBbWlO7bcOefEqqV1pBEaXCXKo8HEBrZoTq8hfMtdlw1+pJjqUTUjfG55fNf4g8JwA
 cHEGj+YBdIxuyCWYFnvmft0PsqVUpUvD+w/EhHNLdopCaf8Sa2DKwcYcJ/kkYBT3QODV6C62x
 4DP1Yolm8udMHmPXwY2my6n/fJEkhYTlYJHpxWnOmC+S2aWo82VSFEzfA439sq7Tekacsco6R
 RJu/Aw5wNh9pNXRqVggz4fQZlQTGfi5s5a0MoYAk0rG4dtxdeeRY5PfV53517BL6f5qFiBBr3
 N+016n78Cg+Jt4BW1yNvrR16eeI3XHFC19VFXhmPag/vHr6ufac42dijeM1/SjSjMg20SHK0F
 m5sqz0LYspcUVUVfCiVLvn5dhWGqB3C6t/EC87TeOQSmvy1FN2GZ5vfQf5sMNIIAr24PzkQtQ
 fjM2/ypOF7PQBRrztwfbuw+0lop/eHguDFiXMaEK6I2juDLdzqoGKyNvCQ9PYmM87Vo/3oeZC
 9QH0pdYbz2KHwqoq4hnejINiyGjP1MQbzEBwBgvEbEuZdeI9BnCIxJG4i8nIXS8LD2rod726u
 rYIxe65LKuAzoT4J6Ivu5Qt0aIidYE3GnVu6h2a2s8pJYol6qLgDcsYFPyZnCaWVB8s26AkJG
 pznrub5q2JSn68X8HaITtXyyya10VVRICIOuIxHFdULIe4hBNA5mrrLMHpVu+5IwNnNSibmvr
 5gmvrzT4WdjR5fk7XsoTBNsP1AZy9I3lioG9kofQgLwFyX2/SX+NG2oa8qS1mxgd6IswP4GIL
 TEXO4H1AVzcF5kCXJIEWm+dHcvLxJuCXj/aIKUw8poOSHw/Uu/8fVFvwQNcu3XJzv1vJyhKnS
 uLbxLT7TeJXz2MTjeEeG4rULVeYHxnMIjzYixPN+KDYBfJHROH8+i0gngx1TTl8cj8IJZIdrG
 GTfQ7B+GLmZ0n+QGYl+SlSxssuelPqJnLH42N4TZy/5047CaLydXuFnu3dblRHS0SIpFUlcXX
 eJz7kVjLJ6nfjCjYOrk/Ryhj8UucPk7hc2QXbNi4/MKAgwvKO6eitDTcHonqEf0YgoNFFVN46
 jGM6cwaVL2ZUBjcUxEqy0fp3/sjyoaKCSJvCFAuVt4vxY05Wv26z+LUgQy5G8aHiPmr64Gbgm
 vQnHiqgJstyFbz0eHcjTgDc/DtrCy2tEGlWwjbg==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=JK+CnyyB;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.18 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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



> On 15 Sep 2020, at 14:02, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 15.09.20 13:49, Oliver Schwartz wrote:
>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailto:ja=
n.kiszka@siemens.com>> wrote:
>>>=20
>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got s=
tuck.
>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=
=99ve brought ATF up to date and patched it with Jans patch to enable SDEI.=
 If I don=E2=80=99t enable SDEI in ATF everything works as expected (with V=
M exits for interrupts, of course). Jailhouse source is the tip of branch a=
rm64-zero-exits.
>>>> If I enable SDEI in ATF, jailhouse works most of the time, except for =
when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 resu=
lts in:
>>>>> Initializing processors:
>>>>>  CPU 1... OK
>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/a=
rch/arm64/setup.c:73: returning error -EIO
>>>=20
>>> Weird - that the SDEI event enable call.
>> Yes, that=E2=80=99s a bit scary. The code involved in ATF is limited - I=
=E2=80=99m pretty sure that I=E2=80=99m up-to-date with upstream there.
>>>>> FAILED
>>>>> JAILHOUSE_ENABLE: Input/output error
>>>> I=E2=80=99ve seen this error only when I enable jailhouse through some=
 init script during the boot process, when the system is also busy otherwis=
e. When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>>>=20
>>> Possibly a regression of my recent refactoring which I didn't manage to=
 test yet. Could you try if
>>>=20
>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b=
08aa65a456255f
>>>=20
>>> was any better?
>> No, I don=E2=80=99t see any difference with that version.
>=20
> Good and bad news at the same time, unfortunately ruling out a quick solu=
tion.
>=20
>>>=20
>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:
>>>>> Initializing processors:
>>>>>  CPU 1... OK
>>>>>  CPU 0... OK
>>>>>  CPU 2... OK
>>>>>  CPU 3... OK
>>>>> Initializing unit: irqchip
>>>>> Using SDEI-based management interrupt
>>>>> Initializing unit: ARM SMMU v3
>>>>> Initializing unit: PVU IOMMU
>>>>> Initializing unit: PCI
>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>> Activating hypervisor
>>>>> [    5.847540] The Jailhouse is opening.
>>>> Using a JTAG debugger I see that one or more cores are stuck in hyperv=
isor/arch/arm-common/psci.c, line 105.
>>>> It may also succeed in stopping one or more CPUs and then hang (again =
with one or more cores stuck in psci.c, line 105):
>>>>> [    5.810220] The Jailhouse is opening.
>>>>> [    5.860054] CPU1: shutdown
>>>>> [    5.862677] psci: CPU1 killed.
>>>> Has anyone else observed this? Any ideas on what may cause this? My gu=
t feeling is that there=E2=80=99s a race condition somewhere, but it feels =
like looking for a needle in a haistack.
>>>> Finally, if =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequent =
=E2=80=98jailhouse disable=E2=80=99 followed by another =E2=80=98jailhouse =
enable=E2=80=99 always hangs the system (cores stuck in psci.c).
>>>> Otherwise, once =E2=80=98jailhouse enable=E2=80=99 succeeds the system=
 is working fine and I can start, stop load and unload my guest inmate at w=
ill.
>>>> To make matters a bit more complicated: My system is based on Xilinx P=
etalinux 2018.2. For various reasons I=E2=80=99m stuck with the ATF version=
 that comes with Petalinux (https://github.com/Xilinx/arm-trusted-firmware/=
tree/xilinx-v2018.2), which is a bit dated. To get SDEI to work I had to ba=
ckport a number of patches from later releases. I am quite confident that S=
DEI and EHF handling are now up-to-date with the master branch from Arms AT=
F repository, but there remains a chance that I missed something and the is=
sues above result from something in ATF.
>>>=20
>>> OK, obviously that different ATF is another critical point, also in the=
 light of SDEI_EVENT_ENABLE failing.=20
>> Sure. If you or others haven=E2=80=99t ever seen the above behaviour the=
n the issue is most likely on this side and I have to do another comparison=
 of my ATF sources to upstream.
>=20
> Theoretically, it might also be a hidden issue in the ATF patch itself, j=
ust exposed by your different setup.
>=20
>>> Can't you get your board running with the upstream ATF version, just fo=
r the Jailhouse test? Then we would know better where to dig.
>> That was my first approach, but I didn=E2=80=99t get very far. With upst=
ream ATF from Arm my (Xilinx enhanced) kernel doesn=E2=80=99t boot. Exchang=
ing the kernel opens another can of worms, but I=E2=80=99ll see what I can =
do.
>> I managed to boot with ATF from master in the Xilinx repository. I also =
had to update the PMU Firmware to make this work. The resulting system was =
acting strange in a number of ways. Jailhouse showed the same occasional ha=
ngs during intial CPU shutdown, but given the overall unstable system I aba=
ndoned any further investigations and resorted to patching the working ATF.
>=20
> OK, sounds frightening, indeed. The overall degree of adjustments you hav=
e to apply to even get booting systems is, well, demotivating with that pla=
tform.
>=20
> Anyway, pick the most reproducible effect, probably that failing EVENT_EN=
ABLE, and try to debug that in depth in the hope to find a single magic roo=
t cause. Nasty things come with multi-cause problems, though, and I've seen=
 too many already.

True, unfortunately.

Some update on the EVENT_ENABLE: I=E2=80=99ve enabled logging in the SDEI p=
art of ATF. A successful init looks like this:

> Initializing Jailhouse hypervisor v0.12 (105-g5352a61b-dirty) on CPU 3
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/992, remap 0/131072
> Initializing processors:
>  CPU 3... INFO:    SDEI: > VER
> INFO:    SDEI: < VER:1000000000000
> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
> INFO:    SDEI:  event state 0x0 =3D> 0x1
> INFO:    SDEI: < REG:0
> INFO:    SDEI: > ENABLE(n:0)
> INFO:    SDEI:  event state 0x1 =3D> 0x3
> INFO:    SDEI: < ENABLE:0
> INFO:    SDEI: > UNMASK:80000003
> INFO:    SDEI: < UNMASK:0
> OK
>  CPU 1... INFO:    SDEI: > VER
> INFO:    SDEI: < VER:1000000000000
> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
> INFO:    SDEI:  event state 0x0 =3D> 0x1
> INFO:    SDEI: < REG:0
> INFO:    SDEI: > ENABLE(n:0)
> INFO:    SDEI:  event state 0x1 =3D> 0x3
> INFO:    SDEI: < ENABLE:0
> INFO:    SDEI: > UNMASK:80000001
> INFO:    SDEI: < UNMASK:0
> OK
>  CPU 0... INFO:    SDEI: > VER
> INFO:    SDEI: < VER:1000000000000
> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
> INFO:    SDEI:  event state 0x0 =3D> 0x1
> INFO:    SDEI: < REG:0
> INFO:    SDEI: > ENABLE(n:0)
> INFO:    SDEI:  event state 0x1 =3D> 0x3
> INFO:    SDEI: < ENABLE:0
> INFO:    SDEI: > UNMASK:80000000
> INFO:    SDEI: < UNMASK:0
> OK
>  CPU 2... INFO:    SDEI: > VER
> INFO:    SDEI: < VER:1000000000000
> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
> INFO:    SDEI:  event state 0x0 =3D> 0x1
> INFO:    SDEI: < REG:0
> INFO:    SDEI: > ENABLE(n:0)
> INFO:    SDEI:  event state 0x1 =3D> 0x3
> INFO:    SDEI: < ENABLE:0
> INFO:    SDEI: > UNMASK:80000002
> INFO:    SDEI: < UNMASK:0
> OK
> Initializing unit: irqchip
> Using SDEI-based management interrupt

In case of an error in setup.c, I get this:

> Initializing Jailhouse hypervisor v0.12 (105-g5352a61b-dirty) on CPU 0
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/992, remap 0/131072
> Initializing processors:
>  CPU 0... INFO:    SDEI: > VER
> INFO:    SDEI: < VER:1000000000000
> INFO:    SDEI: > REG(n:0 e:ffffc0206784 a:ff0000010000 f:0 m:0)
> INFO:    SDEI:  event state 0x0 =3D> 0x1
> INFO:    SDEI: < REG:0
> INFO:    SDEI: > ENABLE(n:536872211)
> INFO:    SDEI: < ENABLE:-2
> /home/oliver/hil_sw/petalinux/rtbox2/build/tmp/work/plnx_zynqmp-xilinx-li=
nux/jailhouse/0.12-gitAUTOINC+5352a61ba5-r0/git/hypervisor/arch/arm64/setup=
.c:74: returning error err
> FAILED
> 10ININFNNFFFOOOO:: : :             SDS SDSDEEDIEE:I:I I>:   >:MA>   > SMM=
MKAAA:SSSK8KK:80:0:080008000000000000300
> N00I02
> O0FI
> F NO =20
>  S    :F SOI D NF:E  IS O:D: E   I< : S  D S<EM IAD: MSEA<IKSK ::M 0:A<0
> K
> SO:INM0NAFF
> O KOI:::N 0  F=20
> 0nG) I  NS SFDDO: E E IISD :E:    I>>:S  DUN EU>INR: E URG>E( NGnUR:(NEnR=
G0:E()
> (:nNF
>      :00OI): )
>  =20
> eE FIOSN:DFEO I: :     S< D  UESNDIER:E IG:< : U- N3evR
>   nGt:- s3t
> ate 0x1 =3D> 0x0
> 3INNFFOO::        SSDDEEII::  <<  UUNNRREEGG::-0
> =20
> JAILHOUSE_ENABLE: No such file or directory
> JAILHOUSE_CELL_CREATE: Invalid argument

The interesting part is this:

> INFO:    SDEI: > ENABLE(n:536872211)

The argument seen by ATF for the ENABLE call is 536872211, but in setup.c i=
t=E2=80=99s hardcoded to 0. The problem doesn=E2=80=99t seem to be with the=
 ATF version, but with the SMC calling per se, which is very scary.

The garbled output also made me think if there maybe is a concurrency issue=
 in ATF.

Oliver


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2526A9F3-F82A-44C5-858A-C4E6A1911658%40gmx.de.
