Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPNTL6AKGQEOBOKETQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61D28DB4B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id c11sf881586ejp.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664154; cv=pass;
        d=google.com; s=arc-20160816;
        b=AAEl9yR9GUOyN+mdk3N7hcEz6lyiwvVTuthr8qaR9uawvnyegvE3wocWCxJ52OX/+w
         YB8taip7szZ2sTY4KuNdeWqUcxQeWJNrh8aOUhHVRNVkCsNLd+LYCtl1zlkuoybDoDZ4
         K4+r71VT7a9+MRyYmKRyPmaGUqybkRje4jCM9Wx2fFd7f4YMRkkWOUXmj/1fCBCkAPUf
         6YrSMKfAJl8mMLnqWt7x4k5bRXs7JpDtBl1zfd28LQMxeJm+T37aUHEPQ5/93Ns0PtlY
         MgeU5SoWiFyTp8QFOjJX/JF38ytSR+2OQXTnIdksnk7Zyhjylvjnzt1PdXtWPNxp7/zM
         jhAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=FeICqoQZcrN9xRZkpf1KLH5HqTc+lL2p3ezvi2O/S+A=;
        b=VdJ5SKJcDDobHHNOTQsOo0dA+0rVFS/IFpxz3SvBGcEMnwl1L1NkIWCFXm1fXEP/Nl
         pAWisvk9EutnOGtokG3Lcr3KsQucRlRaBsx7Www+/GXaAeDGu3JolxKZJ2Ocleh8L5iN
         FazcYYOBX9YsH80AhMqSqpjrt2hSwCg8UXmzCJgEmjFMMWIGTIez0+nqu1OByOxbq2EK
         k7Q7eCqqf1WT4nWAoFIc5TdEyxkQwiI0lNUix+HCA+15SBeQVMkJEXXIVKUFIvkHYLUJ
         hdq7guneq4vufOugmMOlyPDtafiSpdwx5+TZ3YxL/xP7CT7hkGRxU6Fk3KA859cX2bqt
         kIAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FeICqoQZcrN9xRZkpf1KLH5HqTc+lL2p3ezvi2O/S+A=;
        b=Psb9johK+IBj3Mhd6etUxH6W2vUHGTg7s7DIckHlAJwtb1KKyqFlHnDTx+BLfmSuQg
         eRjebItN+Qg+k7EFr31DAFFgc4p1t3lkXB/928GL8IBn9fjruBHuGl0sLOT4XCH9mgQU
         hYA1sCivku7K36RMK5Z0WBLVWS1VMGK1QCINFJc5eKnAbYYShS2AOP8wZk3i/X28mn3t
         M0gPrM6QnhAy4K9O092FnyHyvPKl9emt97WJPrZzyQz7K5+iC2BJdoCKg5vWDpDg06mo
         5f7MJX7/VxM+I6DlTocl3K3O8fC0G+0gBXcxfGjFnoXGgwiLm/VdeR3+umS/Oa3H06ps
         CGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FeICqoQZcrN9xRZkpf1KLH5HqTc+lL2p3ezvi2O/S+A=;
        b=F0R1YiCMidpZZpl6+Y/YfPrIysKvFkMvJmqD+j/e3ly7koU8mLOo/hSzmeKVF99sG0
         Tpj2QixyiidFi8B4KZvGwIL5eJpIbbfnvc+giQIyxBWm4AXkqwj/bavOvibzE8e0tR8d
         76bUWjYf7YaXI5tq3ursGv2Ryj2eN0YbwmZI48pP7RTLnZ5Q7bESNESD67xmewhsY95/
         b88mqFV+utk5l0zVR+o8hqkIUwgJA+6/MgAsjiz9W3iUhUheKWlVObTun9NvxsPyvC/V
         XaHV7wLuHC/sj5uP9Fp3YsBGATuaCMknUctqdsmH1mJ64I+RUwc63EUx814MdhIc482y
         lJ7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hsAyFYGfZ3JYsGiBeue0kiN3eD534UlTv1O6oW/VHkB5/asAO
	5dVDVEWuZ4t/4GSGIG3UwtY=
X-Google-Smtp-Source: ABdhPJxW9wGGd4c4GO+RY3fRrfvmvtdyw0o2XgEXDa0SNOBm87I7ghLhywueKMnv4M5v8inZ6ohxTQ==
X-Received: by 2002:a17:906:39ce:: with SMTP id i14mr4281461eje.170.1602664153991;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1b11:: with SMTP id o17ls1252787ejg.0.gmail; Wed, 14
 Oct 2020 01:29:12 -0700 (PDT)
X-Received: by 2002:a17:906:f28f:: with SMTP id gu15mr4180327ejb.291.1602664152939;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664152; cv=none;
        d=google.com; s=arc-20160816;
        b=EF35WHWMRla8VxFo7qAQZhSKvsgNLNuEoUXuKx2WHisjFIP9krYtirvBkWiJnUi3G7
         3C1wFbT8LKFzAHidiPYkQ4enEfVDMl4SXIgL7Z7m6CQvZHtJcAC4WIlpODOULzbwQ9bT
         y5bDuV1txvUvAV9KsxubQvr3aiuYgiGsFy4UMdZ/QQDNjyuO2EWhn824m0lBPyf0hkPz
         44SPLt/IceRNDQZfAZLhWfoqlC0+zzhkp9MjAQ9I6UhTnJztyhq+9AKHWSfYzzWaRlYe
         9bMinCzurcbHa/7+Ue8Yo9EkBIv8sh239tm6JnZL8Kq0C6iv2wQ6VBCIWOdw0hqx6vZ9
         UkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=v82JoNNgz4/vB9lE6/eB24yMag8dJ9MgsAmLodK3Lk4=;
        b=k4Uo3eerbWnyLqEw959DQJJkfvuZy72WJdTOr7asTDfH4dLnlOSClSAlNgIDKErfLp
         RonwOq4ozBZP1lgtyC3nFTliaVg1s/iMBegxj5aeKfPVR6xQ7YNC6ZlXlqoZaqOyasHV
         1TWeXnt2ShSbrhyCcIMr0Shuppc3Ym4WJKJQMcYvWXTUG+jti12MbUyK5H5L9R6FWSMl
         YjMhA+U5ynJweYL6jvHK2H5ER5q3vwm8vDaRx4c3bhW7cq42WSaDrJOjFnBKOH2zvMGv
         AM6E++HTlWuwMqkc+R+TVFDhikB9YnC7dHKsRwDFCsLgVYU8GccnaXFsAAPFLe0TwM+k
         dbmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id bi6si56093edb.2.2020.10.14.01.29.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TB6E001482
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Oct 2020 10:29:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIm002644;
	Wed, 14 Oct 2020 10:29:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Chase Conklin <Chase.Conklin@arm.com>
Subject: [PATCH v2 02/46] arm64: Cap parange at 48 bits
Date: Wed, 14 Oct 2020 10:28:26 +0200
Message-Id: <1a832fddcbdf5a272a1afd998fc20807bc5b20f1.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This is the limit for 4K-paging which we rely on in Jailhouse. Make sure
that, if we hit support for even larger sizes, we still end up with this
limit.

Reported-by: Chase Conklin <Chase.Conklin@arm.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/paging.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
index d62c7142..2942b8d7 100644
--- a/hypervisor/arch/arm64/paging.c
+++ b/hypervisor/arch/arm64/paging.c
@@ -24,8 +24,8 @@
  */
 unsigned int get_cpu_parange(void)
 {
-	/* Larger than any possible value */
-	unsigned int parange = 0x10;
+	/* Largest supported value (for 4K paging) */
+	unsigned int parange = PARANGE_48B;
 	unsigned int cpu;
 
 	/*
@@ -51,8 +51,7 @@ unsigned int get_cpu_parange(void)
 	case PARANGE_44B:
 		return 44;
 	case PARANGE_48B:
-		return 48;
 	default:
-		return 0;
+		return 48;
 	}
 }
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a832fddcbdf5a272a1afd998fc20807bc5b20f1.1602664150.git.jan.kiszka%40siemens.com.
