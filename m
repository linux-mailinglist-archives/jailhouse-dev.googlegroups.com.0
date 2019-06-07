Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBK6E5HTQKGQEKRCIHQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC238AF9
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 15:10:04 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id i11sf865509wrm.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 06:10:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559913004; cv=pass;
        d=google.com; s=arc-20160816;
        b=bKrI81yUtpZ1DryCFDDBGa/3zsUO0NW7YnTdIoWdhaLoYNk6OL+V6wfxcm4UiFoxOv
         odpVJQCV37GJDAwTolzcoQMJTBS+hpf2n5rXG6zYfgvIn/2YPmJW3KZbyQhHyuL9eA11
         KKeKZo0UMc+p+D7ojz8qv07Mc0qm9q+29YPe+viseSxYmR3u8mtHvIZLf3CsvcMHotUJ
         zWXsy5sRz/l9IaX3rzpYZjzt3C80y8/aVg7vVpS4YevqVzG+Bnut5YLQvXqQ+U4/dbfo
         qUnTAfrrRzDidrWLxxiTMDbTnvxqqffKlcOYht584Rf4k8AxMwa8pgXIzDtyFZgDk7ok
         ZalA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=UdIghIeLza4x4hnV2lGc3a1kNmeUfks2OtT4AzHA3EU=;
        b=toFO5XhQVUQrDG0mQVZ3MEp6ybP/QzPMk//AYZd7ulY8oVpO7vOf80Qr1sOZ0zjrJ+
         VGSUx0wimn/BX2LlqYmfCTC1RwNvkOyD2/x6B3EqC6nwsp3URBYEtzhe5DtW57I8LMCz
         zRoOdOEBWgwJr71P2yq8J1jgX87lH2S6RI90CPS4In5Tf7qTMEMDZ0cHo07hQIsq8rS0
         lB8LXYhxx5m+a1wp+fncM5bU2GBL05eBKGz6oYcBNVQjpgH9xkOuDZLiEVrUFl/bq6uk
         wV4kwxl08ea1iAwXBJr+Ha4T6IG8W7D7LTZYtDqNoubus2mJbClm4FW9svf/9lvCzweU
         ixbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="V2GW9qR/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UdIghIeLza4x4hnV2lGc3a1kNmeUfks2OtT4AzHA3EU=;
        b=PWttixz+0TGvrqgUJZheDMamfxFzAPOrPWRgI7T+x2tJNFleGqk5mMbIDzO1lwHo+S
         rqeThK3fxg/6ZWiJ4x765WYYZ4SecYtWyBZ1Ti3ZCASHWhxUisDi8brG5a/uKGYGR30y
         XWZhrEWFOgYL8tdQitH2dCJrev6Hhv1eryBciz09UxoMEXxKwl8LBXb0R1w1tjR+8Uvw
         orveWDpEgbQrpx58uVZ3b0DMTMp+DpKG+PriTBNdQGmQcYkTYYye4ToLEgdh/yz1knd7
         bSeaYKq2unLzgrtGyrXew2OGF5EKB2KeDFOADSKCj284Fyhu7IlicuZUxcWf0tHJCftA
         WXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UdIghIeLza4x4hnV2lGc3a1kNmeUfks2OtT4AzHA3EU=;
        b=rgjTv/YCg353O6ambkYCT6uK/c2a48wERzsUArMPQ7zKj01UkALU2HRUEVsc0Bd9TI
         4cXd5KfT1BDBzqxvRyrrgobos3zGhyn4tLtSjrgdmKkUodjdwh2SkS1898kkP+S7uxsn
         ShWYqDCKz1Ds4wNzJIMIz8b5gjIntTnz8A0NtRiEVMrIQSvYh+PdoD9m3yQsFmprklvX
         k3A/Wy/ej44yiNjdAGzYCYUB/JW7I08ULtr/wlmssISXW1lEAojXZ17b1pbd1BbCAdjC
         ij4WxJ1V5VU2QNGgz5stdJEc+RI+nk4Bh5heS03RBaR5lnaglGkghe9ynkZRy/AM67Wg
         pEhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4ll56cdCuu1mYOan+wDTRP8ZH8wVohXfe0SRGP9XMuYEuS0sc
	fmhWdRxjFHKcy/3oSxSKThk=
X-Google-Smtp-Source: APXvYqzt0tyyjdIDDHuzEaONyvO6F30zNgTOEoiTQO4vVHO5/LGLNKjPe7NpEezPRQDi45FnLx8r/Q==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr3570341wmb.77.1559913003935;
        Fri, 07 Jun 2019 06:10:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d05:: with SMTP id z5ls1990955wrt.15.gmail; Fri, 07 Jun
 2019 06:10:03 -0700 (PDT)
X-Received: by 2002:a5d:5607:: with SMTP id l7mr1462305wrv.228.1559913003253;
        Fri, 07 Jun 2019 06:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559913003; cv=none;
        d=google.com; s=arc-20160816;
        b=LAZZD82QAlMXo0ELNX6BolWArKksDLuXy0FcXqei8hg1Tp+Tzalj/nZf5EmJXvMugK
         ywq/9wA8Cp32qCkzja5Xf9r0J3PndfXipKDliW8iwtoMhALrV19JH3EA2TGXXrwA6BoH
         eZ3q6Y99kKKLhicKa5iKXU1biwQTSQa1/BzQdAEYPgd7E9ejpHf4J89LVyOpb4pXwwQf
         eyCfO5IbnzwNAuvd7JEQV4ysBg6pb4kRSDVUmMY6HB2GE2R3PcJjtFI66YvPA2PYyiJk
         SzP/H56JWzl7Ku4ZGLzI1AAiJZFVxQ6lh7tRBtHP7byujigmp/qdB5OR0GyQycG3YPKs
         baSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=8AM9O9advR16S2CfgSVWfvVsameu9KguHsLmFTYaz5o=;
        b=PSJeqnb0v1O1pfVz/pNifiXQKE8ApAicbLEGY4oWCqf6yB0r/hXLYhyQYtaIQhjJy7
         eL9M6N/ONwOZ1vH7j1iq9wLgAdVclEJjviznUBhfdNygpuhSCadWobyQlDDTBWxFmvH2
         oRoeQYPVBN6biISfBASXtZvx99Lj71Dv/D6fsu6fMXngVIaxS4Pc5ikvAitvycsrDor5
         BFlzYmF3NrANPgGGbYmitWzJXwZ6bEJa41FTOEsvlFs060lcvhfvw2lXYxFJe7lkhRDq
         1S/p2a8kQgToEp/asD7kPvBr56hRpBmS9VP+JqPfmgFxrxJRyAp53cLecDwWmF5uV+MK
         lkrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="V2GW9qR/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id x8si74083wrt.3.2019.06.07.06.10.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 06:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45L2ty62SfzyHg;
	Fri,  7 Jun 2019 15:10:02 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 7 Jun 2019
 15:10:02 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>, <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
Date: Fri, 7 Jun 2019 15:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="V2GW9qR/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 6/7/19 2:28 PM, Wayne wrote:
> Hello,
>=20
> I am new to Linux development and Jailhouse.=C2=A0 I have successfully bo=
oted
> the Jailhouse Hypervisor and root cell on a bare metal X86 Linux system
> (No QEMU).=C2=A0 I am now trying to load a non-root Linux cell and I have=
 a
> few questions.=C2=A0 Jailhouse accepts and starts my non-root linux cell
> configuration and I see it as "running" through the "jailhouse cell
> list" command.=C2=A0 However, I don't see any serial output from the
> "non-root linux" cell booting up.=C2=A0 I=E2=80=99m not sure what the non=
-root node
> is doing at this point.

Ok, first of all, can you see any output from Jailhouse's demo inmates
(e.g., tiny-demo or apic-demo)?

>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My root node is a =
4.16 kernel configured this way:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILHOUSE_GUEST is not set
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dy
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0My non-root node i=
s a 4.16 kernel configured this way:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. CONFIG_JAILHOUSE_GUEST=3Dy
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2. CONFIG_SERIO=3Dm (can't seem to disable
> completely in my config for 4.16)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. CONFIG_SERIAL_8250_RUNTIME_UARTS=3D1

Could you please provide a full .config? What branch are you exactly
using? Vanilla 4.16?

Please attach your system config and your non-root linux config as well.

You may also want to try https://github.com/siemens/linux . See
jailhouse-enabling branches for some releases.

>=20
> In general, do the kernel config settings have to match between the root
> node and non-linux or is the above fine?

No, they do not have to be the same, but they can. Still, an analysis
requires your .config.

>=20
> The vmlinux-4.1.16-Guest bzImage is approx 7MB, and the inmate node is
> allocated ~75MB of RAM.
>=20
> I have a single UART, so I have configured the root cell system config
> to output to the virtual hypervisor console:

Wait... You configured your root-cell to use the hypervisor debug
console? How? It's only available once the hypervisor is enabled. How
should this work?

But let's have a look at your configuration first.

So you want to:
  - Have the UART (0x3f8) available in the non-root cell
  - Use 0x3f8 as hypervisor debug console as well
  - No console for root-cell

Did I get this right?

  Ralf

>=20
> .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>=20
> .debug_console =3D {
> .type =3D JAILHOUSE_CON_TYPE_NONE,
> },
>=20
> and I have configured the non-root linux cell to output to the UART:
>=20
> (Added serial 0x3f8 to pio bitmap for non-root linux) and started the
> node with this:
>=20
> ./tools/jailhouse cell linux configs/x86/linux-x86.cell
> /boot/vmlinux-4.1.16-Guest -c "console=3DttyS0,115200"
> (Note I also tried "console=3Djailhouse" in the command above, and that
> produces the same result)
>=20
> I then see the following on my hypervisor console (./tools/jailhouse
> console -f):
>=20
> Created cell "linux-x86-demo"
> ...
> Cell "linux-x86-demo" can be loaded
> Started cell "linux-x86-demo"
>=20
> After a little while I do get a parked CPU error on the root node, looks
> like its trying to do something with the UART as well:
> FATAL: Invalid PIO read, port: 3fe size: 1
>=20
> I would expect something to pop out on the UART from the non-root linux
> node first.=C2=A0 Note that root node has serial 0x3f8 disabled in its pi=
o
> bitmap.
>=20
> I verifed that the UART is functioning by allowing the hypervisor to
> print to it and also performed an echo test over ttyS0.
>=20
> I have tried several configurations of kernel.....including your current
> "queues/jailhouse" branch head kernel for the non-root node, along with
> the kernel config for 4.7 posted in this thread below (but I get same
> result as above when I start it, no kernel output):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> =C2=A0"https://groups.google.com/forum/#!searchin/jailhouse-dev/Re$3A$20F=
ailed$20to$20boot$20jailhouse%7Csort:relevance/jailhouse-dev/M7UO89XFIk0/Qi=
40DDuMBAAJ".
>=20
> Any information you can provide to me will be helpful.=C2=A0 I'm not sure
> what might be going wrong here.
>=20
> Thanks,
> Wayne
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0huh=
5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com
> <https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2iKk1J6%2B0hu=
h5__dS4HyujXzV9r%2BLbKLzuVZ4K3Bt5eA%40mail.gmail.com?utm_medium=3Demail&utm=
_source=3Dfooter>.
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/57edbc3b-cadc-c850-8310-4640fc623085%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
