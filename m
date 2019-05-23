Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRBDO4THTQKGQEGV5KJOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77F279C3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 11:55:27 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id h4sf2642198otl.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5uagAJ4l4UgfqMmxz/qr99WfsBw6YEHzefIuQjxjnA0=;
        b=jgyZcOOG1M2zp0kmhLW/fxAvdXrnwLlhPj3glhvUnaTZmQIo7azloHubxe46/KK2t3
         8f1zy89v//w94/0Qd4vIq1yVILRY+z6XFvyspGwLmM0lXvxz/tphpvQB9o8AAiDT9J07
         V6hDM8HKMzK+5HcDAZ3hygftZyxmt454giwn041BskqAx296814OC2cg2DGmXSx4hGGG
         gRwu22DILcEW23Q9g30Zm4YM6ujrNG7cCm29VgVQJfSlEYS+PCFHcshIRotfS2jocSWR
         fpn0znNl22yX/myGpTnY3UAY7+Fk5FNr/RvP3h2Ous5HAVO7VD80M8Bi9hBSFA1hkU3D
         Zubg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5uagAJ4l4UgfqMmxz/qr99WfsBw6YEHzefIuQjxjnA0=;
        b=Re8okSrj/x8midxQebhDEltolYfq8gsP7fnTRCbAJVzd3ty2Ohk30Au7EVwVwOgihi
         FQfQoGVPRcZoi8HVM74iKCCbB31jUBPEhDOXJQ+WvAc9IOQLRnm6udyI9vX6QSzAn/Qh
         yupr2SiNb403Wvw2saO4AupA4hCXV2qrnaVELG8JICWICd3fdJo0mcBtUW9Hd1jjRv+1
         CbmL0WRv8vODWwkJG5Iv+OpN5KlLkRz4kd0aq8pHNhwlS0Guoo7/zwlQ9V5GMCXn3qWy
         6h+RgYdFIIWw5j9O0h/YQ+5p83iWL+KT07esqk+ZD4ff/pPI3TnasZQFgL/p6BPYLVQt
         8WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5uagAJ4l4UgfqMmxz/qr99WfsBw6YEHzefIuQjxjnA0=;
        b=RGA9YbePiS2bxYmAO3BU/5MtHXFUgNeuJZO5v4JFRz9qMnzldaJe6xgWTORXmx26yR
         LhQLvwoLImK4H/c8s5mzd7WVe+TvoV+0jH+qVcD36BhFMPuQSRhk013ZUDiGxl4ddE0j
         9p3nlgmZ+rSltu3HL1bUfhCoPUWq1SSe5eAnlKPb/0rbVRMCf+YvyNmxYnGV1IfD7b3J
         GgvmrP+8/wxmlJs0yBgGHgvddh4JanIXW53FE8ZaFsRvmJDUNmrg+Z/JD9zu+RNr9YMg
         rbwofP7f4ZXPZGTbXxLEFGbvoqqFt8BKOH8wYK7YH32JjIp4XR9Au8HvMxwNg46emef7
         yHnA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVhMeVBwgcv+LMyFs51MdFCk84NDgQRUi25Z6+ngEjQXUuMfHZM
	UvDYG5AUlrI2FSuCsEcPKv4=
X-Google-Smtp-Source: APXvYqxK4dV7JUoduEC3MYPUX53h78DFtBFnxPrUaiIPeIDkOkSdrZzWSHCNwrSHYEh+VCn+gZPCsw==
X-Received: by 2002:a9d:3786:: with SMTP id x6mr33538297otb.88.1558605326237;
        Thu, 23 May 2019 02:55:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6e05:: with SMTP id e5ls1022310otr.10.gmail; Thu, 23 May
 2019 02:55:25 -0700 (PDT)
X-Received: by 2002:a9d:62d5:: with SMTP id z21mr70665otk.150.1558605325352;
        Thu, 23 May 2019 02:55:25 -0700 (PDT)
Date: Thu, 23 May 2019 02:55:24 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6b032366-4973-48ee-bb6d-eeb9a8f8af0a@googlegroups.com>
In-Reply-To: <eed22d42-114d-4f59-8c9d-6749a62e0674@googlegroups.com>
References: <11b39fc2-5d7b-4118-a265-cba7558fb6f3@googlegroups.com>
 <1839f769-4d27-3e6f-af6d-edb8ec9ee478@siemens.com>
 <69e728e8-c543-4bb1-8c34-5db36e04d1cc@googlegroups.com>
 <2dce448e-a8ff-b7c4-dc76-52a193dacd55@siemens.com>
 <82eae47c-fb7a-40a5-aa48-6f123d97597e@googlegroups.com>
 <20190206135906.7ad04428@md1za8fc.ad001.siemens.net>
 <a9691b13-c868-42cb-a42e-0a09ffc9d7cc@googlegroups.com>
 <20190208164015.2d9a3ee7@md1za8fc.ad001.siemens.net>
 <eed22d42-114d-4f59-8c9d-6749a62e0674@googlegroups.com>
Subject: Re: How do I get ivshmem-demo working with Jailhouse Images?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_350_1408583893.1558605324359"
X-Original-Sender: jeanne.romefort@gmail.com
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

------=_Part_350_1408583893.1558605324359
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 9 f=C3=A9vrier 2019 06:26:29 UTC+1, michael...@gmail.com a =C3=A9=
crit=C2=A0:
> On Friday, February 8, 2019 at 8:40:18 AM UTC-7, Henning Schild wrote:
> > Am Thu, 7 Feb 2019 16:53:41 -0800
> > schrieb <michael.***@gmail.com>:
> >=20
> > > On Wednesday, February 6, 2019 at 5:59:09 AM UTC-7, Henning Schild
> > > wrote:
> > > > Am Tue, 5 Feb 2019 19:25:28 -0800
> > > > schrieb <michael.***@gmail.com>:
> > > >  =20
> > > > > On Friday, February 1, 2019 at 12:32:40 AM UTC-7, J. Kiszka
> > > > > wrote: =20
> > > > > > You likely want
> > > > > > https://github.com/siemens/linux/commits/jailhouse-enabling/4.1=
4
> > > > > > or the 4.19-variant that is jailhouse-prepared. That's what
> > > > > > jailhouse-images is building for you. If you just rebuild the
> > > > > > kernel that the original image was using, only adding UIO, you
> > > > > > should be fine with keeping the jailhouse kernel package
> > > > > > untouched. But the cleanest way is reproducing the image via
> > > > > > jailhouse-images after adjusting the parameter you want to
> > > > > > change (CONFIG_UIO, ROOTFS_EXTRA etc.).
> > > > > >=20
> > > > > > Jan
> > > > > >=20
> > > > > > --=20
> > > > > > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > > > > > Corporate Competence Center Embedded Linux   =20
> > > > >=20
> > > > > That worked! I was able to figure out the correct kernel to build
> > > > > by looking at
> > > > > jailhouse-images/recipes-kernel/linux/linux-jailhouse.bb from
> > > > > when I last generated my image at 4.14.73
> > > > > (https://github.com/siemens/linux/archive/1dd68658b3a8308a160b078=
6fc4e1e04d8ff5216.tar.gz).
> > > > > With that, I supplied QEMU with the new UIO-enabled kernel image
> > > > > and built jailhouse and uio_ivshmem.ko and ran the ivshmem
> > > > > jailhouse demo.
> > > > >=20
> > > > > However, I'm still not sure how to read in the data from the
> > > > > ivshmem-demo. Once I insmod uio_ivshmem.ko, shouldn't there be a
> > > > > device called /dev/uio0 that I can read "Hello From IVSHMEM" from
> > > > > and write back to? And shouldn't there be an entry
> > > > > in /sys/class/uio/? I don't see either of these, and I'm not
> > > > > quite sure how to debug this yet. =20
> > > >=20
> > > > Yes you should get that. If you do not, my first guess would be tha=
t
> > > > you are not building the jailhouse branch of the guest-code repo.
> > > > The jailhouse version of the PCI interface is slightly different,
> > > > so the probing between the two is not compatible. =20
> > > Shouldn't I see /dev/uio0 and /sys/class/uio/ once I `insmod` it,
> > > regardless if it's built against a non-jailhouse-enabled kernel? Or
> > > will it show up once jailhouse is running?
> >=20
> > I am not actually sure what will happen, so if a /dev/uio0 will pop up
> > even if probing failed.
> > Just to clarify, i did not talk about a jailhouse enabled kernel, i
> > talked about checking out the jailhouse branch of the repo you got the
> > uio driver from. The one from branch "master" will not work!
>=20
> Thanks! That's just what I needed. I didn't realize that there was a jail=
house branch. I rebuilt it, /dev/uio0 shows up, and the ivshmem-demo is wor=
king! uio_read and shmem_test.py (README.jailhouse) both work great.
>=20
> But unfortunately uio_send doesn't. When I run `uio_send /dev/uio0 1 0 0`=
, it fails to mmap() with an ENODEV/"No such device" error. The mmap man pa=
ge says "the underlying filesystem of the specified file does not support m=
emory mapping."
>=20
> Do you know why this is? Isn't uio_send just trying to mmap() the PCI con=
fig space (the first 256 bytes)?
>=20
> Thanks,
> -Michael
>=20
> >=20
> > Henning
> >=20
> > > When I `make` uio_ivshmem, it shows that it's entering the correct
> > > kernel source. Is https://github.com/siemens/linux/commit/1dd68658b
> > > not the correct jailhouse-enabled source to build for 4.14.73?
> > >=20
> > > Does making all the UIO modules be built-in (Y) instead of (M) make
> > > any difference? I set them to Y because I thought it would make
> > > things easier.=20
> > >=20
> > > I may consider upgrading jailhouse images to the latest if I can't
> > > get things working.
> > >=20
> > > Thanks,
> > > Michael=20
> > > >=20
> > > > Henning
> > > >  =20
> > > > > The only documentation I can find on this is
> > > > > https://www.kernel.org/doc/html/v4.18/driver-api/uio-howto.html.
> > > > >=20
> > > > > Any help is appreciated. Sorry to be a bother. Thanks!
> > > > > -Michael
> > > > > =20
> > >

Hi Michael,

I am in the same situation as you with the "no such device" during the mmap=
. Were you able to solve your problem? If so, how?=20

Best regards,=20

Jeanne=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6b032366-4973-48ee-bb6d-eeb9a8f8af0a%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_350_1408583893.1558605324359--
