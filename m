Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSOPSDUQKGQEUPXBREY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B66300B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 07:36:10 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id h7sf4238858ljk.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 22:36:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562650570; cv=pass;
        d=google.com; s=arc-20160816;
        b=PHzkBN95TontOax/kMPh73UBIYAg/PdTIF99WizEyf2fz2lxjeMBmKvotlsUaN3QM6
         8R8W/HZrQ+cNOQgGDKPsxjTUHR+GV7xh286l9JLWIrJ+XVMBp1MypEhoDb49vpoKVYdK
         Lt659h9W/WY2GflYfIpKDUQlTztgrRirLzqlzJ5IAgwBNWI1/kGG4F/yHCqsW/0C9s6K
         INmGvoKdcnfVqpjDmiJbM9YfjYF9WttfcKkfy/s6A2F6xvauFG+xH8Re8FIi7ebySJX7
         iHOLQxEa6NBGiyOeml23apE39R7woIXjg8a8AlXdRchjyKauJHMoC6MxTfcsXvllmp0S
         Inmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=FIJJHrv6nIHop7lXYCt1oakCdN4zKg0IJVwPEnSDzW0=;
        b=nxvTlrvAfLZmTs4oCld0jMRsvR1146EgZWrsIcYwEKjytI1EH44S7u1cVHP7GUL1g6
         ALRwKHPsvsqK1Gwn8A0Stq+/8F5jHliHrta2d+qzY6uB4KcHZL5Ownel+R3ySzXQxQ79
         yK4az08N2YbSAC1/6nw0/go+3zuw0uqDEsIk7xSKuLu+Umdb0fMS6ifm9FeTppeVUYGC
         Wnf8IgO1DcSBy5qtIAXFrQKnC9MXpcG9DMI2ctatKhQU1OAhd3JvbfF4tnVLB1dLQ5fK
         3muSfR/qLyvwZuVArnnkS01bA6tWKXjLkHrFOid4ouY0Gi67himVICviueSm/Z27fMnO
         Y9Bg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FIJJHrv6nIHop7lXYCt1oakCdN4zKg0IJVwPEnSDzW0=;
        b=qC37ac+Izh476775LW3D0WU6VGo98rbt+tkgfhkIBLrse3JQwNiXWRs2zoA3BYDg02
         W3QpuXTLXIZwumObPdx11RnKccGPv+I80beqwVOJ8ysSM04pw1xTZAHK501iv6XwJLTd
         nfWBEiI9FvlK6sT8cI4A5cLTCVhT43LY08oSKpepEu3MNmnFv3NicnJhPJjjKg4Ip38I
         /GksfDHFoZYV2jB2p2W5e3iJae5063OCBuvViAoq/N0zWP3Xxr50AdVAGpyA20uVpFY8
         f00CNmwSRJWZbFccYvip0l58W8KoJeAinpLpYijgsvVG2FYt9Ee79gngkGKLk9kjABPG
         yyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FIJJHrv6nIHop7lXYCt1oakCdN4zKg0IJVwPEnSDzW0=;
        b=Q2j6JA6ePl4O0zbnOsEhow0+I20ryspcGGzFjfYWLhOOrMTxbcnhSL5mVbh1vw9tuJ
         UpFt2IxDrOyfHOB7dBVxlfNGR6rRajycK4uNWglA6esFnD67HG9TaTMd0IWcXeMW9/yJ
         aC2GhlY6zR+28HMZsPXmHAJunUOzFtpxX8Y53MOkhfs3EOH8W+IXCb4B9KmYxzFuWooU
         JGxmgJEVS/3PAjDOAly9GxS8tOSo+WDTU3OUSfP52jgaGoqAjYye8q3Gl/4LTgIO3at7
         CjexK5Jq/jJFIoU5UhX4BLsApx4LzkJxVrSzA/9qK9QoH421VBuNeWn7a2Yby1nDsu8q
         a94w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWzgjLMg2ACyU4uBZGmZHHTuF69WqBINsE7aTI1vscGb2aacBXR
	pyDAK6GgPXiknrvopiqLPFg=
X-Google-Smtp-Source: APXvYqwxP+XegTDOEQ0wi9MsTBCVGfhBUg6zg0RXlJ2vUy8hHnEyGLJ5tUHbIgEExzeD0L+dGE+NCw==
X-Received: by 2002:a19:cbd3:: with SMTP id b202mr10674328lfg.185.1562650570103;
        Mon, 08 Jul 2019 22:36:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:50c2:: with SMTP id h2ls654064lfm.0.gmail; Mon, 08 Jul
 2019 22:36:09 -0700 (PDT)
X-Received: by 2002:a19:1d1:: with SMTP id 200mr10612632lfb.8.1562650569429;
        Mon, 08 Jul 2019 22:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562650569; cv=none;
        d=google.com; s=arc-20160816;
        b=SOejZe6yHxa8MWdKxix6MQZfVQWaQU9qra+aSWIhHPN8RelpQAdayhChec3Wz4ltfT
         pXffq1CYvVGCUZWgLidh5QAs2RoUC1GbwFJ/4tsBBYmqGN5IOQ8+pIbcDxulDnUUW+ug
         Adb5dfUldjCGox901e21y3Sp2D2jP3+5GHM1gyJX2Su4qpivrydDMD0jtwslNLiEq+f4
         5+oq5/eX5Rk+WPHcui7D7gTbO3oGJzKwtu0WRV2nI0NY7YiXYnzLYrpazHfAH0YZIQl/
         Nw9zEglUowZ1g4B6hmgvusk/UJbcWGHbtOI/55quuXr5/S/vPFkAEa2UtLT8BDTNUGcG
         Bjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=SNmRUOOsv0DhjlEvvZYkI1Ok+F8oFjr+MId+jO550e4=;
        b=jpqgHvvTEyTKusrP0dauveo/b5qmQdZQo7GummX38cuqcNUUqTblbQOc2lKFW2npm1
         rWokcqw4bMCUoLKPiAQha5YJvVCKkOpg4bNioj66cGrWFAU0Mi/oh2pk/zfHK6YMWafW
         kIiOSBPZEKZbHzW2IMXIcAOTyIuTheUMXAkyrxRvaU4F8gQDfKHQrc9HfqW23dDmOo9Q
         m7Ffzv2EHGGu76YrRd7KcaS56bTRPJSpW+ZNOS60qfIvItEQaGKvSteCzHweiIo6Lm4I
         UfBmCWgP+oRDmaEbxyv3u3ofWMGczXtNd3u53oEMGirhz4Yv+9Bcx8bzv/jPkfHcDy7v
         ZLqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f26si1112624lfp.5.2019.07.08.22.36.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 22:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x695a8YP028385
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 9 Jul 2019 07:36:08 +0200
Received: from [167.87.6.78] ([167.87.6.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x695a8Re015118
	for <jailhouse-dev@googlegroups.com>; Tue, 9 Jul 2019 07:36:08 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: ivshmem 2.0: Reworked ivshmem rework available
Message-ID: <8d0a6e80-d926-8783-949d-8fd036611492@siemens.com>
Date: Tue, 9 Jul 2019 07:36:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

Hi all,

long-announced, I feel like it's finally in a good shape to publish it: The new
version of something I would call "ivshmem 2.0" is now available in
wip/ivshmem2. Highlights of this:

 - vmexit-free peer state table in shared memory
 - all key features of current QEMU's ivshmem, specifically
   - multi-peer support
   - multi-vector support
 - unidirectional shared memory (optional)
 - UIO-friendly one-shot interrupt mode (optional)

The corresponding kernel drivers, including a rewritten UIO driver, are
available under
http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse-ivshmem2.

The code hasn't been extensively tested yet, so any early feedback is welcome.
Just keep in mind that things are still in flux, specifically as the discussion
with the QEMU and also virtio communities hasn't been started yet.

One of the next steps is demonstrating the feasibility of stacking virtio on top
of ivshmem2. I also plan to reach out to the QEMU community to ask for feedback
and interest in enhancing their ivshmem model equivalently. In the ideal world,
this model will not only used by Jailhouse in the end.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8d0a6e80-d926-8783-949d-8fd036611492%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
