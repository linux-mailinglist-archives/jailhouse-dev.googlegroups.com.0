Return-Path: <jailhouse-dev+bncBCVKRBX6ZUARBVXH5HXQKGQEBMJ3CPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id A34411250EB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Dec 2019 19:45:44 +0100 (CET)
Received: by mail-pj1-x1039.google.com with SMTP id ie20sf1527169pjb.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Dec 2019 10:45:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576694743; cv=pass;
        d=google.com; s=arc-20160816;
        b=vE8G/v1LIhaTMjKvRU+VS1+mil8IieYo7oX+KKuzCAAugLAfQSvhdHvt4K+9RIiJvT
         +xLMvTBUpvicWM/IxmGAMztc3+fdO7OMR/u85cZZWLyXR+fWBealc6GWGtAxrNAWDakM
         +EWdwnAALdag4a3YE5WjfUQlkyWgEUDVICqsCLDyB8D1GZAD2AH0hjIT8mKE5Xmh+j9N
         UIZyluA3XBLj6RJP87L2CL9IGamXbZD1yAy3MBmcq04TEElh8Gk3/oSSR74tG7c5vYA9
         sry6sS1VygvBlYAQENG7rziO7g38GK1hzP6u113g1wBTeSl8B29H2Oopoz4yus2R9RnV
         U/pA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=OxTLqmTvvFBykgzmFJ3yWVSo6AjZs6z8wINzdvku09U=;
        b=cwNqEAyJDzmeaO8qeU6BZ6tBSSUYpBMybBW39s8spjdPxsEsUYv11OnSpmQ4eI1LiE
         mpZ6u58wFybVfbmi6QvzdNo7Syfhlgq46m4hvq95GEy1Q27S64zi1AIZstu1n0aj3iXd
         K/a06J7mxSh+eWa67Pi0MfAAFAejtPLrlPdvTeWBDj3rmJbKpnB/SROpnw4Kk35IG+pa
         AnDdTlpTeeWv6wk4ocKZW3DwHyxecKF66Ov+kKL7ZKXDYjmI6T1Uj7xP7vnl9KjQk/kv
         Unmy+wB/nqaQC3Fo/oQu2+U/YOO/6sxSp4PtwNe8voQ0XN+9HCDwWw7iTf8XvSPSvkfw
         frzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gjV+zOO7;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::32e as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OxTLqmTvvFBykgzmFJ3yWVSo6AjZs6z8wINzdvku09U=;
        b=Ny1wCf9MGjTq9uiHwHjiklsAKEX+9hyQtLyytwS1ANFlgebVmthrLzU/ftgPpWMjgH
         XIxVyXrHYSxjj36KybkJ6Q1R4dUDcSLQMGI3eEPSR2ZXovheaxTR8ocT3Y6USeFNybbe
         FLaXHRLJOuKitqcYIdBQo4GtRtslzODLLfQOB+m+401ph2p1sG0mZeidB8NAEhbb2tkw
         VuvMwaSU5/D9Q+BEe/b9up9c8lDE1EL1aKboonduPzZpHc4feNwoNvcx6wC0d1rCFKXS
         id0iHPIhjPSa/ezmoCS6ItXLlcSmJkrywmZHWmwA7MN9kW2mr/PQfcDpTCfvGxXWZuh+
         07Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OxTLqmTvvFBykgzmFJ3yWVSo6AjZs6z8wINzdvku09U=;
        b=p+TuXMndOWw9WMxVl3wVaXv7hY+vCB3xoqvmaTxbRRIl9n1Ouorc1DVeuYBVVVawLp
         B2/TeHA2T5oRzdIc7dOSSEg/QGZXmvYW5GW1uTFTWQYjM4sv99+NlWfzGigKDJtS+LqM
         6F2ZfKUnURb5zrPaERbO0x03tYta/8n7dePaSN1CDSrxoimqkpMmLqbD6cq9WGa0iKMS
         VXKR8X2VbM4223+KOlqdp5S2m9dIoxtBrDsP8onP45c0fHD2W5zSw63etQ3xG9s9CEJ1
         leYqHAode/V7vtySNqAHLn18/bJ4T1FOcn4whfyCC3VyZ+tFOR6rpPB94yNtJBO+OYOr
         3Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OxTLqmTvvFBykgzmFJ3yWVSo6AjZs6z8wINzdvku09U=;
        b=RvqPimvsWAnWUxBMY7G+Jub4HvVbxVhOu4lxeL5Xc+bpQ4r6hZ2cqVImcMyP5Iny+r
         3O3w10bSMzLnsPhMz9OJxXIeq/0lCTmQgqvUZQODnc0bXPW7eTn7zx9bhFFaASvtTb6l
         ea6SmdzLxa6gHir0tHRduSxZVbqw7FZjtGyMXfWnd25XOSRNdb/aE8Vo6OoQMEIDZkk0
         DCLe41BX8kZ+mzaHVHdbMvU7933d1znnw35ovUIRpgfu8+pHJrzUmpvCQp3OEzUIWNDf
         F8//Jg9NvqKg7I2rnMQFtrI+ks9ExDVAqHmCCVuWMcMHNXkpsGae1QckPachYq66LDtF
         k4bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWZt0s2qYu6+3KIHUcyC5kEvGSXRJlrxdZf9pRbePf3odScd2Zv
	+RsjnUlbGDtr3cJAvUiTnAY=
X-Google-Smtp-Source: APXvYqxiCv0X/2HyCs2dqFjtX0ZSAQnDjW05CcKS2ZzHT4stbQfJX0u4HPVWCKNeB1IylJyqyn/5EQ==
X-Received: by 2002:a63:d62:: with SMTP id 34mr4829179pgn.268.1576694742912;
        Wed, 18 Dec 2019 10:45:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:f8d:: with SMTP id 13ls740350pjz.0.gmail; Wed, 18
 Dec 2019 10:45:42 -0800 (PST)
X-Received: by 2002:a17:90a:200d:: with SMTP id n13mr4689808pjc.16.1576694742174;
        Wed, 18 Dec 2019 10:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576694742; cv=none;
        d=google.com; s=arc-20160816;
        b=NCiF3Phl1ytaH03yxppQmMGi6cem2+k2T1UBLTnnxbGkYksCZ44ifObAWuBD1sioKR
         S3SIGDM3AAn+HUg9KmykrKb4ag3Md2YQU3dpZxz1DfjTtp+zLDWDFZ20Bpjg+/BFXf9p
         DGJvmpc85faxTwG0KMzYojOags3/nDK/s9WYekVjmSC8qCZhnLDS2jCmYYcyLKVYYqWo
         ctUKqv8rrXuyrkG9NtlCyFAwZ3wPCesotCz1E4Av0iNlmGSZcyY4mv1ZwhlFlvz3nsni
         Rx9GACpXk2tUFDC2fXcwR+xB3n8QxLMKO1dHUQ6l1SvQ4hCNAYppx8loAdWHRJgEU9kR
         bQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cPAjdvAUdpJQTcIpEwDl4I7xT0ySMBJHdYsZrjnjf0=;
        b=NlHQY0FrEzB64c3QJBC4ZizI87QIbsNOzc4fU11GJzPFXSWanXon7Ipwasf/YUyywB
         Ds5bCjYytlhaCD0Hdcmbyyvnlf/JEJdXj/rDev48ZtxdkW2bMXzQ0PMWRc3cswbnNwiX
         He25zgy4gNIGHIlwENWbp1SAUQBVYLhOoR0F7+G86ZVqUv+qUywZXo/uUL25drGH8dKX
         4wRP7V7o0gdbiQpY3BPJ7x75wgxc+w3UJlrPNzNoxkAesY/iNUVUnT+/+79EuHusdslQ
         bBWn4wRVUX+SOuwzXO7NV3Vm8hIgv9zXQa+RWhhqFFg0f6srbUX7b7atUlG4BOEo/5aG
         tyHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gjV+zOO7;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::32e as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com. [2607:f8b0:4864:20::32e])
        by gmr-mx.google.com with ESMTPS id x13si141753pgt.3.2019.12.18.10.45.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:45:42 -0800 (PST)
Received-SPF: pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::32e as permitted sender) client-ip=2607:f8b0:4864:20::32e;
Received: by mail-ot1-x32e.google.com with SMTP id r27so3646057otc.8
        for <jailhouse-dev@googlegroups.com>; Wed, 18 Dec 2019 10:45:42 -0800 (PST)
X-Received: by 2002:a9d:7357:: with SMTP id l23mr4025762otk.10.1576694741416;
 Wed, 18 Dec 2019 10:45:41 -0800 (PST)
MIME-Version: 1.0
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com> <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
 <87131459-2a1d-91b5-21f5-3dfccd49fa81@siemens.com> <CANBTL1XSjDtz5OFuMUXSM0R_=nsESgHH1WFxRk9qaA2uCy0Jww@mail.gmail.com>
 <0660d2b8-b8e4-fcf2-69cf-068b9fc4a622@siemens.com> <a27fdb7b-0c85-d967-7c8c-81d26b0157b6@siemens.com>
 <CANBTL1XAj0ArLDjNq_2rfu8NXCp9h5i=atzhP8m2BCEhLtRVCg@mail.gmail.com>
 <0c7b7542-5f48-8f77-128e-26eee1f24ad7@siemens.com> <CANBTL1XmekrVLi+AfTT7oM9tZjNUcOd-7TM8KeeEH6TLSd-b0A@mail.gmail.com>
 <e7f1ff75-7fbe-d608-6fd9-6e9323037e34@web.de>
In-Reply-To: <e7f1ff75-7fbe-d608-6fd9-6e9323037e34@web.de>
From: Mani Sadhasivam <manivannanece23@gmail.com>
Date: Thu, 19 Dec 2019 00:15:30 +0530
Message-ID: <CANBTL1Xp3ZEsF3WK-v2wM0CRjOFsX82kXJqDqzxo+qgmfEM+4g@mail.gmail.com>
Subject: Re: Zephyr as a Jailhouse inmate
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Peng Fan <peng.fan@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000fb3fc10599fed9f4"
X-Original-Sender: manivannanece23@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=gjV+zOO7;       spf=pass
 (google.com: domain of manivannanece23@gmail.com designates
 2607:f8b0:4864:20::32e as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000fb3fc10599fed9f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 14, 2019 at 3:51 PM Jan Kiszka <jan.kiszka@web.de> wrote:

> On 14.12.19 10:51, Mani Sadhasivam wrote:
> >
> >
> > On Fri, 6 Dec, 2019, 1:39 PM Jan Kiszka, <jan.kiszka@siemens.com
> > <mailto:jan.kiszka@siemens.com>> wrote:
> >
> >     On 05.12.19 20:32, Mani Sadhasivam wrote:
> >     > Hi Jan,
> >     >
> >     > On Thu, Dec 5, 2019 at 1:38 PM Jan Kiszka <jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>
> >     > <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>>
> >     wrote:
> >     >
> >     >     [re-adding the mailing list]
> >     >
> >     >     On 05.12.19 09:07, Jan Kiszka wrote:
> >     >     > On 05.12.19 08:49, Mani Sadhasivam wrote:
> >     >     >>
> >     >     >>
> >     >     >> On Thu, Dec 5, 2019 at 1:09 PM Jan Kiszka
> >     <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
> >     >     <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com
> >>
> >     >     >> <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com> <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>>>>
> >     >     wrote:
> >     >     >>
> >     >     >>     On 05.12.19 08:14, Mani Sadhasivam wrote:
> >     >     >>     > Hi Jan,
> >     >     >>     >
> >     >     >>     > On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka
> >     >     <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
> >     <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>
> >     >     >>     <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com> <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>>>
> >     >     >>     > <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>
> >     >     <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>> <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>
> >     >     <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com
> >>>>>
> >     >     >>     wrote:
> >     >     >>     >
> >     >     >>     >     On 02.12.19 19:43, Manivannan Sadhasivam wrote:
> >     >     >>     >     > Hello,
> >     >     >>     >     >
> >     >     >>     >     > I can see that the Zephyr RTOS has been
> >     mentioned in
> >     >     the FAQ as
> >     >     >>     >     > one of the ported OS for non-root cells.
> >     >     >>     >     >
> >     >     >>     >     > Is there any reference code I can look into?
> >     >     >>     >
> >     >     >>     >     There is x86 support for Zephyr as Jailhouse
> >     "inmate".
> >     >     Check out
> >     >     >>     >     zephyr/boards/x86/x86_jailhouse/doc/board.rst. I=
f
> you
> >     >     run into
> >     >     >>     trouble,
> >     >     >>     >     report to the communities.
> >     >     >>     >
> >     >     >>     >
> >     >     >>     > Ah, just noticed that it got removed some time ago:
> >     >     >>     >
> >     >     >>
> >     >
> >
> https://github.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19b=
c56a14b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07
> >     >     >>     >
> >     >     >>
> >     >     >>     Too bad they didn't reach out...
> >     >     >>
> >     >     >>     > But this could be helpful!
> >     >     >>     >
> >     >     >>
> >     >     >>     Partly. For ARM, you likely don't need so may changes,
> >     see below.
> >     >     >>
> >     >     >>     >
> >     >     >>     >
> >     >     >>     >     We could probably also easily support ARM, but
> >     the last
> >     >     time this
> >     >     >>     >     question came up, there was still not A-core
> >     support in
> >     >     Zephyr
> >     >     >>     which is
> >     >     >>     >     a precondition.
> >     >     >>     >
> >     >     >>     >
> >     >     >>     > That's what I'm trying to do on IMX8M EVK in spare
> time.
> >     >     There is
> >     >     >>     an ongoing
> >     >     >>     > PR for adding Cortex-A support in Zephyr, so I'm
> >     planning to
> >     >     >>     utilize that.
> >     >     >>
> >     >     >>     That is good news. If you combine that with the device
> tree
> >     >     description
> >     >     >>     for inmates, actually those for the Linux cells, you
> should
> >     >     be able to
> >     >     >>     boot without code modifications.
> >     >     >>
> >     >     >>
> >     >     >> Don't we need MMU support in inmate? The current ARMv8 PR
> >     doesn't
> >     >     have the
> >     >     >> MMU support.
> >     >     >
> >     >     > Technically, we don't. Earlier versions of our demo inmates
> were
> >     >     running
> >     >     > without MMU as well, but as that implies running without
> >     caches as
> >     >     well,
> >     >     > we changed that. In any case, the inmate starts in reset
> >     state, means
> >     >     > with MMU (and caches) off.
> >     >     >
> >     >
> >     >
> >     > I got it working partially(not fully though). What would be the
> >     Flash and
> >     > SRAM address would you recommend? The Flash start address should
> >     > be 0x0 since that's the CPU default start address, how about SRAM=
?
> >
> >     I didn't play with targets where SRAM was involved so far, but I
> could
> >     imagine that it will be easiest to map it at a location where it
> would
> >     appear physically in exclusive use as well.
> >
> >
> > I just got it working. FWIW, the wip commits are
> > here: https://github.com/Mani-Sadhasivam/zephyr/commits/jailhouse
> >
> > There are couple of caveats though:
> >
> > 1. Zephyr places the vector table at the start/base address and the
> > reset entry next to it. But jailhouse didn't seem to find the reset
> > entry and it always tries to start from the base address. Is there any
> > config option available for fixing this? Since the vector table size is
> > fixed, it should be relatively simple to make it start from that addres=
s
> > I believe.
>
> You can set jailhouse_cell_desc.cpu_reset_address for that.
>

Yes, this helps :)


>
> >
> > 2. Currently the GICv3 Rdist address is hardcoded for 2nd core but in
> > ideal case we should find it based on MPIDR value as done in jailhouse
> > inmate demo. I'm getting faults while trying to read MPIDR_EL1 system
> > register, so need to debug it.
> >
>
> Sounds promising! Maybe I will find some time to give it a try during
> the holiday season.
>

I have fixed the above mentioned issues and now Zephyr can fully run
as a Jailhouse inmate on IMX8MM.

The updated commits are here:
https://github.com/Mani-Sadhasivam/zephyr/commits/jailhouse

Thanks,
Mani


>
> Jan
>


--=20

*=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D*

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CANBTL1Xp3ZEsF3WK-v2wM0CRjOFsX82kXJqDqzxo%2BqgmfEM%2B4g%40mai=
l.gmail.com.

--000000000000fb3fc10599fed9f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 14, 2019 at 3:51 PM Jan Ki=
szka &lt;<a href=3D"mailto:jan.kiszka@web.de">jan.kiszka@web.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 14.12.19 =
10:51, Mani Sadhasivam wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Fri, 6 Dec, 2019, 1:39 PM Jan Kiszka, &lt;<a href=3D"mailto:jan.kis=
zka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank"=
>jan.kiszka@siemens.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 05.12.19 20:32, Mani Sadhasivam wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi=C2=A0Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Dec 5, 2019 at 1:38 PM Jan Kiszka &lt;=
<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siem=
ens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemen=
s.com" target=3D"_blank">jan.kiszka@siemens.com</a> &lt;mailto:<a href=3D"m=
ailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a>&=
gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0[re-adding the mailing list=
]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 05.12.19 09:07, Jan Kisz=
ka wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 05.12.19 08:49, Man=
i Sadhasivam wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; On Thu, Dec 5, 201=
9 at 1:09 PM Jan Kiszka<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:jan.kiszka@siemens.com" targe=
t=3D"_blank">jan.kiszka@siemens.com</a> &lt;mailto:<a href=3D"mailto:jan.ki=
szka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a> &lt;=
mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kisz=
ka@siemens.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &lt;mailto:<a href=
=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0On 05.12.19 08:14, Mani Sadhasivam wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; Hi Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:jan.k=
iszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a> &lt;mailto:=
<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siem=
ens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a> &lt;mailto:<a href=3D"mailto=
:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">j=
an.kiszka@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_bla=
nk">jan.kiszka@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a> &lt;=
mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kisz=
ka@siemens.com</a>&gt;&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0On 02.12.19 19:43, Manivannan Sadhasivam wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I can see that the Zephyr RTOS has been<br>
&gt;=C2=A0 =C2=A0 =C2=A0mentioned in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0the FAQ as<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; one of the ported OS for non-root cells.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is there any reference code I can look into=
?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0There is x86 support for Zephyr as Jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;inmate&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Check out<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0zephyr/boards/x86/x86_jailhouse/doc/board.rst. I=
f you<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0run into<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0trouble,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0report to the communities.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; Ah, just noticed that it got removed some=C2=A0time ago:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0<a href=3D"https://github.com/zephyrpro=
ject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19bc56a14b4a2fdadaffe3#diff-bb944=
5fa64739ef6a5a6b59d520deb07" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19bc56a14b4a2f=
dadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0Too bad they didn&#39;t reach out...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; But this could be helpful!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0Partly. For ARM, you likely don&#39;t need so may changes,<br>
&gt;=C2=A0 =C2=A0 =C2=A0see below.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0We could probably also easily support ARM, but<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0the last<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0time this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0question came up, there was still not A-core<br>
&gt;=C2=A0 =C2=A0 =C2=A0support in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Zephyr<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;=C2=A0 =C2=A0 =C2=A0a precondition.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; That&#39;s what I&#39;m trying to do on IMX8M EVK in spare time.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0There is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0an ongoing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; PR for adding Cortex-A support in Zephyr, so I&#39;m<br>
&gt;=C2=A0 =C2=A0 =C2=A0planning to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0utilize that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0That is good news. If you combine that with the device tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0description<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0for inmates, actually those for the Linux cells, you should<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0be able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=
=A0boot without code modifications.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Don&#39;t we need =
MMU support in inmate? The current ARMv8 PR<br>
&gt;=C2=A0 =C2=A0 =C2=A0doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0have the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; MMU support.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Technically, we don&#3=
9;t. Earlier versions of our demo inmates were<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0running<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; without MMU as well, b=
ut as that implies running without<br>
&gt;=C2=A0 =C2=A0 =C2=A0caches as<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0well,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; we changed that. In an=
y case, the inmate starts in reset<br>
&gt;=C2=A0 =C2=A0 =C2=A0state, means<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; with MMU (and caches) =
off.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I got it working partially(not fully though). =
What would be the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Flash and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; SRAM address would you recommend? The Flash st=
art address should<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; be 0x0 since that&#39;s the CPU default start =
address, how about SRAM?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I didn&#39;t play with targets where SRAM was invol=
ved so far, but I could<br>
&gt;=C2=A0 =C2=A0 =C2=A0imagine that it will be easiest to map it at a loca=
tion where it would<br>
&gt;=C2=A0 =C2=A0 =C2=A0appear physically in exclusive use as well.<br>
&gt;<br>
&gt;<br>
&gt; I just got it working. FWIW, the wip commits are<br>
&gt; here:=C2=A0<a href=3D"https://github.com/Mani-Sadhasivam/zephyr/commit=
s/jailhouse" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mani-S=
adhasivam/zephyr/commits/jailhouse</a><br>
&gt;<br>
&gt; There are couple of caveats though:<br>
&gt;<br>
&gt; 1. Zephyr places the vector table at the start/base address and the<br=
>
&gt; reset entry next to it. But jailhouse didn&#39;t seem to find the rese=
t<br>
&gt; entry and it always tries to start from the base address. Is there any=
<br>
&gt; config option available for fixing this? Since the vector table size i=
s<br>
&gt; fixed, it should be relatively simple to make it start from that addre=
ss<br>
&gt; I believe.<br>
<br>
You can set jailhouse_cell_desc.cpu_reset_address for that.<br></blockquote=
><div><br></div><div>Yes, this helps :)</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; 2. Currently the GICv3 Rdist address is hardcoded for 2nd core but in<=
br>
&gt; ideal case we should find it based on MPIDR value as done in jailhouse=
<br>
&gt; inmate demo. I&#39;m getting faults while trying to read MPIDR_EL1 sys=
tem<br>
&gt; register, so need to debug it.=C2=A0<br>
&gt;<br>
<br>
Sounds promising! Maybe I will find some time to give it a try during<br>
the holiday season.<br></blockquote><div><br></div><div>I have fixed the ab=
ove mentioned issues and now Zephyr can fully run</div><div>as a Jailhouse =
inmate on IMX8MM.</div><div><br></div><div>The updated commits are here:=C2=
=A0<a href=3D"https://github.com/Mani-Sadhasivam/zephyr/commits/jailhouse">=
https://github.com/Mani-Sadhasivam/zephyr/commits/jailhouse</a></div><div><=
br></div><div>Thanks,</div><div>Mani</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><pre dir=3D"l=
tr" style=3D"border:none;padding:0px 0.14em 0px 0px;margin-top:0px;margin-b=
ottom:0px;font-family:inherit;overflow:hidden;width:275px;white-space:pre-w=
rap;height:36px;line-height:36px"><span lang=3D"ta"><i><font color=3D"#4444=
44">=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D</font></i></span></pre></div></div></div></div></div></div></d=
iv></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CANBTL1Xp3ZEsF3WK-v2wM0CRjOFsX82kXJqDqzxo%2BqgmfEM=
%2B4g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CANBTL1Xp3ZEsF3WK-v2wM0CRjOFsX82kXJqDqz=
xo%2BqgmfEM%2B4g%40mail.gmail.com</a>.<br />

--000000000000fb3fc10599fed9f4--
