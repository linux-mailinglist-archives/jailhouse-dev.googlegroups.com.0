Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3ES4L3AKGQEI7WUJQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F82D1EDCB5
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jun 2020 07:41:01 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id l18sf1972821wrm.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 22:41:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591249261; cv=pass;
        d=google.com; s=arc-20160816;
        b=s4PtuCrmO/1Z+SAlA9PMBOQ0aVxNa57VCtNdDwlk8D1I6613lBeeLdrUqxt/Fe3M53
         zw/0bK8rsaDBfcJ8duRaChRzPwCMzMk+NljqLNvQVl9hxL+4eslADEnjWDTHYuLQ6lpu
         eSs5Lk5PfdXRYXw8tTcbRJb3Tswn7JmzGcBL5UivYB4fmSsPsrUOWLDIZPVtaQtcOH0r
         eXpOpbCshOqXBPDP1lIcrPlc4tHtJFZ2dsU+4uenwZGbSFZbjwwlF2ORacAySNHC0ooE
         1nt1uBq1zglgYuE0FrHRMC3C3LGMV0Cdy9zCrgD9vCfD7WWo1x3+cGeo8LXMjzhqMxSv
         WmpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Z2mPoSAydQG7GgwYPbPHcKWjImtc3+TAV+aMhwhNkQs=;
        b=bYbcZyL+ubTVGkMAyZgWbVJ6LarngfjYI2dsxUs58wg4fCAOrNndjJeMTpCScmb/gw
         FnhzC6rjF6V1ePlvhOcXyNPecMOO5VjLL++D9fiIxvJsJk5lnSlVlrifkrGIXU1S6DoZ
         TaDToPbsIFnZd5v9GYJzvuc6gHUANj/N2IfaPcb6xQCxOJcBJQwu6pPZIb9y13rbFTF6
         qr0lp9SS7xuvilQvGUXvTCGKmq0bvoRT9Qfz/v0hqhAANeAJYB3xQS9t33F3TPQSG4cp
         3WbWdM2y18dTU3qcCqYMJ1e4GZbKed33gzuvCutHFwlYWkdv/FFSWtfA4zSzAjYBFPS5
         78Rw==
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
        bh=Z2mPoSAydQG7GgwYPbPHcKWjImtc3+TAV+aMhwhNkQs=;
        b=Rk33W97UdNkCUZ8JiR472grdlPGBUu81vpS97+e+la0aaMBgRyEQZhvVjCuQoAHNWR
         P+RZhLmbK+ZbfAmJdM+Dh919T4Itt0gsccjeIqRnc7lnSVYpDCX7GpBKgiVDxGdgOZ8E
         hXKQTdcSRsHtmsBkEYl1KG89TRBWtkODad77XUycX8U01ArclOU1zT7vjK38z/bAt4TK
         Gir85deo915MVw5wuJqVn3YXs4dapkBak4KxOrc4EZvF4YW7ngpeRBKTVTwC6aFQUR6N
         11tQrP5MOUrEFttRWWD+PzcjYsLUtE+geeCB37OxtgumCoAXGOOJSf24UNIuwSY2vOFv
         HyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z2mPoSAydQG7GgwYPbPHcKWjImtc3+TAV+aMhwhNkQs=;
        b=j8Ag2mhhGAojAliZ2Wl/C+2TREegTVYxGc5kiWgd6UzP+3ArCrOYG65cW6SSawzakR
         0fOuLlz1n1WRRmxjF9S4yZ52WseaIhsZeoA28jLh9VbNVODO1qzzFBGFDC3NtpLkhPzA
         WwlbZmskSw8lRTInIKVSsirLa0MnY2ris7VpcF/4BweCyREVQStGuT8OLhg9mIutVHnD
         wIABh/wkAs/zW+YIrQcQKtkCX0yeFZMyZbd6ZGRpQ05Q784vezeVgHalQarRpBod+pou
         bzD03yp2lrD6NrYxOAkiky6xBEXANXRm1Z9rARuO4vtEpb0eVKLMSJf7lQYejcjFCOu/
         bVpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532F2CG9MKX7RHZcctBT7btazV/gkBbkpmLHZhCqtXenHkhdPlut
	273MMfUJSWw7jeIfC9svc2k=
X-Google-Smtp-Source: ABdhPJy+TT2M0rlk/OIZvcFy35a4e5xzE66goT97mraIbPj5eRDhPmTd4pJkGGLCITmTnoZIYccIQg==
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr2457746wma.83.1591249260852;
        Wed, 03 Jun 2020 22:41:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c959:: with SMTP id i25ls2137741wml.2.gmail; Wed, 03 Jun
 2020 22:41:00 -0700 (PDT)
X-Received: by 2002:a1c:2c45:: with SMTP id s66mr2452125wms.40.1591249260099;
        Wed, 03 Jun 2020 22:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591249260; cv=none;
        d=google.com; s=arc-20160816;
        b=L93N10Ei30VK3GBQTjodFtgNarZgMvlBAC9dH1AU/C3YnjDdMF+mHY6O0PPUiJCnxs
         r89F0dS8JqsTAcMvfu6nYVtghgCOHiWVPpbFJ5f2rI4MnKDKrrZrsmEOuIe9a3aW1oSO
         QtgeDwSzi6XTMpe1yxUKrsHbVJBFc2Ul/hkdEV1YDUMTXQAbDNP3FTstz8jeiTbS7wJf
         qVfk89ycjenGYlIGEwP4aDTm7qq6lZpiWMn590+7KiHC2/dCaNqaSFp9Eg1pSn30qN7y
         YV0X48cbVvStGJkaMHjZgzRAIyoEIHnaZTCI8YlZeiHEiLuM6H789nkG0eiwhSm8K4Cw
         cWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ADB8mAUiCnw4nJphqbX4wKF1Ktq7iPxMfLBpE9NkXOM=;
        b=G6yma8WGJ2hX8mV4xe6ZhOEIbdjfOUAgxs/zWiKSnRbCdB3AvWfFYWu2NqakVFmKr1
         T9FgHpJ4fzqK1TxPRLRLBacGTAISudIUl6FvIxQf8Oy0FNYvy0IOH1SUCmNtkNMY8ZRt
         uFesJQUz5nYIBcEm4n6xPDm0ZLz3ODsh6kMCyIj4XiJIKpcOSu/v3rF3psfenZUI4n+g
         xoqSqwY6JHk6TnjIWgjqXkCR6VMh6t5twwK6PILJQZf1RiuKRrvoGzCy0ryf2gxzMp3z
         D8AYjJmOFmUFsZuFmTUqEZ1vCW3RCobU3Og6SIYgj9nJSOpA/MoIE1j/n7ZVXWlxKrv/
         vT6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id m20si253244wmc.0.2020.06.03.22.41.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 22:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0545exBE014390
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Jun 2020 07:40:59 +0200
Received: from [167.87.73.233] ([167.87.73.233])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0545evsf014895;
	Thu, 4 Jun 2020 07:40:58 +0200
Subject: Re: ZCU102 ZynqMP Ultrascale+
To: jorgeluis.martinezgarcia2@gmail.com,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <5dca1eee81cd46218983e92131d9a31a@tum.de>
 <ed5c9386-c34b-46d8-ae34-fd9f4f416ae8@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <344734c5-3b91-b00d-e00e-a5d2f6377b5d@siemens.com>
Date: Thu, 4 Jun 2020 07:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ed5c9386-c34b-46d8-ae34-fd9f4f416ae8@googlegroups.com>
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

On 04.06.20 00:19, jorgeluis.martinezgarcia2@gmail.com wrote:
> Hi,
> I forgot to mention that I am using Jailhouse v0.9.1 and hence the

What's the reason for that old version?

> actual config and dts files are
> https://github.com/siemens/jailhouse/blob/v0.9.1/configs/arm64/dts/inmate=
-zynqmp-zcu102-2.dts
> and
> https://github.com/siemens/jailhouse/blob/v0.9.1/configs/arm64/zynqmp-zcu=
102-linux-demo-2.c.
>=20
> Jorge
>=20
> On Thursday, June 4, 2020 at 12:05:23 AM UTC+2, Martinez Garcia, Jorge
> Luis wrote:
>=20
>     Dear all,
>=20
>     I am trying to have three Linux instances on the ZCU102 ZynqMP
>     Ultrascale+ (The root cell and two guests). I followed the steps
>     specified in
>     https://github.com/siemens/jailhouse/blob/master/Documentation/setup-=
on-zynqmp-zcu102.md
>     <https://github.com/siemens/jailhouse/blob/master/Documentation/setup=
-on-zynqmp-zcu102.md>
>     and have two Linux instances successfully running on the board.
>     However, when adding a third Linux guest, I do not see the kernel
>     booting in the Jailhouse console:
>=20
>=20
>     root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell linux
>     zynqmp-zcu102-linux-demo-2.cell Image -d inmate-zynqmp-zcu102-2.dtb
>     -i rootfs.cpio -c "console=3Djailhouse,115200"
>=20
>     root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse console -f
>=20
>     Adding virtual PCI device 00:02.0 to cell "ZynqMP-linux-demo-2"
>     Shared memory connection established: "ZynqMP-linux-demo-2" <-->
>     "ZynqMP-linux-demo"
>     Created cell "ZynqMP-linux-demo-2"
>     Page pool usage after cell creation: mem 77/995, remap 69/131072
>     Cell "ZynqMP-linux-demo-2" can be loaded
>     Started cell "ZynqMP-linux-demo-2"
>=20
>=20
>     root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell list
>     ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Assigned
>     CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fail=
ed CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=C2=A0
>     0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ZynqMP-ZCU102=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>     0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0
>     1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ZynqMP-linux-demo=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
>     2-3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0
>     2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ZynqMP-linux-demo-2=C2=A0=C2=A0=
=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1
>=20
>     The config file of=C2=A0ZynqMP-linux-demo-2
>     is=C2=A0https://github.com/siemens/jailhouse/blob/master/configs/arm6=
4/zynqmp-zcu102-linux-demo-2.c
>     <https://github.com/siemens/jailhouse/blob/master/configs/arm64/zynqm=
p-zcu102-linux-demo-2.c>
>     (as you can see the flag JAILHOUSE_CELL_DEBUG_CONSOLE is present)
>=20
>     and its corresponding dts file is
>     https://github.com/siemens/jailhouse/blob/master/configs/arm64/dts/in=
mate-zynqmp-zcu102-2.dts
>     <https://github.com/siemens/jailhouse/blob/master/configs/arm64/dts/i=
nmate-zynqmp-zcu102-2.dts>
>=20
>=20
>     While the three instances are supposed to be running, as shown by
>     jailhouse cell list, I do not see the third Linux booting. Has any
>     of you faced a similar issue?
>=20

The second non-root Linux is headless because the UART is already used
by the first non-root Linux. If the cell is running, you can ssh to it,
though. If it is not running, debugging would be possible via the
hypervisor console for Linux [1] ("console=3Djailhouse").

Jan

[1]
http://git.kiszka.org/?p=3Dlinux.git;a=3Dcommitdiff;h=3D226048c260672f16e1e=
3eea894a1131c6d07b690

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/344734c5-3b91-b00d-e00e-a5d2f6377b5d%40siemens.com.
