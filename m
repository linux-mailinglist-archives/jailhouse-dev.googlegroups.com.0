Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKHY4CDQMGQEB6MGLMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 891DD3D1240
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:24:25 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id l29-20020a19495d0000b02903606e832f3asf525214lfj.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:24:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626881065; cv=pass;
        d=google.com; s=arc-20160816;
        b=l2HkbIN5FFxsXpAkJRAhQYcI3aIK2X7SAubZV4pvvsAdr2NjZ2Fq0Zn3quQSeuRKtt
         GJ/PZD7hxBUg/7H0vug2QlRAPako4d6S3KLpFBUA1q6axR7w5vSGMOhDPmkSkSkZUoFk
         KRbo5pVY1zBLt/nuodAbEyzV+KXk1JfCR0gQLHOGSrHjFG3RVLkf1K1PwQwQVLth4CRf
         xVksh+I4IKbCE+k2enGb5pgoZ3o/y8lGQaOyer39eRBqS+Zj2EviN4e/oY+27wYRE5hp
         ZNtn4LK7w0I/kn4NGcpT5fGteZhaUDoJ1fxNoclyRdGJFbWj1PWOXaRfPflhY6zmS4sT
         TqGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=JFzjXiBpmq3+g96CQV8XLws+fp3L7ZZN+CGihPLdciQ=;
        b=pGTtybWgmHRQTcvVeSwWZZtLvo4tVN426VxxL19k5JZPWtcefwEENjOwTSWOvZucmg
         9SLocuIgTfUWr0IXs+t+LWFOYRNX3ttYlWkPhyYblm/5vhaYrQZCJNMTf5VkteuROBYc
         UzHhip7k2A8eB4lnYLEg93cIfzzjT3bRPBqLBi2ZC8ZK7Q50YozC2By99sAIgPRiXwrG
         DEVN22Ay07bpnvVmA0JymwnhosaqmqGd7Mz0kAmjcGrOrIyrQseO6teLsCSgQaVNDJUz
         zyfkXP+RDi0OP17za8O/A3KHCMkkL1Y97V5uw5HNzSHwWZ6Q9GFCac6JDHjLct1iu/Sd
         vzuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFzjXiBpmq3+g96CQV8XLws+fp3L7ZZN+CGihPLdciQ=;
        b=lZRXv2IMKCVyalBw0AeJ1IiJ9iGlI/eti2nYV7x32pgzg83gbJQdTuYUPHaNKAMX2U
         7ZC8PtCMh69xjj2mLS8QGuCefIYkmNLf1MU7i4/HIYd8GC4NbZl1E6Fj1wMIHN/fFPuD
         p3MxmNapg95StKKOgjivPvphlrX+Dv2dT1YJ+DAmtJ8adESJSte2c5iy9g1IUPZWUQlt
         RBN2la0Jscx/LJ/T+5M/X3/cWlozcekpTmRKWQFzmfuG8ae20CyBl6jy++wJZczdA/R+
         5Q7bOjnwGP1RWps/+bUJWXCmGCYZPiesLyVSyyc9MNPKBBHQc7PF98f30TzGODHlP1PT
         3tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFzjXiBpmq3+g96CQV8XLws+fp3L7ZZN+CGihPLdciQ=;
        b=pYpYY20GdnR2VWtbgDLqp/ZaRkYct8h3MdoO9JxdXtskZp7qP8KYTutw+UPX4OTepA
         tF3KRfkT9531ir/Oskl+VJXcPlUnMjDBWbOlXEEdJumH6GMu9oFQpcJXxavOyCfB+vj0
         jZ/6xgR8sJg1IyqiQUmSQGWo8S6HH7xZyB4ZNcLxJOoJ4ZZuYMzy58A/p3KzJp/53MBw
         piscXab+GJjItHCXLpU6W84iYj0/wIY8Qprvvg8eKgLwZlUTxh1MVAFafFoLwWp7BIQ4
         VLsMMwLlJHNmOQCMPSjQO9pnZQF+oiEwD2cTeP/GSzpr3b1PXvrERI5ocNdg6EMA8jZU
         n1dA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dkMJKs5URYdz/yu1cvwE/tDf65o3cDdk7P0QFxBoqzb0WeIfv
	6b1d/TYPXKKUzXSpAhImUqI=
X-Google-Smtp-Source: ABdhPJxiNm4iR0J5koYvHHDxlKyTi8fo2MtRBhq3+BY02RFIbzjltr1elqbG2Xa30DzpTCuuylW+1g==
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr13502084ljr.352.1626881065072;
        Wed, 21 Jul 2021 08:24:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:430b:: with SMTP id l11ls308712lfh.1.gmail; Wed, 21 Jul
 2021 08:24:22 -0700 (PDT)
X-Received: by 2002:a05:6512:159d:: with SMTP id bp29mr25747138lfb.619.1626881062615;
        Wed, 21 Jul 2021 08:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626881062; cv=none;
        d=google.com; s=arc-20160816;
        b=H/kmuOuyXjvPYJeRts5EJF7cxpzrNa+yXw7rUKo2zCa6fOpYeyh01R6APlCisCgXUM
         F8g0Z9FnSMEpH9xDIYj4MUOrFeBg7iq3YwSLL4/tTuke3TKro8shfoyYa780n25eyj71
         qONAUAo99McDXRu4c8uxlFlTDjfqsAOJyJ2Z66h4zp2TYyBlWPQ4iyFU1ZFSmtp9lNNI
         nFkXeF7CXgjZ7HeYwqzUoJ2dbAtg00DNERCkYXKcEqhsDah8LiyKp1QC/LmM34B7bw7r
         Zdscsj81pbukGuJD0HRu6SHoME3jxrEoW1LqkXMbci8G10yeQLAaH9nYGsmTUiAmDI3f
         NGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6SpH9OP4cOAqIp0j/zJz5u8C8BtBbH6UUtP0XNZNcaI=;
        b=mHXXLcopL8ImCteo1sdQIEuV1rjEicta5aXm7Q3EyKglK2vQXH+jCJRP8Dn6CC42a9
         kjacab+0NT19QwBTSVr/p3HlOpcN72BfvzyLVaj/Po5RkUDuVd2M49cMB8tLqXiC6iuE
         JNhWWuQ3j++YXwI5n4TPXGwR+2Jio3er2cT9WGQakPulwUotq6VnV1Fd43tClShKsgxv
         RQ4euaoPC3j1AcVJdoQXIaJOts1aw0z0kAHTTEY1exp3NERlcmk3v1Qd5dIWvFW0q5hV
         8gvC+A2aok+ETl6gZlEo0SGsHxNmH47VBUQmFDmOY1aPTTgrCqc0fzbv9RmPbIsnF6Bx
         TmSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h20si803475lfv.7.2021.07.21.08.24.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 16LFOL3u017771
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:24:21 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFOLVR013413;
	Wed, 21 Jul 2021 17:24:21 +0200
Subject: Re: Help needed regarding AGL with Jailhouse
To: Anmol karn <anmol.karan123@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <089c15bf-194d-c84b-431c-461cc8a608e1@siemens.com>
Date: Wed, 21 Jul 2021 17:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c07e7f82-2a69-44e6-bbba-aa270d60917en@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Hi Anmol,

sorry for the very late reply.

On 25.06.21 16:38, Anmol karn wrote:
> Hi,
>=20
> I am currently working on a GSoC'21 project "VirtIO-blk implementation
> with AGL on Jailhouse".
>=20
> I am new to the Jailhouse and trying to get jailhouse(v0.12) work with
> QEmu(x86-64) with a custom agl-image.
>=20
> I have been using a 5.4 kernel(jailhouse-enabling/5.4).
>=20
> We are getting Kernel panics and unknown failures with
> `jailhouse-enabling/5.4`, so we decided to shift to `queues/jailhouse`
> (452bfd9102265f67afd5818024ca2664aa3afa60), and then we somehow managed
> to QEmulate it without kernel panics, but now it's showing some unknown
> behaviors, and also not booting properly:
>=20
> Log:
> [=C2=A0 =C2=A0 0.007617] [Firmware Bug]: TSC_DEADLINE disabled due to Err=
ata;
> please update microcode to version: 0xb2 (or later)
> [=C2=A0 =C2=A0 0.525808] kvm: already loaded the other module
> [=C2=A0 =C2=A0 0.567138] hdaudio hdaudioC0D0: Unable to bind the codec
>=20
> Automotive Grade Linux 11.91.0 qemux86-64 ttyS0
>=20
> qemux86-64 login: [=C2=A0 =C2=A027.731494] virtio_gpu virtio0: [drm] *ERR=
OR*
> fbdev: Failed to setup generic emulation (ret=3D-22)
> [=C2=A0 =C2=A027.841660] Out of memory: Killed process 161 (systemd-udevd=
)
> total-vm:12276kB, anon-rss:556kB, file-rss:0kB, shmem-rss:0kB, UID:0
> pgtables:64kB oom_score_adj:0
>=20
> qemux86-64 login:=C2=A0
> qemux86-64 login:=C2=A0
> qemux86-64 login: root
>=20
> ^C^C^C^C^C
>=20
> [=C2=A0 236.927354] Out of memory: Killed process 167 ((agetty))
> total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0
> pgtables:48kB oom_score_adj:0
> [=C2=A0 437.781132] Out of memory: Killed process 166 (systemd-udevd)
> total-vm:13548kB, anon-rss:1500kB, file-rss:0kB, shmem-rss:0kB, UID:0
> pgtables:64kB oom_score_adj:0
> [=C2=A0 457.378023] Out of memory: Killed process 170 ((agetty))
> total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0
> pgtables:48kB oom_score_adj:0
> [=C2=A0 516.062574] Out of memory: Killed process 171 ((agetty))
> total-vm:8260kB, anon-rss:1488kB, file-rss:0kB, shmem-rss:0kB, UID:0
> pgtables:48kB oom_score_adj:0
> QEMU 4.2.0 monitor - type 'help' for more information
> (qemu) q
>=20
>=20
> Questions:=C2=A0
> - Is there any solution for the 5.4.x(jailhouse-enabling/5.4) kernel
> with some patchset.

I would recommend to switch to 5.10 or queues/jailhouse as I'm no longer
updating 5.4 with potential fixes.

> - Any hints to get it working properly with the "queues/jailhouse" branch=
.

Is that failing cell your non-root Linux cell? I suppose it ran out of
RAM. How much did you assign to it?

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/089c15bf-194d-c84b-431c-461cc8a608e1%40siemens.com.
