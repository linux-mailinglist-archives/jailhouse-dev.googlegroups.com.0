Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI42T7VAKGQEVR7IDLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8578125C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 08:30:59 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id l4sf17349589lja.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Aug 2019 23:30:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564986659; cv=pass;
        d=google.com; s=arc-20160816;
        b=B/OHf7c8kliimpdc4XXHXu3BET3ecqeLVvnsb7LxQuv4LYyGuDIFXpl8UP4NO/LQqF
         LxBc/OaCvnWzfjmEaOeaEZ64nhQhAV8qIzG1bAUqwkeESvdGKiiKwdQsoC5EKUoeT+Ut
         Huugvq4ey5cPENebSQBWnf7c8x6GmwRvg2ZSJv3hVVeF1ZqAhCkLaGvjje/eVIYXZQGn
         KUQEjwblBZisVEDn1l/slX6cHcvLZuXh0pX3DfcMH2XBRkhipgUOWYTYm0aYd8DWJ4Ap
         FnNcvtuFKNyNjScH2ayjdCGxg11m3jnejPSITJfGOxvyUoTQLpXREP6Ik7o+cpl80u6s
         mHlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=X5tBDeIInIXJ5thWmfqi27iH0Tyo6ANeNUbBN+Zf8ug=;
        b=Px5+zV4ASQDUWL2YOB+Sdlnt1lFNw2wrXbgTZccItyZiA9cKvkoGeDwprjeSBwvTEw
         ezcIGrAg+3B53wFVm0NKKAAdxO939jv3YSAnojnFek0ci71NiKnwRfHf2slVydM7Je6b
         Nwmp7y5Ft33PojHBjN9EHaVeu/rymWPsMKxxB5A5xeooOCEh0jUlzLRrvXWPCPWpK+qE
         8N0Et2XtM8MXbu72xbgqEyFNckB53jW/pGtk11vksi4QtQaMV5aXWQ8DqRIUDHzh1J95
         rdhRH93hNIkw0gSP3Z9QedTXUOKwBjXl5wUjbbXBDXGKNKf9jqAtj5Bl41PnaArtP935
         S9dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X5tBDeIInIXJ5thWmfqi27iH0Tyo6ANeNUbBN+Zf8ug=;
        b=k+9+OYU29scsAJcnxyZvaUn7Cyry98o13Ez9XuLr82LYhTZAbwopIWgASyBG7BHSHK
         iJKd8/rIV9p9+CiCr0S049JNNxxTj2aFcgxMltZQ3WQpIopcrBvOqoLJNUPPy5e6LqRx
         XBWg2wsW2mmTQFjV0jIoIiqZPNAx3REJFUmrRQsdp9/WjFpZ73cvBVolX+SrO65as11u
         cY7NLhrMlaSZYaX6kLlU/umWpTVDHRxDjOIIGFnFwFqXQYgD5NAiZmR0vjO5nCGMjUGk
         oeCXrFj24Bi5Io45jjrT73w1VuckPWJrA9ggcNzKz0eVXDQ4VskeeL9xBCZmZlQuSDaZ
         AdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X5tBDeIInIXJ5thWmfqi27iH0Tyo6ANeNUbBN+Zf8ug=;
        b=Hh6gGeLtDRsETT5qD7FvJWuxdS5Ni+i4/tod/YtgDagFrRidQVc8SDGIcnpfsXA0Xp
         8PYiXAEpJs3CZ6WCTuz58gbFCNHJbtaKU/u9v7+w8olHed1TrZVs0/Mso5HoYHd1w+2M
         az6tj3+Jh6z1Dkz04ik0Q6ecpA8Dyf5xK+Bpuma6W27eWd2ExFX7uZIQAkH+mYMXyVLB
         WrtYkhvubpw4Debg7dVzQ6JmqcEHOSNgr4/hIgcTkDqBKqsNFVBaJ5qqkOKNzgyCgMmF
         0J6Phto6kKfR94hdLi+4HoU+HPAHu+H4DuWlFmCKJ+wRDQrJNB9qtoXeihlVzfITvWbr
         2vNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVF6Xyz6jxxRzeRug+axAyanHBl4oeGGgcVB/Gn9OoUP0vlPWU+
	1W/ZwP9hVOA1GOHFziwlamg=
X-Google-Smtp-Source: APXvYqypioLTg7/F/1BqsjLuyY6I+AtQVQIoFEwJg0lFw52dIstWQ2AB0Vnm7YRkcpsDQe2aVfQddg==
X-Received: by 2002:a05:651c:20d:: with SMTP id y13mr74811662ljn.204.1564986659118;
        Sun, 04 Aug 2019 23:30:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4c2e:: with SMTP id u14ls6814086lfq.15.gmail; Sun, 04
 Aug 2019 23:30:58 -0700 (PDT)
X-Received: by 2002:a05:6512:484:: with SMTP id v4mr127108lfq.66.1564986658386;
        Sun, 04 Aug 2019 23:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564986658; cv=none;
        d=google.com; s=arc-20160816;
        b=05iNQ83U1bg6NZXYv3nil+/85rRSL6uACtc1nL5E9L2Rpb07Re12T6dXdu6i6CMjVs
         ISuwYXp8VlEz3L2GjWekaEpWqcn9faREBhCV0p/LYTFjf5H/Aneou/ieHOJ2j+odUq61
         wW12x/tCnaHb1w9Io1iFzGO9SeLoQJUXtRdoZGJu4B6pSOGLXqvd8y24IYdvssirtYAP
         RtIWBmOJkazypg85+sEtJRGCjQ8ohQumEZFCqrTm8FwOlxE2yAYpKKNyNy+l48rgswqo
         dDB9FHTlEGklxs+HdMNBEq5cqeTACgTCURZ0Lgvm0WTR5z3RgcZ9bYpiWk8irQoyg1pp
         F61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=G/aBrqBeSl9pm6P0QtD1E2GuQWR+KA0oyIVRBmRUEZU=;
        b=kiJg3GfoGihYOhUF/vA5Bc4s/qxiazzlIoYxrvcHZ9aY4sVLOcX3gae4jc4PaKxrnI
         Z7lGg1obC8xPlSCeYiVeOwnYi2fzJDAVllRvqTZWLoiWcQw39Ck6h2zuWrA924zUlt5S
         8lbDGMhHPVo58/w7jhDFTTfheGuczk2xw1FlDuIejyVS2gKb6Q83zoD83+75dh9l6xSG
         PGE7u+1Zi3i1Umjx+fT9sh3cBwNbB39LdKvBkWU33AFKubheUhSP2ITYwQWpcms2CrHd
         ouC09ATQ0PQc1tZsX4xRTvFDdRHp55CCuu7I/yfyZIUu24Fqp9ggwQMiDYafzyfY11Jk
         HZYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q11si4577670ljg.2.2019.08.04.23.30.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2019 23:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x756UvTZ021652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 08:30:57 +0200
Received: from [167.87.3.96] ([167.87.3.96])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x756Uubg003201;
	Mon, 5 Aug 2019 08:30:56 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
Date: Mon, 5 Aug 2019 08:30:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 02.08.19 21:46, Jo=C3=A3o Reis wrote:
> I send in attachment the root cell (ultra96.c) and non root cell
> (ultra96-linux-demo2.c) config files, along with the .dtb i am using.
>=20
> The Image and rootfs.cpio files occupy 89,9MB and 79,4MB, respectively. (=
link to
> download them if you want to:
> http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3)

That's obviously too large for the remaining space in that region. I will t=
ry to
reproduce in order to understand why the loader attempts this nevertheless.
Meanwhile, you could try if expanding that region a bit more makes it work =
- or
just moves the problem around.

Jan

>=20
> sexta-feira, 2 de Agosto de 2019 =C3=A0s 08:28:52 UTC+1, Jan Kiszka escre=
veu:
>=20
>     On 02.08.19 04:34, Jo=C3=A3o Reis wrote:
>     > The value of arch.ramdisk_address() is=C2=A02062893056, converted t=
o
>     hexadecimal is
>     > 0x7AF54000, which is within the newly added RAM memory region that =
begins at
>     > address 0x60000000.
>     >
>=20
>     OK, and what' the size that shall be transferred here? Keep in mind t=
hat there
>     is only 0xF9C000 (16367616) left in that region. That information is =
part of
>     the
>     'load' structure JailhouseCell.load assembles. If that size if too la=
rge, the
>     driver will reject it. That would explain the error, not yet the reas=
on for
>     jailhouse-cell-linux to make that mistake.
>=20
>     If you share your configs, the kernel and dtb images and the informat=
ion how
>     large the initramfs is, I can try to reproduce that.
>=20
>     Jan
>=20
>     > quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 UTC+1, Jan Kiszk=
a escreveu:
>     >
>     > =C2=A0 =C2=A0 On 31.07.19 02:40, Jo=C3=A3o Reis wrote:
>     > =C2=A0 =C2=A0 > Other thing i forgot was that on Ultrascale+ the RA=
M finishes at 2GB
>     > =C2=A0 =C2=A0 > (0x80000000), so i moved the memory region to 0x600=
00000, with a
>     different
>     > =C2=A0 =C2=A0 size
>     > =C2=A0 =C2=A0 > to not overlap any other memory region.
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > /* RAM */ {
>     > =C2=A0 =C2=A0 > .phys_start =3D 0x60000000,
>     > =C2=A0 =C2=A0 > .virt_start =3D 0x60000000,
>     > =C2=A0 =C2=A0 > .size =3D 0x1bef0000, //must be page size aligned
>     > =C2=A0 =C2=A0 > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |
>     > =C2=A0 =C2=A0 > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
>     > =C2=A0 =C2=A0 > JAILHOUSE_MEM_DMA,
>     > =C2=A0 =C2=A0 > },
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > But now it gives me the error on ramdisk_address:
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > Traceback (most recent call last):
>     > =C2=A0 =C2=A0 > =C2=A0 File "/usr/local/libexec/jailhouse/jailhouse=
-cell-linux", line
>     831, in
>     > =C2=A0 =C2=A0 <module>
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 cell.load(args.initrd.read(), arch.ra=
mdisk_address())
>     > =C2=A0 =C2=A0 > =C2=A0 File "/usr/local/lib/python2.7/dist-packages=
/pyjailhouse/cell.py",
>     line
>     > =C2=A0 =C2=A0 44, in
>     > =C2=A0 =C2=A0 > load
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 fcntl.ioctl(self.dev <http://self.dev=
> <http://self.dev>,
>     self.JAILHOUSE_CELL_LOAD, load)
>     > =C2=A0 =C2=A0 > IOError: [Errno 22] Invalid argument
>     > =C2=A0 =C2=A0 >
>     >
>     > =C2=A0 =C2=A0 To make this a bit more systematic, I would recommend=
 you to
>     instrument the
>     > =C2=A0 =C2=A0 code, dump this address e.g., and match against what =
you think you
>     configured.
>     >
>     > =C2=A0 =C2=A0 Jan
>     >
>     > =C2=A0 =C2=A0 --
>     > =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     > =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
>     >
>     > --
>     > You received this message because you are subscribed to the Google =
Groups
>     > "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it, s=
end an
>     email
>     > to jailho...@googlegroups.com <javascript:>
>     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd=
2d-c7cbdad1507c%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com>
>=20
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=
>.
>=20
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-a=
38e99a441d4%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ace6-=
a38e99a441d4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dd33650a-c068-52ca-4da7-4537de652bfa%40siemens.com.
