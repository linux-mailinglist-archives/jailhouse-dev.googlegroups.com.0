Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBLOPXHVQKGQE66SQCCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id D72D7A697D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 15:16:30 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id l124sf5993922oih.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Sep 2019 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4N0ZBxW3gF+r7Er404w03fo7aVa4af3jNAxT8eBSax8=;
        b=cWNye15KM5eASIJfmyVODc7aD66kT9nF3DMvQCtFM6ZsROp1RE5NTZMuqTxvn0oBQ7
         ga6aHhEkQScGxsQ8gWFOZNv2h3gG7qjYVDYWXQnTbxY8RNmC+kF3WQf63Nef5Kg+B0u/
         c7LNcRqUlfLsc+hXIVCDCq6/HMZLLhka7CHzwbozHQZTjoYtmmKJju+O+kvgF2LhRgtV
         de20JmvHILlIe23sPms3Tkhd8E4LnGxqaV1wflVcH0k7axGRzJerbLPY3BeYNzFg85mc
         4g1JIwwhq8F1dPezM6/XN2foXxGdYxx1jZcRvtM6PZ08ZBXMePo/fhtqprcm4CleU8Zf
         2fyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4N0ZBxW3gF+r7Er404w03fo7aVa4af3jNAxT8eBSax8=;
        b=I1NO4Gq2KTKO1XtbiW72pNdI6E/f3ResevRJrqTJQ9c1lrsZmL3pr0LBWNI8WgbCW5
         BcJH3t4Z990wf70HMzdB/t1RiSOrvnjvopH8nyaygIGNYizRCAIxVK3xn9exfcNW7mDg
         GKZ4fgx3QfUewEZLkXlYpRPsOFnaCN/G14FhZ27ghWf7cuebsNNBFV2eOYfjv6hBShI9
         SiLdzq2Wj5Wj8NK1VKTCBxNdcSdnwR+twUwp3GgHQgcweh8lkbqyNgHVsylpk0AW79Ge
         OfsuBe7F/6Mkhzku4CQ1qGy1an92Zq6KIXGmHOybEgRXuT9+2herG5Q4B3N41erZ04ao
         MsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4N0ZBxW3gF+r7Er404w03fo7aVa4af3jNAxT8eBSax8=;
        b=ABvHiJR9t2JnIXjBtZd0m97SuekmoaR8+d2H6RgVVPt7myHIsHtKB+tw6VrkcW0azW
         x5usCXv48EZgkeQ0HRnVch28SRWqtn2ARBitQDyPEAUNCAwSP9G/UFsg+cmDjWZ8T/2m
         EKV/ZyF4dvhHgvbDm7OzCR2h4WlKeQ8Adb2qDuTgWLJpIpGZT/t9n7vg1wfouwT0DEvu
         /ya4/kMTmi3a68Q/2WaQcDdpAApqdnkuOD/Mb1Q6sQ0Osx270woQeIihom6hEf/E5VpY
         B/yZDkMANU+FlkYZDYulqBTYOfkGY+STlKsBtHc5m/F6huFUSggrYrgntCRmb0FEa1lT
         5oBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWwstjO7hYs+FpULKq+OFE2ffCf0IdnIHbtoZk2DKCgiJRlULpJ
	cbNHeugUk5qET9d8eCKuD3Q=
X-Google-Smtp-Source: APXvYqzZmt6nkoXjFq83oqk6RcH/joK+MdDgu5/Nn6pGe1O5cFEAcuwNi18ALsdAQ9cRnd+CHGdi2g==
X-Received: by 2002:aca:3909:: with SMTP id g9mr15020328oia.158.1567516589385;
        Tue, 03 Sep 2019 06:16:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:b8b:: with SMTP id 11ls2347684oth.6.gmail; Tue, 03 Sep
 2019 06:16:29 -0700 (PDT)
X-Received: by 2002:a9d:1eb:: with SMTP id e98mr29514208ote.244.1567516588719;
        Tue, 03 Sep 2019 06:16:28 -0700 (PDT)
Date: Tue, 3 Sep 2019 06:16:28 -0700 (PDT)
From: Nir Geller <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <393f0ab0-f37f-42a1-9d17-1a23c8c775a4@googlegroups.com>
In-Reply-To: <20190903141907.65025fe4@md1za8fc.ad001.siemens.net>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
 <bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
 <20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
 <a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
 <53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
 <20190902185713.0c54ed6b@md1za8fc.ad001.siemens.net>
 <7ab0b502-2efe-41fe-ae9e-ec2c8f2c1b7a@googlegroups.com>
 <20190903141907.65025fe4@md1za8fc.ad001.siemens.net>
Subject: Re: Interrupt Latency in RTOS inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1794_753467612.1567516588160"
X-Original-Sender: nirgeller18@gmail.com
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

------=_Part_1794_753467612.1567516588160
Content-Type: multipart/alternative; 
	boundary="----=_Part_1795_1948226772.1567516588160"

------=_Part_1795_1948226772.1567516588160
Content-Type: text/plain; charset="UTF-8"

I have a simple memory communication region between the 2 cells, not 
IVSHMEM.
I use a kernel module that emulates ethernet over this memory region, but 
the jitter still happens even when I don't load this kernel module.

The jitter still exists when completely disabling UART1 (Linux debug 
console) in the dts.

The storage device is a eMMC.

Maybe RCU or swapping are related?

Thanks,

Nir.

On Tuesday, September 3, 2019 at 3:19:10 PM UTC+3, Henning Schild wrote:
>
> Am Tue, 3 Sep 2019 02:28:13 -0700 
> schrieb Nir Geller <nirge...@gmail.com <javascript:>>: 
>
> > Hi Henning 
> > 
> > When I execute "sync" I get a spike on jitter. 
> > When executing 
> > echo 1 > /proc/sys/vm/drop_caches 
> > or 
> > echo 2 > /proc/sys/vm/drop_caches 
> > or 
> > echo 3 > /proc/sys/vm/drop_caches 
> > No spike occurs. 
>
> Not those caches. The CPUs caches. If your two cores share i.e. a 
> layer3 cache one core can evict all warm entries from the other. 
> Forcing that other to go back to slow RAM and get it again. In the 
> worst case you share and NUMA kicks in, which gets you twice the 
> slowness of RAM. 
>
> Do you share any memory i.e. a ivshmem region? 
>
> > I'm not familiar with AMBA, so I'm trying to learn the subject now. I 
> > guess you mean giving higher priority to core1 
> > in attempt to narrow DMA latency? 
>
> Yes i thought about DMA latency. But if that also happens for sysfs or 
> proc, there is no IO and no DMA. 
> What is your storage backing anyways? NFS, some filesystem on some mass 
> storage ? 
>
> Maybe your Linux UART has some shared resources with with the GPIO? Can 
> you silence the UART and operate that Linux with i.e. ssh? 
>
> Henning 
>
> > Thanks, 
> > 
> > Nir. 
> > 
> > On Monday, September 2, 2019 at 7:57:16 PM UTC+3, Henning Schild 
> > wrote: 
> > > 
> > > A good way of estimating the cost of someone messing with ones 
> > > caches is to flush them yourself in your test and see how much that 
> > > costs you. 
> > > 
> > > I am not sure how complicated it is to read performance counters on 
> > > ARM, but those might give a clue. 
> > > 
> > > AMBA QoS can maybe help raise the IO prio of your RT-cell. If a DMA 
> > > request is what is slowing down your GPIO. 
> > > I have never used that but maybe you can configure it from Linux 
> > > before you enable Jailhouse, and make sure that your root cell 
> > > config blocks future access to the configuration mechanism. 
> > > 
> > > Henning 
> > > 
> > > 
> > > 
> > > Am Mon, 2 Sep 2019 17:27:47 +0200 
> > > schrieb Ralf Ramsauer <ralf.r...@oth-regensburg.de <javascript:>>: 
> > >   
> > > > Hi, 
> > > > 
> > > > On 9/2/19 5:11 PM, Nir Geller wrote:   
> > > > > CPUFREQ is set to performance, and I'm setting scaling_min_freq 
> > > > > to the highest available frequency (1500000) 
> > > > > CPU idling is disabled 
> > > > > 
> > > > > Now I see that executing a simple "cat somefile" on the command 
> > > > > line causes a spike in jitter     
> > > > 
> > > > only for the first time or also for consecutive calls on the same 
> > > > file? IOW, can you observe/trigger the spike when somefile is in 
> > > > your page cache? 
> > > > 
> > > > Does the non-root cell share any devices with the root cell? 
> > > > (e.g. debug UART) 
> > > > 
> > > >   Ralf 
> > > >   
> > > > > 
> > > > > On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning 
> > > > > Schild wrote: 
> > > > > 
> > > > >     Am Mon, 2 Sep 2019 06:12:00 -0700 
> > > > >     schrieb Nir Geller <nirge...@gmail.com <javascript:>>: 
> > > > >     
> > > > >     > I created a kernel module that catches/releases a 
> > > > >     > spinlock and disables/enables preemption, and it had no 
> > > > >     > observable effect on the jitter, however, 
> > > > >     > the operations insmod and rmmod definitely cause spikes 
> > > > >     > in jitter. 
> > > > >     > 
> > > > >     > Any pointers?     
> > > > > 
> > > > >     Do you have any power management features enabled in that 
> > > > > Linux? 
> > > > > 
> > > > >     Henning 
> > > > >     
> > > > >     > Thanks. 
> > > > >     >     
> > > > > 
> > > > > -- 
> > > > > You received this message because you are subscribed to the 
> > > > > Google Groups "Jailhouse" group. 
> > > > > To unsubscribe from this group and stop receiving emails from 
> > > > > it, send an email to jailho...@googlegroups.com <javascript:> 
> > > > > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:> 
> > > > > <javascript:>>. To view this discussion on the web visit 
> > > > >   
> > > 
> https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com 
>   
> > > > > <   
> > > 
> https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=email&utm_source=footer>. 
>
> > >     
> > > >   
> > > 
> > >   
> > 
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/393f0ab0-f37f-42a1-9d17-1a23c8c775a4%40googlegroups.com.

------=_Part_1795_1948226772.1567516588160
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a simple memory communication region between the 2 =
cells, not IVSHMEM.<div>I use a kernel module that emulates ethernet over t=
his memory region, but the jitter still happens even when I don&#39;t load =
this kernel module.</div><div><br></div><div>The jitter still exists when c=
ompletely disabling UART1 (Linux debug console) in the dts.</div><div><br><=
/div><div>The storage device is a eMMC.</div><div><br></div><div>Maybe RCU =
or swapping are related?</div><div><br></div><div>Thanks,</div><div><br></d=
iv><div>Nir.</div><div><br>On Tuesday, September 3, 2019 at 3:19:10 PM UTC+=
3, Henning Schild wrote:<blockquote class=3D"gmail_quote" style=3D"margin: =
0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Am Tue=
, 3 Sep 2019 02:28:13 -0700
<br>schrieb Nir Geller &lt;<a href=3D"javascript:" target=3D"_blank" gdf-ob=
fuscated-mailto=3D"-d6YZTgIAQAJ" rel=3D"nofollow" onmousedown=3D"this.href=
=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;">nirge...@gmail.com</a>&gt;:
<br>
<br>&gt; Hi Henning
<br>&gt;=20
<br>&gt; When I execute &quot;sync&quot; I get a spike on jitter.
<br>&gt; When executing=20
<br>&gt; echo 1 &gt; /proc/sys/vm/drop_caches
<br>&gt; or
<br>&gt; echo 2 &gt; /proc/sys/vm/drop_caches
<br>&gt; or
<br>&gt; echo 3 &gt; /proc/sys/vm/drop_caches
<br>&gt; No spike occurs.
<br>
<br>Not those caches. The CPUs caches. If your two cores share i.e. a
<br>layer3 cache one core can evict all warm entries from the other.
<br>Forcing that other to go back to slow RAM and get it again. In the
<br>worst case you share and NUMA kicks in, which gets you twice the
<br>slowness of RAM.
<br>
<br>Do you share any memory i.e. a ivshmem region?
<br>
<br>&gt; I&#39;m not familiar with AMBA, so I&#39;m trying to learn the sub=
ject now. I
<br>&gt; guess you mean giving higher priority to core1
<br>&gt; in attempt to narrow DMA latency?
<br>
<br>Yes i thought about DMA latency. But if that also happens for sysfs or
<br>proc, there is no IO and no DMA.
<br>What is your storage backing anyways? NFS, some filesystem on some mass
<br>storage ?
<br>
<br>Maybe your Linux UART has some shared resources with with the GPIO? Can
<br>you silence the UART and operate that Linux with i.e. ssh?
<br>
<br>Henning
<br>
<br>&gt; Thanks,
<br>&gt;=20
<br>&gt; Nir.
<br>&gt;=20
<br>&gt; On Monday, September 2, 2019 at 7:57:16 PM UTC+3, Henning Schild
<br>&gt; wrote:
<br>&gt; &gt;
<br>&gt; &gt; A good way of estimating the cost of someone messing with one=
s
<br>&gt; &gt; caches is to flush them yourself in your test and see how muc=
h that
<br>&gt; &gt; costs you.=20
<br>&gt; &gt;
<br>&gt; &gt; I am not sure how complicated it is to read performance count=
ers on=20
<br>&gt; &gt; ARM, but those might give a clue.=20
<br>&gt; &gt;
<br>&gt; &gt; AMBA QoS can maybe help raise the IO prio of your RT-cell. If=
 a DMA=20
<br>&gt; &gt; request is what is slowing down your GPIO.=20
<br>&gt; &gt; I have never used that but maybe you can configure it from Li=
nux
<br>&gt; &gt; before you enable Jailhouse, and make sure that your root cel=
l
<br>&gt; &gt; config blocks future access to the configuration mechanism.=
=20
<br>&gt; &gt;
<br>&gt; &gt; Henning=20
<br>&gt; &gt;
<br>&gt; &gt;
<br>&gt; &gt;
<br>&gt; &gt; Am Mon, 2 Sep 2019 17:27:47 +0200=20
<br>&gt; &gt; schrieb Ralf Ramsauer &lt;<a>ralf.r...@oth-regensburg.de</a> =
&lt;javascript:&gt;&gt;:=20
<br>&gt; &gt; =C2=A0
<br>&gt; &gt; &gt; Hi,=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; On 9/2/19 5:11 PM, Nir Geller wrote: =C2=A0=20
<br>&gt; &gt; &gt; &gt; CPUFREQ is set to performance, and I&#39;m setting =
scaling_min_freq
<br>&gt; &gt; &gt; &gt; to the highest available frequency (1500000)=20
<br>&gt; &gt; &gt; &gt; CPU idling is disabled=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; Now I see that executing a simple &quot;cat somefil=
e&quot; on the command
<br>&gt; &gt; &gt; &gt; line causes a spike in jitter =C2=A0 =C2=A0=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; only for the first time or also for consecutive calls on=
 the same=20
<br>&gt; &gt; &gt; file? IOW, can you observe/trigger the spike when somefi=
le is in
<br>&gt; &gt; &gt; your page cache?=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Does the non-root cell share any devices with the root c=
ell?
<br>&gt; &gt; &gt; (e.g. debug UART)=20
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; =C2=A0 Ralf=20
<br>&gt; &gt; &gt; =C2=A0=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; On Monday, September 2, 2019 at 5:51:24 PM UTC+3, H=
enning
<br>&gt; &gt; &gt; &gt; Schild wrote:=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 Am Mon, 2 Sep 2019 06:12:00 -0700=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 schrieb Nir Geller &lt;<a>nirge...@gm=
ail.com</a> &lt;javascript:&gt;&gt;:=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; I created a kernel module that c=
atches/releases a
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; spinlock and disables/enables pr=
eemption, and it had no
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; observable effect on the jitter,=
 however,=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; the operations insmod and rmmod =
definitely cause spikes
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; in jitter.=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt;=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; Any pointers? =C2=A0 =C2=A0=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 Do you have any power management feat=
ures enabled in that
<br>&gt; &gt; &gt; &gt; Linux?=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 Henning=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; Thanks.=20
<br>&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0=20
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; --=20
<br>&gt; &gt; &gt; &gt; You received this message because you are subscribe=
d to the
<br>&gt; &gt; &gt; &gt; Google Groups &quot;Jailhouse&quot; group.=20
<br>&gt; &gt; &gt; &gt; To unsubscribe from this group and stop receiving e=
mails from
<br>&gt; &gt; &gt; &gt; it, send an email to <a>jailho...@googlegroups.com<=
/a> &lt;javascript:&gt;=20
<br>&gt; &gt; &gt; &gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank=
" gdf-obfuscated-mailto=3D"-d6YZTgIAQAJ" rel=3D"nofollow" onmousedown=3D"th=
is.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;j=
avascript:&#39;;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.c=
om</a>
<br>&gt; &gt; &gt; &gt; &lt;javascript:&gt;&gt;. To view this discussion on=
 the web visit=20
<br>&gt; &gt; &gt; &gt; =C2=A0=20
<br>&gt; &gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3=
c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/=
msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com=
&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d=
/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.co=
m&#39;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/a=
3c23a6a-<wbr>95ee-4baa-9714-229c84d9d5b7%<wbr>40googlegroups.com</a> =C2=A0=
=20
<br>&gt; &gt; &gt; &gt; &lt; =C2=A0
<br>&gt; &gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3=
c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"th=
is.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95e=
e-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium\x3demail\x26utm_sour=
ce\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.=
google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40goo=
glegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;=
">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/a3c23a6a-<wbr>95ee-4=
baa-9714-229c84d9d5b7%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;u=
tm_source=3Dfooter</a>&gt;.=20
<br>&gt; &gt; =C2=A0 =C2=A0=20
<br>&gt; &gt; &gt; =C2=A0=20
<br>&gt; &gt;
<br>&gt; &gt; =C2=A0
<br>&gt;=20
<br>
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/393f0ab0-f37f-42a1-9d17-1a23c8c775a4%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/393f0ab0-f37f-42a1-9d17-1a23c8c775a4%40googlegroups.com<=
/a>.<br />

------=_Part_1795_1948226772.1567516588160--

------=_Part_1794_753467612.1567516588160--
