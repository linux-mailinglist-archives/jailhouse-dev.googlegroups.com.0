Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBOOUQL5QKGQEA2MHLDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2D26A460
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 13:49:14 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id l2sf1134644ede.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Sep 2020 04:49:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600170553; cv=pass;
        d=google.com; s=arc-20160816;
        b=U0mdzlu5lABBMuLYAzvlVEPbOitaieOBrtAg24itgCSDhWtAgk0U/1xipr+gU7QvSW
         NXr2tB67NGJu03v0YxuIdJXBXlqGesKmm8sIlwWQ9xFAt8ZABi3bfksxu5Zqc2rhKHdH
         SYT8SK4EZRwOYRTMojIxUXzfwSSHTD0YhBhpcGw1PrCwkmoiKrLkJiTWl9yqY8QnxGKr
         VgPDXjg960zo2SO5OlmuBxbeUKdwkaPGvPNX151YxPTqvaOjqeD1dDYWOoOKmjzF4YaL
         pEYr0NzfXjcUUHwD65v1VRvAwQOPfpEkmcxLn1Vsr0Gjm/Ro8wRjXB/CAegYjsY4hknp
         SCFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:to:cc:in-reply-to:date
         :subject:mime-version:message-id:from:sender:dkim-signature;
        bh=OIw4R5b4p7Iazal12qOChxNIbFdWl8knvvssi6dd5wQ=;
        b=oq4BJ08cwCiG+pcYMxnTOOR7J9J0sQ4zC+8CWv+kFIa/Nl6004bk1OcxOpfUyiYEwi
         r7Ha0wrxXCc3wGIN2st9+RJk2DqkooWNgse8rY6Fu+pCK05hSxKaVVLlXCoe2dsUe6oP
         zdVw91k7pL+DZe+5SJOFjMArgnnlnMrr0f2IDdZE+ZsleXicX+QFhBPEx76BNN1JOpiU
         G+aht0LSsw8jYVDL1C31p8RXrHjEoPt9ZB1OFl3k7ch3hnTyZ649EbVTU01xuO/Nwxrs
         48cGFKZ9R8fEfwZn24jTRjDtthoK26aU/GfE2qGO6q4bCFDLvKPuT9WQ88JEmIPjz5kd
         IwUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=d0EtIqsa;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OIw4R5b4p7Iazal12qOChxNIbFdWl8knvvssi6dd5wQ=;
        b=QWsKtTQHGB7bg684/55Zoym6BBJ+p0X4AxZx+K7jeifroITJa8JrqR2l/nRGhTHXnO
         rlOTqUd5XMMGt1YiT6OB6QU1hd7kc4dCNUwG3dC3NezwDV5UN+84nTk8Hln0WXbXc8Hu
         K/gJlkLSXtlMzrmTb+q4ww8H3jK7oY1H8ZZSiiL0rQPyuS2VflER83ligePKHcJDEt2Y
         KwswGyqU3WQQQtp9jt6m9kK5lLvsfcbCTwJZ3xxX9/RDc6xRufEZbCPBw1ID2D2GryfO
         CenLJ/j0mX2qLL4Fkkw0C6aTPVYDccBKgXiwtcynKv0dcPLjytlfgHLwsidE+Iu1ttM+
         fbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OIw4R5b4p7Iazal12qOChxNIbFdWl8knvvssi6dd5wQ=;
        b=cz4kz0cLA1otkhatOiJ7bTR3B6VejUXIaN37vCZXEcDMb1hqZrboRyqt+GttBOQms8
         GhL2lMDJRqP2MqASvGugtRWWKCPcJrYl+L6AfzkAMkuYIQqAAJZjIeDEOmQ/jD7nuShf
         YWKxDAi1QNIIQmUJ7a9AVt9bUdSHAQhS7RSlX8+bPs1P1MJWGcKgUnSbzo81VSNfCVrd
         qNRgBizvkdxHtvotwsSSVJVOcC0gpjnfJVO23OxishmZ9WGXNYLGK2o1iR9G/jH5sK5P
         TUdQpvfbVT9OnUJ1JvcQvjx2ezfG/YZ/KF0h1Kqv5Tuxy+hC3qkUpZzCVI6TYrlwajsO
         eKRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53365hOMHrg8pCKJr/2Pho4GHWmSfUq9KHgfWxhs7UKqw/7NZMYL
	W+yhjHegqVi7UZqq5N5aUz4=
X-Google-Smtp-Source: ABdhPJyr0JhYtY8PXrAjxkaTbuYb2dke4bjbV4z/KMSK6FcipjulNmYa0GYB5wLr89VCI67yDkZgXw==
X-Received: by 2002:a17:906:4a81:: with SMTP id x1mr15792389eju.541.1600170553727;
        Tue, 15 Sep 2020 04:49:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0c8:: with SMTP id bq8ls6270616ejb.3.gmail; Tue, 15
 Sep 2020 04:49:12 -0700 (PDT)
X-Received: by 2002:a17:906:934f:: with SMTP id p15mr20058096ejw.497.1600170552516;
        Tue, 15 Sep 2020 04:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600170552; cv=none;
        d=google.com; s=arc-20160816;
        b=dmhusXV4pMtcS/NeSmeBk72RVEoHFXfrfXDdfuPHnYbCNhDYqXLuwtUz9Y2uu9NEic
         ldmsnpMvU5Sah66SSZAOw6jq/xhOEYRWenKuR9c/l1M3fT6PK+6ReSA0WB4U9z1P/jGq
         yBsS2YUTLlN8B4JM1eB20UPpmYklIlygtcIqjJ/3cwDYyBXK/bmvVeDSjfypqKD6Ub1N
         nGzP9gt0WFceW/wlSX3E//HKjQGVFdPJwgZ/9hpRxVQxE+A6o9+R1yd6BG/ukPqihy6t
         f/L23B5MHiRiIvkQIHTpKrwi/IkjDtBIfBqzuT7O0wQp7wQxSRHRQwnEDlc33PmcwZj0
         0CXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:dkim-signature;
        bh=ux6BIRXD1POeN1pMbXYA6CJRk49T+YBGNTjaIatDkKM=;
        b=ozmpXGQZZTFKSrgYjOQqZt0AN/0RDPXqOckzYTWiL8Wn6/9tJWQTJMy/bYSfYg2hWr
         UsxuQXT4ekQGQxlr3ZDPDXUDwB8fTlYC2COrS5zpYysRq9SOsLyEJv5e2kL3TnbZnAZ6
         jHCWBlhcHFy+DU4IvJmferVCK/ofAjOESS+4UFNCaxvXDfopxRV5tFrGE+7jm/86iQbw
         QAyIVjMap+eXIMCRqBpwOh22WkzjwpC0WXy64RDIS0Hy3MKkNNrI3TbSxnpUHTCd6C5p
         svBK/GEWgidpTg0vPmYejKX+qwybLx1sWGumLkumAONbhyVRk6XinXZRVdT7c4mtpQ67
         ki7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=d0EtIqsa;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.15.15])
        by gmr-mx.google.com with ESMTPS id a16si685069ejk.1.2020.09.15.04.49.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 04:49:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as permitted sender) client-ip=212.227.15.15;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from nethserver.fritz.box ([5.149.23.5]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmUHj-1kieda3DMn-00iTtQ; Tue, 15
 Sep 2020 13:49:11 +0200
Received: from [192.168.2.64] (unknown [192.168.2.64])
	(Authenticated sender: oliver)
	by nethserver.fritz.box (Postfix) with ESMTPSA id 28E5A202544E;
	Tue, 15 Sep 2020 13:49:11 +0200 (CEST)
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Message-Id: <9F8CA946-F83A-41A8-A12E-B6FF06FA9B37@gmx.de>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_175C2004-37A6-4ED2-A8EF-E939AFDFCF55"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: arm64-zero-exits trouble
Date: Tue, 15 Sep 2020 13:49:10 +0200
In-Reply-To: <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:yBQRrvfOciU0/gpzrNh4vzydRsA/TXQ9KZ1WvSjcabsh7NtLCMt
 hjr1zDbSDaew2x7r1r2AkyC7NnfAOLng39vaAgrRtIX8jYoQQrGTUl3dXG3tahlRyf1PzRW
 xBsPs4/hfF1QP/yKXly5MxyfCyDTkuP++xI2aqOtIzr2FTMPVj+KGXrnUrWOALnWqOzai2X
 YA2J5Cp2y6O8xaRFO9q5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VnaXEjbJc40=:ExxJDm5voxNsxHrdkXGffO
 512b962BfkllvsHutZeZLl8uSMeo2R6Iskd9XUk2ic1fMgk3F+ugpF86UNRBlHvAqg/ZRj+qo
 rBDo3/CyDvgr0x3QJJ+5wzHiSis1TeDsfsGVEh7+5CaYrRCrlJw0qp5h/fexOdgVD1dr6vIbk
 x2uPToTq+LZDXauM5qDQLaVrDsz9qWp7nMnwyTgQAz33Md1+Uqd/jzJgK1ldbw57YolXdzlz8
 o8JVkWkgcdz49ZarbYD6Qc/QHoE2A7xMncy4yakJH+cDsvLMxBkGzDVU2f+SxL/Sf2qamqt6C
 IfOgAyuJXsNOEwAvzrv7Re5sIYBUReHV7OVsBbYWVo3insYFNkWB1ySxwNTEQ6n28KRIzaLZl
 A7s58Ix+3efRfQzXlBSHXZbgikm/AIYXmXwJks/eETiAmaomEGUA9stJPsShlM4qhVs2BsbIv
 DVEovSiVhJd8X+vF8vR8dJvjzADtIPIqK+I5xj5v/iNwSYtiA5H0vyLAjgajyITq3adRZyjnx
 L6r1KyfXlpw7awiTrpPn+G+nfv4BR1PWnCC0eAhS8vT3FUSYeVEYmDEr1M4LNPI0F4aeWfG0C
 eWF+Az9lAoPIFn+wuNkgFIk9By3U09wUNn8uCA750UmStA3GBnwfnOYZXar8LCn/YfbJu01Qr
 bi6NFPlMlwG/rMRi9s+lGavYCef1fp4wejfp0bt1gxCWmQFlcBPZuodKLui7ugddh/QoeoZt+
 zlmsoIFL8xon5IqFpiaVYV6TYUisDFmY9yxwljkBiRdh2fr1yvfYGdSpXgQzuFKe/nQQkcNPT
 BdtRRTPIahKuC8zuw9GISfspwg7PjZaW+H5safaSgf6XOub6tXXWlwdPsTXNp8NFJypADJowj
 drdgtb9jOA6aph0t8dHtjeJdti0kIs/FPo+NaJ0eZUvMxyAen7Lft4UZLX2RAflPpfoKW/7cT
 OHOschs7Q8nNwo0eVEntpu50EmfLKarb54gImfEtRYBcfxM00cvjieimShd4YL+ufYHZ7oKYZ
 ZP3g0FNdMw4N75VT39F5O2+VCjQRqC9vFqjCcP+LXkKVW05aEybLGIg2vJUWgqN+xvp4wAG/b
 Dl6J6S72Q5qiIev/G5jAkCViSRmbmJxxTpPMlh+Kjq+b7EMbbS7QQ817L6xktv/V9sMOmQxMb
 rLu02sDr9Q+LJZzVjsu3ihKFtJM6c5Bmz2fPvkWbAhqDtkzKoiNo/+0caRVyhnMqf7zbhRZW4
 oLDr+9qFqS/kOrcehYlFed6tnVJfEtzVWJyy28A==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=d0EtIqsa;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.15.15 as
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


--Apple-Mail=_175C2004-37A6-4ED2-A8EF-E939AFDFCF55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"



> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 15.09.20 09:07, Oliver Schwartz wrote:
>> I=E2=80=99m currently trying out the arm64-zero-exits branch and got stu=
ck.
>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=E2=80=
=99ve brought ATF up to date and patched it with Jans patch to enable SDEI.=
 If I don=E2=80=99t enable SDEI in ATF everything works as expected (with V=
M exits for interrupts, of course). Jailhouse source is the tip of branch a=
rm64-zero-exits.
>> If I enable SDEI in ATF, jailhouse works most of the time, except for wh=
en it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 result=
s in:
>>> Initializing processors:
>>>  CPU 1... OK
>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervisor/arc=
h/arm64/setup.c:73: returning error -EIO
>=20
> Weird - that the SDEI event enable call.

Yes, that=E2=80=99s a bit scary. The code involved in ATF is limited - I=E2=
=80=99m pretty sure that I=E2=80=99m up-to-date with upstream there.

>>> FAILED
>>> JAILHOUSE_ENABLE: Input/output error
>> I=E2=80=99ve seen this error only when I enable jailhouse through some i=
nit script during the boot process, when the system is also busy otherwise.=
 When starting jailhouse on an idle system I haven=E2=80=99t seen this.
>=20
> Possibly a regression of my recent refactoring which I didn't manage to t=
est yet. Could you try if
>=20
> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08=
aa65a456255f <https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6=
387d5ea11b08aa65a456255f>
>=20
> was any better?

No, I don=E2=80=99t see any difference with that version.

>=20
>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=99:
>>> Initializing processors:
>>>  CPU 1... OK
>>>  CPU 0... OK
>>>  CPU 2... OK
>>>  CPU 3... OK
>>> Initializing unit: irqchip
>>> Using SDEI-based management interrupt
>>> Initializing unit: ARM SMMU v3
>>> Initializing unit: PVU IOMMU
>>> Initializing unit: PCI
>>> Adding virtual PCI device 00:00.0 to cell "root"
>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>> Activating hypervisor
>>> [    5.847540] The Jailhouse is opening.
>> Using a JTAG debugger I see that one or more cores are stuck in hypervis=
or/arch/arm-common/psci.c, line 105.
>> It may also succeed in stopping one or more CPUs and then hang (again wi=
th one or more cores stuck in psci.c, line 105):
>>> [    5.810220] The Jailhouse is opening.
>>> [    5.860054] CPU1: shutdown
>>> [    5.862677] psci: CPU1 killed.
>> Has anyone else observed this? Any ideas on what may cause this? My gut =
feeling is that there=E2=80=99s a race condition somewhere, but it feels li=
ke looking for a needle in a haistack.
>> Finally, if =E2=80=98jailhouse enable=E2=80=99 succeeds, a subsequent =
=E2=80=98jailhouse disable=E2=80=99 followed by another =E2=80=98jailhouse =
enable=E2=80=99 always hangs the system (cores stuck in psci.c).
>> Otherwise, once =E2=80=98jailhouse enable=E2=80=99 succeeds the system i=
s working fine and I can start, stop load and unload my guest inmate at wil=
l.
>> To make matters a bit more complicated: My system is based on Xilinx Pet=
alinux 2018.2. For various reasons I=E2=80=99m stuck with the ATF version t=
hat comes with Petalinux (https://github.com/Xilinx/arm-trusted-firmware/tr=
ee/xilinx-v2018.2), which is a bit dated. To get SDEI to work I had to back=
port a number of patches from later releases. I am quite confident that SDE=
I and EHF handling are now up-to-date with the master branch from Arms ATF =
repository, but there remains a chance that I missed something and the issu=
es above result from something in ATF.
>=20
> OK, obviously that different ATF is another critical point, also in the l=
ight of SDEI_EVENT_ENABLE failing.

Sure. If you or others haven=E2=80=99t ever seen the above behaviour then t=
he issue is most likely on this side and I have to do another comparison of=
 my ATF sources to upstream.

> Can't you get your board running with the upstream ATF version, just for =
the Jailhouse test? Then we would know better where to dig.

That was my first approach, but I didn=E2=80=99t get very far. With upstrea=
m ATF from Arm my (Xilinx enhanced) kernel doesn=E2=80=99t boot. Exchanging=
 the kernel opens another can of worms, but I=E2=80=99ll see what I can do.

I managed to boot with ATF from master in the Xilinx repository. I also had=
 to update the PMU Firmware to make this work. The resulting system was act=
ing strange in a number of ways. Jailhouse showed the same occasional hangs=
 during intial CPU shutdown, but given the overall unstable system I abando=
ned any further investigations and resorted to patching the working ATF.

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9F8CA946-F83A-41A8-A12E-B6FF06FA9B37%40gmx.de.

--Apple-Mail=_175C2004-37A6-4ED2-A8EF-E939AFDFCF55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 15 Sep 202=
0, at 11:00, Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" class=
=3D"">jan.kiszka@siemens.com</a>&gt; wrote:</div><br class=3D"Apple-interch=
ange-newline"><div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; dis=
play: inline !important;" class=3D"">On 15.09.20 09:07, Oliver Schwartz wro=
te:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans:=
 auto; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">I=E2=
=80=99m currently trying out the arm64-zero-exits branch and got stuck.<br =
class=3D"">System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=
=E2=80=99ve brought ATF up to date and patched it with Jans patch to enable=
 SDEI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (=
with VM exits for interrupts, of course). Jailhouse source is the tip of br=
anch arm64-zero-exits.<br class=3D"">If I enable SDEI in ATF, jailhouse wor=
ks most of the time, except for when it doesn=E2=80=99t. Sometimes, =E2=80=
=98jailhouse enable=E2=80=99 results in:<br class=3D""><blockquote type=3D"=
cite" class=3D"">Initializing processors:<br class=3D"">&nbsp;CPU 1... OK<b=
r class=3D"">&nbsp;CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/=
hypervisor/arch/arm64/setup.c:73: returning error -EIO<br class=3D""></bloc=
kquote></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none; float: none; display: inline !important;" class=3D"">Weird - t=
hat the SDEI event enable call.</span><br style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 12px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"=
"></div></blockquote><div><br class=3D""></div><div>Yes, that=E2=80=99s a b=
it scary. The code involved in ATF is limited - I=E2=80=99m pretty sure tha=
t I=E2=80=99m up-to-date with upstream there.</div><br class=3D""><blockquo=
te type=3D"cite" class=3D""><div class=3D""><blockquote type=3D"cite" style=
=3D"font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; orphans: auto=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquote=
 type=3D"cite" class=3D"">FAILED<br class=3D"">JAILHOUSE_ENABLE: Input/outp=
ut error<br class=3D""></blockquote>I=E2=80=99ve seen this error only when =
I enable jailhouse through some init script during the boot process, when t=
he system is also busy otherwise. When starting jailhouse on an idle system=
 I haven=E2=80=99t seen this.<br class=3D""></blockquote><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none; float: none; display: inl=
ine !important;" class=3D"">Possibly a regression of my recent refactoring =
which I didn't manage to test yet. Could you try if</span><br style=3D"care=
t-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;" class=3D""><a href=3D"htt=
ps://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08aa65a=
456255f" style=3D"font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 orphans: auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adj=
ust: auto; -webkit-text-stroke-width: 0px;" class=3D"">https://github.com/s=
iemens/jailhouse/commits/e0ef829c85895dc6387d5ea11b08aa65a456255f</a><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><sp=
an style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">was any better?</span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""></div></=
blockquote><div><br class=3D""></div><div>No, I don=E2=80=99t see any diffe=
rence with that version.</div><br class=3D""><blockquote type=3D"cite" clas=
s=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquote t=
ype=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; orphans: auto; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size=
-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;" clas=
s=3D"">Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=
=99:<br class=3D""><blockquote type=3D"cite" class=3D"">Initializing proces=
sors:<br class=3D"">&nbsp;CPU 1... OK<br class=3D"">&nbsp;CPU 0... OK<br cl=
ass=3D"">&nbsp;CPU 2... OK<br class=3D"">&nbsp;CPU 3... OK<br class=3D"">In=
itializing unit: irqchip<br class=3D"">Using SDEI-based management interrup=
t<br class=3D"">Initializing unit: ARM SMMU v3<br class=3D"">Initializing u=
nit: PVU IOMMU<br class=3D"">Initializing unit: PCI<br class=3D"">Adding vi=
rtual PCI device 00:00.0 to cell "root"<br class=3D"">Page pool usage after=
 late setup: mem 67/992, remap 5/131072<br class=3D"">Activating hypervisor=
<br class=3D"">[ &nbsp;&nbsp;&nbsp;5.847540] The Jailhouse is opening.<br c=
lass=3D""></blockquote>Using a JTAG debugger I see that one or more cores a=
re stuck in hypervisor/arch/arm-common/psci.c, line 105.<br class=3D"">It m=
ay also succeed in stopping one or more CPUs and then hang (again with one =
or more cores stuck in psci.c, line 105):<br class=3D""><blockquote type=3D=
"cite" class=3D"">[ &nbsp;&nbsp;&nbsp;5.810220] The Jailhouse is opening.<b=
r class=3D"">[ &nbsp;&nbsp;&nbsp;5.860054] CPU1: shutdown<br class=3D"">[ &=
nbsp;&nbsp;&nbsp;5.862677] psci: CPU1 killed.<br class=3D""></blockquote>Ha=
s anyone else observed this? Any ideas on what may cause this? My gut feeli=
ng is that there=E2=80=99s a race condition somewhere, but it feels like lo=
oking for a needle in a haistack.<br class=3D"">Finally, if =E2=80=98jailho=
use enable=E2=80=99 succeeds, a subsequent =E2=80=98jailhouse disable=E2=80=
=99 followed by another =E2=80=98jailhouse enable=E2=80=99 always hangs the=
 system (cores stuck in psci.c).<br class=3D"">Otherwise, once =E2=80=98jai=
lhouse enable=E2=80=99 succeeds the system is working fine and I can start,=
 stop load and unload my guest inmate at will.<br class=3D"">To make matter=
s a bit more complicated: My system is based on Xilinx Petalinux 2018.2. Fo=
r various reasons I=E2=80=99m stuck with the ATF version that comes with Pe=
talinux (<a href=3D"https://github.com/Xilinx/arm-trusted-firmware/tree/xil=
inx-v2018.2" class=3D"">https://github.com/Xilinx/arm-trusted-firmware/tree=
/xilinx-v2018.2</a>), which is a bit dated. To get SDEI to work I had to ba=
ckport a number of patches from later releases. I am quite confident that S=
DEI and EHF handling are now up-to-date with the master branch from Arms AT=
F repository, but there remains a chance that I missed something and the is=
sues above result from something in ATF.<br class=3D""></blockquote><br sty=
le=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; f=
ont-style: normal; font-variant-caps: normal; font-weight: normal; letter-s=
pacing: normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; tex=
t-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Helvetica; font-size: 12px; font-style: normal; font-variant-ca=
ps: normal; font-weight: normal; letter-spacing: normal; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; d=
isplay: inline !important;" class=3D"">OK, obviously that different ATF is =
another critical point, also in the light of SDEI_EVENT_ENABLE failing. </s=
pan></div></blockquote><div><br class=3D""></div><div>Sure. If you or other=
s haven=E2=80=99t ever seen the above behaviour then the issue is most like=
ly on this side and I have to do another comparison of my ATF sources to up=
stream.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">Can't you get your board running with the upstream ATF version=
, just for the Jailhouse test? Then we would know better where to dig.</spa=
n><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;" class=3D""></div></blockquote><div><br class=
=3D""></div><div>That was my first approach, but I didn=E2=80=99t get very =
far. With upstream ATF from Arm my (Xilinx enhanced) kernel doesn=E2=80=99t=
 boot. Exchanging the kernel opens another can of worms, but I=E2=80=99ll s=
ee what I can do.</div><div><br class=3D""></div>I managed to boot with ATF=
 from master in the Xilinx repository. I also had to update the PMU Firmwar=
e to make this work. The resulting system was acting strange in a number of=
 ways. Jailhouse showed the same occasional hangs during intial CPU shutdow=
n, but given the overall unstable system I abandoned any further investigat=
ions and resorted to patching the working ATF.</div><br class=3D""><div cla=
ss=3D"">Oliver</div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9F8CA946-F83A-41A8-A12E-B6FF06FA9B37%40gmx.de?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/9F8CA946-F83A-41A8-A12E-B6FF06FA9B37%40gmx.de</a>.<br />

--Apple-Mail=_175C2004-37A6-4ED2-A8EF-E939AFDFCF55--
