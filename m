Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBPNUXHVQKGQEPPYKH5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFDEA6873
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 14:19:10 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id y66sf7294212ede.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Sep 2019 05:19:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567513150; cv=pass;
        d=google.com; s=arc-20160816;
        b=v1ey596dlbaaGbLCq4ybagMeyYoMoEd3WuzK8vdKG6E1dS6G+chHsTyqqqSSsasZZd
         QYUqadAwWYAGsrLucnt3pozU1s3PzufmoTOIU+AvzveEv9d8dUEeoNG3VDYTE8Xk/UQB
         6Wm08YdiFewRUkzgOas50GU3x8sT8hT7fC69PqebjB5RGu0PHoGiUqBxEBoH+2exwwHO
         9Jy/tpXgSykt6MIptNVMj4/X1iOI7j8LYELPK4xIQ0FCe4rPbnArFKDrle3Dv/mWL24V
         Jri3ayMa0ZzRvwHx1eH+SvhX5D8i8Anhphsklm+YGeJkDv8JvCKXmSLHpyU22XqsB+48
         GL5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=P5fGUNIw4V08fS0sYPSpjG40qHGJ/MEHKUuPitH+DSA=;
        b=lFaQ0hEPJE8nOda7yXpmYMV9VgXgo1FiFiZSNsR12HwAgjuDfDJbHLSyyoPgXaROgk
         VBimXYdA8u01eob9iyZge7lqZzgJpfCdKxui8p9BG49FJFHYspUfsbuohJ0kZURKy5c2
         8W484E2X30SvglRlZwB9s9Ja28csNTchfIrlvUS722aZ+2jLB6Q40j3v2oTgAkUZJjOa
         2t4QqaUfeks8aMeXOY4J8G4SGeFmtBsz/6sI6AsB9MC3Zo2tKrfTXs3SzPfEvhb/C6E/
         k2VXXmUMPgWker7CpnY+q927Hx68Tsieg95rbe+YbjMRbyaS8sESZ9IYa3TV2wvs1tEg
         CjTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P5fGUNIw4V08fS0sYPSpjG40qHGJ/MEHKUuPitH+DSA=;
        b=D8tVHmUXlOHyQ9VlrbcYO/6x0n9/h0cz/ECwks6gcd7nGu5dau1PMiHjx5EArDpewD
         fIk5f97iJxqwoWCyw/Gipp428ZBy3XCJeRXaVuvaKoJZ4qhQCvfbJBAp5IT2HmNZJhk8
         GfB/gJxJe33gkAleq2BRQNnsTtbGOQDQclbGzWEtjqZ8D0c2hk5Mm+rlIXkYW98BrFMW
         8VxF9rsRFUB8cMj2+0U0g4SCzU0/T8uqPb4wN8yFY1DfFoCBwkzKwez1mLF+Tcf8PDyB
         zc14XmAktPRTW9YDwhD/+jkFcmdjt7vOImtGbJQ++4b0e1ON+/UtUDPg82DetO5yxT68
         58xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P5fGUNIw4V08fS0sYPSpjG40qHGJ/MEHKUuPitH+DSA=;
        b=tG1gZ8Mp+dEy+nuUXOy3YZ7AsM9PcnYz9jDvWX6xyWFvEmYlkwRbm0vK6nco7rwv4j
         IplKWnnxUvE+LIQjnitDR8Jy8sv4GEUeciCg2kf+I0+aCfF6c8dFFBIrqNWfrlaT07Cj
         KbPjklrxFE9RxsGsI2ajNIseD2ZtNyED845w5/lQU81Q9CZD4yPeVkD7QOy0JzHTxbNd
         UpGjq9FKnxTu2+M8NrZ9XavQXYvLB63NzoDRaRX5uX93PeiUcZMGIDey3yt/pCxmJA7d
         hbsoYPbv9xOQo3avKKqk6IqjNhWRC+2jbAmuqUC0QH2hEK7sX0frB/GVLzedYbtgKhOf
         tICw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW9VRJfkezfO1H9shiZpOoDCp5p/hwxbQadErYtQ6PL3+EqLqXF
	vv62a6trgZK32UhB6Ygurk8=
X-Google-Smtp-Source: APXvYqyMQqI7tSH9QJoZKAGVmnTQIsMnWgMM6nS0fUCqNw15iwQae8bOOoEkCj2yexTS3NAVNVUarQ==
X-Received: by 2002:a50:eb0a:: with SMTP id y10mr29081005edp.53.1567513150031;
        Tue, 03 Sep 2019 05:19:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:da85:: with SMTP id q5ls3930634eds.15.gmail; Tue, 03 Sep
 2019 05:19:09 -0700 (PDT)
X-Received: by 2002:a50:fc87:: with SMTP id f7mr36181751edq.288.1567513149309;
        Tue, 03 Sep 2019 05:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567513149; cv=none;
        d=google.com; s=arc-20160816;
        b=yaDvfyXQO7WhtcYSEIid7xkjLrhqgCUeiCw0qqs23Ohiz8cCxTpglVFG5Inzr/YL9K
         6rY3QRoSics10Q9bi/wWBErjuS7de8yxkQcFn1dVXY5lrYR2rDblYMs6vCAuHB3onpOL
         ORbwcwkqYuiziUggy3rNn7fVjQvkOPo2UYB+uw7Ddt2KgunToYioVWoW4X+tmrvFApPR
         p1B+h8dUQm4aHOJQSCKO/IOymk6PnBNIgVeFO6GfZppZ3tVhz+uR9rIvfnCHPRdC4rmi
         SxJCazu6xKinbxmjBLAAUmoTE4+joVhieLUneuH9GcJZxSuFTmFeT+ewevgTMulE5HWc
         3qlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=92lVJWJOukonINgEbBRqxwhCa3nEJMB0bGGL8SPN5gg=;
        b=kLeLsmkWBUcZXwDOjB1Pd83FeVpF16r4xtofk+UIor94X6Hctdk2CBiEHEaC3w/HCV
         5SVBW6SQHwNNGf3YpOJ1C7uUMDThy75WNa9Fj57iqp6S1+7B1PCa5bKoRFTT5vL+i5Zw
         IcASg6qwUgcAZRwy1G+5+ET4zSL8PzFPRKEgLEM6DTYgZHge3Hd/XpVdp1Vjmu/7XwQu
         zfz1U+0jauuRuVXKG4ASIrEUeUFIeiGyPztK0CgcKQ8OU76o/CZdSb8xkwV7BB0xlsfu
         QL2Vttn28tRiNxw2sFCAEq3ia3z//n+uU+1Pek4xrsSTkJYwysJ1JOkKhFEAE78KWcgl
         zyeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z31si479884edc.2.2019.09.03.05.19.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 05:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x83CJ8kQ018391
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Sep 2019 14:19:08 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x83CJ7gO028088;
	Tue, 3 Sep 2019 14:19:07 +0200
Date: Tue, 3 Sep 2019 14:19:07 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Nir Geller <nirgeller18@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Interrupt Latency in RTOS inmate cell
Message-ID: <20190903141907.65025fe4@md1za8fc.ad001.siemens.net>
In-Reply-To: <7ab0b502-2efe-41fe-ae9e-ec2c8f2c1b7a@googlegroups.com>
References: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
	<bce2e24b-2063-4ce1-a1c9-c99efcd2ba5d@googlegroups.com>
	<20190902165120.7cc1048b@md1za8fc.ad001.siemens.net>
	<a3c23a6a-95ee-4baa-9714-229c84d9d5b7@googlegroups.com>
	<53ebbcfc-be0b-ab8d-5cd2-477e01d1dafc@oth-regensburg.de>
	<20190902185713.0c54ed6b@md1za8fc.ad001.siemens.net>
	<7ab0b502-2efe-41fe-ae9e-ec2c8f2c1b7a@googlegroups.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
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

Am Tue, 3 Sep 2019 02:28:13 -0700
schrieb Nir Geller <nirgeller18@gmail.com>:

> Hi Henning
> 
> When I execute "sync" I get a spike on jitter.
> When executing 
> echo 1 > /proc/sys/vm/drop_caches
> or
> echo 2 > /proc/sys/vm/drop_caches
> or
> echo 3 > /proc/sys/vm/drop_caches
> No spike occurs.

Not those caches. The CPUs caches. If your two cores share i.e. a
layer3 cache one core can evict all warm entries from the other.
Forcing that other to go back to slow RAM and get it again. In the
worst case you share and NUMA kicks in, which gets you twice the
slowness of RAM.

Do you share any memory i.e. a ivshmem region?

> I'm not familiar with AMBA, so I'm trying to learn the subject now. I
> guess you mean giving higher priority to core1
> in attempt to narrow DMA latency?

Yes i thought about DMA latency. But if that also happens for sysfs or
proc, there is no IO and no DMA.
What is your storage backing anyways? NFS, some filesystem on some mass
storage ?

Maybe your Linux UART has some shared resources with with the GPIO? Can
you silence the UART and operate that Linux with i.e. ssh?

Henning

> Thanks,
> 
> Nir.
> 
> On Monday, September 2, 2019 at 7:57:16 PM UTC+3, Henning Schild
> wrote:
> >
> > A good way of estimating the cost of someone messing with ones
> > caches is to flush them yourself in your test and see how much that
> > costs you. 
> >
> > I am not sure how complicated it is to read performance counters on 
> > ARM, but those might give a clue. 
> >
> > AMBA QoS can maybe help raise the IO prio of your RT-cell. If a DMA 
> > request is what is slowing down your GPIO. 
> > I have never used that but maybe you can configure it from Linux
> > before you enable Jailhouse, and make sure that your root cell
> > config blocks future access to the configuration mechanism. 
> >
> > Henning 
> >
> >
> >
> > Am Mon, 2 Sep 2019 17:27:47 +0200 
> > schrieb Ralf Ramsauer <ralf.r...@oth-regensburg.de <javascript:>>: 
> >  
> > > Hi, 
> > > 
> > > On 9/2/19 5:11 PM, Nir Geller wrote:   
> > > > CPUFREQ is set to performance, and I'm setting scaling_min_freq
> > > > to the highest available frequency (1500000) 
> > > > CPU idling is disabled 
> > > > 
> > > > Now I see that executing a simple "cat somefile" on the command
> > > > line causes a spike in jitter     
> > > 
> > > only for the first time or also for consecutive calls on the same 
> > > file? IOW, can you observe/trigger the spike when somefile is in
> > > your page cache? 
> > > 
> > > Does the non-root cell share any devices with the root cell?
> > > (e.g. debug UART) 
> > > 
> > >   Ralf 
> > >   
> > > > 
> > > > On Monday, September 2, 2019 at 5:51:24 PM UTC+3, Henning
> > > > Schild wrote: 
> > > > 
> > > >     Am Mon, 2 Sep 2019 06:12:00 -0700 
> > > >     schrieb Nir Geller <nirge...@gmail.com <javascript:>>: 
> > > >     
> > > >     > I created a kernel module that catches/releases a
> > > >     > spinlock and disables/enables preemption, and it had no
> > > >     > observable effect on the jitter, however, 
> > > >     > the operations insmod and rmmod definitely cause spikes
> > > >     > in jitter. 
> > > >     > 
> > > >     > Any pointers?     
> > > > 
> > > >     Do you have any power management features enabled in that
> > > > Linux? 
> > > > 
> > > >     Henning 
> > > >     
> > > >     > Thanks. 
> > > >     >     
> > > > 
> > > > -- 
> > > > You received this message because you are subscribed to the
> > > > Google Groups "Jailhouse" group. 
> > > > To unsubscribe from this group and stop receiving emails from
> > > > it, send an email to jailho...@googlegroups.com <javascript:> 
> > > > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> > > > <javascript:>>. To view this discussion on the web visit 
> > > >   
> > https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com   
> > > > <  
> > https://groups.google.com/d/msgid/jailhouse-dev/a3c23a6a-95ee-4baa-9714-229c84d9d5b7%40googlegroups.com?utm_medium=email&utm_source=footer>. 
> >     
> > >   
> >
> >  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190903141907.65025fe4%40md1za8fc.ad001.siemens.net.
