Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO6OTPWQKGQERE5EYPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEDFD8CDB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Oct 2019 11:47:40 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id c90sf13860749edf.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Oct 2019 02:47:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571219260; cv=pass;
        d=google.com; s=arc-20160816;
        b=ov+vcE6QN8vj5UvYl5KaAVagfptn4MHzryAtD0mTX8lSLOMFLMpuYIzVgIJpdBIWrM
         N1S49CHurYCiqF2NBmrJ6VJCKCJjm5iLn3osqNLNf9VUnGjtbwAU6LhY4IFnCpYL+tdg
         lM/KkzZ1mJcuEwvT4uAreLuKhdPnuCkdRiCY2m3CdZwbbSfJZ2I5RDX8Ql0+ZVBXJqts
         ni6gm2BrJst9syftcMZHbqx/Jo1/tU0SZ2F+lYZlyILT2vkYgTiBZ0MKZR69ZXBr0Llr
         xjMjqmw1/TaRTMJq80NZziDVBaPMoknOSo3g6L1cP0uMPzMC3Jb3OdykkFOy6A5MmLf4
         KjaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=/SSZ/UkgtxP8LXnAq9NMm1HfgVHJTUmwiMMNe76LHYU=;
        b=0AYyWyF7ZQf0flSf7ScWm5cWaiKZ5pj28jt6vsym8NL5ZOUQWZafE8rcCkH1NRd1a4
         684LoQmUvg1PCL+apyVUpwnpXXI6R3KMgqqiQ04inRiJ/ldzxu00CDBskIWvZZwrJ4Ls
         gCZyhYfdmg4cjCtJXRH8qaqLbXerFOfRrraqV0z67cLCztgUXaj5z0Hq/A+U47ncuHdj
         b7uTPatX3JhW4qAHGnztX/I7X35FwgBbe6zKup8PD5cdXA5pjnJ2wmkpDqLm0GMprEU3
         WPqfnjyh6DtIV/w+NdkDXG6wnQzVGoMuB8FGAn4sIbm8VcmbE3w6UkZcBq+Rk/XjU3le
         tRkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/SSZ/UkgtxP8LXnAq9NMm1HfgVHJTUmwiMMNe76LHYU=;
        b=lD18EBhqkNiVBRPCpLRVUrhFy6BjYaVfN1xb2Z7Sw0hpudLeESGNRNYE7ruAyImDle
         JjbVCV+5p703iwoGjQdJn2GkrernKfb9amNsBvikx6A83eWBahfBmivhKdNKlJDanpPX
         HmXb1d3N7FzUnSVZL5nmgn5eAofbJUF+LpbTq2dhS05dCbR0dzmTp2semHxu/xNZLvX+
         HvfKt/WjxR0lcTBrj3QlY2x04mEZXHfJLtm4wNZjcrGSDK/G4Ru1007S591/eNynK7+a
         t7WBYUHRIPz9GP6tMenFVys/571VaOI3iWXoseC/uWCtUoFb9qcyZN7bQkxrhDlZwJe8
         rwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/SSZ/UkgtxP8LXnAq9NMm1HfgVHJTUmwiMMNe76LHYU=;
        b=rIy1A+VB3+h8VEp41mb3aunfAJSR3s49GzhKLfwx4sEfxDsYROhKVAvElVbqVv50dk
         uN430NfdVgIhw9e5utl2tT191HMigyEY6cfyTIxgvlCfhgoLGzqg/CBqgHCwA9RhRbq1
         fW7rpwWS97nUAuliNoHSU77c3uo8txIkXpIU9Pnizy3Uu1HluPvATl9qvvImSe6vWxFZ
         uHhoupzvTxvhW9NVWt1pmeYG1XFUtIvtVrKUdb2DWqOgzTOK3d3jtEyaHxOggk7uKeyo
         XTu63zkg/moz/1j2VPHW4m2axKijzsYxxehZxOfh+ozNDYaaQzDrj2JWL+85QJ6lyFIZ
         BENA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWMmcPp3TgYPvtoKNCM4xx4df27LCNjyoDgZqV62ePoK02G0AJG
	o5/SEqAKZYJL6jGkZ2Xk5cg=
X-Google-Smtp-Source: APXvYqzhvLi8ZBRk0wJIJhp/lsHJSngN7RPkOg0ZxZbqUTH9QPV64HFNFTIPq3F4tIxrB9s/0O4ezA==
X-Received: by 2002:a05:6402:327:: with SMTP id q7mr31878469edw.30.1571219259905;
        Wed, 16 Oct 2019 02:47:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a585:: with SMTP id a5ls4865697edc.11.gmail; Wed, 16 Oct
 2019 02:47:39 -0700 (PDT)
X-Received: by 2002:a05:6402:29a:: with SMTP id l26mr37827190edv.290.1571219259210;
        Wed, 16 Oct 2019 02:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571219259; cv=none;
        d=google.com; s=arc-20160816;
        b=QzFjcim4DY4P7HUr56axSMyNNIAenXmESGatYvqQmehxDHC3BQPEHZp7L59VQ4FFR1
         MkU2i8/3o7i/KtvBMxmGhY+Xi86UFyH3BDTqw3UimN2IeQnCBq4K2rDcrOWWRLUibdwR
         6J1LulUWTNv/ZhpkPDPHaOwvZYUsjGt+xdQJe3Udbefnc9jasBqTiUuusVREfwAMqYsQ
         vcNeudFFtbOHiHRiMqQDI1ByI2XOP0CD687u+DJKkUChqV/2K8ilyCkjmt43lL68N7zE
         OyIAD0FJfeSc4HcgovR5gUV3JB5WPFXuAxkIqIxJ/U53qHLUK1CnUltXrV0RJOINjTQZ
         GZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TOeLZuMqp/FiA3qGhd2XeAsnRlPyNssmc/gtLM9l9qI=;
        b=srdF37TE84iIIIVOj7z1rKMy1bOKeiB/qBmCm1YTRFkhCnm5EOJmtxkxn5rRNgEZL9
         B2WN+NE8e0aE5Ui2Y9CrcaTxja6/0dpmtsAsW1OjGR9jBVMVHOW+JRNruc9qqUU1XnDt
         UYMVUDO14ZvNEZ6OP0WiKxLxk7bUAjZHpBG+rfWDd4fMg6nT17/9zDgc0EMj6463zd8Y
         tqd/ZpXexIZqmsjWFtDkwN8YvRxxQkVb/ZumV/+ZSI6YYuBAasLXbvcm7BgpxRlMdQgw
         Gs1GmmuAaGt/ekCyvePLnrBQNVplWAFrLziP7nu78guaxneuG7umHMqODdjn9oWjv7rD
         VNKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id b18si402214edr.1.2019.10.16.02.47.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 02:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x9G9lcqw014947
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Oct 2019 11:47:38 +0200
Received: from [139.22.37.250] ([139.22.37.250])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9G9lbVZ019482;
	Wed, 16 Oct 2019 11:47:38 +0200
Subject: Re: PoC: virtio over ivshmem for Jailhouse
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <85f868a4-bff5-567b-fbd1-22c79406ad17@siemens.com>
 <603922dd-251c-b4ad-f4a0-1397f753a25f@siemens.com>
 <e67df2f1-0967-453f-97a9-5bc2ea58a790@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4317ffa7-5ed8-e2be-28f3-ca046f153183@siemens.com>
Date: Wed, 16 Oct 2019 11:47:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <e67df2f1-0967-453f-97a9-5bc2ea58a790@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 16.10.19 03:33, Chung-Fan Yang wrote:
>=20
>=20
> 2019=E5=B9=B410=E6=9C=8815=E6=97=A5=E7=81=AB=E6=9B=9C=E6=97=A5 16=E6=99=
=8218=E5=88=8639=E7=A7=92 UTC+9 Jan Kiszka:
>=20
>     On 14.10.19 19:04, Jan Kiszka wrote:
>     > Hi all,
>     >
>     > it's still basically a PoC, not yet specified and with a lot of sha=
rp
>     > edges, but it works too well for not being pointed out:
>     >
>     > The queues/jailhouse-ivshmem2 branch on [1] contains a virtio-ivshm=
em
>     > transport driver [2] for Linux front-end guests and a simple virtio
>     > console backend device model [3], also for Linux. Combining that wi=
th
>     > the wip/ivshmem2 branch of Jailhouse, you can call in the root cell
>     >
>     > # echo "4a48 4a48 4a48 4a48 ffc003 ffffff" \
>     > =C2=A0 =C2=A0> /sys/bus/pci/drivers/uio_ivshm/new_id
>     > # virtio-ivshmem-console /dev/uio0
>     >
>     > and then start the Linux demo inmate which uses "console=3Dhvc0".
>     You will
>     > both see the (late) boot logs and be able to log into the guest,
>     like it
>     > were a serial console. And all that without touching anything in
>     > Jailhouse (beyond generic ivshmem 2.0 support)!
>     >
>     > More to come, latest at [4].
>     >
>     > Jan
>     >
>     > [1] http://git.kiszka.org/linux.git/
>     <http://git.kiszka.org/linux.git/>
>     > [2]
>     >
>     http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Ddrivers/virtio/virt=
io_ivshmem.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2
>     <http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Ddrivers/virtio/vir=
tio_ivshmem.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2>
>=20
>     > [3]
>     >
>     http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools/virtio/virtio=
-ivshmem-console.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2
>     <http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools/virtio/virti=
o-ivshmem-console.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2>
>=20
>     > [4] https://sched.co/TmxI
>     >
>=20
>     Was too easy:
>=20
>     Welcome to Buildroot
>     jailhouse login: root
>     # mount /dev/vda /mnt/
>     [ =C2=A0 =C2=A08.968669] EXT4-fs (vda): mounted filesystem with order=
ed data
>     mode. Opts: (null)
>     # ls -l /mnt/
>     total 12
>     drwx------ =C2=A0 =C2=A02 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 12288 Oct 14 =C2=A02019 lost+found
>=20
>     You just need [5] and this to make it happen:
>=20
>     # dd if=3D/dev/zero of=3Ddisk.img bs=3D1M count=3D64
>     # mkfs.ext4 disk.img
>     # echo "4a48 4a48 4a48 4a48 ffc002 ffffff" \
>     =C2=A0 =C2=A0> /sys/bus/pci/drivers/uio_ivshm/new_id
>     # virtio-ivshmem-block /dev/uio0 disk.img
>=20
>     I've updated the Jailhouse wip/ivshmem2 branch with corresponding cel=
l
>     configurations.
>=20
>     Jan
>=20
>     [5]
>     http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools/virtio/virtio=
-ivshmem-block.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2
>     <http://git.kiszka.org/?p=3Dlinux.git;a=3Dblob;f=3Dtools/virtio/virti=
o-ivshmem-block.c;hb=3Drefs/heads/queues/jailhouse-ivshmem2>
>=20
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
>=20
> This will be very handy.
>=20
> I am current working on project require custom pipes and serial console
> between cells.

Sounds interesting...

> I have handcrafted the drivers, but if the generic virtio model is
> adapted, it will be much easier, at least for the Linux side.
>=20

That's exactly the idea behind it. Once the general direction is clearer
(/me counting on discussions during KVM Forum), we can start thinking
about how to set up a back-end ecosystem. The uio-based "demos" can be a
baseline for simple cases like low-bandwidth consoles. For things like
networking, probably also storage, a mapping of vhost on virtio-ivshmem
is likely a better idea.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4317ffa7-5ed8-e2be-28f3-ca046f153183%40siemens.com.
