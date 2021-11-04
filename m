Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBCWNR6GAMGQEGLK3RYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB0445459
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Nov 2021 14:56:27 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id v18-20020a5d5912000000b001815910d2c0sf1039554wrd.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Nov 2021 06:56:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1636034187; cv=pass;
        d=google.com; s=arc-20160816;
        b=aNnCtxHgAz8gp6ZkJd3Hej7XdHSNkyBhrei5G8MpaO/MU7Ko9O1kftzmRfiXtodLHF
         S8rUveZWe9yCVGEpa4Yu0HalkZ5+YW9mll3wD+G/1k0Ze6wb6NdcF68IeheITRmBhJBu
         a39+3IFhfh5tB3DkF73nIvyyP20fxgwIq51M8N/h4i8lRGElErg3Nxq9FXPG6FABjumY
         RYZqhLbF5a9r6GQhk4QiR+aClzxL1KTpXlKd65Y6cGP6/lDK+dAGQLRKS0foIHKmfmLh
         eZcYuXIf0KyuOt5bsfW9fm3rWUZCeiXGpeEQQkXMLoWd3ksJ5GV/yIXncifAMKSwIs7s
         v6AA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=cG7zT/hLOmqinv8+L+kxfZFVljiQ6JHcSxfr4cOeU9M=;
        b=wIXG1SwZBmdRrr1GE6z+FNB8GFYHVoGWKMMY1x1q9JJtE92vFvcr+jMw+QEL7iNNLm
         C3CVpU6Vg20f6w9uQJ3fsyDrVLrwcq346dN3ZRDLEC03cjDoEqUHba7YRVufgXEksUar
         0W+ACo58y6GPUAnFXnhJcXQY2OQK147hItqSuHVH7Hs7fTUybBjMEuameKAle+0J2jeR
         guOZaQANiz7eD6ucpf2qWGb2Z6nKYIgGiJiAwDYj7QUaxXEz7jsz72wIT5s3bdU06Ug2
         2bABEUdUfEiNQhdmSvv84kPNfBcjf36Z07TA4XhFk44aPT5J3vZrF/pvwC/bBJ3INi86
         /GlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cG7zT/hLOmqinv8+L+kxfZFVljiQ6JHcSxfr4cOeU9M=;
        b=B/xKcLu5GGoozbJeaVn1YX+y/XvH6qS+xPdpiJLNUNgOACxiJq6HA57TTQSbeBSTa7
         wkLPSjHhpCoZSgKFXWimr1Ln4tVowqEzXNqQN0mGKezZYPJ5iLGYZytQLi1jBS5oPJ2w
         Ic/5skFahuxvxv09OHW0OhEq22vcXtnMDnvKXZLkeyfG3V3L5BFcadwrsGiKy7zJIot2
         KE5qL+y01ysOMT1/hqYz+BtcFEY7CoDn3kt6Dsluprqb6HthsdQHHjB6BAswV0xS5aOX
         XssSoWk3mtTxGWoargqWP4NU6iWm0kfx9oN6eJn6QkHz2bDTnlM6Wh2k8YznaEDVBk02
         lgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cG7zT/hLOmqinv8+L+kxfZFVljiQ6JHcSxfr4cOeU9M=;
        b=Y7RRh7ShrYipfsnNi7+0KZD8LUBlKR8xoUxBqqQS62ArbQJ2ROURv8tkTguGl//1Bd
         PYL3m1z/F1XEgOtldzq5vEbKFwluPFhDuaF3doJAMoxe67ACMhhsW1QVwZXomiLFpTUR
         t/LlSlZ4SonQg8IN96Q+0bTcogGwXISbqOBlaUp8X7syrLdCeE134ch2uqw2xXM85g8r
         euwZ2iYw1Qw1fLl91IBG3QWmKqpcUh2rjvNbicb92lRLQtktQBspOOiw/hySlY7TuvaX
         M16AZId5thsHgYY4foc1tqLhuBE5H/EXTqvRYVEjZhYPrSCLCnEHcC0ZIrbw/jlTxpAT
         q24w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531weXMYTp3TEtiZTHcWg5//L50Qbzp5wBTM72isg0JrPo/U/qzS
	79e9xAf+bbzeRQbcnoLRN0s=
X-Google-Smtp-Source: ABdhPJyul+YfJpervY1Jla8UfGhD2lX796QYonq0c2H6xqRTZ0/rRZxoFrWqNstmV9c87+QKhgcCzA==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr61886348wrw.434.1636034186957;
        Thu, 04 Nov 2021 06:56:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6b08:: with SMTP id v8ls840767wrw.3.gmail; Thu, 04 Nov
 2021 06:56:25 -0700 (PDT)
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr22426050wrw.262.1636034185866;
        Thu, 04 Nov 2021 06:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636034185; cv=none;
        d=google.com; s=arc-20160816;
        b=wLZpVImB6dl+zhneHHeir9vQqKXARbsUZJxmCbOF6F/CFn7nSF4yw5otvNZGBTf7Yu
         Mlq+CV4UGHe9em7cVbI7Qm03z0NPSzJwRvF7rBRKaKG8ESOLM+CjcrcKFa3lZ4l92Osg
         zQxQoaeUgnqgzs6TKBPWnBiKZg/tWR7ji4q1a1usC6GZBs2Os+5rPyRr8rI7dEQdCYWK
         IOYM5t+rXDlPmzSwNxlJOr3RDO59G/Cs8gJblP+MGsiOuRdlaXJw3PfwD5K928Gqv4dr
         w8kzbBqIvt23O5WLjZdJdIcmdtRXs8k8xF+alSlSE4FwtiSD4S4MeYX75SbJY3iTNoic
         9PoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=CHKSnBF121c+vqDIE92IB7U2vEATAucR6nVK8n/pXUI=;
        b=B7Veri0La3ginCU+qb0Qf0GxzapQ24flLmKZo4MTqXnW/g5iH7/mUkJHcLOdh3gIhE
         e7Jvsv3CBenRtnjL0tUeYOcQDU7Dm1xV4nTG/FETRzb7ezBYyjM6GY6TR2BRDFX4Jmxd
         JG6IWJpO/uuP1O786hbtXGKNwyKbnd0i00ajBzyljDIUQ2IwHxYlHPdfWZ/kDpPhnEca
         8CivFK5BmmtNhFHl3V5Ow+lFj6V9C52IMYlPmobn31kpG9hMN43vIEFMA1zFFWmP7HoI
         QFWHoy4yq7qzCg2gwPmHXTJiMQl/LDC7JG8hiqrth245WXPuHsoFljPrQLGVMesTb22q
         ZpXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o19si24628wme.2.2021.11.04.06.56.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Nov 2021 06:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1A4DuPic001980
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Nov 2021 14:56:25 +0100
Received: from md1za8fc.ad001.siemens.net ([139.25.69.80])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 1A4DuOa0005593;
	Thu, 4 Nov 2021 14:56:25 +0100
Date: Thu, 4 Nov 2021 14:56:24 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Re: Problem: system hangs
Message-ID: <20211104145624.5fb4b0d4@md1za8fc.ad001.siemens.net>
In-Reply-To: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
References: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
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

Am Thu, 4 Nov 2021 11:47:00 +0000
schrieb Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>:

> Hello all,
> 
> I'm experiencing a "system hanging" problem when jalhouse is enabled.
> It happens with just rootcell enabled, no need to start inmate cells.
> I've been working on it for several weeks trying to have at least an
> error log or report but I didn't success. System just freezes.

You should see what happens without jailhouse. If the hypervisor was
blocking any access to anything, it would tell you. So it might be that
it in fact has nothing to do with jailhouse.

> I'm able to reproduce it by launching and killing an application
> repeatedly. It hangs when launching, not when killing, so I'm
> thinking it could happen when trying to access an invalid memory
> region. Could be?

Unlikely because applications can not directly use physical memory.
Unless you have an application using "/dev/mem". In fact you can try a
dd of /dev/mem and break out ... i bet you would see a hypervisor
violation and not just a hang.

"dd if=/dev/mem of=/dev/null bs=1 count=1 seek=<address not allowed
for that cell>"

> Sometimes it arrives quit easily,  just after some launches but
> sometimes it can take several hours, more than 7000 launches ...

Sounds more like a memory leak or something, a memory leak would also
show quicker when running under jailhouse (with reduces memory).

I suggest to valgrind that application, or just keep an eye on "free"
as you re-launch. Regular applications should not be a problem, but say
that application re-loads a leaky kernel module ...

regards,
Henning

> I'm working with x86 Intl Atom E3950 hardware platforms. I'm
> attaching "/proc/iomem" and "memregions" from the config file, in
> case anyone can see something is wrong.
> 
> Any hint on how to debug it or where should I focus on will be very
> welcome.
> 
> 
> /proc/Iomem:
> 
> 00000000-00000fff : Reserved
> 00001000-0003efff : System RAM
> 0003f000-0003ffff : Reserved
> 00040000-0009efff : System RAM
> 0009f000-000fffff : Reserved
>   000a0000-000bffff : PCI Bus 0000:00
>   000c0000-000dffff : PCI Bus 0000:00
>   000e0000-000fffff : PCI Bus 0000:00
>     000f0000-000fffff : System ROM
> 00100000-0fffffff : System RAM
> 10000000-12150fff : Reserved
> 12151000-77874fff : System RAM
> 77875000-79994fff : Reserved
> 79995000-79a69fff : System RAM
> 79a6a000-79d8efff : ACPI Non-volatile Storage
> 79d8f000-7a1a9fff : Reserved
> 7a1aa000-7a1fbfff : Unknown E820 type
> 7a1fc000-7a569fff : System RAM
> 7a56a000-7a56afff : ACPI Non-volatile Storage
> 7a56b000-7a594fff : Reserved
> 7a595000-7aae5fff : System RAM
> 7aae6000-7aae7fff : Reserved
> 7aae8000-7affffff : System RAM
> 7b000000-7fffffff : Reserved
>   7b800001-7bffffff : PCI Bus 0000:00
>   7c000001-7fffffff : PCI Bus 0000:00
>     7c000001-7ffffffe : Graphics Stolen Memory
> 80000000-cfffffff : PCI Bus 0000:00
>   80000000-8fffffff : 0000:00:02.0
>   90000000-90ffffff : 0000:00:02.0
>   91000000-910fffff : 0000:00:0e.0
>   91100000-912fffff : PCI Bus 0000:05
>     91100000-911fffff : 0000:05:00.0
>     91200000-91203fff : 0000:05:00.0
>   91300000-914fffff : PCI Bus 0000:03
>     91300000-913fffff : 0000:03:00.0
>     91400000-91403fff : 0000:03:00.0
>   91500000-916fffff : PCI Bus 0000:01
>     91500000-915fffff : 0000:01:00.0
>     91600000-9160ffff : 0000:01:00.0
>   91700000-9170ffff : 0000:00:15.0
>     91700000-9170ffff : xhci-hcd
>       91708070-9170846f : intel_xhci_usb_sw
>   91710000-91713fff : 0000:00:0e.0
>     91710000-91713fff : ICH HD audio
>   91714000-91715fff : 0000:00:12.0
>     91714000-91715fff : ahci
>   91716000-917160ff : 0000:00:1f.1
>   91717000-91717fff : 0000:00:16.0
>   91718000-91718fff : 0000:00:16.0
>   91719000-917197ff : 0000:00:12.0
>     91719000-917197ff : ahci
>   9171a000-9171a0ff : 0000:00:12.0
>     9171a000-9171a0ff : ahci
>   9171d000-9171dfff : 0000:00:0f.0
> d0000000-d0ffffff : Reserved
>   d0c00000-d0c00653 : INT3452:03
>   d0c40000-d0c40763 : INT3452:01
>   d0c50000-d0c5076b : INT3452:00
>   d0c70000-d0c70673 : INT3452:02
> e0000000-efffffff : PCI MMCONFIG 0000 [bus 00-ff]
>   e0000000-efffffff : Reserved
>     e0000000-efffffff : PCI Bus 0000:00
>       e0000000-efffffff : pnp 00:05
> fe042000-fe044fff : Reserved
> fe900000-fe902fff : Reserved
> fea00000-feafffff : pnp 00:05
> fec00000-fec00fff : Reserved
>   fec00000-fec003ff : IOAPIC 0
> fed00000-fed003ff : PNP0103:00
> fed01000-fed01fff : Reserved
>   fed01000-fed01fff : pnp 00:05
> fed03000-fed03fff : pnp 00:05
> fed06000-fed06fff : pnp 00:05
> fed08000-fed09fff : pnp 00:05
> fed1c000-fed1cfff : pnp 00:05
> fed64000-fed64fff : dmar0
> fed65000-fed65fff : dmar1
> fed80000-fedbffff : pnp 00:05
> fee00000-fee00fff : Local APIC
>   fee00000-fee00fff : Reserved
> ff000000-ffffffff : Reserved
> 100000000-17fffffff : System RAM
>   175600000-176603b86 : Kernel code
>   176800000-176bacfff : Kernel rodata
>   176c00000-176e919ff : Kernel data
>   17754e000-1775fffff : Kernel bss
> 
> 
> Config:
> 
>                .mem_regions = {
>                               /* MemRegion: 00000000-0003efff :
> System RAM */ {
>                                             .phys_start = 0x0,
>                                             .virt_start = 0x0,
>                                             .size = 0x3f000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 00040000-0009efff :
> System RAM */ {
>                                             .phys_start = 0x40000,
>                                             .virt_start = 0x40000,
>                                             .size = 0x5f000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 000a0000-000bffff : PCI
> Bus 0000:00 */ {
>                                             .phys_start = 0xa0000,
>                                             .virt_start = 0xa0000,
>                                             .size = 0x20000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 000f0000-000fffff :
> System ROM */ {
>                                             .phys_start = 0xf0000,
>                                             .virt_start = 0xf0000,
>                                             .size = 0x10000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 00100000-0fffffff :
> System RAM */ {
>                                             .phys_start = 0x100000,
>                                             .virt_start = 0x100000,
>                                             .size = 0xff00000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 12151000-77874fff :
> System RAM */ {
>                                             .phys_start = 0x12151000,
>                                             .virt_start = 0x12151000,
>                                             .size = 0x65724000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 79995000-79a69fff :
> System RAM */ {
>                                             .phys_start = 0x79995000,
>                                             .virt_start = 0x79995000,
>                                             .size = 0xd5000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 79a6a000-79d8efff : ACPI
> Non-volatile Storage */ {
>                                             .phys_start = 0x79a6a000,
>                                             .virt_start = 0x79a6a000,
>                                             .size = 0x325000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 7a1aa000-7a1fbfff :
> Unknown E820 type */ {
>                                             .phys_start = 0x7a1aa000,
>                                             .virt_start = 0x7a1aa000,
>                                             .size = 0x52000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 7a1fc000-7a569fff :
> System RAM */ {
>                                             .phys_start = 0x7a1fc000,
>                                             .virt_start = 0x7a1fc000,
>                                             .size = 0x36e000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 7a56a000-7a56afff : ACPI
> Non-volatile Storage */ {
>                                             .phys_start = 0x7a56a000,
>                                             .virt_start = 0x7a56a000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 7a595000-7aae5fff :
> System RAM */ {
>                                             .phys_start = 0x7a595000,
>                                             .virt_start = 0x7a595000,
>                                             .size = 0x551000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 7aae8000-7affffff :
> System RAM */ {
>                                             .phys_start = 0x7aae8000,
>                                             .virt_start = 0x7aae8000,
>                                             .size = 0x518000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 7c000001-7ffffffe :
> Graphics Stolen Memory */ {
>                                             .phys_start = 0x7c000001,
>                                             .virt_start = 0x7c000001,
>                                             .size = 0x4000000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 80000000-8fffffff :
> 0000:00:02.0 */ {
>                                             .phys_start = 0x80000000,
>                                             .virt_start = 0x80000000,
>                                             .size = 0x10000000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 90000000-90ffffff :
> 0000:00:02.0 */ {
>                                             .phys_start = 0x90000000,
>                                             .virt_start = 0x90000000,
>                                             .size = 0x1000000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91000000-910fffff :
> 0000:00:0e.0 */ {
>                                             .phys_start = 0x91000000,
>                                             .virt_start = 0x91000000,
>                                             .size = 0x100000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91100000-911fffff :
> 0000:05:00.0 */ {
>                                             .phys_start = 0x91100000,
>                                             .virt_start = 0x91100000,
>                                             .size = 0x100000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91201000-91203fff :
> 0000:05:00.0 */ {
>                                             .phys_start = 0x91201000,
>                                             .virt_start = 0x91201000,
>                                             .size = 0x3000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91300000-913fffff :
> 0000:03:00.0 */ {
>                                             .phys_start = 0x91300000,
>                                             .virt_start = 0x91300000,
>                                             .size = 0x100000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91401000-91403fff :
> 0000:03:00.0 */ {
>                                             .phys_start = 0x91401000,
>                                             .virt_start = 0x91401000,
>                                             .size = 0x3000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91500000-915fffff :
> 0000:01:00.0 */ {
>                                             .phys_start = 0x91500000,
>                                             .virt_start = 0x91500000,
>                                             .size = 0x100000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91600000-9160ffff :
> 0000:01:00.0 */ {
>                                             .phys_start = 0x91600000,
>                                             .virt_start = 0x91600000,
>                                             .size = 0x10000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91708070-9170846f :
> intel_xhci_usb_sw */ {
>                                             .phys_start = 0x91708070,
>                                             .virt_start = 0x91708070,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91710000-91713fff : ICH
> HD audio */ {
>                                             .phys_start = 0x91710000,
>                                             .virt_start = 0x91710000,
>                                             .size = 0x4000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91714000-91715fff : ahci
> */ {
>                                             .phys_start = 0x91714000,
>                                             .virt_start = 0x91714000,
>                                             .size = 0x2000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91716000-917160ff :
> 0000:00:1f.1 */ {
>                                             .phys_start = 0x91716000,
>                                             .virt_start = 0x91716000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91717000-91717fff :
> 0000:00:16.0 */ {
>                                             .phys_start = 0x91717000,
>                                             .virt_start = 0x91717000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91718000-91718fff :
> 0000:00:16.0 */ {
>                                             .phys_start = 0x91718000,
>                                             .virt_start = 0x91718000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 91719000-917197ff : ahci
> */ {
>                                             .phys_start = 0x91719000,
>                                             .virt_start = 0x91719000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 9171a000-9171a0ff : ahci
> */ {
>                                             .phys_start = 0x9171a000,
>                                             .virt_start = 0x9171a000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 9171d000-9171dfff :
> 0000:00:0f.0 */ {
>                                             .phys_start = 0x9171d000,
>                                             .virt_start = 0x9171d000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: d0c00000-d0c00653 :
> INT3452:03 */ {
>                                             .phys_start = 0xd0c00000,
>                                             .virt_start = 0xd0c00000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: d0c40000-d0c40763 :
> INT3452:01 */ {
>                                             .phys_start = 0xd0c40000,
>                                             .virt_start = 0xd0c40000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: d0c50000-d0c5076b :
> INT3452:00 */ {
>                                             .phys_start = 0xd0c50000,
>                                             .virt_start = 0xd0c50000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: d0c70000-d0c70673 :
> INT3452:02 */ {
>                                             .phys_start = 0xd0c70000,
>                                             .virt_start = 0xd0c70000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fea00000-feafffff : pnp
> 00:05 */ {
>                                             .phys_start = 0xfea00000,
>                                             .virt_start = 0xfea00000,
>                                             .size = 0x100000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fed00000-fed003ff :
> PNP0103:00 */ {
>                                             .phys_start = 0xfed00000,
>                                             .virt_start = 0xfed00000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fed01000-fed01fff : pnp
> 00:05 */ {
>                                             .phys_start = 0xfed01000,
>                                             .virt_start = 0xfed01000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fed03000-fed03fff : pnp
> 00:05 */ {
>                                             .phys_start = 0xfed03000,
>                                             .virt_start = 0xfed03000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fed06000-fed06fff : pnp
> 00:05 */ {
>                                             .phys_start = 0xfed06000,
>                                             .virt_start = 0xfed06000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fed08000-fed09fff : pnp
> 00:05 */ {
>                                             .phys_start = 0xfed08000,
>                                             .virt_start = 0xfed08000,
>                                             .size = 0x2000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fed1c000-fed1cfff : pnp
> 00:05 */ {
>                                             .phys_start = 0xfed1c000,
>                                             .virt_start = 0xfed1c000,
>                                             .size = 0x1000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: fed80000-fedbffff : pnp
> 00:05 */ {
>                                             .phys_start = 0xfed80000,
>                                             .virt_start = 0xfed80000,
>                                             .size = 0x40000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                               /* MemRegion: 140600000-17fffffff :
> System RAM */ {
>                                             .phys_start = 0x140600000,
>                                             .virt_start = 0x140600000,
>                                             .size = 0x3fa00000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 79930000-7994ffff : ACPI
> DMAR RMRR */ /* PCI device: 00:15.0 */
>                               {
>                                             .phys_start = 0x79930000,
>                                             .virt_start = 0x79930000,
>                                             .size = 0x20000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 7b800000-7fffffff : ACPI
> DMAR RMRR */ /* PCI device: 00:02.0 */
>                               {
>                                             .phys_start = 0x7b800000,
>                                             .virt_start = 0x7b800000,
>                                             .size = 0x4800000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA, },
>                               /* MemRegion: 100600000-1405fffff :
> JAILHOUSE Inmate Memory */ {
>                                             .phys_start = 0x100600000,
>                                             .virt_start = 0x100600000,
>                                             .size = 0x40000000,
>                                             .flags =
> JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, },
>                },
> 
> Thank you,
> 
>   Rai.
> 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211104145624.5fb4b0d4%40md1za8fc.ad001.siemens.net.
