Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4WP3P7QKGQETJHR7EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EBB2ECE2E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:52:35 +0100 (CET)
Received: by mail-ej1-x639.google.com with SMTP id ny19sf2249827ejb.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:52:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016755; cv=pass;
        d=google.com; s=arc-20160816;
        b=EQ/HwJcfw3huYScYVnlNL+I6q40v1NX3oUUkpoAdqtH6coFcRx4NGbIHGeJb5A4S5H
         vIfwUc/j8DN4IR5Cn3Sj8LijXD9dAG0Kq8oHYJZr9E9xBGDKUtrp+Q0JyYKl4te67P88
         TKmQFablRua1uHlKzTp/VwcONxvSg9608e54vzbmtauUXd7hMpYIHoRh5bWn0AV1rlTf
         yEpq5KTAxFF3GK+VrtGxpVohnbX62sGIFqlAE0C6BboZfmrKsl+62OqfrAHN90VQoqmt
         0kHYlQkPltah+IFxRmwT8lX7XxyUqyYaOozw3ZnEX110qEtYZE1du+n7O5qliO6rRIE/
         tZ0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Se4YcVxtIzwBf4W8zz8CoKKUVNIJp2SAVBeCsdJuQnc=;
        b=vJ87y0HKwuLx58S3AUQQjYlz8XqYi75n8ZI6RasupjIGa6yeOp9v5ppSiVnBpV9apG
         QGbF+J0xui2T85QxpiPEaa52KeBAIu8N5ha9E7Bb7JwV1LlOyuWYFAImsNklot4yX8/Z
         rm2TC4vo1UShl7rD2j998/dO+eeeuEiMSbY0ONj/5AURSYpoggSMqy0fQlJo4Sv8CphR
         psyWs+Z8lGlgaxHu6+BwSEczTPD87rScfX0ml/1Ucy+xWOUKpEUXxA5nqafGjYtLeIw2
         aTM+vCVLhSCfatHdcb7FoOFZKsaxSn4/t8Mz6M7I4AfkxF4qCp8ZYixXWXegReTjhwvZ
         Qr2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Se4YcVxtIzwBf4W8zz8CoKKUVNIJp2SAVBeCsdJuQnc=;
        b=N+kVd/lmjXkZY/XsU13XQCizT+90OqJNm28uytXc5NjvezPj3OjVBndYVOKGe1AZYx
         pKri50PWE5h3sLPJKXsODBul04DTmJ3PYs3sFEEQwRk8Q/LGNGqsee2SQ93Z7QX/9WGY
         ZrRN1LCOXhBSnK0cSg3b6yb+l6uXrcRIgHMEreCESIpmwNfl5ZLIoxRTL+20zUjp9Rok
         omKr5+unM1Ybuc66FcrJMx78G6JN1mk4dEBJH0SbqOg/UJgRYAVoKPqAlHA1CKJ3T6ft
         7dBgCEqMTptiCXGSh9bRmhHdZ9PNApmZ4a30Imix0OO0UYKL1PJvHJehiXC2+1W+MNsn
         6PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Se4YcVxtIzwBf4W8zz8CoKKUVNIJp2SAVBeCsdJuQnc=;
        b=eTsxCCuRkT19Rxx43UJt6L0Lh88TNaAJevKXXyCa0COnMk3hStL33k4w39ItI1t0Gn
         Of+vSpri8zxcvKXi7+60/uuJD9v1YMlVQF6fGnzOP+v5f4xE3kxWkqnuuwEDtXI0p6fi
         J0rSpvhAUXpHevyx9a0RHU5IYcvuGz3pwZwuCDBJ5Y2HrGho3dckP+MkbmOsbT+4I/1I
         kbiqz1B5lEm1gl9EWXRWPwlT+uVrBqqGF83JDEhY5hD47PqXd2kR6sWXQbAJgPcJfSts
         utLNpfwFtPwAA2prmcq9HY8HaBEGmN/8kzyZ2/F/aeF1oLNTFJJyvRkOG86EOGIjU/j6
         zjfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ogePO58BjtumN+uVaKVbo2HkIak+GTHVz8aKHJnA8jJFNX4ql
	dSoL8eWRMF3URwfyREdjdfk=
X-Google-Smtp-Source: ABdhPJygD9XX5hioAGqjNE3ZpRiNE1YxzkHM31vOJn1mEIQGmfw6t9M/fCUj58efkZOC3D6xkWCVeg==
X-Received: by 2002:a50:b905:: with SMTP id m5mr1214346ede.292.1610016754890;
        Thu, 07 Jan 2021 02:52:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5591:: with SMTP id y17ls2656068ejp.5.gmail; Thu, 07
 Jan 2021 02:52:33 -0800 (PST)
X-Received: by 2002:a17:906:ae0c:: with SMTP id le12mr5868607ejb.283.1610016753861;
        Thu, 07 Jan 2021 02:52:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016753; cv=none;
        d=google.com; s=arc-20160816;
        b=xEudjrF6VRvz71x8sUnVfkO1HPV1NEQcOCbSgy2atm8uulhGLK1emJAD8E0oCRC2qd
         hqq2lySYJeXgPbp+mgArh3cwNJtMzuYuZfm0IvwHiCs6mmhwbatt8hWj8oZRm+TYStwS
         6fsY1hlpNqhaIqvIba+PCx9PndsNtIHlNxXKGbgpTFLp/lt5BPtBBRSsd1Cp+i/N+sMs
         12FEOfZtLw7u7WCAj91kJxaRKrsxQdd7lpWQYExU6Pb07XfKryKTJJRgPrwx6FYTxYOo
         M7NqJgE6G99YQtHQj/k17I33bLUVOyhYo8iQg7hcPOOfwiNFYAzxbTFBk2oyDfIgy7kX
         +V5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=kQjxAPjue5lqvmVojbaGmOVePdy7M2puLocaCa2W8kg=;
        b=WYERuPDrOhqZgek86yH4138a3AkL1bdndxlxf/1fFpx6q5UfO4SYsn1bQLbHufnWlw
         BFEwTw86Qywy7bUDc02e19VL3NvDzl39buHj0mOCNacxBIqs40K2XALSHpmUBMLGXEmM
         4nSb+7Ftn6X4zuApjU5fElSGHRmmqEsDC58W/hW0ru7y0vnzsHSkpcTg8VRnWlZIpxBW
         sROT210B9jtIgDoms4+0tTdcfcMoYGlnmQXS9eOmqr9lYYZe9Y0K045BqGSPYh9aNJ0E
         1wovHppEoq/7uFWfa9zQeZNR6bcxrQrG7W2sZOZeL1qBieN7F1BmBIZYhg/V29DCaxQB
         nmvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j6si168088edh.0.2021.01.07.02.52.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 02:52:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 107AqXhm008767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:33 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.120])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 107AqWd9019377
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:33 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/3] tools: jailhouse-config-check: Fix error output on hypervisor overlaps
Date: Thu,  7 Jan 2021 11:52:31 +0100
Message-Id: <dacd5095c75e1b2b35bf1f3706960a7c1019230a.1610016752.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1610016752.git.jan.kiszka@siemens.com>
References: <cover.1610016752.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Initialization of idx was missing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 tools/jailhouse-config-check | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 59e8199e..c27dbb8e 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -91,6 +91,7 @@ found=False
 for cell in cells:
     for mem in cell.memory_regions:
         if mem.phys_overlaps(sysconfig.hypervisor_memory):
+            idx = cell.memory_regions.index(mem)
             print("\n\nIn cell '%s', region %d" % (cell.name, idx))
             print(str(mem))
             print("overlaps with hypervisor memory region")
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dacd5095c75e1b2b35bf1f3706960a7c1019230a.1610016752.git.jan.kiszka%40siemens.com.
