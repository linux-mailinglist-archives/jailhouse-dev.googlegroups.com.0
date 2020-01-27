Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKEOXTYQKGQE2YBRQCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B214A78C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 16:52:11 +0100 (CET)
Received: by mail-pg1-x538.google.com with SMTP id i21sf6750061pgm.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:52:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580140329; cv=pass;
        d=google.com; s=arc-20160816;
        b=xMOto2CXPNqZv8EeUBD9KY011F0W0ow2T6MVDd7UNZC2Q20WJpiCKiZF0DhLjZJQDw
         xxDsXHZpWG0DePhJO5FfVyqn8RMiRHg1gZTRWvoWLYlRQqKG9Mlh3wQljeJWew2VXVXG
         ecX2MVtG13jqWtwoq47iCLoLPGmB6nquqNqv/FZB0+TYv97tMRQHLgvg0LzYL7NxVoBZ
         NR7fvx13UHzjr3iQtNOE50zDvtaBcvAL+IAkpp4//3IUoa0FJDfa5W5n7eeCLigTk/F1
         iBLox2yyENkuoIGUaGbJ/Pws5yXxItfsSmYcV1M2pFbqQoERioYXiq8uWXNKH48QxzVn
         igzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=xafCcmIcgLW1a6qJgljJBkxjw9znt5uNBKvtwfmI+pA=;
        b=EWuILvQhjkRYIzPHSIkmN5TNTkA1Y6tJkm7qpfb/CofgRI6la/gulNTVisxbks00B5
         gCdeZzN35qKeYvshjiU9MWsUqxKB+f3zjpbDVuDs8fu5SRcZKgL/af+PPFETa/0CtGif
         rrXxFybpISwzIDR6TdYMYqvaTT8QxOvqWinQ0xWWx76wLpGtSL5X9z+31bqRbAagzw/P
         Hvwxm9HiHKR0iCXni5c19MC+LJTuPXSNdlJbTJq8KpU8hYJNZKqWuq3cAlVnmJI1zRNd
         UbXyv8zJOuIuvaYQcYYCHuFejkhaoiGbG1/UhYqbO3N0AZjhSQT9kFSCLBYfis8P+dom
         CYqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wgkvTkLa;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xafCcmIcgLW1a6qJgljJBkxjw9znt5uNBKvtwfmI+pA=;
        b=BlUhxQ9xYel3nLejQ3zmqHm7r/iOUGWaSIqg9ouChZxKkcbDevGAcl00ffuN2/rI/0
         yQXs3MrL6VLKCGaj2GydubGwBu2SZoYSxUDwLk/kO/FfyyldkmtuzydjNobBkFiaHV9x
         E1OsKvahKOBOETuNcKAu91teNWyuwLkCdl4rOisI8HiDieljhBzTEPlX4yhorTedS44w
         giaMxPaCtNihQ8/jEJDP3lFkPfyNWN2Phn93Xgs2PXI26WUmB7+nh/8fj05lzEHwxeuv
         +sr1Bnk3evsUncff1HVkP3Up+RxYQzxF2U876wq9V9pW/wi+Z7ivSS0vbTrESlkwGMZh
         /HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xafCcmIcgLW1a6qJgljJBkxjw9znt5uNBKvtwfmI+pA=;
        b=CwAXfaeQYoQOcIc18oseX2XG2KyEfPYLG5vT7TLwy4ZJf2vUesvnb8Xs2d6ZEpOjVS
         lQFnIn0l4fYzzHlUD0dVqCOQ8Pknr/ll58m1z8i+XdKXkcB6diEmkVM8NuPpMAsRa+cI
         Kclu/6d5/SnpxTiv022tq9x5i7tusrUrUHeigLSVd4M/JARxrpIi85MjV6MjEoaDNnHa
         UtoknaO1Ae0UGH0BND8BQyhB4txZFCc/7kQkR2YNnOQtinV0sJH8+8iLzHuThrpkGmuw
         0m6Xtod2KScjaW5us9Ge53t4R4O5CCsx31beosAQTQRFws6tXu+rcwzfoEODxxYO4wXo
         eDSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGGR2eG65BBsD4nRTdDJppvgp+Ht0IWVzkAgseW/bFuXWbJfAr
	Ucxl9LXNzwizfa73CvXCSyg=
X-Google-Smtp-Source: APXvYqz0VpJ1EshHD4gb1gaNTHn28FxhfBySY6s9OseI+lRhD4PcKBAFONrZ1JBHUgCes4SWAZxl6g==
X-Received: by 2002:a62:1783:: with SMTP id 125mr17018403pfx.189.1580140329243;
        Mon, 27 Jan 2020 07:52:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:6483:: with SMTP id y125ls4626878pfb.9.gmail; Mon, 27
 Jan 2020 07:52:08 -0800 (PST)
X-Received: by 2002:a63:5c0e:: with SMTP id q14mr11767777pgb.313.1580140328264;
        Mon, 27 Jan 2020 07:52:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580140328; cv=none;
        d=google.com; s=arc-20160816;
        b=t1nOHsiTn5Q6kcp4n79L1ZdsTygBqx9K54laLjpx5jXB+R341/y2Vc0wOeC4MjBLBt
         uvrx8RSLIRw10dyE+E0YlJtoMMV33LcDmcPp47hGOMBIHK12Ndef9b/+XuMvH5t5lTwg
         GYiYJtwzL+CLxelVAHp/Tzjms6YQJMWMqC1G/Kahp49PwxQKbI0VIMvzOJN4zzHGiGJ6
         e/aWXA0v5MFTrp1hHB7v99X1CYnIhRS9P3i1Ns19Q74t2aFJfHKDsxenEJaBDbnpCxHI
         FubvLjuieUhw4355a10L7YYV8zuDA88hbopGtYR1CVZvJLF8vGuInG+yXudUKveucaAd
         COGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=6RmUk6heDe1dlUZVRAOa7n/MkigqLKRfK0x5zsLySck=;
        b=MV38OLa9rJdKZJT/VCigGzd9YrFvTeyMV4ZwdZrja6MJLw1SI5nWG9zFXh/tBHTIFq
         aefmWZaJlcQcPQTQ/x/BKMwubvUwqfZcWy0IF+CwBGmjaDt7nGLsFDq7y2xxG+uB6HJE
         YhclH0h9D5mhHINMPZfgI8lCaNfephk1uJifsKjoKU0ZqiAQ/Hs8OGTZ8APGthrzWZ5t
         imyEhYP3AiMuZJew+HwfCJ8R7lRotPaJ1ID6SEm7Rg5KZSwil1dxFZGmBUbCU1Lv9yV4
         6QWkM+kyYno3lBNWrVJTsCTnVI2XhhDTutSvOGN8dOBOOQMjB8QqkOjo9u3l5nk/2hDH
         QTvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wgkvTkLa;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-25.smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id h2si1066225pju.2.2020.01.27.07.52.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 07:52:08 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Date: Mon, 27 Jan 2020 07:52:07 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/77a41e-8c51dd@github.com>
Subject: [siemens/jailhouse] 8c51dd: arm/arm64: Factor out more common parts
 of jailhou...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=wgkvTkLa;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 8c51dd45ad98f71e693d98b89dd85e45ab10c069
      https://github.com/siemens/jailhouse/commit/8c51dd45ad98f71e693d98b89dd85e45ab10c069
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h
    M include/arch/arm/asm/jailhouse_hypercall.h
    M include/arch/arm64/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Factor out more common parts of jailhouse_hypercall.h

JAILHOUSE_HVC_CODE is the same, most of the JAILHOUSE_CPU_STAT_VMEXITS_*
are, and when we move struct jailhouse_comm_region, we can save
COMM_REGION_COMMON_PLATFORM_INFO.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/77a41e-8c51dd%40github.com.
