Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV7LRPUQKGQEJ7T6CKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75961B61
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jul 2019 09:50:48 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id j22sf3410665ljb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 00:50:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562572248; cv=pass;
        d=google.com; s=arc-20160816;
        b=KnCArBRGQs88m6+tlVw7zWhRaYUsMIPFeasezFOu0T2akCVzydlV03LH4MrlEcdvd2
         bSmZjNnyJdpJxWRIDfFC+iUNF2pgc2r9Z8gSZ3+12a8NynARZ4Gjau6IQXVbywDvcjuO
         dhPjnZTngv7BieeswQ5JUPB13ZZjIP7hXr5abr2qTZygFyc9rJw1ofBV9BBthBA04kIm
         3T8QZNkQdcxniTb+GinJQe7ciCTJtAzZst4kvTFtjwpCa9v0x3VQDGgngNo6Cmn0kPdK
         uncv3jfmQoST2rmjCy+huRHGhDV+9jc8MQByDkIV8wZzbU/xU6cQ4PFT4qFme2qJIg2y
         bxrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=YuIibFAMAFEmngkkksS/ZqiWkT4CRb7nKQ+2OCbfKfI=;
        b=p4RQ9kH7JlHFiGSjoq3S4bONrG7o2+Tdqoc6g6ZTi3mI2f8GNEPAONn8VP49S1xDc1
         MMyugK1NbiQthCwciw2gpkZ60USYvlojRHT8GAnK42NiBof7TW5soAk0wm0D5ucF3t4o
         Yf+43vmYPhJazIh739TAE7dhpj+Oc4qjcCjkARKud8KvW7tM8oQTdDIHuxhl4c6QsS44
         nKu212wzrJ0iV/S64zm7iBeq05bVT3NLEClldkFbgoHLIZJ6z3hBuFMgUMSZ+pb1Cn0K
         vQ7BYlkyLd1I0RPIfTx+TKiCVNPJP4DxI+sTEZXYmbK40j9YpFkecEshSya3g1U4gFnF
         Lu5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YuIibFAMAFEmngkkksS/ZqiWkT4CRb7nKQ+2OCbfKfI=;
        b=MLIMmu/z2ST4VjUeVYBLyQpdMw6LYbpTjlc/2TikDtAbivYLjlN+reCnJRMWuK9idG
         4QMvdHZkDVMd+TOfvizeCKgKewS3NlkIeQL5PiTnS0+rrOZHboifNfFExGuz1X3HqmFM
         WtWbLpCiiYJceoQMWXtM8upYpGYV0SXK14xVT+CgsBukLa0ZDGs90fJR+iXq5C5x+Ivl
         StJ2A6h9GcYjt2FVfN63B6ocX9mPdr+B1mQbxl8qSxXR117GZUAh8zCWrw/XfhHRvCve
         F5fgTSmvfZa0jjtVbH/UIu/Y35JSUow9HfUwFxsiet8TBpIeZPF5gJz0iMy0rj6B3gys
         Horg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YuIibFAMAFEmngkkksS/ZqiWkT4CRb7nKQ+2OCbfKfI=;
        b=d5yr4UVHD3ie/eoVgMQoXlWQ3k1lpcf0dSEKaPpue5xhOnkL9BRzVI3kUeS6OJm2ty
         rpyw+MjpahUS5hT3CommunSrcn6AZibw2CmwPXLEg7wMIGBfJeRyBCrO+sy6eXxXIkR2
         efiQ7/x6lH24wGRVtvoDLXWQO/Iz+Hnote5J163ZZuanclwANNn3u69YIM8flgZLCBEl
         o9DdMxfmcjgvr4O+MHtSnIJB0CjIn3VvM/zYPSUOlM+FgbPFWs55LX/XuEYQTH5HKtA4
         vsoZ8YyBZdjGZyqXIxdihnY6S/XmfZwzy8k5zyMDu8hUTqYSEvTGYEca30rZEXYojQSj
         XSyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVnbpKsg8Zl6fEO099M/ceDU8Bt5Pst9HWbZzOOVy427C8tCJIR
	9qpU9KuEkWhf+HY6fkaDVs8=
X-Google-Smtp-Source: APXvYqz/8PWZz5XdCL9Lhku0d9gBcZ68tMPWCl00VYRhVfZ/5tqJOD1MW+IebWzmMgFL4pXacRiy8g==
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr9377501lje.7.1562572248149;
        Mon, 08 Jul 2019 00:50:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6b10:: with SMTP id d16ls1148696lfa.10.gmail; Mon, 08
 Jul 2019 00:50:47 -0700 (PDT)
X-Received: by 2002:ac2:514f:: with SMTP id q15mr8086405lfd.145.1562572247301;
        Mon, 08 Jul 2019 00:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562572247; cv=none;
        d=google.com; s=arc-20160816;
        b=gs6PWGZtYLeK/M+ACp0rpa7q8+JqFjIpYfB8ASWEMqNykyTr1p0NVYflBYi67CEYCo
         4oAbKv933eZXf+y7rDY32gaxFfRfX0yQ2qGnFCUNNqa2iFeXcBIcjr38L675RheSwtG4
         Mm8+0QJXxW3hfcKd1QcGDyKs8iBzgIDn1Vf+1HWUVdn5k9xIR03ggKX8npdega0dzT2u
         tXQ7HVLFYEqDSYI7xrWZJW2kWJkVfwuqGpgNE7+68qgBREjgoxBc+EfA1j7VKQM1UrqD
         L/cbNlUe98WGFieNfyVsd6JNm3KK0mCZLQgBhMhh7ln0xyGBvIdo1DmLMvDb89sRZZkd
         chqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=B72OIzVUNbiC2DyBV97TTgN+viGbjqr7I5t/BNXNzM0=;
        b=TC9jwwPqmTyY1eSVi/ogEm+KhMH/n3KqBA+XeRRQb9lw2Tm/oo9aVpA37++2Q7a7OA
         zVbNf1M0/xEPq1N3KEB8BWTWQ5JZHb5VzY10vDLvT2xeNvEM+vnDuwGy/6FQYvbFKZ95
         /I4JQFUTsU4VECVmdf7ExdLa0BXzexU8jhkThz5TWQj2yL3xh6Tm177sBEzGkb8DSYnC
         bVzakkg3OtqdAFOhMXgp//X/1pRcD0xhChkD4uygx3g3fA6SvkVo6XIZLeCKoB/bls2M
         GdHWsaRoRBSQ8A9Dh3F66tWQJf+cZrhF6z08hKZpxYwABsEJaLwlGtAx/MrL3ziUWC6d
         YRDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q25si1026285lfp.0.2019.07.08.00.50.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 00:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x687okks015033
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jul 2019 09:50:46 +0200
Received: from [167.87.41.211] ([167.87.41.211])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x687ojqu023276;
	Mon, 8 Jul 2019 09:50:46 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [ANNOUNCE] Jailhouse 0.11 released
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Mozilla-News-Host: news://news://news://news://blaine.gmane.org
Message-ID: <13acbeee-94fe-831b-51a5-01cc65f23bf0@siemens.com>
Date: Mon, 8 Jul 2019 09:50:45 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Long time, no release: Version 0.11 is finally available. Several last-minute
issues delayed this, though that's not a real excuse for having so many months
since the last one. Time-wise, this should have been two releases.
Changeset-wise, we are in the same dimension as usual: 140 commits, 185 files
changed, 4057 insertions, 1437 deletions.

- New targets:
   - Marvell MACCHIATObin
   - Xilinx Ultra96
   - Microsys miriac SBC-LS1046A
   - Texas Instruments AM654 IDK
- Cross-arch changes:
   - add per-CPU statistics
   - reset PCI devices already on cell shutdown
   - account for PCI devices not supporting QWORD MSI-X accesses
   - adjust driver DT overlay to latest kernels
   - fix alignment calculation for page_alloc_aligned
   - split and relicense printk core for inmates
- ARM / ARM64:
   - add Spectre v2 (CVE 2017-5715) mitigation (if firmware supports it)
   - fix SGI forwarding during jailhouse enable
   - avoid overwriting PSCI firmware on Orange Pi Zero
   - adjust qemu-arm64 config to recent QEMU versions
- x86:
   - multiple fixes for MSI injection during jailhouse enable/disable
   - fix address overflow in VT-d IR emulation
   - do not fail root cell in the presence of Intel PKE
   - various fixes and improvements of the MMIO instruction parser
   - various config generator fixes and improvements
   - more fine-grained MSR exit statistics
   - remove hlt-related latency from apic-demo
   - fix AMD inmate startup
   - add exception reporting feature to inmates
   - fix inmate stacks for SMP usage
   - enable SSE and AVX during inmate start

You can download the new release from

    https://github.com/siemens/jailhouse/archive/v0.11.tar.gz

then follow the README.md for first steps on recommended evaluation
platforms and check the tutorial session from ELC-E 2016 [1][2]. To try
out Jailhouse in a virtual environment or on a few reference boards,
there is an image generator available [3]. It will soon be updated to
the new release as well. Drop us a note on the mailing list if you run
into trouble.

The forecast of upcoming changes first of all contains some pending patches
series: IOMMUv3 is under review already, and cache coloring should see a v2
series soon as well. Then we will likely need a workaround for an APIC issue
Ralf and his group found on AMD Ryzen CPUs. That currently prevents non-root
Linux boot on those CPUs. Finally, the ivshmem device will undergo a significant
rework, patches may already be published this week. If all goes well, those
should finally allow to settle on the interface and push the related kernel
drivers upstream (network, UIO, ideally also a new virtio transport).

Thanks to all the contributors and supporters!

Jan

[1]
https://events.linuxfoundation.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf
[2] https://youtu.be/7fiJbwmhnRw?list=PLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q
[3] https://github.com/siemens/jailhouse-images

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/13acbeee-94fe-831b-51a5-01cc65f23bf0%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
