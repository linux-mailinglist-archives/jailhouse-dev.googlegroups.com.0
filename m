Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB3OC77WQKGQEJIT44WQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA5EDA95
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Nov 2019 09:29:35 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id e6sf9614072oth.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Nov 2019 00:29:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1572856174; cv=pass;
        d=google.com; s=arc-20160816;
        b=rQPFoNRGUVvjb3wEN7uLOx66O4FbOCH8rmSxP3LS4DqdNFn9p36nDwAN/RVltYsdRA
         oC4L/y95OSa/aMgG+XnpegSyoVSzbFZain4ji2mIIvzCUPbLM5Z1Sk9AcG7192EHTi5L
         kIf3OmHhc1R3XLwLQLkU3SchzV5JPLs5B24j1WebJ9IiBSmljuiScnq1x1QYKuWsG6KE
         zS5NY2m8xnKWgWTo1fe/CzwCJP/3n15uxvf4ePWzhmGi9KqzUPJYGLl7vtg9aM8Lu7Tc
         y8n7lnqwn7XBHmAl7SNlbNXw1aoagV2CHxveVVKMPJmAObSnVRNgc+fYUvAdhC/dGtqs
         URJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ov80jIw98ks4dxXiuoqLNGjbht0/DMM6PJPzEnkhcdU=;
        b=Ql5/vHeIl15BO8L61wHBLBo+ysR0PTIGf0GAy7ErE7RcITtrVgDbldEBkz0Si/kFx2
         RpVNiKu0jCD9yl0JT50Oj0H1Mu6FOiz6QTfnYkq0x5iewZGa4gBdjyVy/JtYPcoChJ/D
         y6n5B/A7v8UbPejna1vkD8lZ2O3buC4NVG5ITI3yl/pipcnLQPGLBhMRQn5IlvQpuWoC
         mf6U9xcSDy+X4UYukMdy+90Gcb5v7hyvfEbh7QcdITrUVrNpRRX/tCQRdCzlcCzVccLH
         5Nvk1xRcAXeX6+OdiWSTIKrFoVl3yHJaFzQyLKJnnyhWSZPH7GJBOWNeFKnJhtCbebpO
         WLvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=bYDkDCKi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ov80jIw98ks4dxXiuoqLNGjbht0/DMM6PJPzEnkhcdU=;
        b=MhPIrTuiI66oanNaYDgehSSMwfO/YL79k0QtRYbylvHz/meORAbWYCbTeitcv+uxgN
         ilU41OivdwsRkks5ZggrgI1ZCSpTSFPDR/oDJAzBc1DDkWCrIk1+jFF8OHEVXhUTwFm0
         7Ql22/rOAI38GV4RqsfbCo4CSL8GukqS5erVg2q7IGNP/Y8KnaMu+AE5n+Z9wH3EDunI
         vRkYRiioXNwi0w4C2CGFOdhO2HDbnXzLwjuuxECmqQuANOJOGc5kdP8wXECdXpzNvY7a
         pA5kHAHW4rBfce3LKMA0SzAGfC/qyd6pQ0hWX4vVhUQwB4SnCG6AOoSOuzYVy2EKthKi
         Lxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ov80jIw98ks4dxXiuoqLNGjbht0/DMM6PJPzEnkhcdU=;
        b=eoQ+S25qmLljUFRySPThNELcoOkD0mbCTmqJBHYGv0DuZOhuPjTbdq0h1GbnyZ4xT/
         MLCQU7PrtzHjbUGQk5i2NY8wHy8T9ZjpthnuXLzH4HRKjRmSo/5jypp4aHOOsqDHTPmW
         VlKiBdrMF/9heqZf3OMZmvrHLqSIIk9w0Pqxtm5SJ6KewufGffbTOc7hT4wHS80H1hCs
         Rkru0cowc6f13vfmihp3wELwwPFkAnSYYY3O3SNCqh3iqH4+NAxm3HEuUOyPvjIsUk4y
         ujg3tQMaCgwTIFxHYrzO6g7oaUAL2UJQnDY0vs8gaeDsJ6Cf6I3s7AyvgxG+jqdHDOFu
         mTbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUEIY7L94LyUdwVKlkHzf+AdQHoEOUoAfsHigQvRvNvfSUsxeO4
	y65sT+/bNgcpe0Y9wGsTGmM=
X-Google-Smtp-Source: APXvYqx6/SiTOZnvDeVbhHg8aeqKb4bYP01OOHHdyCfsmvK4xn1Kb6WP6jc48YWldMPBJXgfhT3rQg==
X-Received: by 2002:a9d:4792:: with SMTP id b18mr12298973otf.245.1572856173911;
        Mon, 04 Nov 2019 00:29:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:2c42:: with SMTP id f60ls2534112otb.8.gmail; Mon, 04 Nov
 2019 00:29:32 -0800 (PST)
X-Received: by 2002:a05:6830:1587:: with SMTP id i7mr18120691otr.321.1572856172712;
        Mon, 04 Nov 2019 00:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572856172; cv=none;
        d=google.com; s=arc-20160816;
        b=r/8CUadQO3XV5baIHb7s4kr0V4FAcdqpYcrc1V3d8b14SFBoWOck/SBvFmm2dm5o3D
         Lu6zdanPWdtDzuYA0LMQR/BemuOC55+31lpjcQeKoMGhAumU1sbv/HVe611ADzquUp01
         ssdQcqnfI97ZTXE+IFMtdNX7k+vwAsCcb5OVseHkK3nHQiEZ29PWqV1HbQ7LTZz7cC3f
         RvEEPWD1Iw/1fjfP5FeX1+9cWNAKAyCz/XLJaYu7TCQfYaI3OJC64CtsAy64Oacx1JKk
         sR9BM/dkfxmlHHakIIrgWzMH0yruEWwndhL2ECjTSH76egFOtUzfsMu2LVyZKOzr28qh
         Y29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=Ef+8kw73AuJUWdZPGSoS/F6f4gQ+wSwf3r5XOEK3fTA=;
        b=wZgSsrsv0bjZk/9a1NZJ89n8o2qPpnvUbgtNDvlkuGOJMsH0HFjdNYGmwbfhciT67w
         3joGyoV1/YDB6KlyH7zLcqBf3WhZtUmQL+DpYJuW5SbsV7Q+61N18awtJ6c4WBU0TocX
         MZ9DfYHy+U1wWeGsqDoEIQsYJh6FRtzzkkXYf7/SMsaCHWk5koFT9F2h5IhetxG8/9u/
         liSW3M3mX2oG6erkURGDKn2tUD0noy7tI9ivUUf1bpghBpEwCn4DGpfE94vzc2VBqzdv
         s9gh1dM8spTwxiriiA3YgxWLYAaz3ddGmgkO10we6t95lNML+BUrUzwukSYeYaYwjXN9
         g4zg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=bYDkDCKi;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id c19si801497oto.3.2019.11.04.00.29.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 00:29:32 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Mon, 04 Nov 2019 00:29:32 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6820b5-bac03e@github.com>
Subject: [siemens/jailhouse] bac03e: x86: ioapic: Rework and fix redir entry
 programming
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=bYDkDCKi;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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
  Commit: bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570
      https://github.com/siemens/jailhouse/commit/bac03e4d5f5479933f1f5d0fbbc3f7aa6c4a0570
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-04 (Mon, 04 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Rework and fix redir entry programming

Currently, EOI of level-triggered IOAPIC interrupts may not work while
the related entry is masked - at least with QEMU as machine and
PREEMPT-RT as root cell. This is because we always overwrite trigger
mode and vector information when masking an entry.

Let's use that issue to rethink the programming pattern. The new one
works by still avoiding to map while masked but writing the entry with
an invalid remapping index. Furthermore, a redirection entry is only
updated in the IOAPIC on writes to the lower 32 bits. This is to ensure
its consistency. Writing higher bits happens first, either out of masked
state or with the identical value.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6820b5-bac03e%40github.com.
