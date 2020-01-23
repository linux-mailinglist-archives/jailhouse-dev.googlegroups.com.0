Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBS44U3YQKGQEQU2Z4PQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 634321467B1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 13:15:08 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id f11sf1927951edy.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jan 2020 04:15:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579781708; cv=pass;
        d=google.com; s=arc-20160816;
        b=Km2mD/HNIn1dv/d3+O03wdhhkYqv9GTxiJ3JFErKMnhfhCLHSlVBYMMmzKKiWvLM+r
         Vr4Mkdux0mvD321Fi/bZFVm6+joCb4pxUOAEYApr7CDP8acJtgBeHXHtylcnq4ik5i8/
         gU0oUsbVr05ULAg2rUEKnNaYWwVG0tIrLbs72vwZMCzWgSWTcnGo7t8iiC0OdBQWpppj
         1yao2Uzvp2xCm5YEwzDhkbvkm6vP3dfSVSsFwI4LsblE81bbCN1mXijUfewIeHQIy9Jd
         QDh+rVMx2r6qcUWVhp80lec+Ag2p11EtgR2W/LnhlcqGK9A2GVGyoyY1lUnody9tGw4u
         FI2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=OrVGEsCGGQul74uTq7qksX56ZWq2L4TgjEQGHbwdjsY=;
        b=tY5EIEJCb6JPRMlQT6Y5Wae/uY6CAM1L86Hsypqk3nKkpPI8ZRUVdLJ8UbDRGv0b+5
         lECP9oaQmBkH6F810zVrCzIq3QXjVNjWLD1Rc7o4fb029eGBb1osjUgR8S6ruhlUUQur
         KKqKXQ6yS2MyoxPrcrvAbZbulAY4atE8ziNxQpTXRhwYMDRKSzQevzpy7wFS6bu4dkJ9
         kuH3rb3NPTmqM/Frm4ZcOKpbBQGA8NWXDOSt+LmHD6ZWkwB05DGdIOrc/5bw1CcwJbLX
         EewepQ/c5S8xzMnzQjdA4NghBcW6QbgbynHVRI6KtO6mg71v7+gfaDuwvClkzalvfA8L
         zM6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OrVGEsCGGQul74uTq7qksX56ZWq2L4TgjEQGHbwdjsY=;
        b=FZ5lmRNqvaLQxUWCzi+cs21H8G8gb0RqjGze0ygEYY/D2zX4FK20AViGrh4qFUeDnq
         ZT3F7+LfRv+E9qoXa4Ug3a0vRhP2pZwHteok7ufhDRE7GG2A4dnGt+WoaqsPzg882BWI
         AL83hjLrRfk5NtpZjNANRFD0shErvC/TzmZ8mmpUnfAn1L9YN0/xFMOejfwhHj+TyQy3
         MemfeFXLOVyNJ1LhEDYe5O8QqBWNCoZAV7iL26EpBEwTiFzKUNMfVAsjwn/1m0cfnE9x
         xLjXC0VtZO5wmT8huZxfTJYzfLy7QQPdzxxoPU6G7beVj18kP2dNGWBzxbqbKiaEM5rs
         UZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OrVGEsCGGQul74uTq7qksX56ZWq2L4TgjEQGHbwdjsY=;
        b=FPf+4H18ekpSOoHLYRr6o9f3/ZTkSwcKoOjyNMpu3sTOeHHVFuF+UA42KvbVK2nbXi
         wOl0S5jlxjw5hRhEiHDleX9IhQaoz+ymQBwIfb/kXkPEbHH40+jnFPI+xQLmtuSeqTwD
         963rLyhRp6RnaCWR2uQzUQN0vcYKpITyOXS1x/zn+XED9FIKlPnxiA1zyjKZKZeln7bt
         t6zE1wZOOWwa8p7io7NgWZbqrqUzwIhNXqnOlJ95csTmwXizwxt/tW4dJ44r9+uu/kn9
         XF2fVbNx8Ko3G/A1X9RUvmrfxzIRgrwSr5FXH02or1xqA2IKMa9eeQeO6j/b8vx9/ivc
         +gXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWNuibWAP27RdiPxo98Pd8JNRxoT+B7ytg5dWzFo5wGXF2S36/T
	hgYtrIceudiH66Gg9Q+mxQk=
X-Google-Smtp-Source: APXvYqz+G5oky2RkaM/lGnyX06ollKuK8BagFxgSQjEnpb4LochXgI7mva+Be4Gq0KA7xuhhwBrXKQ==
X-Received: by 2002:a05:6402:542:: with SMTP id i2mr6550487edx.190.1579781708028;
        Thu, 23 Jan 2020 04:15:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9d0b:: with SMTP id v11ls1845229ede.11.gmail; Thu, 23
 Jan 2020 04:15:07 -0800 (PST)
X-Received: by 2002:aa7:d511:: with SMTP id y17mr6681962edq.41.1579781707325;
        Thu, 23 Jan 2020 04:15:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579781707; cv=none;
        d=google.com; s=arc-20160816;
        b=iEZnirGfqDf034jONDej9lq+SyNq5fyKGPheYmjQ11f++7WwxJsNWagggE918QbqRo
         Fo37vfJRwichzBSMT7Bf8bPqeKVhbaW5l61S6ETt5VjYdlyESd1GTX8+bTIIK36ofCTL
         tfF2ElBkj4bdux2aye80Ght3uY7An1pPUy8Ve2ew35fsXH/R3Th3OtxveLdR4JEORomq
         HKebWK5n8igJFOixAUyFWtBxEMi6kkofuAaVPK5EEjQwn6DljxwYg+TAN0rjmnlNgcM8
         ynnFed6k4aAMXtGJYKtHzMspIC4KN839rgeoXPy6aR0seN+SdfL8mZ9Qfau1K56G8gTl
         k82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=BV/0B7jiPQw3GW1SqI22ypadBZOw+BdTG1jX0CEO6Xw=;
        b=DWtLTb1uOrKubQVAClAHNP8Mvl5LDLOmGu/mbbPSqnLr9LF7XpPLLwLf46ai6ssvXJ
         R/4iKu/3nRGQ0AM/NO7TvMnrt5/6E1V6TUyOek6ySTwMgF0MujXd/a4HYdI/ELlFaqGa
         bF6UPwjOlCqdtKJEbWOUeeJdE/M+KMTR8PEtu2GA6Gn+p9dc4U+RXbLghvIqSjSiiX/Y
         uIDsGeuq/7oOds+APTWxCdfUZUVnvlHlmAA5NuKgrQpxhSQlWiymwsGHeCSDpUHz8Ey4
         oVfd41S5SdKaxFHH3gQqP3nZ8PnGqokYJrEBpNneex62yApCFOFQEtQFtSyPqgKu4SZD
         zyiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x18si86728eds.2.2020.01.23.04.15.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jan 2020 04:15:07 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00NCF6nU028402
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2020 13:15:06 +0100
Received: from md1za8fc.ad001.siemens.net ([139.25.69.193])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00NCF6oB006434;
	Thu, 23 Jan 2020 13:15:06 +0100
Date: Thu, 23 Jan 2020 13:15:05 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Michael Hinton <michael.g.hinton@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
Message-ID: <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
In-Reply-To: <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
	<20200120144629.201f3081@md1za8fc.ad001.siemens.net>
	<b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Thanks,

that is a lot of information. I would say that is CPU and memory bound
work. It should not cause exits at all, maybe a few for getting the
input in and the output out. reading ivshmem should not trap, writing
output to a console should be avoided within the measured time.
If you need to use something that traps, see if you can "batch" things.
I.e. do not read/write in byte-chunks.

For truly memory bound applications the mapping of the memory matters.
The bigger the pages in the pagetable (and the nested pagetable) the
better. You might be able to read performance counters and look at TLB
misses.
Not sure what Jailhouse exactly does to mitigate Spectre etc. but these
mitigations often have a severe effect on "memory performance".

I would for sure have a look at aligning the CFLAGS used for the Linux
application and the inmate.

The first things to compare is "native Linux", "root cell Linux under
jailhouse" and "non-root cell Linux under jailhouse". If the third is
better than your inmate, your inmates environment is likely the cause.

Henning

On Wed, 22 Jan 2020 23:57:29 -0800
Michael Hinton <michael.g.hinton@gmail.com> wrote:

> Ralf, Henning,
>=20
>=20
> Thanks for the quick response, and sorry for the delay.
>=20
> Here=E2=80=99s my setup: I=E2=80=99ve got a 6-core Intel x86-64 CPU runni=
ng Kubuntu
> 19.10. I have an inmate that is given a single core and runs a
> single-threaded workload. For comparison, I also run the same
> workload in Linux under Jailhouse.
>=20
> For a SHA3 workload with the same 20 MiB input, the root Linux cell
> (and no inmate running) takes about 2 seconds, while the inmate (and
> an idle root cell) takes about 2.8 seconds. That is a worrisome
> discrepancy, and I need to understand why it=E2=80=99s 0.8 s slower.
>=20
> This is the SHA3 workload:=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/inmates/lib/mgh-sha3.c#L185-L208
>=20
> This is the Linux wrapper for the SHA3 workload:=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/mgh/workloads/src/sha3-512.c#L166-L168
>=20
> This is the inmate program calling the SHA3 workload:=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/inmates/demos/x86/mgh-demo.c#L370-L379
>=20
> You can see that the inmate and the Linux wrapper both execute the
> same function, sha3_mgh(). It's the same C code.
>=20
> The other workloads I run are intentionally more memory intensive.
> They see a much worse slowdown. For my CSB workload, the root cell
> takes only 0.05 s for a 20 MiB input, while the inmate takes 1.48 s
> (30x difference). And for my Random Access workload, the root cell
> takes 0.08 s while the inmate takes 3.29 s for a 20 MiB input (40x
> difference).
>=20
> Here are the root and inmate cell configs, respectively:
>=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/configs/x86/bazooka-root.c
>=20
> https://github.com/hintron/jailhouse/blob/76e6d446ca682f73679616a0f3df8ac=
79f4a1cde/configs/x86/bazooka-inmate.c
>=20
> I did do some modifications to Jailhouse with VMX and the preemption
> timer, but any slowdown that I may have inadvertently introduced
> should apply equally to the inmate and root cell.
>=20
> It=E2=80=99s possible that I am measuring the duration of the inmate
> incorrectly. But the number of vmexits I measure for the inmate and
> root seem to roughly correspond with the duration. I also made sure
> to avoid tsc_read_ns() by instead recording the TSC cycles and
> deriving the duration by dividing by 3,700,000,000 (the unchanging
> TSC frequency of my processor). Without this, the time recorded would
> overflow after something like 1.2 seconds.
>=20
>=20
> I'm wondering if something else is causing unexpected delays: using=20
> IVSHMEM, memory mapping extra memory pages and using it to hold my
> input, printing to a virtual console in addition to a serial console,
> disabling hardware p-states, turbo boost in the root cell, maybe the
> workload code is being compiled to different instructions for the
> inmate vs. Linux, etc.
>=20
> Sorry for all the detail, but I am grasping at straws at this point.
> Any ideas at what I could look into are appreciated.=20
>=20
> Thanks,
> Michael
>=20
> On Monday, January 20, 2020 at 6:46:32 AM UTC-7, Henning Schild wrote:
> >
> > On Sun, 19 Jan 2020 23:45:46 -0800=20
> > Michael Hinton <michael...@gmail.com <javascript:>> wrote:=20
> > =20
> > > Hello,=20
> > >=20
> > > I have found that running code in an inmate is a lot slower than=20
> > > running that same code in the root cell on my x86 machine. I am
> > > not sure why.  =20
> >
> > Can you elaborate on "code" and "a lot"? Maybe roughly tell us what=20
> > your testcase does and how severe your slowdown is. Synthetic=20
> > microbenchmark to measure context switching ?=20
> >
> > As Ralf already said, anything causing "exits" can be subject to=20
> > slowdown. But that should be roughly the same for the root cell or
> > any non-root cell, is it truly the "same" code?=20
> >
> > And of cause anything accessing shared resources can be slowed down
> > by the sharing. Caches/buses ... but i would not expect "a lot".=20
> >
> > regards,=20
> > Henning=20
> > =20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200123131505.1e5fdeb5%40md1za8fc.ad001.siemens.net.
