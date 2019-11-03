Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCHC7LWQKGQEYTQD2XI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B706ED2F5
	for <lists+jailhouse-dev@lfdr.de>; Sun,  3 Nov 2019 11:50:51 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id s3sf14498048qkd.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 Nov 2019 02:50:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1572778249; cv=pass;
        d=google.com; s=arc-20160816;
        b=yzWzxGjD1ycfvVNWG1r48CP5G+MVRRbEq6R2focOzCuayloSEB5lTvuhlEjHCBGUrD
         V9clT85Ah50gNWGpguNDcdeiRiJVKElkMn4HzxIf4D0uGTkt1B3BNLk9qIl0TLSyG6C8
         4yadkNmhA3ddjbYzVZySTs4Tr0G/45IIW5tQjuREkvDJT2zlrwtuCEwHK7Km46wLfqG3
         +vfLBFfismMPel33IXnjektbFaC9x9sZ5a1GsyGdd8009HfeLJGPChB8GrhmL0V99f0k
         Aavrq14Qp0tC5h4HRfEyaqsWXYj4+gQ4pLOXbzJYZNV2PtCu2Eid8w3PfIPl2qmdIrGu
         t5BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=CGcA/UKmwjzk2V8koHWudEuskiagfhzJqeUkDrrXddg=;
        b=ALBu6bUoYAneCFRIUsGT1rmWtuvOXPWFXlIQwmRWlipxKwC7SuwTQzRa9aa3hWs4N3
         zuxBOMhddXy25qThqCTbExwPe3uNMfw5H1/wKMPe1MMCBXivIxRsxM+72jZW4r3S+E7n
         DW5Y+qXviKxsH9lgeBakYNVgB+ztiFTTpas89Dsnp76OG8GTtWKxhBR779l+vN3BB0A6
         EPUYfV4yJqUHrTEA9OBGhuWeeJKYZxsIH6MaVEljMUMcHtrAbDtx8iBo/P3/gKwiwXdn
         NJgISsbbZctI9bStQuBjrwUJQkNsLyhb3Z1ZizcB3Svfz3K9UvMtU6Cnf7jS64etxXt6
         ZxNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=fMBdZexH;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CGcA/UKmwjzk2V8koHWudEuskiagfhzJqeUkDrrXddg=;
        b=ggwyOZtjPnFj0xg7JdNlydAzTzRauDMJk8Vp0kcGokg1kCVE84nBewJ9VA0WAylY87
         G9ZXbOphWWWsdeiqC8ZjRAfFW1ALTdMBqc8/x5eUNUrJztqImUrug21F/bcyNOb8UmQk
         GQW1XNLlMtZE8H3PSVKo18yJg1Ew/zGYd4yexJpXclzJ3+lMxcQQZA6F9VbV2x+QaRM5
         gVFpoGvALMB0xX7wNIxH1SiQSZ45gB5spWRT+pRKvo8DKXWv3CrMCPVjN4V7RYgfQ/K3
         BiWauX78skAmtwxPKej7OOxnrBL1O+qOtbg9kKeUjoiMxrDeuXtqgqAlZn8t+ISYv+uu
         CDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CGcA/UKmwjzk2V8koHWudEuskiagfhzJqeUkDrrXddg=;
        b=FFhjpQDa29SV/AeWm/LoaV1Cx7Zt6wytjy9LLnwFNG/vPxwftabmVYF7LPixdbaNV8
         mu1Wq72vQmACSXsgZOpKAgOl6i3k9R9QNweh1pvHcrlbASxsUbmggrmHiIZgwCl4wyvq
         2id7vqFQQe9Jcymo6wN0SM4LdWMcYW0YS/uP4x8ExKQfh6zdYOve577UQtScP0yZqP7Z
         vV5UlvXI/tVmwLm96a3kiiJV9irLhn+gjUHyU4uVCAfMfbbhKOsCP+iHXAMZNJq+KWNn
         mdshXLiNfdvdSkudjgmlrSp9R5CZWz8nq8WPue9pWLUc43cC83K5v8iAl+T1711gMWYu
         kc4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVN4KzWINXKf61mnI9uYZv01Is6yWQYWSBxMvx6L52cwV+U+vI3
	mthpWG8Y6oh9Jv+QfLDx2Zg=
X-Google-Smtp-Source: APXvYqzprHKBaYQKCL96UaVYA3xTzrZZTG8Y1ilVc6RUB4axn9qwcJ5wBfOj4pI/+jMUbhy+cOkMGg==
X-Received: by 2002:a05:6214:188c:: with SMTP id cx12mr17561529qvb.147.1572778248271;
        Sun, 03 Nov 2019 02:50:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:7a1:: with SMTP id v1ls2004508qvz.15.gmail; Sun, 03
 Nov 2019 02:50:47 -0800 (PST)
X-Received: by 2002:a0c:d09b:: with SMTP id z27mr16656965qvg.168.1572778247895;
        Sun, 03 Nov 2019 02:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572778247; cv=none;
        d=google.com; s=arc-20160816;
        b=iE0arPpxwiMT2+ZMiqIyDpHspQT5uje4hC1PJnrCzJ9DkhCJBy1TMHOYXu7v1Qt+85
         KGKo1wcvGFXcYFKtIA5eVXUF+4uBZcqBC0wKm7jfBCkp2nBXPzKzOvXvD8bhtHMfV58l
         MytNURQgsjlvnq9bsLyBDi2YOjjsN0JZxgMRv5o170Kt+1kaan9hteqjfzt5FyC8350a
         YZS78ma5q6jsT525kKjx54zu5mJUwFo6+FmNNIGW6ldV01S9FZ1eX0H72D8O1IVRUfZK
         AQ4qhVGNihBxmm6OK2MEPhpHN87qM4KszPoTx0TgNv4bzyyDmpKU0XAMS45bnmYi/Owb
         2wyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=BGWOTwqxqabCPZ9x/woe+5aNcmOI9B+Zx+2ybEnv5VM=;
        b=LQ9rcP/CMzPjkmQ9nGQA1JJWGZ69rOX8YzjJ/CWjlWQ5aPbb/5f1A2uRJednPe4uJt
         qE3ARQCUbkEJgxifxEa0DtRWsIcIQMuNmXsuEpa7H+YngH69uEw5xRFaTnQ/3t5dnJDG
         nAJDZRFoQgMqd85WuCCJAnIXjeWb6h1YvTeBfS0flJlbIWFi1PlAInkKzLlFbUlVaUiI
         pzrbiaDYRQK+zmS2F124G0CJKL5fimzQb8Jo89IUPqdX8GjZMX3VVdBMeRN+cxt8X3OG
         cETY5ckrmn3FRe+DYFiNKLiAtjqJvPQvSAzw43OpWweuZH5HXCxK+wy08WpKULxCX/7A
         haEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=fMBdZexH;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-10.smtp.github.com (out-10.smtp.github.com. [192.30.254.193])
        by gmr-mx.google.com with ESMTPS id k33si717142qtd.4.2019.11.03.02.50.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 02:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) client-ip=192.30.254.193;
Received: from github-lowworker-fb56993.ac4-iad.github.net (github-lowworker-fb56993.ac4-iad.github.net [10.52.19.31])
	by smtp.github.com (Postfix) with ESMTP id 0208F1204F7
	for <jailhouse-dev@googlegroups.com>; Sun,  3 Nov 2019 02:50:47 -0800 (PST)
Date: Sun, 03 Nov 2019 02:50:46 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/d6ea1b-6820b5@github.com>
Subject: [siemens/jailhouse] 6820b5: x86: Permit root cell to enable CR4.UMIP
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=fMBdZexH;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.193 as
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
  Commit: 6820b515e9a71f5490a36d2a5041e21ab4ea1e4b
      https://github.com/siemens/jailhouse/commit/6820b515e9a71f5490a36d2a5041e21ab4ea1e4b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-03 (Sun, 03 Nov 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/processor.h

  Log Message:
  -----------
  x86: Permit root cell to enable CR4.UMIP

This is safe from hypervisor perspective.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/d6ea1b-6820b5%40github.com.
