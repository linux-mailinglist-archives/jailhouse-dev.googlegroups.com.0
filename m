Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB64I43YQKGQE5I4X6QI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BBB151C8D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 15:49:31 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id c6sf10246497wrm.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 06:49:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580827771; cv=pass;
        d=google.com; s=arc-20160816;
        b=nZ/JZHJ/EcBxUJbz7AbU7TZtqoxt4DUHIWqVOX9dNvouSdMwlMhiMeTziUMHEA/bpE
         dJ8ThAQL9MgsPbScCrSVbZtyCvc0hhF2hR+4Q1pZrqExYf+YBlG6oG3ZYRFjRGZRVjte
         9YhNTkcPgxhPDN8dnaimAY5lKEXNvr45rRTLc4WYnrtAD0QtzDeJuHsNR+0ypF9wPw/I
         8yTdm65OSlP0jE3D9gI0vU8zegxtSNkwOZG0s3yanGo3uVwsDuPh1Xz6bjP7Ln+VbvhV
         h1reBeWRpvSfuVHdf42jcanu35GsuE0p3MRGFe7hPmHffOfOIiZv4OmmoaI3jN5upF8U
         lvkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=pFliTPWwUgWXZeYTnkrDYQm1I6DIHgh6cizD305kSBQ=;
        b=HmyuLlhM+K9HG5qF7JIJEZxP1Y1rlmLVB8ka1TOOd92BlGvtksolm5FxBrgWnSnUi2
         rq6UBqmo60NHKU9y2NS3g24tKrotSl7xRyGPIp0nGC2Ojrks4jRlW5faYB1hxGF2ZBqO
         1JeLFqGXzBW6XGdg+SmVl3K9PAv7thG6coA2CvphaxSSARCF5PYhnuRoYIGneQBmqwUR
         WP600cPbYUoNLNtYbI6EdnsiB3oy/jVF7CE9DsXVA/P7h5x6+mH2pHXRWRBIAnq84A3+
         U3TwfWIJEIzfio0io/aSPkq3U1vhWzkJKjr2742JAy5UEx1erKcJVFbe9qRgpbxP2lNn
         XWuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pFliTPWwUgWXZeYTnkrDYQm1I6DIHgh6cizD305kSBQ=;
        b=qSuhEvujrqpq23/F5b6EzH82iIoR3O66NDhYwNw6VHGaVLf6hO7vVE+y8tTtyNa38F
         WS99F4ifTv3VMT/rRAlM6kjw0RA+vcrixKY+SGqC+8+Lq6e1yN2CI33Z4o4FLDvzdEci
         q/ozIf6gJi0/ArP+B/7KRoCowOnhDXWPxfk5uQhpGVmRRIlCkbh8xyQZ5RvxZ3fg+hyW
         U09ZhBB3ax55aI9M+Ncdnv7XuBM5zbMueeq42nSiA11ps8O3AoXqZDDtYOlmTCU7PuDF
         z0/F0UzIDIdwRgiFeFo4ado5BEIwlnTuRwtxkoRNgOWvY7XxtixTempOCU3T1HUBEJ5o
         nkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pFliTPWwUgWXZeYTnkrDYQm1I6DIHgh6cizD305kSBQ=;
        b=Bome+RnY1wrXu9862lnDhTweBSz8h7KfXUdgZ+RGf6rxZmbk30B4IGWZQ00okx4nKa
         W5ctqQn21bXmKSp4hwM5SdGJZUwM6E3Tr08dg+AYCA+Xe951Qzo/iks0WfzoPlppI/YS
         7JfFdzLggSrnC96KgAeKePf2yp+d7YxNdtN8ge4yVWj9j52CAiHypETbyvd8uu/dcZUY
         bN0LiIewuGpiWKw827L5waWuMJJnO2kHc4H3uSDMHEwYqYgLlz18P5HjRM/zJyf5JhRA
         hV7CcUEAfzjVhIjdxlmWljXVqZ3XUhnyYQJrlRjGHcDvGQnp/AMUBn0Ky8Wk6AAW9huN
         rwTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUqxrdSI6FS9Uar/f07BUCG0+Tck29VJK4PAv1KdillFpfm/3Fq
	DRXIiev3lZFMga1WKVR47bw=
X-Google-Smtp-Source: APXvYqwWTLbSdP+6kpIOQZqBKOs8pmOvxZ/q0NWQqY1pTAkoZNMfAob77WZJAOLsMVYh5KM86xeZzQ==
X-Received: by 2002:adf:f802:: with SMTP id s2mr24069073wrp.201.1580827771643;
        Tue, 04 Feb 2020 06:49:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d13:: with SMTP id g19ls2951410wme.1.gmail; Tue, 04 Feb
 2020 06:49:30 -0800 (PST)
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr6499484wmj.160.1580827770916;
        Tue, 04 Feb 2020 06:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580827770; cv=none;
        d=google.com; s=arc-20160816;
        b=S9RGs4X4KmKWY9cekc22Wbx1H2KyUQ6QhAtb6ZdDRDewjpGPlkK6REKJQG7M5hg+lX
         X7H/6FPmXhOhP7yFVj4g2I+14g/S8ZwLfLNMurt6+nGZUkOQ/i1jBbTT7G5e4J06r8ea
         MNE3bCXp2PXRYbjUGQJJWSeVNFSHEUmwEq/1vDSxcNwzZgBBM1QUcmhnExfp7ZBdK1qK
         aeRaJLc7KGiq6GBXCmg7QPvmkPR6Uy3N08aW1q2oA/p5jedeuddkju4zTGToEIkHYl4F
         rBPKidERyGo0QAndsKvdc9iTSLTdmMqOL7DC7ege7RsqiNWDVk0qQF4lX1Ryw/TBPKrD
         hclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=wiH6IOpwP3bTYKz7lDp1MNS8l4iRwdXdICpSXCuqjXw=;
        b=Knfa8UJZSZc8Ey3zsb/p/YR7R17Cvxn3h61DzHGrehAnVUYyflLy2JAnc1HTCMADpx
         MzEucW3Qq39Gdo20IKItgpETsN1yrIejQZ8q/jmtf6RkESnR38avF6NHlbqhrbM5Ey86
         3b+Q9VzmcwaC04VQ1sYN8dEDxThyF54VxZLsAd+Ub2fxWgFBF7ZmLJS7rF/udQ+e9qQ0
         j5Ji5gslUYALUUDGifL3yw5mQYS1rj+Pi7sx/l42fFmP5Ntr6J8FdnUK2rfhSJLjW/MR
         S+N2URvJQkB3BMc85Pqd5wMS8crxrVGTqhaZ18T+1+ApU69Dc3+wsap9Qmqx9NtxHisl
         nekQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p29si123492wmi.2.2020.02.04.06.49.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 06:49:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 014EnUwV004584
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2020 15:49:30 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 014EnUoG029882;
	Tue, 4 Feb 2020 15:49:30 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [ANNOUNCE] Jailhouse 0.12 released
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mozilla-News-Host: news://news://news://news://news://blaine.gmane.org
Message-ID: <dd4344b9-ca04-0ef2-0810-6b98e30f68b4@siemens.com>
Date: Tue, 4 Feb 2020 15:49:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

This release is an important milestone for Jailhouse because it comes 
with a reworked inter-cell communication device with better driver 
support and even an experimental virtio transport model for this.

While this shared memory device model is still in discussion with virtio 
and QEMU communities, thus may undergo some further smaller changes, it 
was important to move forward with it because there is an increasing 
demand for it on the Jailhouse side. We now support multi-peer 
connection, have a secure (unprivileged) and efficient UIO driver and 
can even start working on virtio integration - without having to touch 
the hypervisor any further. More information also in [1].

The release has another important new, and that is SMMUv3 for ARM64 
target, as well as the TI-specific MPU-like Peripheral Virtualization 
Unit (PVU). SMMUv2 support is unfortunately still waiting in some NXP 
downstream branch for being pushed upstream.

Note that there are several changes to the configuration format that 
require adjustments of own configs. Please study related changes in our 
reference configurations or, on x86, re-generate the system configuration.

Due to all these significant changes, statistics for this release look 
about more heavyweight than usual:
195 files changed, 7185 insertions(+), 2612 deletions(-)

- New targets:
    - Texas Instruments J721E-EVM
    - Raspberry Pi 4 Model B
- Cross-arch changes:
    - rework of ivshmem inter-cell communication device
    - fix hugepage splitting in paging_destroy
    - allow to disable hugepage creation
      (to statically mitigate CVE-2018-12207)
- ARM / ARM64:
    - SMMUv3 support
    - TI PVU support
    - fix race several conditions in IRQ injection
    - add support for PCI in bare-metal inmates
- x86:
    - model PIO access via whitelist regions, rather than bitmaps
    - vtd: Protect against invalid IQT register values
    - fix 1024x768 mode of EFI framebuffer
    - permit root cell to enable CR4.UMIP

You can download the new release from

     https://github.com/siemens/jailhouse/archive/v0.12.tar.gz

then follow the README.md for first steps on recommended evaluation
platforms and check the tutorial session from ELC-E 2016 [2][3]. To try
out Jailhouse in a virtual environment or on a few reference boards,
there is an image generator available [4]. It will soon be updated to
the new release as well. Drop us a note on the mailing list if you run
into trouble.

A quick forecast of what is being worked on: One of the next major 
changes will be a rework of the CPU selection in configs (selection by 
stable physical IDs), along with support for L2 CAT on Intel processors. 
There is also ongoing discussion to extend sub-page memory regions with 
access bitmaps, on byte or even register bit-level. That will make 
access control more scalable, e.g. to pass pinmux registers to different 
cells.

Last but not least: We are starting a port of Jailhouse to RISC-V, first 
against QEMU, then against an FPGA model that will be developed within 
the EU-funded SELENE project. Stay tuned, there will be more behind it!

Thanks to all the contributors and supporters!

Jan

[1] 
https://static.sched.com/hosted_files/kvmforum2019/4b/KVM-Forum19_ivshmem2.pdf
[2] 
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf
[3] https://youtu.be/7fiJbwmhnRw?list=PLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q
[4] https://github.com/siemens/jailhouse-images

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dd4344b9-ca04-0ef2-0810-6b98e30f68b4%40siemens.com.
