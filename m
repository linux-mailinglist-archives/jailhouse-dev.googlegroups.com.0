Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3NGTDZQKGQEW4OOVXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id AA03D17DCD3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Mar 2020 10:59:10 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id y7sf1418119ljm.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Mar 2020 02:59:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583747950; cv=pass;
        d=google.com; s=arc-20160816;
        b=km6fmBqtA9nRKi7e6+w7SKZJ/d8I0Ck8D4nBBOkn6PwTcDaUns/QB+kTkbahLF3Xg+
         oUS0jPUAB7LjJ9zRAKSQKytxNGrc2IupJViYRco0CxHxpf1o6fpM7kQnQrX3D4kC9WQw
         9aC2cGtLfsMHPLzz8hXiL/WN9hqDGlf7Sd9vz2Sm6sAiXgIzajnxKwIWePpH2XH6wcVH
         Od4OObPL6VAGubo7q9cT+b6BrkerGOYBf9NcCmVvVD5RqT66Oc+buvpfZzt50Y3od2qV
         Tsw2hp5Lq3atqUPeCoIZKjH/eqCjquqJ7+5JSTxM0shr/TVQmiPND8XCibzFRx+BpUWR
         LB8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=IblpGy1sAkdgzWYlfNT2T7CTC90T3N+7U1ycopuP44w=;
        b=QYfx4/sh/0TKWgG1JYO7R85OGEy5MZpv+3jsYjCx6PDmFDz6+HTDcsEQXWFkpyGLUC
         74JLYGQxoPfrz2oPWwNWaHMcix36C38M0whwCSgQk9N41pUd9Ech4/I6K1d9hVMiXoHh
         gCTkCLyX6wwiK3RGrwMCzuOmHU3Zd3bGoV6klAioAqESIrhJR5Wp7CHTma5d1CJFLDUr
         /BcIKTWYfV+higIWF2LJY29qMap1dshcs8lvG982cloCfRmEF4n+WnoLwViRA4hKgNET
         2HSt5JDd5SkiNaJhgx36taMEPvJEprVAlcA9Jik8V7mek7pUGndg3vcFoo/ugd2C3Fkd
         wM8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IblpGy1sAkdgzWYlfNT2T7CTC90T3N+7U1ycopuP44w=;
        b=NeD6CeejTgx5RxJ+fHbApFlTsJ5Ap+7+07iLGuE01Sre5riX+SqtnB9xcjA313jRVu
         V3ckx5cYLLCelqdxE5UWGgEpXsUFbMhUq0RgiN4fiyO830zLgtXn+JY33DM+BDNkfrZe
         o804DmuHWcJ7t2dCn4wDg526Wh4ks4/TP+GT5kJhd7wT/zwG/jnjKjLrWLVYDpF3qpUR
         qU7RLxE1l/JYCTiatn6H+ZnRrhghHGkyJxqoQJ0Q81SqNVJa9vpIyfk67UFV2oFxgqNa
         Nu8b9Zv65rybk1MBQB6oQrhSi+xbHHPf5D/3GWCZzdEVH9i7wBW+LC2dt3t+mLybr1Cy
         6icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IblpGy1sAkdgzWYlfNT2T7CTC90T3N+7U1ycopuP44w=;
        b=mTEgBP+6NSlmvZlBhh8hHurnIqE6D46MibS13f1GR/DqPpr6+s7NkgHgsVGteJ2pYw
         DBjgoxvg0CQ5hj8Oa/s0W1rGYE7AtitGcvTi7NCjxjONN78cQU3/QKj+hQt7gw53aDZ1
         lhJ9FeTvW+elwcubf9Rcd3WGoea3GnRf8US63TFc4+5cZN8IiP2G4q5A/ANKBOP3EaVh
         Ct6BTUj4QPFaDq/fVvgWhnxHBVSbtgTXv2KcDg0rat0rVEzLgo8gjCsO/HxmrK7m6Iy3
         0zfbI0NdASmE4unHwb3NhAHOcsnPzgCL++B4kYjTzmon/OF7sc5TN1eyjfKPdxsTWhlt
         wCMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0GDmrDbakLykESCH7JJCWavKD1j415eFB+xVBvGhW/oxf4Kdl9
	b9W5yEcB/d5ewcxbjdLAv8E=
X-Google-Smtp-Source: ADFU+vvXTiqb82hQMcy/S8aJ1YsIwCpi1IE+n1+zX7ae8u0q/ldX/6thx03HszN53KfMuazvrV+2ww==
X-Received: by 2002:a19:fc15:: with SMTP id a21mr7566083lfi.78.1583747950193;
        Mon, 09 Mar 2020 02:59:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8647:: with SMTP id i7ls1640026ljj.11.gmail; Mon, 09 Mar
 2020 02:59:09 -0700 (PDT)
X-Received: by 2002:a05:651c:486:: with SMTP id s6mr9519018ljc.100.1583747949314;
        Mon, 09 Mar 2020 02:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583747949; cv=none;
        d=google.com; s=arc-20160816;
        b=VGbkZTqOR8lw5555/+V2EVS8QcPzHt3nwPV8AFvMo7BW7N1xNrsnQu0ChEQCWJvtGK
         +3QER2p8AZMxT7y3ovc58VEctnBNF0pXp4ibi0/tvqlKtgBNmOjwYL2+ypSPnAlbDNmZ
         mxk2Hi678VQVDynFJmNxe8r5OQNNiB6Nk0J7X2OS4te7A9V06I9OvFwenqOE5brqmJ/M
         5ZU2mkbXAOwLI20FU80S+D0xj9gnhphz0s4SjnPN4cisRRyAShXbrPY55oRGljPqY1d2
         a8MrTF7ZZ2Rzu9Nnox+gsCXGJeP1Nu95LtzDfXqu15Eti7DfohPofVtFsL+6LkK/LyrG
         wQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=7U3QbBswTOfoEpU874dsYu6JT+3s31cC55VpYWkbna0=;
        b=ytKyCkVKF+7Zk2Wtos3tIGnIddkysOeuwgdfhklNWLqRnATmdtbghhvo4+BXQs9oJs
         M12zH8pUwc5DEKx/nTv++nCZtu2C8SSVjv6p5A7/uRmzP05kboZmNK1mu+Z8xdpCcUxD
         s1VHCBy97CaqsfXH5efCIuC4ZR0uanxzsJeX6OCn+sod1zNGAqVMFEUYx9maeuKvbqca
         LDjBv/CX7gZDZJJIKYRQpWiRrcHAXlox+/8gJqBeSbBHF+EbaQwm3yemw+8HAvUZf+Rp
         vMAJ6xQ6JdTPmxjpwO8UT2ESvz1tPQBPBT/0vxA31JXwtni7iv5WM2d2sbshkBAVODxQ
         VHjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j11si428435lfe.4.2020.03.09.02.59.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2020 02:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0299x8Ce012920
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 9 Mar 2020 10:59:08 +0100
Received: from [167.87.242.96] ([167.87.242.96])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0299x7rb006670
	for <jailhouse-dev@googlegroups.com>; Mon, 9 Mar 2020 10:59:08 +0100
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: ivshmem-net: Heads-up for race fix
Message-ID: <6207dd25-861e-227f-30ca-4f0fb38a0d49@siemens.com>
Date: Mon, 9 Mar 2020 10:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
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

Hi all,

those who are using ivshmem-net in a productive scenario should pull the 
latest version from [1] or [2]. I've managed to track down and fix 
several races in the TX patch that can cause stalls under high packet load.

The update also fixes MTU setting which was broken since day 1.

Jan

[1] 
http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse
[2] https://github.com/siemens/linux/commits/jailhouse-enabling/5.4

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6207dd25-861e-227f-30ca-4f0fb38a0d49%40siemens.com.
