Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB26LZTYAKGQEJK53MMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57F1311E5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:56 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id n12sf267248edq.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313196; cv=pass;
        d=google.com; s=arc-20160816;
        b=G1aWl447IMQ5e1IC1nEze40e/k5RqUHEfMjYjf/wUXWTeLnfnJLCMKajduHShZrOPj
         wzIYKE9nZtp7SElA9Y3gLMSbTqkalkJ8ctK9DXQMMjD+CnRx0bOHZXEJV5V69lCuLJsF
         Me6BD4M1yqTnHIiojBNb1i43ace3lfxStl14vAh/Gesera/za7E8ASA0IiC45xE4sL6g
         gS257Cf4GTceVIXpfzxXnpyJNSoQswdCg66P1bQjxlFOg3flWBQaiGrMXDx8Bk4l35xP
         Gh7eur5ssRSMaFz1HINNXgXaQncprOcPNAGTmG+b47hZZ1+ctUmVlLOftties/A9p4OS
         De8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=kVE00ErSFtbrdioZ9jfCwfgwCdOYaQ2wp7JNtRgGBBs=;
        b=oDHHTlW9FwBwudxXYDy8bsKJP5guBd1hiVxNdbPWnTlb4IJDzxnOKOiMSYMYvhQ9y7
         4CEceFFWFtYkiLCwToowsToF1/Zboj838iz5wtrM6r8KC6vPqp3yetmvGiioj6EeoMwZ
         IJ8LhB3/RVhg9LcYYxO0LA8H4Fn4FOJc81nTkAqQutMw2V6Y+Sg/tTTaKzYg+af89RQw
         3VW5EihUsrFLkxZWoGjdwZ9ROUFF1Ate5o7ZLVhWempsPup7EfAc2gLsxOUtbemomNxI
         LMMW072VCI3XQASBVLEf2WNEKKF/GvI7bZOGpSQUkSZVy+0I6dI28x167FcKYLm1ncls
         CgLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kVE00ErSFtbrdioZ9jfCwfgwCdOYaQ2wp7JNtRgGBBs=;
        b=p/Mu+uMVaoMGPMqAdfoiQy49pKgfBKe5JEb3wZ7/dgV2TAa3oUVJsZBaTRJHHzQGf9
         wmnZ0jUWypBVJZpP/OHlbvHN4qOyIJcaxDyoxvERdeG+Cgba/WzSxf7gQhJcrWQu7dD6
         qIksKqZehVmkMg2xRng4iCxyiYLvMmwo11282v88T8ok4sQhE3yIziyoQ/4128xfrKYR
         xBEzwQiVUNBTZB7o0cOlCgsWBJJMt5avTa0w+VEe1SbLgIK4gCXL2F4pOVh2zoaZmg2j
         iy7Y89CEfZfiCjER5SomRZEk/xTc66LnBtGgPkfaHnqfQbkLJ6+5mtv0Xe0aHSQL9HxY
         IdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kVE00ErSFtbrdioZ9jfCwfgwCdOYaQ2wp7JNtRgGBBs=;
        b=S8fU4O1e+k5Jq9dCRBkC/OoXtr3kli4WSclalmq2bqX5W+NiOROrhoYvStt5F6MUnp
         5fQqc78bSDzAqQM5y3rGGgGLgSAiNI2P2+TYU/8S/JZwV81ZgWHdBZHN0AtACk1ZVhmX
         GAfu91hiL69anSWVolqnecy7QWYSNBiXFUg7cGoNA6yPCsBLliMf66sNHz9/IMQm7rxT
         NVergkRm67h3V+fgpukxeFpRrG1kBELtHoaDcEIKvq0jJzLvhiN87MXRA1inPbKTjghN
         hLwMxvH8hGIWRCSFuJh+l1t9ajm3cxos68k0WNYHLsGHUX0UrPv9X7Jv2WsBX7BvgQqK
         8AvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU6DE1NMt7XkCExxI7TuKLJeS7n/zlYt/d9o51g63BuOPnHgzBM
	f6BKdfU0HfbZFM/no08WnY4=
X-Google-Smtp-Source: APXvYqyCRs01dLYalQBfNp97Byd6KThCzr7/kv0QVgI4U0nzynnBBc/rcrQ4d9ZRmNIdK9390Dx89w==
X-Received: by 2002:a05:6402:22c1:: with SMTP id dm1mr104905277edb.21.1578313196030;
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9ac2:: with SMTP id p60ls13502424edb.7.gmail; Mon, 06
 Jan 2020 04:19:55 -0800 (PST)
X-Received: by 2002:a50:d849:: with SMTP id v9mr106896952edj.105.1578313195187;
        Mon, 06 Jan 2020 04:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313195; cv=none;
        d=google.com; s=arc-20160816;
        b=W64mm5t5Wk+VxphFjd0y31FZErnFiCA9eQV0ZfTXk+GGf+vhaJItudHN2VXsCIaykJ
         7qukostaUjM3i9lDzKhmm80PnV9408cTdimXTicYgTO1wdRgQ/wtDF8ljr2kqqOr0zib
         NHj5lYZt4bPdeDTZVdaE3pp8A/DyQS+SJWNN2BZ/NLW8TFlV4dO/xQ7O6vXgtbNKcueg
         Fod16xkTb6UqKmnTfTW/LiHE6CYegntL/pI94SoQImRk3s8xI1l7WQCHCvH/2CQLVG89
         AJYOrk0R8MxRTVcNaocPY9GfbGB/Nm/FqOzzAEsTgUllOYSUJxRrMDPI/3JHk81mSNIM
         KsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=KB+3K5VkPwd7uehhB7coeJm6dA15TlXonHX2kwsjgaM=;
        b=k0qu5K29rSzaaI7wTXgEoF9gEcGvBx84Cqu7mXhllAVGQqmZJ1tkYy3WGIykYmWCWO
         sSknHBaVisAGhoSVNW3gFKRUL7Jc/pg/w8gdj82z+1tYvRwvrpcvvK5M6qXLvRODjCEL
         iq1Sn0bO9lCzZrknIbZDdr3QgQK+no2sj29fHjJ20KK+Q1Qvz7IgJoUaPuHeA0NOMGs8
         j03SMswfA0eGPzLyHnU1aGtzs5VQO2pBaHhzCmKM3Qf219oEOQQqZeUP/VEHj1wfTu1g
         NZW+5a1QYrrUNWRdxiJMnuryLSC/roN6zrkJT/I7BX8jFUgasRrofTe4RDhPbToVnUxO
         Mu+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id x18si2237389eds.2.2020.01.06.04.19.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJsgM020956
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:54 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEa029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:54 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 02/38] core: Restrict asm/ivshmem.h to inclusion by jailhouse/ivshmem.h
Date: Mon,  6 Jan 2020 13:17:43 +0100
Message-Id: <8148a2502cff4b4a009be81ac33ed94edbdf3729.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

The asm header will gain a dependency on the generic one and, thus,
should no longer be considered for direct inclusion. Adjust the header
check accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/ivshmem.h | 5 -----
 hypervisor/arch/x86/include/asm/ivshmem.h        | 5 -----
 scripts/header_check                             | 6 ++++++
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/ivshmem.h b/hypervisor/arch/arm-common/include/asm/ivshmem.h
index cd7c8234..8110ca30 100644
--- a/hypervisor/arch/arm-common/include/asm/ivshmem.h
+++ b/hypervisor/arch/arm-common/include/asm/ivshmem.h
@@ -10,11 +10,6 @@
  * the COPYING file in the top-level directory.
  */
 
-#ifndef _JAILHOUSE_ASM_IVSHMEM_H
-#define _JAILHOUSE_ASM_IVSHMEM_H
-
 struct arch_pci_ivshmem {
 	u16 irq_id;
 };
-
-#endif /* !_JAILHOUSE_ASM_IVSHMEM_H */
diff --git a/hypervisor/arch/x86/include/asm/ivshmem.h b/hypervisor/arch/x86/include/asm/ivshmem.h
index 081d4a27..6eb66da1 100644
--- a/hypervisor/arch/x86/include/asm/ivshmem.h
+++ b/hypervisor/arch/x86/include/asm/ivshmem.h
@@ -10,13 +10,8 @@
  * the COPYING file in the top-level directory.
  */
 
-#ifndef _JAILHOUSE_ASM_IVSHMEM_H
-#define _JAILHOUSE_ASM_IVSHMEM_H
-
 #include <asm/apic.h>
 
 struct arch_pci_ivshmem {
 	struct apic_irq_message irq_msg;
 };
-
-#endif /* !_JAILHOUSE_ASM_IVSHMEM_H */
diff --git a/scripts/header_check b/scripts/header_check
index 05e08fb3..2fa6e45f 100755
--- a/scripts/header_check
+++ b/scripts/header_check
@@ -42,6 +42,12 @@ test_compile()
 		prepend="#define __ASSEMBLY__
 			 #include <jailhouse/types.h>"
 		;;
+	ivshmem.h)
+		if [ "$1" == "asm" ]; then
+			# must be included by jailhouse/ivshmem.h only
+			return
+		fi
+		;;
 	traps.h)
 		if [ "$2" == "hypervisor/arch/arm-common/include/asm/traps.h" ]; then
 			# must be included by arm{,64}/include/asm/traps.h only
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8148a2502cff4b4a009be81ac33ed94edbdf3729.1578313099.git.jan.kiszka%40siemens.com.
