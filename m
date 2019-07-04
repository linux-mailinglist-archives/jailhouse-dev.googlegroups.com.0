Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP6B63UAKGQEDE3PRZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF335F30C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jul 2019 08:46:23 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id i44sf3201647eda.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 23:46:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562222783; cv=pass;
        d=google.com; s=arc-20160816;
        b=BPFgmTnLUM0SzwEm8uWIOT1iIx3fJTz94cb4KVJkPjH9ss9Uj2niTYGMs6f+qTjwWR
         K/in2XohlgHuuXIkXUNuyGcM+p6Qwb1sIUq2kMkGXra0mc1mYFEiNGSZaXhmOSoPxx94
         VQSrEdUvGEVArmaFi+LffslscVO6fo7uSEdWt4oQUDcJpYfwk3llqCTSE5IiXH93VD7Z
         FUE6OdIpnZ3NA1vLTdWQ1wpM/68clJmoVicRZHDKbtgouFkQ4xJ82RxodF/rRkYTmngj
         sUbWuHlJ+zlpWHz1mVn2RbgiKa+4SLnNXXdV+rlEYI3eHRvyv8N0yxvnBrqW5OIqaiqq
         b3sQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=ydtuxbu8maY+guayowifVyxl41szL5gRXJHlSQubUTc=;
        b=Qf+NaZlXPjA3oiZZj690AErc3U9RA8c8Vexy2Aaat5TQv+xHWf/rMaO6JirlZeQ8AP
         dE27HBToy1Ol5DMtm5tGBbhJf+vol6pFatSQ0dGacly6gt8KE22jbR/AdqL6K7kEtGAZ
         LGevlTNVSGxLJ1UQXX0tItPaPEuK3qSryno1O/H5g7t034pa/MfbTUfme7zY9HIdIsL1
         OhynlSYOYwAzWca9RI7zesnqoPW9PRCujHDXpyiC7l58Uq4PlXXRycwxjbpLkywb4iYH
         kQKhu8PnZB3FIR+7F5NGlVDiP+K3bxouppoxGwqy96k5nIlQgsfN3s6jTRMmC5+oHG5S
         iWsg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ydtuxbu8maY+guayowifVyxl41szL5gRXJHlSQubUTc=;
        b=e6A/PnTbTJTr7CcLwdT6zl5cQ6/4DXANe6Vb9TetBZ4x7nQXAEgoC8WM2YNMpMt4gz
         Fr6NmcQB27YErYjyr2F8Q4B5gCHNFkMYSGefja5PAHkWBlWq/RMLGBmkbBeS2Xow6cXA
         MZyrlo9utQzWhUU6KnfswP/Til9PnslIPW5zS9FaVTpv2xXnHKcFtr80OZoLHvPx6Vsm
         LTwaBRr3zWExqBIlleNsv4+aO8990B++BTXX36NFTSxce80cPPRElr3NmBB7a2uE/C/N
         EL5WXaXIVw/hBsBDmzbs0gDUskJlln72oOAUMoQL5LmUcjXfy0WQCZCkF9nVPwio9GUK
         1OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ydtuxbu8maY+guayowifVyxl41szL5gRXJHlSQubUTc=;
        b=OUeLPX8qX0E81SjzEcLB1J8MKjB+Ecs3VlyFGxMnyRqesq0vP+XlaySvV5hezL72Ds
         vR8rSBQ3rUpfnGKds13zQ4bCwVdU2FnUk2/Ut+VLhVtNraS4C6HoE+0D6ewpMuNEsnjK
         PuWtaHnZgSb+wEtFkOtKf4TYFixGa8OPtzud9sm+MzSytZ0wIH6OC1T67boF0BvYwCCe
         zxw1Opb0g8epkOs8AKFEfZS9l3xm2mtLUHG/nAEqfbbntbvvqE9wZt3exeXZA93CKL8C
         iYEfK3gDzTCJdjdxocYadYmzWUC55O39z7uqHc2VdCgqDKXtknZ6Db8E0jT8nuqr4lzC
         6IMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUlgC6vkPSeGO8uqTKdq8ZvnXvLBN99Il8lj9nFy+W/KaX/KGkF
	lUKJnnDB3JJnFxSQSj1RzcI=
X-Google-Smtp-Source: APXvYqyVqwOjI4CKDNqtRsnK3lS6glUD8yd4SoCqu9g8psPjFZ5i9bRnCn1VVlayuZAxgE/HqAH4fg==
X-Received: by 2002:a50:b178:: with SMTP id l53mr18450176edd.244.1562222783146;
        Wed, 03 Jul 2019 23:46:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7345:: with SMTP id h5ls1161366ejl.16.gmail; Wed, 03
 Jul 2019 23:46:22 -0700 (PDT)
X-Received: by 2002:a17:906:6582:: with SMTP id x2mr38793151ejn.2.1562222782616;
        Wed, 03 Jul 2019 23:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562222782; cv=none;
        d=google.com; s=arc-20160816;
        b=OnUWlAt2AKuRowZGMAH3OHxrZYWmbS5H8oKHIhy4mkHgIrP55vHdpGp0INkgl45PGR
         +lW4wy7K9UaWdZWUhSs8FRYIswjGrziy+gF8WWgc/P6eE8EKVexGg03fVRLw1UKAmOqg
         j+x3FINL/HfCfUoHbtYfuHDSdFg4NtpXORlyOKR+8weV6OVxDX5ifUehhHtbvN44Cq4M
         w0UJkiDBL+JrKGkQOumsGhXP4k3kUaf88AP2SUWz72V48P6SBM0mvlrrSMWn7yhsqdKB
         vHWwDbk6NK3jtyfG6fCwwi0I0c9/AWYLOXVtxWaESuZBPHzoft2IGX7NgV7ti8jVwvt5
         t7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=tRwPzszu03kMtYzG4oDLu4OH6F88yROJ1iytJpJe/lA=;
        b=ZyrREQq2gK34CheBSRERUXX5aMdvF39pGZ4uI5kFqOXTEC78uOMx2tlF1qxTYxdYGc
         UuoFt/7ISUtyNVo+UUKy/D23Llum4REHVfd1HR5TNu1kPnchyvEALzAAHLfB3bW+2hJq
         t2oH12qbX+XlrmqFlT3PmoLFy1nNK8nPjzpnG1yjbYvjmq5IypGpqyEXLDT45RKVrVEk
         ScgDHl8GDR5guGJbDszsgJyvYMSSqrBq+hg8wTUyQz1avKn3VCOHyZXDtKICKpuJagKW
         pw60hUT8QXhIS8C4LNIPAI0/u8VBw0GBEmzQSYmLZN5wGh8Y5KXF2rXRhMSmqqTQrUiP
         Kk/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t15si269027ejq.1.2019.07.03.23.46.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 23:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x646kMgs022092
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 4 Jul 2019 08:46:22 +0200
Received: from [167.87.13.141] ([167.87.13.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x646kLR5007573
	for <jailhouse-dev@googlegroups.com>; Thu, 4 Jul 2019 08:46:21 +0200
X-Mozilla-News-Host: news://kiszka.org:119
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Jailhouse on RPi 4 (spoiler: not yet)
Message-ID: <15f92023-1caa-389f-fe97-9a41eaaeb103@siemens.com>
Date: Thu, 4 Jul 2019 08:46:21 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

Hi all,

just to document this publicly here:

I've started to play with the new Raspberry Pi 4 last weekend. It finally has a 
standard GICv2 (yeah, so modern...) and therefore supports virtualization 
properly. I got Jailhouse basically running on Raspbian using their 4.19 kernel 
in 32-bit mode (64-bit is not ready with that yet). However, this is not yet 
ready for release.

The primary blocker is missing CPU hotplug support in that kernel and the 
old-style firmware. That firmware only puts the secondary A72 cores into 
spinning mode after boot and allows the kernel to pick them up via some mailbox 
messages (commonly accessible registers in the Broadcom interrupt controller). 
There is no PSCI. Reminds me a bit of the AM57xx. I've hacked in simplistic CPU 
shutdown into that state, but that may not be upstreamable. And that hack lacked 
support on the Jailhouse side, thus CPU onlining didn't work anymore.

The other issue was getting Jailhouse to boot in the constrained virtual address 
space of that configuration. We should resolve that for all ARMv7 boards for the 
next-but-one release by adopting the ARMv8 boot concept (hyp mode activation 
during arch_entry).

But the perspective still positive because, if we overcome the blocker, we will 
gain a broadly available, fairly powerful and nicely affordable ARMv8 target.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/15f92023-1caa-389f-fe97-9a41eaaeb103%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
