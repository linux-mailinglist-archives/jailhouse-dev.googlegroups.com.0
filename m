Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV563H3AKGQEBHAF4ZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC51EBDD6
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:55 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id l26sf1013500wmh.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107415; cv=pass;
        d=google.com; s=arc-20160816;
        b=lNBcVsJ9wO19ItM35ctGiXpFNMub4GVjdUfeQyCFYKhByfMBI8QNOXlqWtSCC1Iud1
         5/z6BIJP1HwtUXW2QTDFI9xaJS75EUX3y1pNhOBG2CtxM7LyDKxBkaGWbR3o/6HEIH/h
         S9GlWQW6xfN4rBNyYS4ppVpL7kegBw00jr0RtPrhAu89XzEKDON8pJywyFU2NoIBtAum
         kj4EiJOZVk7sVIi6i5fQslEvy+AJhjPiDu5UujOICuct7xPHLF4FiFwRzdrLUKG8ocgU
         5Wsi6oMCxY2WQRtSzyRxz/9kGAw3HU6GdoA8XeCV+4JhE7cujwgGS10C6kD9fpNLqrU8
         TvYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=kX2PxxyaqK/vquwEvYoiqojZxZW0tidCeAhn6gbxCdI=;
        b=qIe7g4yQwh6p2yh07syYdrtJYLGmsGqJT1IInFcimHhNOwFASu6FIJ3MOdurNxkzHQ
         hAbX4kd2KY/zI9BGXiho7PBuMbIn4yrTuXeEWTVEfn1Uz91aP2fyhe7yHBii1OJOMEFH
         0b91pvDxmcnV1Z2SmiRc3mpFTB/xdZQu3QnROezW9Rsdk6beZDwhr3NfX/YFfP4O3F74
         w2F+IYY+N6IWOrJT8tYu3eHhk4OCITT3Fgopu8rlL8y8GdZON9qsGXscFsIMMk+7Zfhm
         HX5avrXX5cd3lR1wa6UGig94XDD/a+Pu+JH1fYvmxd/hr99aFE25vG/o704heGTL2y8k
         uTgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kX2PxxyaqK/vquwEvYoiqojZxZW0tidCeAhn6gbxCdI=;
        b=QQ1JYwOPsLnmzChwT7gPMBWdlbwREhvd4IaOQ0dGcRV2sCt7p6llL7r+w44WIVcJc6
         j3eCKEs1nrtBVHzDTASM0cjki9nkvFVBewySmCL7VHE11GAdBULWTPPUsjVNO0KI+gwp
         tSwQ6Av17e0Rc51lZ+idWV1zYx9MGvAdtDIQjsxX7uC2CG7ocLEvwzDYySH27aUovzhH
         saW1pufEN36GO3haXxn2Q5mcVXMM6ueTSCY2hr4yGHKI4P8LeqYpR1E7b7tJQGkzQ6CZ
         ZPVBZUQfu/nXMn0tu38zkZ9rxhsK/VUaCJ01SqOqRvZMfX0n6R8O0GIL0Ui+bQhEjhrQ
         5auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kX2PxxyaqK/vquwEvYoiqojZxZW0tidCeAhn6gbxCdI=;
        b=PLyz6BF2SM3X3cB8JJdiJMAMRrhaxlbzjDEruDBB8LokdKsbJFQMAE9+eRBkqrBBx8
         l+oxSFvRxUfdtK3VvVzlxrQecTnlfgVJ7/fiC3XQnyO7or/Rc7C2UvXdA5h5pavgXmet
         ePoBL/qbEOdgdGktBK/AmDMEatycUyDsOdN+pnljUSYAaqtzVqKlMzEOOGew6ZQqCbiG
         npwyLBkqRWSg1CCJMmmfVmEZ0G45XXah1d1svi5HgzunZu0VJRO9DzUvPTTh5yMxvuko
         AGIDO5p2uqQvjYGg70KOcGOX/puj62Hipu20zvIj3ieRqshOEJ+aWEHzAEgNlxlBRlyJ
         b5OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532hUHzdynpm4QTlrWdZRof8Nz3SvxjLi9Y4rYE1px6GrAVNYxVn
	N8GQ7eaHznJWyF9vqSrhYYk=
X-Google-Smtp-Source: ABdhPJxLjpNY/fJ2DLtG+HRBtLg1SdHjxLK62rm1YCfh9dho7kyl4SC3VlS5um6gyI9SCf7DLTh/jw==
X-Received: by 2002:a5d:4c81:: with SMTP id z1mr28863326wrs.371.1591107415128;
        Tue, 02 Jun 2020 07:16:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db45:: with SMTP id f5ls7837381wrj.0.gmail; Tue, 02 Jun
 2020 07:16:54 -0700 (PDT)
X-Received: by 2002:adf:e588:: with SMTP id l8mr28577318wrm.255.1591107414645;
        Tue, 02 Jun 2020 07:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107414; cv=none;
        d=google.com; s=arc-20160816;
        b=S8hOSAE0tM0BU2ABw1ckjxGL71jiIEw31FF4zBbejjNAJWn2Y9RVMY83hYznQQHZxB
         rnJM0uAMEmjCwx8r9NlZHRuK7Vi6QH2PvvOY5a/QShdKn3CTg71S/tUzZot5WZeDbCQD
         wbgdGZl2rfaNKd32W5dsoJlD1hBjvxI4QudlvNobdy2m5r9AS9y7rFC31udprOy6Sl7N
         NrWL4jm+qLLI82EIwasbET02bdSZHbPq0d3ZT6zwSkyj+Z0vwL1hgYtmj66a+enjerLE
         UGJNs9kOa3yyT5RNiQ4/MQsu32diq0a2VrR27YcBm/GOHzb2tiPS8UQSYDrb8pJXtq3Z
         MwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ejWsXVUZcpAweektriMxAQaMoXazr913AqFLb9d5DiQ=;
        b=oKsXkQIZ9VfcD0/OX0l+Ks0LLDavs6a9DrcSe3QnQG6qPYHY+KQLR40JXf+dJWQxss
         WjHRu+9QiFHMYnumiaV/Fhd3hw/GVJpz7VConArOBN03OUq/0C0/W7e1mGXMa0gOpR4q
         x//4I94JKNvxCXOb6twVhMCiaItdAQF0ZFMma8JdeZ0yGgV7y+PdpFY0YkC8dHRNJ/kN
         bPTYtqBHjwUoctsXTQcb9C0N+GgwekmTYpuB+rabUtP7zIHAiB+vjo2f8EafwYUzdLV+
         yMYhalNoN3uEtM/U0qjZDCwVS5vjY737Zosk8yYQH4Ho+pKXa748D3zVNgO4w1xRQaCs
         dS/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s137si132722wme.2.2020.06.02.07.16.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGsVr000837
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:54 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdK028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 11/15] tools: jailhouse-config-check: Add overlap check for hypervisor memory
Date: Tue,  2 Jun 2020 16:16:34 +0200
Message-Id: <4f16acaa71dcee9087610921e7dab69fc9dc7ef6.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
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

This checks if any region in configuration set physically overlaps with
the memory reserved for the hypervisor.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-config-check | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 23e6ae26..12d3dbce 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -86,4 +86,17 @@ for cell in cells:
                 ret=1
 print("\n" if found else " None")
 
+print("Overlapping memory regions with hypervisor:", end='')
+found=False
+for cell in cells:
+    for mem in cell.memory_regions:
+        if mem.phys_overlaps(sysconfig.hypervisor_memory):
+            print("\n\nIn cell '%s', region %d" % (cell.name, idx))
+            print(str(mem))
+            print("overlaps with hypervisor memory region")
+            print(str(sysconfig.hypervisor_memory), end='')
+            found=True
+            ret=1
+print("\n" if found else " None")
+
 exit(ret)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4f16acaa71dcee9087610921e7dab69fc9dc7ef6.1591107398.git.jan.kiszka%40siemens.com.
