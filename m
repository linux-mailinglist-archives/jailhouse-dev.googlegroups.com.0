Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZG53D7QKGQECR6VRZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863F2EC5D9
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Jan 2021 22:43:02 +0100 (CET)
Received: by mail-pj1-x1039.google.com with SMTP id o23sf2478462pji.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Jan 2021 13:43:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609969381; cv=pass;
        d=google.com; s=arc-20160816;
        b=w5GT7W6cEwERtswPcKZaC5sRiAS1m0/9nTyHUY8PZWjEt16wNRVPbl6B/IeRB1hypq
         Ga1lEyJROHmHPxJK9JIrLEqWYuNzd6lhbLabfpavBbAz4lOdfrIrMMWp0ytcUy4ZAXPV
         7CsTaJDZhxTW0iXKgvhwAJfSSwhNBEXR5PZo8jzlWzXJjzoqOwnsw82uRerFA8mQa+jQ
         9TRQ7ogfTtRIKkNY+UH33xVG0X8q9F+Hx2EZLGzLy/7DLNlakoINTaBzRjBJyACqmaIs
         MOjrVjQ2aKaGGY8xfuA76FlVdnvYvpA6Ob4Qi80fUnI2Rw+3X3R/SXTwhVT5CvXTPHe3
         8Flw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=XGFRPOMAFcIzT/hjOid0W6zKCejBnkgx2KYJDkAfXUU=;
        b=y6bqA0tqazod4lmmP9EMXfFRfIky2k2yYgTy5J8DdSq340YPzPZOcxsuMm4nQe7Had
         CAVBu0HbeaMe5rY5ZERNJmSN++Nh6zyXCGn4mfASx92xA09DaDr91w4WP3yJWFhdz4pi
         4kCwioTd9tSZzGe41Bs46tbI+o5mF0DEyovbF0ZSAF8ybRT+CvdKQi3gyAF9LXuJJDyZ
         NaDJleiw+6gfemorkXQ4fMHw11YOObXXKWhdXP42NDqr+qi8+a1LOJBe3TE7Lb3FT4tZ
         uYIpT/oSnRkGycvKjpq2cnf5xGSM6FMhIwmQxwnZgDbiJ6qPt5f+wmbTWJo5WaXf9nRK
         MC2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=hsQS++Dq;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=XGFRPOMAFcIzT/hjOid0W6zKCejBnkgx2KYJDkAfXUU=;
        b=mp2/PUbx1MO5Hgf2PyYxP0VV+HDyFH5qu4m7zrea5APbXEWMHskqq7/ijhUYj2RwpN
         F/SIUbAwaZ2oqMGob9s745nsiR/RfHALKfoA6uajDYbAp/IA/PqjTQN5SZaYizQDi29s
         TSskK0LoEe0SLWx7HdJwCymg+qZT5QSUuFCm0P8jgSVgJV/C5Ts/uV+9m5gQVL05xDZo
         i1xhGMV022Dk+Q/WTdecvWZPnwb+82tbTOcAdWatTToB4sh+940P+LjhSyludFRbFWgf
         dnjfzbGBTmNyGoMXq7aGljUqO4g0VBR7quEF6+kU506qtL356Apr1J8K2nEs0a0IeE3M
         xF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XGFRPOMAFcIzT/hjOid0W6zKCejBnkgx2KYJDkAfXUU=;
        b=pc4iyJHEmWufFXYMzcmmokhf5N/2P4sAIV6qnwbH4OsFWJrifzWMZpzud73ieNVYmP
         +QKI9DVYwFmpMBXNkSgrjXYdcFZm45uBxM/BahS453y5UIPDGrl+u9oJxzTl7veHmf44
         Uq+GiUMLh1L8Je7jsVhTCTbtUxAhXNF68u9mi3aGiCoTyymFadH8mkbAW9ppOUkBODf0
         ss8KT/AIeFNp3Mc+o54AfOib9/9f96DQ4BVFK7YMtGUOJNvn0sCjCfCzy2iOP90/qwuT
         eqHoMhI+Un99Zyg6qgM3XfyZoisggd7iy2YZfsXYo5Ww84/F8LINAzMs3Y3P68pPm5VW
         CvLg==
X-Gm-Message-State: AOAM533aPukGqHnjhx4iBmT7LzgI98Q3rQbhEJ3WVLR/fEhjBLu9nsoc
	KhRUG+bUr5+5XmqmyvLCsqI=
X-Google-Smtp-Source: ABdhPJwd02MXVB6IUfHLmjUTvwWlE3MZNwkNKbSKSQKaL3yQRD/UR4OdBJ5YSxpMdi97X3rm6Ot+zQ==
X-Received: by 2002:aa7:8813:0:b029:19d:cd3b:6f89 with SMTP id c19-20020aa788130000b029019dcd3b6f89mr6033736pfo.42.1609969381203;
        Wed, 06 Jan 2021 13:43:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:ba8b:: with SMTP id k11ls2002829pls.8.gmail; Wed, 06
 Jan 2021 13:43:00 -0800 (PST)
X-Received: by 2002:a17:902:bb8c:b029:dc:2e5e:2b2 with SMTP id m12-20020a170902bb8cb02900dc2e5e02b2mr6051132pls.10.1609969380295;
        Wed, 06 Jan 2021 13:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609969380; cv=none;
        d=google.com; s=arc-20160816;
        b=oFGipfvYBKI7F9ELB9PVMNaNQG0BT9vpypFi3EAI1WTqhDKlbOOeMSednaGsCYxTq0
         U66jnUrV3+e0N03uasZHOTRKrOnRJBrI276SDjkRnJmqYm9vjInzS0+fI1fBd66qvxel
         DpcbGShfliC9Zgg0nee2jQvGBhTk85mJB0C0c3oYH9E0Ps3oAJpgAzSS73m4ysSOBwOj
         6WBcq4/CGjt++xrAIeLQXX7iBy2uLmazXo5xBkRCFgSFRzXK4WyevEZVPfXuPhJHy0pF
         nnI/MU86IxhdEy+cat+xA63/+ujowRkxE77S0joFPIqLtFY4k5Bg8f31tlswILYfmkhK
         Ybjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=d0Gp641NQsk5oV4084JRv2M/9ixS23ilDnmEmxlEI28=;
        b=0+Jb5hcxKVxBtTQl8pGmjniSTt0Znti8TuQ5hQ4fCPay/UHlSs+XqAAXGvxnaQKk5D
         F6GEcbW9ZuxwODNNsA2LCYGBu7bWgY+pZj1diMlHPvpDl2NbwvXcwTXB6vej3OqzQsGF
         5TkuQZ/+t/4mvyruyumaXuOx10uKrtYaVBhKBW09nkHRoOMawltH+GlSajNEIQJZncyC
         wfimZYSWx2v6Oy2ffHncmSMoxygkkfdIbWsNtk5tYfs6/22vxJHwsiK2gWCwWRVbeiG/
         D6MkDWsWOFFzCAazZtE+XdLjtq6UKLbBSN+r17g/+lxlgiQ3mFQmzqCGkjpOCoOw8iiA
         izUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=hsQS++Dq;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id q32si4551pja.2.2021.01.06.13.43.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jan 2021 13:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github.com (hubbernetes-node-b90b667.ac4-iad.github.net [10.52.100.63])
	by smtp.github.com (Postfix) with ESMTPA id 7E896520E89
	for <jailhouse-dev@googlegroups.com>; Wed,  6 Jan 2021 13:42:59 -0800 (PST)
Date: Wed, 06 Jan 2021 13:42:59 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/9325b7-beb3ae@github.com>
Subject: [siemens/jailhouse] beb3ae: driver: Fix x86 cr4 shadow update on
 errors
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=hsQS++Dq;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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
  Commit: beb3ae8a643587023b6a944aab5790f453e12d74
      https://github.com/siemens/jailhouse/commit/beb3ae8a643587023b6a944aab5790f453e12d74
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-06 (Wed, 06 Jan 2021)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Fix x86 cr4 shadow update on errors

We must not touch the cr4 shadow if initialization or shutdown failed or
it gets out of sync and blocks re-enabling or even reboots.

Fixes: 67e4de38a3f8 ("driver: Adjust to kernel 5.8 and 5.9")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/9325b7-beb3ae%40github.com.
