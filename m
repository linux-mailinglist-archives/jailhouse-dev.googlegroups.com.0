Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBSUKZXYAKGQEFFUJHLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x139.google.com (mail-il1-x139.google.com [IPv6:2607:f8b0:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F5F1313A7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:33:48 +0100 (CET)
Received: by mail-il1-x139.google.com with SMTP id o13sf32732982ilf.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:33:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578321226; cv=pass;
        d=google.com; s=arc-20160816;
        b=BRqdw+DihSrxqdDnkuYx0/EzEIv+eRb/Yk7Pg0IjkGqzDwsPDj1i0j9VQFx7dWNQ/r
         uoHMN4N5Qoxyv8g+5yvlDyW4Gx1Urp/6sXpxvEEbIywFHtnIs2I7wH1H01yIRukkcAY+
         kQdeoLCkuZDkaxGAVqR5pfpjAF2uo1puOyJiFFD91p6R2EUIuvkxwYQIKwykGqt6nEL0
         MQsuhQqchdCDSJCFPLBtkJrMLopQj0s3ZStDuFa47iuJpEWBjuDbszEdWMcrNi6Me7pI
         B2qQFl4FTeQrfWxbuHqIXOWkv4ZzW74yvFaxI3lpXUmwDzMeCRqfFxtUoI1c6rupHcdU
         Aoag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=peZaII4xYYkBAx+yYeLesgWtWkyE9RqQkzZnJaEsFRE=;
        b=rOvmMh3g6rAo6a7UlATDQtr9pIul+uqUvvgtHpNpeWYGqNcNdheAQUtyY9bWXt3l97
         iritsrCV28YVTeXMOwNMFVNUTo2/zAGNuDHmb7JS2ANW+HC8VyIpxwirN/ixU4DdAR7U
         YFtAWUo7lbtGVB5+pualBDnCwfaeOLvNgHaJ3KMA2Y7SmqZ2ngjRbo/hSg4an+5Hif9I
         WX+rpH6IDBKjEbQx0YpwFwDzB4p6fMSY40drJOteSgbQBJt/ZHA3GgD2yUA0h6I6NeXv
         qCMkRklzP5XTvFmjkBnaUq8G9upxcEIskMeCnsDEq/vmrrnwAO9047oBuVdPrjeTbQa1
         lk9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=E6FEsbAC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=peZaII4xYYkBAx+yYeLesgWtWkyE9RqQkzZnJaEsFRE=;
        b=PdmsSPvA31LzxqbsTdXDYT5sxQk3rMsfFqeh+EKBLZLm12sDsu361bLjp/TEhBnLvq
         BZqGvFaMjcOf+4XFus/idh2h23hzhWeAVFReav+dc7M3UNxRnv1H0sgohzuFCLlOyL3v
         AYTAM3zXRD4yZGC4D6JdhVkdfCUzhAQGXuVHe7+bHERUl7znWDDM/w89jkye86oqp7kw
         xzUE/1FAEFhWFibkEegUa9GVFS0Y2imCy0VJ/lD3LtH6j8IvWKkQtdJrfXFG7poNhM61
         jnrf61MHa8GEe7h1LUklDyTsOJUQzIEQ4Ht1L83v44ICuU3IsMTQsxK/PzcOEQduQrzS
         5Vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=peZaII4xYYkBAx+yYeLesgWtWkyE9RqQkzZnJaEsFRE=;
        b=HsZtCNcl5GguLT9BMFWjJRyKR5rp0icQrd6ddDYVS/41bOdcayf5SJ7iNHS188+xED
         db53IkFnv+oglG/rs+uTTmFuiZJYhsuBaM+WcaiuR28FxTl+ib+zJagp8VNWPYBJ9lH/
         Zym/1/9sWnf+EXIDdvR6+Sfyngd40ajEEZC9QyP6bvA0MWLd0Qlzz6R/LA/UWenL8m7H
         CP5TF9OoA4IIIimK+MvGp3SQhxZdkRj5l0yAn8i2enIvfBgYXn/VzLsmpf3hKLdAODs7
         QsHxh6vuPhBBMH8lq1vGKFcIymsq1fBoFbxkJYiju/k+DdyG8tWw8IODsmVamdD+TwIN
         Th7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFh4cjFXNlDopdzEAghUqABzaNlYqcHwWA+VQUlIfjpMDqDe6N
	Ihfahf8QVZfkaFdjOSGf7fA=
X-Google-Smtp-Source: APXvYqzhR9/cgyhsjbYC0IeMl0gXJyNpphzp3Ti3E0s84C+ui3xao/ygIaxJiGLjFx/Zu0jWiDAQJg==
X-Received: by 2002:a92:5845:: with SMTP id m66mr87925810ilb.257.1578321226449;
        Mon, 06 Jan 2020 06:33:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6602:22c9:: with SMTP id e9ls6088838ioe.2.gmail; Mon, 06
 Jan 2020 06:33:45 -0800 (PST)
X-Received: by 2002:a6b:ab43:: with SMTP id u64mr69631740ioe.198.1578321225918;
        Mon, 06 Jan 2020 06:33:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578321225; cv=none;
        d=google.com; s=arc-20160816;
        b=kJgmCTiAuJsfeLRGyWfJUZ7+UM7xOjsBEqSpu7/2mI9J7Twr2P9Oa22dTR1UMzth6h
         E0x8Jd/98mJXx7el2mhnSm8uwKct9AbfS1ExZq9nO+wacF1ttqDcMawCkOyDJnz1FS9B
         +YmQ22ObvoCW1AFItIZEZ4vzrKbeFJNP1aEEw4MfHf1I7+wfoAC9cAuyWSCYQlGRLNKH
         JSLMWYm9IMgQOaKLbz9/sE4cuOP8KtHM/jfZdza+knWmmyvtYWdeFA7k7cRMv5orCFX1
         8abD+JO6mlyZPyTYqS14Ng1YyUgmGBlD26UVcaoe7BeXWDsc21D5Yql50Uom+JehwpLL
         kI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=ctgmmBJ5zwixMQWp4XFYC+30uAWxCrFQZQFKzPC1EKx/G6jMr4og/HAmxvMKquoszp
         9p0mmDI0wE1gzlpJdf0+MvEh7akNqHFF6iK969YaLFnO7i2vcjSdrAZFN8BY6OYgBSfL
         0jn9rje4ZfZUjWBguFYTmKBihp+aDJ0ej0Hsz7cKdztjPchehTL8Ap6kyvmeSOEkDZ69
         yAmDI4L2PwSnWW14E0yALljBuOOtqnOyNIZKxSXP3+gxv63m9cab0Bpp4t6ln0/JxZV1
         HfPOCWW65/S0WAjB3gJ5X6tLz7tWumC3Xoo/k2//3e1XrR0cOvUwoDzwf//M0/H43TkG
         DtOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=E6FEsbAC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id v6si2647074ios.0.2020.01.06.06.33.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:33:45 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Received: from github-lowworker-5825cd4.ac4-iad.github.net (github-lowworker-5825cd4.ac4-iad.github.net [10.52.22.68])
	by smtp.github.com (Postfix) with ESMTP id 64664C6007C
	for <jailhouse-dev@googlegroups.com>; Mon,  6 Jan 2020 06:33:45 -0800 (PST)
Date: Mon, 06 Jan 2020 06:33:45 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/0c902c-6a8ab1@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=E6FEsbAC;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/0c902c-6a8ab1%40github.com.
