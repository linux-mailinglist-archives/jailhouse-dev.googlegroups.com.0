Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBSEUXDWAKGQEQNPGTBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x440.google.com (mail-pf1-x440.google.com [IPv6:2607:f8b0:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE3C0609
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 15:10:34 +0200 (CEST)
Received: by mail-pf1-x440.google.com with SMTP id z13sf1852751pfr.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 06:10:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569589833; cv=pass;
        d=google.com; s=arc-20160816;
        b=vfcr6l6jb2FLWshPrDxa75cMvdf2OtYrEZvawDPhbQz64r4M/p0FFa6sWmdpsVb9+M
         TKNF9DE5QKEotWGZL/s/YLoEeeydbYv/XzkicL4il5FUnD2CrVdBCe2oduU1qzOQPhJL
         lE66X136LGu3SA8KzsktFkr5Monpy4+33/i8MtSXVl/ex0h6CIqJQBidOfSQzaT3iJNo
         IIy+nOjREJzShjPNmISN3km2fBQmj2dNFckZvqHc68dO92Db1wR2z40baYWMTn2W8eKV
         m91SBdYe0KAvZtmJA2XfDCZSrH0yEGltTR+oy9VDM2qoJPBga4JIu+Z03OpwxxLDbWTR
         bYdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=nOJFfh/Mqw+d+sv19Jozafk7cXXn+Nq0L2ziqv7S3KY=;
        b=o099g3cV06htDNZKj2ad8oxvB6XKABJrV2doCf7RKVBNS4HUKV6ARs+iNkb2JGGvyc
         jCt86BDA3PyPBfYv7QKXYA9AScSqGj+a0p5iKbEEF+Yx+4BxvxOlHzhkSeOixIQky7jg
         RqCNi6Xd680nB6hdAI9oH82N1Vp0UiULpomdhlVWYKaH+U7Dym6SKd74PCbCz/2PKdg/
         wvXdJQaYFtXtf0AfyugaXsCQsCOgnoRlCu/HwLrTHo5+/4QuqWIrvgsOG1OepaHt0EJw
         5UVAZXPoQY7bXtZ8c1xmQR+AFvdOI2QvRypaESdCfqXrYF29opP6+kSxcSznUbBdNxil
         czYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nOJFfh/Mqw+d+sv19Jozafk7cXXn+Nq0L2ziqv7S3KY=;
        b=I8ZGw1rfEB36Kb7+EIrVJ6UQ2dhfgM7O3j9+fyhQIG2zEKNEvCW5WnWxImsxWImSAa
         xzGbMsq4upN6hR45ObcFzV8MyrmopO+7XUtZzFLdwxJLZQsi1wDodzYXN6knl+Feqzww
         rBJpBNo+kXBcm+WSZpJs25OyS/OsDuzYttKplg85rR59FmYTlFglzFveaz0hYRx2e8zY
         1SxVA7wc0mJpwJReGUx90QerecDeUbxRpNMAHWQJKP9GFNAkzkwer5Cqht5pSRC7Kum+
         Xxo1RGJpIbgXSse3AVe7Ag5C+vD13HY8P9H5XunFjmC+7Cm1u5OIH4iS7iGN2uZs0rxV
         5x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nOJFfh/Mqw+d+sv19Jozafk7cXXn+Nq0L2ziqv7S3KY=;
        b=XfpDQq60HucEjAT2tLfOQGJCrMKcfqjTBtOsLFn/WEx+00QjLKErKRvpr5pvA1qO8y
         essKCnDkJjYKO1IXtEQ37ae6yH+Nvx1Yqw83viOksmuGt27LfhigGAVBLJptgZPBW+BB
         XKNcXoGyoczXnvDt4IDs95+eD/eMHrFGEeoC+7gwrky8gYZhNzVyPIic+3ynTj4yW1Ye
         iDqGWlD+pVfRE/37iEbcIbu7b5V+XSuo5tsf14FQ7U1a/i8OxKln92RZfKHY35WuzRJz
         kayfHdR80fsnz3k8fsUK6R88Mzu7sMig0TZ8Cifq3v691x4B1hRLlSU3GNncMjsJIwbS
         5oDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzHLA5qZAI4U71Vc6kxC4heRJp78WdP9IYYBYze9+5ZVLUyw6I
	//LhYltwZ1sZ7TuQFrYRUR4=
X-Google-Smtp-Source: APXvYqyk7/HUqYbw71rBLbuYf81bX6o8W8JLn33L35nLGczVj+S0yykcoXNV8ah4javYZ/lCeeiDOg==
X-Received: by 2002:a65:5bc3:: with SMTP id o3mr9362777pgr.30.1569589832721;
        Fri, 27 Sep 2019 06:10:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:8a8c:: with SMTP id x12ls1648864pjn.5.gmail; Fri, 27
 Sep 2019 06:10:32 -0700 (PDT)
X-Received: by 2002:a17:902:8b8a:: with SMTP id ay10mr4564726plb.110.1569589832297;
        Fri, 27 Sep 2019 06:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569589832; cv=none;
        d=google.com; s=arc-20160816;
        b=WSg7AuGQqk+5UJFbgINObDMTZvI6doP9SAWWjJnhbtMCEatzGSSdXWjaoTXH5XhIVr
         yG/H4ExsP1hBYrhTaVHzrKLZ0j0rQ/x9zRvBKejxAlVxj6zre9BPBlLNyYcWaZIFPZI1
         i/C5uNjZjOkDWxvnquHsF/ym/1g+uUvfDrWFcnDgHug7sA42QvAyOm7oDdKrN+QOrnjT
         ieskoArcv275EEFvW69jxC/qSfjZg5S2hKrRoToLcNL5wP15X87DPoBCARsZTgSVy8UG
         l7H/h8y1TgA6t9/RSQiyCmw02orRU+GWV8hWvk/cIGT7UV4JgS9HAIR2/gUflNblauzh
         J0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date;
        bh=Ih49RabHDOkWOdBNRNVutnKUcqYvlNNlvX8rO6IKGYY=;
        b=W3yiZ00AaQW3eJbq5F7bsyMsaEj5DTRn9qOcm8yqNAHnwx6T9Di+UOr9YX2M8hWUh0
         iTYxBUl+v8zuM8UAEm/Ovcz1LM8Qpx/rUs2EoD+TIoyAALsZJvENYkx5FRI0tQ8g/KRM
         5TW7NU9XbyEK3XnDfPO+AKSx1B19X5FeGMbImPTDw4jfolWxmjKk7irb2OkOBsGogeVy
         T2L3U58xDNMVsUYqVySnGaRRI1zHcjW17/CDe+OoqV0jzpnamDc6ucQ2jY9HJTlrIFI0
         rF0Sp/2+rCmDGoqvHFPzSlHcK2jeMhl9njEerzYrxQewmsoaCCWZnc7REufSArJ19nhi
         O6mQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id q141si112068pfc.4.2019.09.27.06.10.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 06:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Received: from github-lowworker-a6a2749.va3-iad.github.net (github-lowworker-a6a2749.va3-iad.github.net [10.48.16.62])
	by smtp.github.com (Postfix) with ESMTP id 1EFCD121281
	for <jailhouse-dev@googlegroups.com>; Fri, 27 Sep 2019 06:10:32 -0700 (PDT)
Date: Fri, 27 Sep 2019 06:10:31 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/7cc0dc-b66f75@github.com>
Subject: [siemens/jailhouse] b66f75: tools: cell-linux: arm: Do not page align
 the ramd...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.195 as
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
  Commit: b66f75c353cd3b0e4b3eacd786eb3ef4908ef6f9
      https://github.com/siemens/jailhouse/commit/b66f75c353cd3b0e4b3eacd786eb3ef4908ef6f9
  Author: Lokesh Vutla' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: cell-linux: arm: Do not page align the ramdisk size

When updating linux initrd size in inmate DT, the size is aligned
to page. Because of this some initrd images were not able to mount
by inmate as Linux is seeing junk at end of specified initrd.
Pass the exact initrd size to the Linux kernel.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/7cc0dc-b66f75%40github.com.
